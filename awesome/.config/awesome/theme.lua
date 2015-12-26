local awful = require("awful")
awful.util = require("awful.util")

--awesome loads the theme into an anonymous block and stores it in beautiful
--so we do a similar thing which allows overriding the theme values before it is loaded by beautiful
local themeblock = loadfile("/usr/share/awesome/themes/powerarrow-darker/theme.lua")

themeblock()
theme = themeblock()
theme.tasklist_disable_icon = true
theme.wallpaper = awful.util.getdir("config") .. "/wall.png"
theme.awesome_icon = "/usr/share/awesome/themes/powerarrow-darker/icons/submenu.png"
theme.border_width = "0"

return theme
