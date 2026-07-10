local M = {}

M.current = {
  date = nil,
  name = nil,
  dir = nil,
  code_file = nil,
  test_file = nil,
  hints_used = 0,
  last_test_passed = 0,
  last_test_total = 0,
}

local function today()
  return os.date('%Y-%m-%d')
end

local function read_metadata(dir)
  local path = dir .. '/metadata.json'
  if vim.fn.filereadable(path) == 0 then return nil end

  local f = io.open(path, 'r')
  if not f then return nil end

  local content = f:read('*a')
  f:close()

  local ok, decoded = pcall(vim.fn.json_decode, content)
  if ok then return decoded end
  return nil
end

local function write_metadata(dir, challenge)
  local path = dir .. '/metadata.json'
  local f = io.open(path, 'w')
  if not f then return end

  f:write(vim.fn.json_encode({
    name = challenge.name,
    difficulty = challenge.difficulty,
    source = challenge.source or 'builtin',
    source_url = challenge.source_url,
    source_date = challenge.source_date,
    title_slug = challenge.title_slug,
    test_note = challenge.test_note,
  }))
  f:close()
end

local function load_challenge(date)
  local config = require('brain').config
  local db = require('brain.challenges_db')

  if config.challenge_provider == 'leetcode' then
    local ok, leetcode = pcall(require, 'brain.leetcode')
    if ok then
      local challenge, err = leetcode.get_daily_challenge()
      if challenge then return challenge end

      if not config.leetcode or config.leetcode.fallback_to_builtin ~= false then
        vim.notify('brain.nvim: LeetCode daily unavailable (' .. (err or 'unknown error') .. '); using built-in challenge.', vim.log.levels.WARN)
      else
        vim.notify('brain.nvim: LeetCode daily unavailable: ' .. (err or 'unknown error'), vim.log.levels.ERROR)
        return nil
      end
    elseif not config.leetcode or config.leetcode.fallback_to_builtin ~= false then
      vim.notify('brain.nvim: could not load LeetCode provider; using built-in challenge.', vim.log.levels.WARN)
    else
      vim.notify('brain.nvim: could not load LeetCode provider.', vim.log.levels.ERROR)
      return nil
    end
  end

  return db.get_challenge_for_date(date)
end

function M.start()
  local config = require('brain').config
  local ui = require('brain.ui')

  local date = today()
  local dir = config.challenges_dir .. '/' .. date
  local code_file = dir .. '/challenge.ts'
  local test_file = dir .. '/challenge.test.ts'
  local metadata = read_metadata(dir) or {}

  if vim.fn.filereadable(code_file) == 1 then
    M.current.date = date
    M.current.dir = dir
    M.current.code_file = code_file
    M.current.test_file = test_file
    M.current.name = metadata.name or 'Challenge'
    ui.open_layout(code_file)
    local lines = {
      '🧠 **Brain Training** — ' .. date,
      '',
      'Resuming existing challenge.',
    }
    if metadata.name then table.insert(lines, '**Challenge:** ' .. metadata.name) end
    if metadata.source_url then table.insert(lines, '**Source:** ' .. metadata.source_url) end
    if metadata.test_note then table.insert(lines, metadata.test_note) end
    table.insert(lines, 'Commands: :BrainTest :BrainHint :BrainSubmit :BrainSkip')
    table.insert(lines, '')
    ui.append_chat(lines)
    M._setup_autosave()
    return
  end

  local challenge = load_challenge(date)
  if not challenge then return end

  M.current = {
    date = date,
    name = challenge.name,
    dir = dir,
    code_file = code_file,
    test_file = test_file,
    hints_used = 0,
    last_test_passed = 0,
    last_test_total = 0,
  }

  vim.fn.mkdir(dir, 'p')
  write_metadata(dir, challenge)

  local f = io.open(code_file, 'w')
  if f then f:write(challenge.stub); f:close() end

  f = io.open(test_file, 'w')
  if f then f:write(challenge.tests); f:close() end

  ui.open_layout(code_file)
  local lines = {
    '🧠 **Brain Training** — ' .. date,
    '',
    '**Challenge:** ' .. challenge.name .. ' (' .. challenge.difficulty .. ')',
    '',
  }
  if challenge.source_url then table.insert(lines, '**Source:** ' .. challenge.source_url) end
  if challenge.test_note then table.insert(lines, challenge.test_note) end
  table.insert(lines, '')
  table.insert(lines, 'Your challenge file is open on the left.')
  table.insert(lines, 'Look for `// YOUR CODE HERE` markers.')
  table.insert(lines, '')
  table.insert(lines, 'Commands:')
  vim.list_extend(lines, {
    '  :BrainTest   — Run tests (also runs on save)',
    '  :BrainHint   — Get a hint (-1 point)',
    '  :BrainSubmit — Submit solution',
    '  :BrainSkip   — Give up, see solution',
    '',
    '---',
    '',
  })
  ui.append_chat(lines)

  M._setup_autosave()
end

function M._setup_autosave()
  if not M.current.code_file then return end
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = M.current.code_file,
    callback = function() M.test() end,
    group = vim.api.nvim_create_augroup('BrainAutoTest', { clear = true }),
  })
end

function M.test()
  local ui = require('brain.ui')
  local config = require('brain').config

  if not M.current.test_file then
    vim.notify('No active challenge. Run :BrainStart first.', vim.log.levels.WARN)
    return
  end

  ui.append_chat({ '⏳ Running tests...', '' })

  local cmd = vim.deepcopy(config.test_cmd)
  table.insert(cmd, M.current.test_file)

  local output_lines = {}
  vim.fn.jobstart(cmd, {
    cwd = config.challenges_dir,
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      for _, line in ipairs(data) do
        if line ~= '' then table.insert(output_lines, line) end
      end
    end,
    on_exit = function(_, code)
      vim.schedule(function()
        M._handle_test_results(output_lines, code)
      end)
    end,
  })
end

function M._handle_test_results(output_lines, exit_code)
  local ui = require('brain.ui')
  local json_str = table.concat(output_lines, '\n')
  local ok, result = pcall(vim.fn.json_decode, json_str)

  if ok and result and result.testResults then
    local total = 0
    local passed = 0
    local failed_names = {}

    for _, suite in ipairs(result.testResults) do
      for _, test in ipairs(suite.assertionResults or {}) do
        total = total + 1
        if test.status == 'passed' then
          passed = passed + 1
        else
          table.insert(failed_names, '  ❌ ' .. (test.ancestorTitles and table.concat(test.ancestorTitles, ' > ') .. ' > ' or '') .. test.title)
        end
      end
    end

    M.current.last_test_passed = passed
    M.current.last_test_total = total

    local lines = { string.format('**Tests: %d/%d passed**', passed, total) }
    if passed == total then
      table.insert(lines, '✅ All tests passing! Run :BrainSubmit to submit.')
    else
      table.insert(lines, '')
      table.insert(lines, 'Failed:')
      for _, name in ipairs(failed_names) do table.insert(lines, name) end
    end
    table.insert(lines, '')
    table.insert(lines, '---')
    table.insert(lines, '')
    ui.append_chat(lines)
  else
    local lines = { '**Test Results** (exit code: ' .. exit_code .. ')', '' }
    for _, line in ipairs(output_lines) do table.insert(lines, line) end
    table.insert(lines, '')
    ui.append_chat(lines)
  end
end

function M.hint()
  local ui = require('brain.ui')
  local hints = require('brain.hints')

  if not M.current.code_file then
    vim.notify('No active challenge. Run :BrainStart first.', vim.log.levels.WARN)
    return
  end

  M.current.hints_used = M.current.hints_used + 1
  ui.append_chat({ '💡 **Requesting hint** (hints used: ' .. M.current.hints_used .. ')', '' })

  local f = io.open(M.current.code_file, 'r')
  local code = f and f:read('*a') or ''
  if f then f:close() end

  hints.get_hint(M.current.name or 'Unknown', code, M.current.last_test_passed, M.current.last_test_total, function(response, err)
    vim.schedule(function()
      if err then
        ui.append_chat({ '⚠️ Could not get hint: ' .. err, '' })
      else
        local lines = { '💡 **Hint:**', '' }
        for line in (response or ''):gmatch('[^\n]+') do table.insert(lines, line) end
        table.insert(lines, '')
        table.insert(lines, '---')
        table.insert(lines, '')
        ui.append_chat(lines)
      end
    end)
  end)
end

function M.submit()
  local ui = require('brain.ui')

  if not M.current.code_file then
    vim.notify('No active challenge. Run :BrainStart first.', vim.log.levels.WARN)
    return
  end

  ui.append_chat({ '📝 **Submitting solution...**', '' })

  local config = require('brain').config
  local cmd = vim.deepcopy(config.test_cmd)
  table.insert(cmd, M.current.test_file)

  local output_lines = {}
  vim.fn.jobstart(cmd, {
    cwd = config.challenges_dir,
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      for _, line in ipairs(data) do
        if line ~= '' then table.insert(output_lines, line) end
      end
    end,
    on_exit = function(_, code)
      vim.schedule(function() M._handle_submit(output_lines, code) end)
    end,
  })
end

function M._save_chat_transcript()
  local ui = require('brain.ui')
  if not M.current.dir or not ui.chat_buf or not vim.api.nvim_buf_is_valid(ui.chat_buf) then
    return nil
  end

  local chat_lines = vim.api.nvim_buf_get_lines(ui.chat_buf, 0, -1, false)
  local transcript = table.concat(chat_lines, '\n')
  local path = M.current.dir .. '/chat.md'

  local f = io.open(path, 'w')
  if f then
    f:write('# Challenge Chat Transcript — ' .. (M.current.date or 'unknown') .. '\n\n')
    f:write('Challenge: ' .. (M.current.name or 'Unknown') .. '\n\n---\n\n')
    f:write(transcript)
    f:close()
  end

  return transcript
end

function M._handle_submit(output_lines, exit_code)
  local ui = require('brain.ui')
  local scoring = require('brain.scoring')

  local json_str = table.concat(output_lines, '\n')
  local ok, result = pcall(vim.fn.json_decode, json_str)

  local total = 0
  local passed = 0

  if ok and result and result.testResults then
    for _, suite in ipairs(result.testResults) do
      for _, test in ipairs(suite.assertionResults or {}) do
        total = total + 1
        if test.status == 'passed' then passed = passed + 1 end
      end
    end
  end

  local all_pass = (passed == total and total > 0)
  local score, emoji = scoring.calculate_score(all_pass, M.current.hints_used)

  ui.append_chat({
    '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
    string.format('%s **%s** — Score: %d/3', emoji, M.current.name or 'Challenge', score),
    string.format('Tests: %d/%d | Hints used: %d', passed, total, M.current.hints_used),
    '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
    '',
  })

  M._save_chat_transcript()

  scoring.update_log(
    M.current.date,
    M.current.name or 'Unknown',
    score, emoji,
    M.current.hints_used,
    passed, total
  )

  -- Fire user callback if configured
  local config = require('brain').config
  if config.on_submit then
    config.on_submit({
      date = M.current.date,
      challenge = M.current.name,
      score = score,
      emoji = emoji,
      hints = M.current.hints_used,
      passed = passed,
      total = total,
    })
  end

  vim.notify(string.format('Brain: %s %d/3 points!', emoji, score), vim.log.levels.INFO)
end

function M.skip()
  local ui = require('brain.ui')
  local hints = require('brain.hints')

  if not M.current.code_file then
    vim.notify('No active challenge. Run :BrainStart first.', vim.log.levels.WARN)
    return
  end

  ui.append_chat({ '⏭️ **Skipping — requesting solution explanation...**', '' })

  local f = io.open(M.current.code_file, 'r')
  local code = f and f:read('*a') or ''
  if f then f:close() end

  hints.get_solution(M.current.name or 'Unknown', code, function(response, err)
    vim.schedule(function()
      if err then
        ui.append_chat({ '⚠️ Could not get solution: ' .. err, '' })
      else
        local lines = { '📖 **Solution:**', '' }
        for line in (response or ''):gmatch('[^\n]*') do table.insert(lines, line) end
        table.insert(lines, '')
        ui.append_chat(lines)
      end
    end)
  end)

  local scoring = require('brain.scoring')
  scoring.update_log(M.current.date, M.current.name or 'Unknown', 0, '⏭️', M.current.hints_used, 0, 0)
end

return M
