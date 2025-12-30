return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    }
  end,
  config = function()
    require('telescope').setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
      }
    }
  end
}

