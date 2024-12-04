return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      -- "MasonInstall vue-language-server@1.8.27"
    },
  },
}
