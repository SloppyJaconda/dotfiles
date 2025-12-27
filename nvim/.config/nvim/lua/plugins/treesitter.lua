return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
        "c", 
        "cpp", 
        "lua", 
        "bash", 
        "vim", 
        "rust"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
}
