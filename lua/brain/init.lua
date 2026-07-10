local M = {}

M.config = {
  -- Where challenge files are scaffolded (created on first :BrainStart)
  challenges_dir = vim.fn.expand('~/.local/share/brain.nvim/challenges'),

  -- Markdown log of scores
  log_file = vim.fn.expand('~/.local/share/brain.nvim/training.md'),

  -- Test runner command (must support --reporter=json)
  test_cmd = { 'npx', 'vitest', 'run', '--reporter=json' },

  -- Challenge provider: "leetcode" (daily public LeetCode problem) or "builtin"
  challenge_provider = 'leetcode',

  -- LeetCode daily challenge settings
  leetcode = {
    endpoint = 'https://leetcode.com/graphql',
    timeout = 8,
    fallback_to_builtin = true,
  },

  -- Hint provider: "openclaw" (local gateway) or "none"
  hint_provider = 'none',

  -- OpenClaw gateway settings (only used if hint_provider == "openclaw")
  openclaw = {
    port = 18789,
    token = '',
  },

  -- Telegram notifications (optional)
  telegram = {
    enabled = false,
  },

  -- Disable AI completion in challenge buffers
  disable_copilot = true,
}

M._setup_done = false

function M.setup(opts)
  if M._setup_done then return end
  M._setup_done = true
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})

  -- Ensure challenges dir exists
  vim.fn.mkdir(M.config.challenges_dir, 'p')

  -- Scaffold package.json if missing
  local pkg = M.config.challenges_dir .. '/package.json'
  if vim.fn.filereadable(pkg) == 0 then
    local f = io.open(pkg, 'w')
    if f then
      f:write(vim.fn.json_encode({
        name = 'brain-challenges',
        private = true,
        type = 'module',
        devDependencies = {
          vitest = '^3.0.0',
          typescript = '^5.7.0',
          ['@types/node'] = '^22.0.0',
        },
      }))
      f:close()
      vim.notify('brain.nvim: Run `npm install` in ' .. M.config.challenges_dir, vim.log.levels.INFO)
    end
  end
end

return M
