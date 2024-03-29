local cmp = require("cmp")
local luasnip = require("luasnip")

local function solid_border(hl_name)
  return {
    { "┏", hl_name },
    { "━", hl_name },
    { "┓", hl_name },
    { "┃", hl_name },
    { "┛", hl_name },
    { "━", hl_name },
    { "┗", hl_name },
    { "┃", hl_name },
  }
end

local function rounded_border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
}

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = { "abbr", "kind", "menu" },

  format = function(_, item)
    local icon = icons[item.kind] or ""
    local label = item.abbr
    local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
    if truncated_label ~= label then
      item.abbr = truncated_label .. ELLIPSIS_CHAR
    end
    item.kind = string.format("%s %s", icon, item.kind)
    return item
  end,
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  completion = {
    completeopt = "menu,menuone",
  },

  window = {
    completion = {
      side_padding = 1,
      border = solid_border "CmpBorder",
      scrollbar = false,
    },
    documentation = {
      border = solid_border "CmpBorder",
    }
  },

  formatting = formatting_style,

  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
})
