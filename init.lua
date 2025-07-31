vim.opt.swapfile = false
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', ';', '<CR>')

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

if vim.g.neovide then
  vim.o.guifont = 'Monaspace Neon Frozen ExtraBold::h11' -- text below applies for VimScript

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format('%x', math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_opacity = 0.0
  vim.g.transparency = 0.1
  vim.g.neovide_background_color = '#0f1117' .. alpha()
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

 vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8 -- vim.g.neovide_text_gamma = 0.0
  -- vim.g.neovide_text_contrast = 0.5
  --
end

-- The line beneath this is called `modeline`. See `:help modeline`
local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd 'silent w'

      local time = os.date '%I:%M %p'

      -- print nice colored msg
      vim.api.nvim_echo({ { '󰄳', 'LazyProgressDone' }, { ' file autosaved at ' .. time } }, false, {})

      clear_cmdarea()
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
