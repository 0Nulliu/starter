-- .nvim.conf/lua/plugins/rust.lua

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "codelldb",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    opts = function()
      return {
        dap = {
          adapter = require("rustaceanvim.config").get_codelldb_adapter(
            "/home/devuser/.local/share/nvim/mason/bin/codelldb",
            "/home/devuser/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
          ),
        },
      }
    end,
  },
}
