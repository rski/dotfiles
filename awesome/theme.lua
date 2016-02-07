local awful = require("awful")
awful.util = require("awful.util")

--awesome loads the theme into an anonymous block and stores it in beautiful
--so we do a similar thing which allows overriding the theme values before it is loaded by beautiful
local themeblock = loadfile("/usr/share/awesome/themes/powerarrow-darker/theme.lua")

if themeblock == nil then
  themeblock = loadfile("/usr/share/awesome/themes/default/theme.lua")
end

themeblock()
theme = themeblock()
theme.tasklist_disable_icon = true
theme.wallpaper = awful.util.getdir("config") .. "/wall.png"
if theme.awesome_icon == nil then
  theme.awesome_icon = "/usr/share/awesome/themes/powerarrow-darker/icons/submenu.png"
end
theme.taglist_font="Tengwar Annatar 8"


theme.border_width = "5"
--theme.border_normal4D95F2
theme.border_focus   = "#295082"

return theme
