vim.keymap.set('n', ' c', ':noh\n', opts)

vim.keymap.set("n", " m",
    function() require("diagram").show_diagram_hover() end
)
