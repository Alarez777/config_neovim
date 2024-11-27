-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    branch = "main", -- optional but strongly recommended
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    enabled = true,
    event = "VeryLazy",
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisura" } end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function() require("neoscroll").setup {} end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup {
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim" },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  { "lotabout/skim", lazy = false, priority = 1000 },
  {
    "liuchengxu/vista.vim",
    event = "VeryLazy",
    requires = { "lotabout/skim" },
    config = function() vim.g.vista_sidebar_width = 55 end,
  }, -- {
  --   "simrat39/symbols-outline.nvim",
  --   event = "VeryLazy",
  --   -- config = function()
  --   --   local opts = {}
  --   --   require("symbols-outline").setup(opts)
  --   -- end,
  -- },
  {
    "mbbill/undotree",
  },
  { "kevinhwang91/nvim-hlslens", config = function() require("hlslens").setup {} end },
  { "gitsigns",
    enabled = false
  },

  {
    "dstein64/nvim-scrollview",
    enabled = true,
    config = function()
      require("scrollview").setup {
        excluded_filetypes = { "nerdtree" },
        current_only = true,
        signs_on_startup = { "all" },
        diagnostics_severities = { vim.diagnostic.severity.ERROR },
      }
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    enabled = false,
    config = function()
      local colors = require "tokyonight.colors" -- Asegúrate de que este es el módulo correcto para obtener los colores
      require("scrollbar").setup {
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        folds = 100000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
        max_lines = false, -- disables if no. of lines in buffer exceeds this
        hide_if_all_visible = false, -- Hides everything if all lines are visible
        throttle_ms = 100,
        handle = {
          text = " ",
          blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
          -- color = nil,
          color = "#A843AA", -- cterm
          -- color_nr = "#A843AA", -- cterm
          highlight = "CursorColumn",
          hide_if_all_visible = false, -- Hides handle if all lines are visible
        },
        marks = {
          Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = "#2792e6",
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
          },
          Search = {
            text = { "-", "=" },
            priority = 1,
            gui = nil,
            color = "#35c802",
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Search",
          },
          Error = {
            text = { "-", "=" },
            priority = 2,
            gui = nil,
            color = colors.error,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
          },
          Warn = {
            text = { "-", "=" },
            priority = 3,
            gui = nil,
            color = colors.warning,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
          },
          Info = {
            text = { "-", "=" },
            priority = 4,
            gui = nil,
            color = colors.info,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
          },
          Hint = {
            text = { "-", "=" },
            priority = 5,
            gui = nil,
            color = colors.hint,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
          },
          Misc = {
            text = { "-", "=" },
            priority = 6,
            gui = nil,
            color = colors.purple,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
          },
          GitAdd = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
          },
          GitChange = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
          },
          GitDelete = {
            text = "▁",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
          },
        },
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "cmp_docs",
          "cmp_menu",
          "noice",
          "prompt",
          "TelescopePrompt",
        },
        autocmd = {
          render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
          },
          clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
          },
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = true, -- Requires gitsigns
          handle = true,
          search = true, -- Requires hlslens
          ale = false, -- Requires ALE
        },
      }
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- keys = {
    --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    -- },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    enabled = true,
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<Right>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<c-Right>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<c-Left>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    end,
  },
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = function()
      require("smoothcursor").setup {
        type = "default",
        cursor = "",
        texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
        linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.
        autostart = true,
        always_redraw = true, -- Redraw the screen on each update
        flyin_effect = nil, -- Choose "bottom" or "top" for flying effect
        speed = 25, -- Max speed is 100 to stick with your current position
        intervals = 35, -- Update intervals in milliseconds
        priority = 10, -- Set marker priority
        timeout = 3000, -- Timeout for animations in milliseconds
        threshold = 3, -- Animate only if cursor moves more than this many lines
        disable_float_win = false, -- Disable in floating windows
        enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
        disabled_filetypes = nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
      }
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" },
}
