return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local cmp_custom_mapping = {
      tab = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      shift_tab = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    }

    local function fn()
      cmp.mapping.complete()
      print("Working...")
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
        ["<C-Space>"] = fn(), -- Ask autocompletion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Select
        ["<Tab>"] = cmp.mapping(cmp_custom_mapping.tab, { "i", "s" }), -- Next
        ["<S-Tab>"] = cmp.mapping(cmp_custom_mapping.shift_tab, { "i", "s" }), -- Preview
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
    })

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    -- local servers = { 'volar', 'pyright', 'tsserver' }
    -- for _, lsp in ipairs(servers) do
    --     lspconfig[lsp].setup({ capabilities = capabilities })
    -- end
  end,
}
