-- redraw on mode_change
vim.api.nvim_create_autocmd("ModeChanged", {
   group = vim.api.nvim_create_augroup("tabline", { clear = true }),
   pattern = "*",
   callback = function() vim.cmd.redrawtabline() end,
})

-- all help in :h statusline
local cond = require "heirline.conditions"
local utils = require "heirline.utils"
local navic = require "nvim-navic"
-- local snip = require "luasnip"

navic.setup {
   icons = {
      -- from ? (possibly neovim from scratch)
      Array = "",
      Boolean = "蘒",
      Key = "",
      Namespace = "",
      Null = "ﳠ",
      Number = "",
      Object = "",
      Package = "",
      String = "",
      -- from lspkind
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Enum = "",
      File = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
   },
   depth_limit_indicator = "...",
}

local gethl = utils.get_highlight

-- separators
local space = { provider = "%=" }
local l = ""
local r = ""

-- components
-- modehl
local function mhl(self)
   local colour = self:mode_colour()
   return { fg = colour, bg = "bg" }
end

local function reverse_mhl(self)
   local colour = self:mode_colour()
   return { fg = "bg", bg = colour }
end

local modes = {
   static = {
      mode_names = {
         n = "NORMAL",
         no = "NORMAL?",
         nov = "NORMAL?",
         noV = "NORMAL?",
         ["no\22"] = "NORMAL?",
         niI = "INSERT[N]",
         niR = "REPLACE[N]",
         niV = "RE-VIRTUAL[N]",
         nt = "NORMAL[T]",
         v = "VISUAL",
         vs = "SELECT[V]",
         V = "VI-LINE",
         Vs = "SELECT[V-L]",
         ["\22"] = "VI-BLOCK",
         ["\22s"] = "SELECT[V-B]",
         s = "SELECT",
         S = "SE-LINE",
         ["\19"] = "SE-BLOCK",
         i = "INSERT",
         ic = "INSERT[c]",
         ix = "INSERT[x]",
         R = "REPLACE",
         Rc = "REPLACE[c]",
         Rx = "REPLACE[x]",
         Rv = "RE-VIRTUAL",
         Rvc = "RE-VIRTUAL[c]",
         Rvx = "RE-VIRTUAL[x]",
         c = "COMMAND",
         cv = "EX",
         r = "HIT ENTER!",
         rm = "MORE",
         ["r?"] = "?",
         ["!"] = "SHELLING",
         t = "TERMINAL",
      },
   },
   provider = function(self) return "ඞ " .. self.mode_names[vim.fn.mode(1)] .. " " end,
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = "bg", bg = colour, bold = true }
   end,
}

local mode_comp = { { provider = l, hl = mhl }, modes }

local git = {
   condition = cond.is_git_repo,
   init = function(self)
      ---@diagnostic disable-next-line: undefined-field
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
   end,
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = colour, bg = "gray" }
   end,
   { -- git branch name
      provider = function(self) return "  " .. self.status_dict.head .. " " end,
      hl = { bold = true },
   },
   {
      provider = function(self)
         local count = self.status_dict.added or 0
         return count > 0 and ("+" .. count)
      end,
      hl = { fg = "green", bg = "gray" },
   },
   {
      provider = function(self)
         local count = self.status_dict.removed or 0
         return count > 0 and ("-" .. count)
      end,
      hl = { fg = "red", bg = "gray" },
   },
   {
      provider = function(self)
         local count = self.status_dict.changed or 0
         return count > 0 and ("~" .. count)
      end,
      hl = { fg = "blue", bg = "gray" },
   },
   {
      condition = function(self) return self.has_changes end,
      provider = " ",
   },
}

-- lsp clients
local active_lsp = {
   provider = function()
      local names = {}
      for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
         table.insert(names, server.name)
      end
      return " [ " .. table.concat(names, " ") .. "]"
   end,
   update = { "ModeChanged", "LspAttach", "LspDetach" },
   condition = cond.lsp_attached,
   hl = mhl,
}

-- diagnostics
local diagnostics = {
   condition = cond.has_diagnostics,
   init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
   end,
   update = { "DiagnosticChanged", "BufEnter", "ModeChanged" },
}
diagnostics = utils.insert(diagnostics, { provider = "[", hl = mhl }, {
   provider = function(self) return self.errors > 0 and ("E" .. self.errors) end,
   hl = { fg = "red", bg = "bg" },
}, {
   provider = function(self) return self.warnings > 0 and ("W" .. self.warnings) end,
   hl = { fg = "yellow", bg = "bg" },
}, {
   provider = function(self) return self.info > 0 and ("I" .. self.info) end,
   hl = { fg = "cyan", bg = "bg" },
}, {
   provider = function(self) return self.hints > 0 and ("H" .. self.hints) end,
   hl = { fg = "green", bg = "bg" },
}, { provider = "]", hl = mhl })

-- file name
local file_name = {
   init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
   condition = function() return vim.bo.filetype ~= "help" end,
}

local file_icon = {
   init = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_colour = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
   end,
   provider = function(self) return self.icon and (self.icon .. " ") end,
   hl = function(self) return { fg = self.icon_colour, bg = "bg" } end,
}

local file_pathname = {
   provider = function(self)
      local filename = vim.fn.fnamemodify(self.filename, ":.")
      if self.filename == "" then return "[No Name] " end
      -- shorten if it is over 1/5 of the status bar
      if not cond.width_percent_below(#filename, 0.2) then filename = vim.fn.pathshorten(filename) end
      return filename .. " "
   end,
   hl = mhl,
}

local file_flags = {
   {
      condition = function() return vim.bo.modified end,
      provider = "[+]",
   },
   {
      condition = function() return not vim.bo.modifiable end,
      provider = "[-]",
   },
   {
      condition = function() return vim.bo.readonly end,
      provider = "[RO]",
      hl = { fg = "orange", bg = "bg" },
   },
}

file_name = utils.insert(file_name, file_icon, file_pathname, file_flags)

-- help file name
local help_filename = {
   condition = function() return vim.bo.filetype == "help" end,
   provider = function()
      local filename = vim.api.nvim_buf_get_name(0)
      return " " .. vim.fn.fnamemodify(filename, ":t")
   end,
   hl = mhl,
}

-- snippet indicator
-- local snippet_indicator = {
--    condition = function() return vim.tbl_contains({ "s", "i" }, vim.fn.mode()) end,
--    provider = function()
--       local backward = snip.jumpable(-1) and "<- " or ""
--       -- local choice = snip.choice_active() and "!!" or ""
--       local foward = snip.jumpable(1) and "->" or ""
--       return "[ " .. backward .. foward .. "]"
--    end,
--    update = { "CursorMovedI" },

--    hl = mhl,
-- }

-- harpoon
-- stolen from https://github.com/chrisgrieser/.config/nvim/lua/plugins/lualine.lua
local harpoon = {
   static = {
      read_file = function(path)
         local file, err = io.open(path, "r")
         if not file then
            vim.notify_once("Could not read: " .. err, vim.log.levels.ERROR)
            return
         end
         local content = file:read "*a"
         file:close()
         return content
      end,
   },
   condition = function(self)
      local harpoon_json_path = vim.fn.stdpath "data" .. "/harpoon.json"
      local file_exists = vim.fn.filereadable(harpoon_json_path) ~= 0
      if not file_exists then return end
      local harpoon_json = self.read_file(harpoon_json_path)
      if not harpoon_json then return end

      local harpoon_data = vim.json.decode(harpoon_json)
      local pwd = vim.loop.cwd()
      if not pwd or not harpoon_data then return end
      local current_project = harpoon_data.projects[pwd]
      if not current_project then return end
      local marked_file = current_project.mark.marks
      local current_file = vim.fn.expand "%"

      for _, file in pairs(marked_file) do
         if file.filename == current_file then return true end
      end
   end,
   provider = "[harpoon]",
   update = { "BufReadPost", "UiEnter" },
   hl = mhl,
}

-- stolen from lualine
local filesize = {
   provider = function()
      local file = vim.fn.expand "%:p"
      if file == nil or #file == 0 then return "" end
      local size = vim.fn.getfsize(file)
      if size <= 0 then return "" end

      local suffixes = { "b", "k", "m", "g" }

      local i = 1
      while size > 1024 and i < #suffixes do
         size = size / 1024
         i = i + 1
      end

      local format = i == 1 and "%d%s" or "%.1f%s"
      return "[" .. string.format(format, size, suffixes[i]) .. "]"
   end,
   update = { "ModeChanged", "TextChanged" },
   hl = mhl,
}

-- filesize, stolen from lualine
-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
local encoding = {
   init = function(self) self.encoding = vim.opt.fileencoding:get() end,
   provider = function(self)
      local display = self.encoding
      display = display == "" and "[encoding] " or "[" .. display .. "] "
      return display
   end,
   update = { "ModeChanged", "BufEnter" },
   hl = mhl,
}

-- line ending
local fileformat = {
   -- pillcrow :thumbsup:
   provider = function() return " ¶ " .. vim.bo.fileformat .. " |" end,
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = colour, bg = "gray" }
   end,
}
-- filetype
local filetype = {
   provider = function()
      -- not " %y " because have [] and this is not the place for it
      local filetype = vim.bo.filetype
      filetype = filetype == "" and "noft" or filetype
      return " " .. filetype .. " "
   end,
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = colour, bg = "gray" }
   end,
}

-- ruler
local ruler = {
   provider = " %7(%l/%3L%):%2c %P",
   hl = reverse_mhl,
}
ruler = utils.insert(ruler, { provider = r, hl = mhl })

-- tabline
-- buffers
local bufnrcomp = {
   provider = function(self) return tostring(self.bufnr) .. ". " end,
}

local bufaltflag = {
   condition = function(self)
      local thing = vim.fn.fnamemodify(self.filename, ":.")
      if (thing == vim.fn.expand "#") and (thing ~= "") then return true end
   end,
   provider = "#",
   hl = { fg = "orange" },
}

local bufnamecomp = {
   provider = function(self)
      local filename = self.filename
      filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
      return filename
   end,
}

local bufflagscomp = {
   {
      condition = function(self) return vim.api.nvim_buf_get_option(self.bufnr, "modified") end,
      provider = "[+]",
   },
   {
      condition = function(self) return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable") end,
      provider = "[-]",
   },
   {
      condition = function(self) return vim.api.nvim_buf_get_option(self.bufnr, "readonly") end,
      provider = function(self)
         if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
            return " [T]"
         else
            return " [RO]"
         end
      end,
      hl = { fg = "bg", italic = true },
   },
}

local tablinecorner = function(char)
   return {
      provider = char,
      hl = function(self)
         local colour = self:mode_colour()
         if self.is_active then
            return { fg = colour, bg = "bg" }
         else
            return { fg = "gray", bg = "bg" }
         end
      end,
   }
end

local tablineblockhl = function(self)
   local colour = self:mode_colour()
   if self.is_active then
      return { fg = "bg", bg = colour }
   else
      return { fg = colour, bg = "gray" }
   end
end

local bufnameblock = {
   init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
   hl = tablineblockhl,
   tablinecorner(l),
   bufnrcomp,
   bufaltflag,
   bufnamecomp,
   bufflagscomp,
   tablinecorner(r),
}

local bufs = utils.make_buflist(bufnameblock)

-- tabs
local sidebarcorner = function(self)
   local colour = self:mode_colour()
   if vim.api.nvim_get_current_win() == self.winid then
      return { fg = colour, bg = "bg" }
   else
      return { fg = "gray" }
   end
end
local sidebarcond = function(self)
   local win = vim.api.nvim_tabpage_list_wins(0)[1]
   local bufnr = vim.api.nvim_win_get_buf(win)
   self.winid = win

   if vim.bo[bufnr].filetype == "NvimTree" then
      self.title = "NvimTree"
      return true
   elseif vim.bo[bufnr].filetype == "undotree" then
      self.title = "UndoTree"
      return true
   end
end
local sidebaroffset = {
   { provider = l, condition = sidebarcond, hl = sidebarcorner },
   {
      condition = sidebarcond,
      provider = function(self)
         local title = self.title
         local width = vim.api.nvim_win_get_width(self.winid)
         local pad = math.ceil((width - #title) / 2) - 1 -- need to considre corners
         return string.rep(" ", pad) .. title .. string.rep(" ", pad)
      end,
      hl = function(self)
         local colour = self:mode_colour()
         if vim.api.nvim_get_current_win() == self.winid then
            return { fg = "bg", bg = colour }
         else
            return { fg = colour, bg = "gray" }
         end
      end,
   },
   { provider = r, condition = sidebarcond, hl = sidebarcorner },
}

local tabblock = {
   tablinecorner(l),
   {
      provider = function(self) return self.tabpage end,
      hl = tablineblockhl,
   },
   tablinecorner(r),
}

local tabs = utils.make_tablist(tabblock)

-- winbar
local cwd = {
   provider = "root: " .. vim.fn.getcwd() .. " || ",
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = colour }
   end,
}

local navic_block = {
   condition = function() return navic.is_available() end,
   static = {
      type_hl = {
         File = "Directory",
         Module = "@include",
         Namespace = "@namespace",
         Package = "@include",
         Class = "@structure",
         Method = "@method",
         Property = "@property",
         Field = "@field",
         Constructor = "@constructor",
         Enum = "@field",
         Interface = "@type",
         Function = "@function",
         Variable = "@variable",
         Constant = "@constant",
         String = "@string",
         Number = "@number",
         Boolean = "@boolean",
         Array = "@field",
         Object = "@type",
         Key = "@keyword",
         Null = "@comment",
         EnumMember = "@field",
         Struct = "@structure",
         Event = "@keyword",
         Operator = "@operator",
         TypeParameter = "@type",
      },
      -- bit operation dark magic, see below...
      enc = function(line, col, winnr) return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr) end,
      -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
      dec = function(c)
         local line = bit.rshift(c, 16)
         local col = bit.band(bit.rshift(c, 6), 1023)
         local winnr = bit.band(c, 63)
         return line, col, winnr
      end,
   },
   init = function(self)
      local data = navic.get_data() or {}
      local children = {}
      -- create a child for each level
      for i, d in ipairs(data) do
         -- encode line and column numbers into a single integer
         local child = {
            {
               provider = d.icon .. " ",
               hl = self.type_hl[d.type],
            },
            {
               -- escape `%`s (elixir) and buggy default separators
               provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ""),
            },
         }
         -- add a separator only if needed
         if #data > 1 and i < #data then
            table.insert(child, {
               provider = " > ",
               hl = function(self_hl)
                  local colour = self_hl:mode_colour()
                  return { fg = colour }
               end,
            })
         end
         table.insert(children, child)
      end
      -- instantiate the new child, overwriting the previous one
      self.child = self:new(children, 1)
   end,
   -- evaluate the children containing navic components
   provider = function(self) return self.child:eval() end,
   update = { "CursorMoved", "ModeChanged" },
}

local cur_bufnr = {
   provider = function() return "bufnr: " .. vim.fn.bufnr() end,
   hl = function(self)
      local colour = self:mode_colour()
      return { fg = colour }
   end,
}

-- local DAPMessages = {
--     condition = function()
--         local session = require("dap").session()
--         return session ~= nil
--     end,
--     provider = function()
--         return " " .. require("dap").status()
--     end,
--     hl = "Debug"
--     -- see Click-it! section for clickable actions
-- }

local hl_static = {
   mode_colours_map = {
      n = "blue",
      i = "red",
      v = "yellow",
      V = "yellow",
      ["\22"] = "yellow",
      c = "green",
      s = "purple",
      S = "purple",
      R = "orange",
      ["\19"] = "purple",
      r = "orange",
      ["!"] = "purple",
      t = "cyan",
   },
   mode_colour = function(self)
      local mode = cond.is_active() and vim.fn.mode() or "n"
      return self.mode_colours_map[mode]
   end,
}

require("heirline").setup {
   statusline = {
      mode_comp,
      git,
      active_lsp,
      diagnostics,
      space,
      file_name,
      help_filename,
      space,
      -- snippet_indicator,
      harpoon,
      filesize,
      encoding,
      fileformat,
      filetype,
      ruler,
      static = hl_static,
   },
   winbar = {
      cwd,
      navic_block,
      space,
      cur_bufnr,
      static = hl_static,
   },
   tabline = {
      sidebaroffset,
      bufs,
      space,
      tabs,
      static = hl_static,
   },
   opts = {
      colors = {
         bg = "#16161e",
         red = gethl("Substitute").bg,
         orange = gethl("Constant").fg,
         yellow = gethl("WarningMsg").fg,
         green = gethl("String").fg,
         blue = gethl("Function").fg,
         gray = gethl("NonText").fg,
         purple = gethl("Statement").fg,
         cyan = gethl("Special").fg,
         diag_warn = gethl("DiagnosticWarn").fg,
         diag_error = gethl("DiagnosticError").fg,
         diag_hint = gethl("DiagnosticHint").fg,
         diag_info = gethl("DiagnosticInfo").fg,
      },
      disable_winbar_cb = function()
         local type = vim.bo.filetype
         for _, v in ipairs {
            "TelescopePrompt",
            "TelescopeResults",
            "alpha",
            "WhichKey",
            "tetris",
            "Trouble",
            "vim",
            "lspinfo",
            "mason",
            "lazy",
            "NvimTree",
            "diff",
            "undotree",
            "Navbuddy",
            "harpoon",
            "help",
            "",
         } do
            if type == v then return true end
         end

         return false
      end,
   },
}
