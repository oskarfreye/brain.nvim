local M = {}

local DAILY_QUERY = [[
query questionOfToday {
  activeDailyCodingChallengeQuestion {
    date
    link
    question {
      questionFrontendId
      title
      titleSlug
      difficulty
      isPaidOnly
      content
      codeSnippets {
        lang
        langSlug
        code
      }
      sampleTestCase
      metaData
      topicTags {
        name
        slug
      }
    }
  }
}
]]

local function trim(s)
  local trimmed = (s or ''):gsub('^%s+', '')
  trimmed = trimmed:gsub('%s+$', '')
  return trimmed
end

local function decode_entities(s)
  s = s or ''
  local named = {
    amp = '&',
    apos = "'",
    gt = '>',
    lt = '<',
    nbsp = ' ',
    quot = '"',
  }

  s = s:gsub('&([%a]+);', function(entity)
    return named[entity] or ('&' .. entity .. ';')
  end)

  s = s:gsub('&#(%d+);', function(code)
    local n = tonumber(code)
    if n and n >= 32 and n <= 126 then
      return string.char(n)
    end
    return ''
  end)

  return s
end

local function html_to_text(html)
  local text = html or ''

  text = text:gsub('<br%s*/?>', '\n')
  text = text:gsub('</p>', '\n')
  text = text:gsub('</div>', '\n')
  text = text:gsub('</li>', '\n')
  text = text:gsub('<li[^>]*>', '- ')
  text = text:gsub('<sup>(.-)</sup>', '^%1')
  text = text:gsub('<sub>(.-)</sub>', '_%1')
  text = text:gsub('<[^>]->', '')
  text = decode_entities(text)
  text = text:gsub('\r\n', '\n')
  text = text:gsub('\n%s+\n', '\n\n')
  text = text:gsub('\n\n\n+', '\n\n')

  return trim(text)
end

local function inline_text(html)
  return trim(html_to_text(html):gsub('\n', ' '):gsub('%s+', ' '))
end

local function extract_pre_examples(content)
  local examples = {}

  for block in (content or ''):gmatch('<pre[^>]*>(.-)</pre>') do
    local text = inline_text(block)
    local input_start = text:find('Input:', 1, true)
    local output_start = text:find('Output:', 1, true)

    if input_start and output_start and input_start < output_start then
      local explanation_start = text:find('Explanation:', output_start, true)
      local input = trim(text:sub(input_start + #'Input:', output_start - 1))
      local output = trim(text:sub(output_start + #'Output:', (explanation_start or (#text + 1)) - 1))

      if input ~= '' and output ~= '' then
        table.insert(examples, { input = input, output = output })
      end
    end
  end

  return examples
end

local function extract_examples(content)
  local examples = {}

  for input, output in (content or ''):gmatch('<strong>Input:</strong>%s*<span[^>]*>(.-)</span>.-<strong>Output:</strong>%s*<span[^>]*>(.-)</span>') do
    table.insert(examples, {
      input = inline_text(input),
      output = inline_text(output),
    })
  end

  if #examples == 0 then
    examples = extract_pre_examples(content)
  end

  return examples
end

local function split_top_level(s)
  local parts = {}
  local start = 1
  local depth = 0
  local quote = nil
  local escape = false

  for i = 1, #s do
    local ch = s:sub(i, i)

    if quote then
      if escape then
        escape = false
      elseif ch == '\\' then
        escape = true
      elseif ch == quote then
        quote = nil
      end
    elseif ch == '"' or ch == "'" then
      quote = ch
    elseif ch == '[' or ch == '(' or ch == '{' then
      depth = depth + 1
    elseif ch == ']' or ch == ')' or ch == '}' then
      depth = math.max(0, depth - 1)
    elseif ch == ',' and depth == 0 then
      table.insert(parts, trim(s:sub(start, i - 1)))
      start = i + 1
    end
  end

  table.insert(parts, trim(s:sub(start)))
  return parts
end

local function parse_assignments(input)
  local assignments = {}

  for _, part in ipairs(split_top_level(input or '')) do
    local name, value = part:match('^([%w_]+)%s*=%s*(.+)$')
    if name and value then
      assignments[name] = trim(value)
    end
  end

  return assignments
end

local function normalize_js_value(value)
  local normalized = trim(value)
  normalized = normalized:gsub('^true$', 'true')
  normalized = normalized:gsub('^false$', 'false')
  normalized = normalized:gsub('^null$', 'null')
  return normalized
end

local function example_args(example, params)
  params = params or {}

  if #params == 0 then
    return nil, 'metadata does not describe function parameters'
  end

  local assignments = parse_assignments(example.input)
  local args = {}

  if next(assignments) == nil and #params == 1 then
    return { normalize_js_value(example.input) }, nil
  end

  for _, param in ipairs(params) do
    local value = assignments[param.name]
    if not value then
      return nil, 'could not find input value for ' .. tostring(param.name)
    end
    table.insert(args, normalize_js_value(value))
  end

  return args, nil
end

local function pick_snippet(question)
  local snippets = question.codeSnippets or {}
  local fallback = nil

  for _, snippet in ipairs(snippets) do
    if snippet.langSlug == 'typescript' then
      return snippet.code, snippet.langSlug
    end
    if snippet.langSlug == 'javascript' then
      fallback = snippet
    end
  end

  if fallback then
    return fallback.code, fallback.langSlug
  end

  return nil, nil
end

local function add_todo_marker(code)
  if code:find('YOUR CODE HERE', 1, true) then return code end

  local updated, count = code:gsub('{%s*};?%s*$', '{\n  // YOUR CODE HERE\n};', 1)
  if count > 0 then return updated end

  return code .. '\n// YOUR CODE HERE'
end

local function export_snippet(snippet, meta)
  local code = trim(snippet or '')
  local name = meta and meta.name or nil

  if name and code:match('function%s+' .. name .. '%s*%(') then
    code = code:gsub('function%s+' .. name .. '%s*%(', 'export function ' .. name .. '(', 1)
    return add_todo_marker(code), 'function', name
  end

  local var_name = code:match('var%s+([%w_]+)%s*=%s*function')
  if var_name then
    code = code:gsub('var%s+' .. var_name .. '%s*=', 'export const ' .. var_name .. ' =', 1)
    return add_todo_marker(code), 'function', var_name
  end

  local class_name = code:match('class%s+([%w_]+)')
  if class_name then
    code = code:gsub('class%s+' .. class_name, 'export class ' .. class_name, 1)
    return add_todo_marker(code), 'class', class_name
  end

  return add_todo_marker(code), 'unknown', name
end

local function topic_names(question)
  local names = {}
  for _, tag in ipairs(question.topicTags or {}) do
    if tag.name then table.insert(names, tag.name) end
  end
  return names
end

local function leetcode_url(link, title_slug)
  if link and link:match('^https?://') then return link end
  if link and link ~= '' then return 'https://leetcode.com' .. link end
  if title_slug and title_slug ~= '' then
    return 'https://leetcode.com/problems/' .. title_slug .. '/'
  end
  return 'https://leetcode.com/problemset/'
end

local function build_stub(question, meta, examples, exported_code, daily)
  local number = question.questionFrontendId or '?'
  local title = question.title or 'Untitled'
  local difficulty = question.difficulty or 'unknown'
  local url = leetcode_url(daily.link, question.titleSlug)
  local topics = topic_names(question)
  local lines = {
    '/**',
    ' * LeetCode Daily Challenge',
    string.format(' * #%s %s (%s)', number, title, difficulty),
    ' * ' .. url,
  }

  if daily.date then
    table.insert(lines, ' * Daily date: ' .. daily.date .. ' (LeetCode UTC)')
  end

  if #topics > 0 then
    table.insert(lines, ' * Topics: ' .. table.concat(topics, ', '))
  end

  if meta and meta.name then
    table.insert(lines, ' * Entrypoint: ' .. meta.name)
  end

  if #examples > 0 then
    table.insert(lines, ' *')
    table.insert(lines, ' * Public examples:')
    for i, example in ipairs(examples) do
      table.insert(lines, string.format(' * %d. Input: %s', i, example.input))
      table.insert(lines, string.format(' *    Output: %s', example.output))
    end
  end

  table.insert(lines, ' *')
  table.insert(lines, ' * Open the LeetCode link for the full statement and constraints.')
  table.insert(lines, ' */')
  table.insert(lines, '')
  table.insert(lines, exported_code)

  return table.concat(lines, '\n') .. '\n'
end

local function build_tests(question, meta, examples, callable_kind, callable_name)
  local number = question.questionFrontendId or '?'
  local title = question.title or 'LeetCode Daily'
  local lines = {
    "import { describe, it, expect } from 'vitest';",
  }

  if callable_name then
    table.insert(lines, "import { " .. callable_name .. " } from './challenge';")
  else
    table.insert(lines, "import './challenge';")
  end

  table.insert(lines, '')
  table.insert(lines, string.format("describe('LeetCode #%s: %s', () => {", number, title:gsub("'", "\\'")))

  if callable_kind ~= 'function' or not callable_name then
    table.insert(lines, "  it.todo('add local tests for this non-function LeetCode template');")
  elseif #examples == 0 then
    table.insert(lines, "  it.todo('add local tests; no parseable public examples were found');")
  else
    local added = 0
    local skipped = {}

    for i, example in ipairs(examples) do
      local args, err = example_args(example, meta and meta.params or {})
      if args then
        added = added + 1
        table.insert(lines, string.format("  it('example %d', () => {", i))
        table.insert(lines, string.format('    expect(%s(%s)).toEqual(%s);', callable_name, table.concat(args, ', '), normalize_js_value(example.output)))
        table.insert(lines, '  });')
        table.insert(lines, '')
      else
        table.insert(skipped, string.format('example %d: %s', i, err))
      end
    end

    if added == 0 then
      table.insert(lines, "  it.todo('add local tests; examples could not be converted to direct function calls');")
    end

    for _, reason in ipairs(skipped) do
      table.insert(lines, "  it.todo('" .. reason:gsub("'", "\\'") .. "');")
    end
  end

  table.insert(lines, '});')
  table.insert(lines, '')

  return table.concat(lines, '\n')
end

function M.fetch_daily()
  local config = require('brain').config
  local leetcode_config = config.leetcode or {}
  local endpoint = leetcode_config.endpoint or 'https://leetcode.com/graphql'
  local timeout = tostring(leetcode_config.timeout or 8)

  if vim.fn.executable('curl') == 0 then
    return nil, 'curl is not installed'
  end

  local payload = vim.fn.json_encode({ query = DAILY_QUERY })
  local output = vim.fn.system({
    'curl',
    '-sS',
    '--max-time',
    timeout,
    '-H',
    'Content-Type: application/json',
    '-H',
    'Referer: https://leetcode.com',
    '--data',
    payload,
    endpoint,
  })

  if vim.v.shell_error ~= 0 then
    return nil, trim(output) ~= '' and trim(output) or ('curl failed with code ' .. vim.v.shell_error)
  end

  local ok, decoded = pcall(vim.fn.json_decode, output)
  if not ok or not decoded then
    return nil, 'failed to decode LeetCode response'
  end

  if decoded.errors and decoded.errors[1] then
    return nil, decoded.errors[1].message or 'LeetCode returned a GraphQL error'
  end

  return decoded.data and decoded.data.activeDailyCodingChallengeQuestion or nil, 'missing daily challenge data'
end

function M.from_daily(daily)
  if not daily or not daily.question then
    return nil, 'missing LeetCode question'
  end

  local question = daily.question
  if question.isPaidOnly then
    return nil, 'daily LeetCode problem is premium-only'
  end

  local snippet = pick_snippet(question)
  if not snippet then
    return nil, 'daily LeetCode problem has no TypeScript or JavaScript snippet'
  end

  local meta = {}
  if question.metaData and question.metaData ~= '' then
    local ok, decoded = pcall(vim.fn.json_decode, question.metaData)
    if ok and decoded then meta = decoded end
  end

  local exported_code, callable_kind, callable_name = export_snippet(snippet, meta)
  local examples = extract_examples(question.content or '')
  local url = leetcode_url(daily.link, question.titleSlug)

  return {
    name = string.format('LeetCode #%s: %s', question.questionFrontendId or '?', question.title or 'Daily Challenge'),
    difficulty = (question.difficulty or 'unknown'):lower(),
    stub = build_stub(question, meta, examples, exported_code, daily),
    tests = build_tests(question, meta, examples, callable_kind, callable_name),
    source = 'leetcode',
    source_url = url,
    source_date = daily.date,
    title_slug = question.titleSlug,
    test_note = 'Local tests are generated from public LeetCode examples only.',
  }, nil
end

function M.get_daily_challenge()
  local daily, err = M.fetch_daily()
  if not daily then return nil, err end
  return M.from_daily(daily)
end

M._extract_examples = extract_examples
M._split_top_level = split_top_level

return M
