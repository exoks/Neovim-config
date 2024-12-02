--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀             𓐓  none_ls.lua 𓐔           --
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              --
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀   Student: oezzaou <oezzaou@student.1337.ma> --
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              --
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              --
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2024/11/06 14:39:02 by oezzaou--
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2024/12/02 21:35:57 by oezzaou--
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              --
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      --
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  --
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              --

-- [[ great pluging for management of linter & formatter as part from lsp ]]
return {
  {

    "nvimtools/none-ls.nvim",
    config = function()
      -- [[ Put the var into a local var ]]--
      local null_ls = require("null-ls")
      null_ls.setup({
        -- ensure_installed = {
        --   --"clangd",
        --   -- formatter for lua
        --   "stylua",
        --   -- linter for python
        --   "pylint",
        --   -- formatter for html
        --   "prettier",
        --   -- linter for html
        --   "markuplint",
        -- },
        --
        -- sources = {
        -- [[ adding the list of linter & formatter, use Mason to install them ]]--
        -- [ lua ] --
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.completion.spell,
        -- [[ python ]]--
        null_ls.builtins.diagnostics.pylint.with({
          extra_args = {
            "--load-plugins=pylint_django",
            "--help-msg=django-not-configured",
          },
        }),
        -- pylint/flake8 is not loading
        -- null_ls.builtins.formatting.black,

        --[[ html/css ]]
        -- dak l mouchkil l austori: sbabo l error li taywqa3 fi loading dyal cpplint ^
        -- these linter does not work for me
        -- null_ls.builtins.diagnostics.htmlhint,
        -- null_ls.builtins.diagnostics.stlelint,

        -- [[ C/C++ ]]--
        -- for c/c++ i'm using the built-in linter & formater of clangd
        -- null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnostics.cpplint,

        -- [[ js/ts/html ]] --
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.markuplint,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.code_actions.eslint_d,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        debug = true, -- Add debug mode to help identify issues
        -- },
      })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
    end,
  },
}

--[[ Questions ]]
-- the lsp has it's builting formater & linter but none-ls allows use to use external ones
--what is the diff between linter & formater ?
--linter : is tool that detect the errors in logic of code & suggest code fixes (katchod l machakil li endk fi l code o katqadhom)
--formatter: is a tool to check & reformat the code without changing the runtime behavior of the code (khedmatha sysntax language kat9ado)
