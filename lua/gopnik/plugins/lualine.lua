-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_duskfox = require("lualine.themes.duskfox")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_duskfox.normal.a.bg = new_colors.blue
lualine_duskfox.insert.a.bg = new_colors.green
lualine_duskfox.visual.a.bg = new_colors.violet
lualine_duskfox.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_duskfox,
  },
})
