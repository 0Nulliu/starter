-- ~/.config/nvim/lua/plugins/rust.lua

return {
  -- This first section ensures that the necessary external tools are installed
  -- by Mason. We are extending the default Mason configuration here.
  {
    "williamboman/mason.nvim",
    opts = {
      -- `ensure_installed` is a list of tools that Mason will automatically install
      -- if they are not already present.
      ensure_installed = {
        -- The LSP (Language Server) for Rust, providing smart autocompletion,
        -- error checking, and go-to-definition.
        "rust-analyzer",

        -- The DAP (Debug Adapter Protocol) server for Rust, which allows
        -- us to debug our code with breakpoints.
        "codelldb",
      },
    },
  },

  -- This is the main plugin for Rust development. It integrates rust-analyzer
  -- and the debugger for a seamless experience.
  {
    "mrcjkb/rustaceanvim",
    -- Pin to a major version to avoid breaking changes.
    version = "^4",
    -- This is a LazyVim optimization: only load the plugin for Rust files.
    ft = { "rust" },
    -- These are the plugin's specific configuration options.
    opts = {
      -- Configuration for the DAP (debugger).
      dap = {
        -- `rustaceanvim` provides a helper function to generate the correct
        -- adapter configuration for codelldb.
        adapter = require("rustaceanvim.config").get_codelldb_adapter(
          -- These are the paths to the debugger executable and its adapter
          -- files AS THEY EXIST *INSIDE* THE CONTAINER.
          -- Mason will install them to this location within the container's
          -- file system.
          "/home/devuser/.local/share/nvim/mason/bin/codelldb",
          "/home/devuser/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
        ),
      },
    },
  },
}
