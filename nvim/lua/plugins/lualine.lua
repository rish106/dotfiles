-- stylua: ignore
local mode_map = {
  ['n']      = 'N',
  ['no']     = 'O-P',
  ['nov']    = 'O-P',
  ['noV']    = 'O-P',
  ['no\22']  = 'O-P',
  ['niI']    = 'N',
  ['niR']    = 'N',
  ['niV']    = 'N',
  ['nt']     = 'N',
  ['ntT']    = 'N',
  ['v']      = 'V',
  ['vs']     = 'V',
  ['V']      = 'V-L',
  ['Vs']     = 'V-L',
  ['\22']    = 'V-B',
  ['\22s']   = 'V-B',
  ['s']      = 'S',
  ['S']      = 'S-L',
  ['\19']    = 'S-B',
  ['i']      = 'I',
  ['ic']     = 'I',
  ['ix']     = 'I',
  ['R']      = 'R',
  ['Rc']     = 'R',
  ['Rx']     = 'R',
  ['Rv']     = 'V-R',
  ['Rvc']    = 'V-R',
  ['Rvx']    = 'V-R',
  ['c']      = 'C',
  ['cv']     = 'EX',
  ['ce']     = 'EX',
  ['r']      = 'R',
  ['rm']     = 'MORE',
  ['r?']     = 'CONFIRM',
  ['!']      = 'SH',
  ['t']      = 'TERM',
}

local function vim_mode()
  local mode_code = vim.api.nvim_get_mode().mode
  if mode_map[mode_code] == nil then
    return mode_code
  end
  return mode_map[mode_code]
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
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

local function location()
  local line = vim.fn.line('.')
  local col = vim.fn.virtcol('.')
  return string.format('%d:%d', line, col)
end

local colors = require("catppuccin.palettes").get_palette("mocha")
local old_base = "#1e1e2e"

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = "",
    section_separators = { left = "", right = "" },
    refresh = {
      statusline = 200,
    }
  },
  sections = {
    lualine_a = {
      {
        function() return vim_mode() end,
        padding = 1,
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
          bg = old_base,
        },
      },
      {
        "filename",
        padding = {
          left = 1,
          right = 1,
        },
        symbols = {
          modified = "",
          readonly = "󰌾",
        },
        color = {
          fg = colors.text,
          bg = old_base,
        },
      },
    },
    lualine_c = {
      {
        "branch",
        padding = {
          left = 1,
          right = 1,
        },
        colored = true,
        icon = "",
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
        source = diff_source,
      },
      "%=",
    },
    lualine_x = {
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
      },
    },
    lualine_y = {
    },
    lualine_z = {
      {
        function() return lsp_status() end,
        padding = 1,
        color = {
          fg = colors.text,
          bg = colors.surface0,
        }
      },
      {
        function() return location() end,
        colored = true,
        padding = 1,
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
