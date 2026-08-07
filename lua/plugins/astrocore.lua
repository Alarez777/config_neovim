local function paste_preserve_clipboard()
  local old_val = vim.fn.getreg("+")
  vim.api.nvim_command([[normal! p]])
  vim.fn.setreg("+", old_val)
end

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        guifont = "MesloLGS Nerd Font:h15",
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        neovide_title_background_color = black
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<leader>m"] = {
          function()
            flash.jump()
          end,
          desc = "Jump prompt",
        },
        ["<leader>,"] = {
          function()
            flash.jump({
              search = {
                mode = "search",
              },
              pattern = "^",
            })
          end,
          desc = "Jump line",
        },
        ["<leader>."] = {
          function()
            flash.jump({
              search = {
                mode = "search",
              },
              multi_window = false,
              pattern = ".",
            })
          end,
          desc = "Jump in line",
        },
        ["<leader>F"] = {
          function()
            require("flash").jump({
              search = {
                mode = "search",
              },
              label = {
                after = { 0, 0 },
              },
            })
          end,
          desc = "Flash jump f",
        },

        ["<leader>T"] = {
          function()
            require("flash").jump({
              search = {
                mode = "search",
              },
              label = {
                after = { 0, -1 },
              },
            })
          end,
          desc = "Flash jump t",
        },
        ["<leader>fs"] = {
          ":Telescope colorscheme<CR>",
          desc = "Select colorscheme",
        },
        ["<Tab><Tab>"] = { ":Telescope find_files<CR>", desc = "Find files" },
        ["<Tab>g"] = { ":Telescope live_grep<CR>", desc = "Find word" },
        ["<Tab>w"] = {
          ":Telescope grep_string<CR>",
          desc = "Find string in your under cursor",
        },
        ["<Tab>s"] = {
          ":Telescope current_buffer_fuzzy_find<CR>",
          desc = "Find string in your current buffer",
        },
        ["<Tab>h"] = { ":bprevious<CR>", desc = "Cambia al siguiente buffer" },
        ["<Tab>l"] = { ":bnext<CR>", desc = "Cambia al anterior buffer" },
        ["<Tab>v"] = { ":Vista finder skim<CR><CR>", desc = "Vista finder Skim" },
        ["<leader>v"] = { ":Vista!!<CR>", desc = "Vista" },
        ["<leader>;"] = { "$a:<Esc>o", desc = "Add ; the end of line" },
        ["<leader>-"] = { "<CMD>Oil --float<CR>", desc = "Open parent directory" },
      },
      v = {
        ["<Tab>"] = { ">gv", desc = "Make ident right" },
        ["<S-Tab>"] = { "<gv", desc = "Make ident left" },
        ["<S-Tab>"] = { "<gv", desc = "Make ident left" },
        ["<leader>p"] = { function() paste_preserve_clipboard() end, desc = "Paste preserving clipboard" },
        ["<leader>F"] = {
          function()
            require("flash").jump({
              search = {
                mode = "search",
              },
              label = {
                after = { 0, 0 },
              },
            })
          end,
          desc = "Flash jump f",
        },
        ["<leader>T"] = {
          function()
            require("flash").jump({
              search = {
                mode = "search",
              },
              label = {
                after = { 0, -1 },
              },
            })
          end,
          desc = "Flash jump t",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
