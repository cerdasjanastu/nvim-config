
-- toggle filetype between HTML and XML
local function toggle_filetype()
    local current_ft = vim.bo.filetype
    if current_ft == "html" then
        vim.bo.filetype = "xml"
        vim.notify("Filetype changed to XML", vim.log.levels.INFO)
    elseif current_ft == "xml" then
        vim.bo.filetype = "html"
        vim.notify("Filetype changed to HTML", vim.log.levels.INFO)
    end
end

vim.keymap.set("n", "<leader>ft", toggle_filetype, { desc = "Toggle filetype HTML/XML" })


