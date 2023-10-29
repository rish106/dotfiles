local function lsp_progress()
  if not rawget(vim, "lsp") or vim.lsp.status then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

  return content or ""
end

local function lsp_status()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and "  " .. client.name ) or "  LSP"
      end
    end
  end
  return ""
end

local colors = require("catppuccin.palettes").get_palette("mocha")
colors.old_base = "#1e1e2e"

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = "",
    section_separators = { left = "", right = "" },
    refresh = {
      statusline = 200,
    }
  },
  sections = {
    lualine_a = {
      {
        "mode",
        padding = 0,
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        "filetype",
        colored = true,
        icon_only = true,
        padding = {
          left = 1,
          right = 0,
        },
        color = {
          bg = colors.old_base,
        },
      },
      {
        "filename",
        separator = { right = "" },
        padding = {
          left = 1,
          right = 0,
        },
        symbols = {
          modified = "",
          readonly = "󰌾",
        },
        color = {
          fg = colors.text,
          bg = colors.old_base,
        },
      },
    },
    lualine_c = {
      {
        "branch",
        padding = {
          left = 1,
          right = 0,
        },
        colored = true,
        icon = "",
        separator = { right = "" },
        color = {
          bg = colors.surface0,
          fg = colors.text,
        },
      },
      {
        "diff",
        padding = {
          left = 1,
          right = 0,
        },
        colored = true,
        diff_color = {
          added    = "LuaLineDiffAdd",
          modified = "LuaLineDiffChange",
          removed  = "LuaLineDiffDelete",
        },
        symbols = {added = " ", modified = " ", removed = " "},
        source = nil,
      },
      "%=",
      {
        function() return lsp_progress() end,
        color = {
          fg = colors.green,
        }
      }
    },
    lualine_x = {
    },
    lualine_y = {
      {
        "diagnostics",
        padding = {
          left = 0,
          right = 1,
        },
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },

        diagnostics_color = {
          error = "DiagnosticError",
          warn  = "DiagnosticWarn",
          info  = "DiagnosticInfo",
          hint  = "DiagnosticHint",
        },
        symbols = {
          error = " ",
          warn = " ",
          info = "󰋼 ",
          hint = "󰛩 "
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
        separator = {},
      },
    },
    lualine_z = {
      {
        function() return lsp_status() end,
        separator = { left = "", right = "" },
        padding = 0,
        color = {
          fg = colors.subtext1,
          bg = colors.surface0,
        }
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
