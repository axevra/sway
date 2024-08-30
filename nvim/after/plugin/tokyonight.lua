-- Tokyo Night Configuration
vim.g.tokyonight_style = "night"  -- Options: 'storm', 'night', 'moon'
vim.g.tokyonight_transparent = true  -- Enable transparent background
vim.g.tokyonight_italic_comments = true  -- Italicize comments
vim.g.tokyonight_italic_keywords = true  -- Italicize keywords
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }  -- Set transparent sidebars

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
