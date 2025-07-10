-- from https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/plugin/floaterminal.lua

local state = {
    floating = {
        buf = -1,
        win = -1
    }
}

local function CreateFloatingWindow(opts)
    opts = opts or {}

    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local window_config = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, window_config)
    return { buf = buf, win = win}
end

local function ToggleTerminal()
    print(state.floating.buf, state.floating.win)
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = CreateFloatingWindow({buf = state.floating.buf})
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd("normal i")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.keymap.set({"n", "t"}, "\\tt", ToggleTerminal)
