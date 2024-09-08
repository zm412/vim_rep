local THEME_DIR = os.getenv("HOME") .. '/.config/awesome/themes/'
local themes_path = THEME_DIR 
local theme_assets = require("beautiful.theme_assets")
local gears = require("gears")
local awful = require("awful")

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")

-- Generate wallpaper:

theme.wallpaper1 = {
    themes_path .. "myTheme/1.jpg",
    themes_path .. "myTheme/2.jpg",
    themes_path .. "myTheme/3.jpg",
    themes_path .. "myTheme/4.jpg",
    themes_path .. "myTheme/5.jpg",
    themes_path .. "myTheme/6.jpg",
    themes_path .. "myTheme/7.jpg",
    themes_path .. "myTheme/1.webp",
    themes_path .. "myTheme/2.webp",
    themes_path .. "myTheme/3.webp",
}

local wallpaper_bg = themes_path.."myTheme/7.jpg"
local wallpaper_fg = '#fa8787'
local wallpaper_alt_fg = '#7e5edc'

theme.wallpaper = function(s)
    return gears.wallpaper.maximized(wallpaper_bg, s)
end



return theme
