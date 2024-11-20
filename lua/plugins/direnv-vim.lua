return {
    "direnv/direnv.vim",
    config = function ()
        vim.g.direnv_auto = 1
        vim.g.direnv_silent_load = 1
    end
}
