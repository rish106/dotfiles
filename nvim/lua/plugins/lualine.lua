local function git()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = " " .. git_status.head

  return branch_name .. added .. changed .. removed
end

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
        return (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end
  return ""
end

local colors = require("catppuccin.palettes").get_palette "mocha"

local custom_catppuccin = require("lualine.themes.gruvbox")

custom_catppuccin.normal.c.bg = "#11111b"
custom_catppuccin.insert.c.bg = "#11111b"

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
        separator = { left = "", right = "" }
      },
    },
    lualine_b = {
      {
        function() return git() end,
        separator = { right = "" },
        color = {
          bg = colors.surface0,
          fg = colors.text,
        },
      }
    },
    lualine_c = {
      "%=",
      {
        function() return lsp_progress() end,
        color = {
          fg = colors.green,
        }
      }
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp", "nvim_diagnostic" },
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
      },
      {
        function() return lsp_status() end,
        color = {
          fg = colors.subtext0,
        }
      },
    },
    lualine_y = {},
    lualine_z = {},
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
