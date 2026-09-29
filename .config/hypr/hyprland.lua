local hl = hl -- consolidating all errors to one place


require("chimera")
require("mod_tokens")



local terminal = "kitty"
local fileEditor = "kitty -e nvim"
local fileManager = "kitty -e ranger"
local menu = "wofi -n --show drun"
local browser = "librewolf"



hl.on("hyprland.start", function ()
    hl.exec_cmd("dunst & waybar & hyprpaper & hyprsunset")
    hl.exec_cmd("hyprctl hyprsunset gamma $(cat "..os.getenv("HOME").."/.config/hypr/scripts/brightness)")
    hl.exec_cmd("libinput-gestures-setup start")
    hl.exec_cmd("eww daemon")
end)



hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENTOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_DRM_DEVICES", "/dev/dri/card")

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Nordzy-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Nordzy-cursors")
hl.env("HYPRSHOT_DIR", os.getenv("HOME").."/Pictures/Screenshots/")



hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = "#F8928EFF",
            inactive_border = "#F8928E70",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "#1A1A1AEE",
        },
        blur = {
            enabled = true,
            size = 8,
            passes = 4,
            vibrancy = 0.1696,
            xray = true,
        },
    },
    input = {
        kb_layout = "gb",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
        },
    },
    gestures = {
        workspace_swipe_forever = false,
        workspace_swipe_direction_lock = true,
    },
})



hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1}, {0.32,1} }})
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36,1} }})
hl.curve("linear",         { type = "bezier", points = { {0, 0}, {1, 1} }})
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} }})
hl.curve("quick",          { type = "bezier", points = { {0.15, 0}, {0.1, 1} }})
hl.curve("bounce",         { type = "bezier", points = { {0.4, 0}, {0.1, 1.25} }})

hl.animation({ leaf = "global",        enabled = 1, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = 1, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = 1, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = 1, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = 1, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = 1, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = 1, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = 1, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = 1, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = 1, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = 1, speed = 1.5,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = 1, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = 1, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = 1, speed = 2.0,  bezier = "bounce", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = 1, speed = 2.0,  bezier = "bounce", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = 1, speed = 2.0,  bezier = "bounce", style = "slide" })



hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + W", hl.dsp.exec_cmd(fileEditor))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + I", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + O", hl.dsp.layout("swapsplit"))

hl.bind("SUPER + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + DOWN",  hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + H",     hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J",     hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K",     hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L",     hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + "..key,         hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + "..key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + SHIFT + LEFT",  hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh left"))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh right"))
hl.bind("SUPER + SHIFT + H",     hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh left"))
hl.bind("SUPER + SHIFT + L",     hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh right"))

hl.bind("SUPER + mouse:272",       hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })

hl.bind("PRINT",         hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprsunset.sh inc 10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprsunset.sh dec 10"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("SUPER + F1", hl.dsp.exec_cmd("killall -9 waybar && waybar &"))
hl.bind("SUPER + F2", hl.dsp.exec_cmd("killall -9 eww"))
hl.bind("SUPER + M",  hl.dsp.exec_cmd("eww open --toggle power-menu && eww open --toggle power-closer"))
hl.bind("ESCAPE",     hl.dsp.exec_cmd(os.getenv("HOME").."/.config/eww/hyprgrid/scripts/hyprgrid_menu.sh exit && eww close power-menu && eww close power-closer"), { non_consuming = true })



hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- TODO: fix jetbrains windows
--windowrule = no_initial_focus on,match:class (jetbrains-)(.*),match:title ^win(.*)
--windowrule = rounding 0,match:class (jetbrains-)(.*),match:title ^win(.*)
--windowrule = center on,match:class (jetbrains-)
--windowrule = no_initial_focus on,match:class ^jetbrains-(?!toolbox),float on


hl.window_rule({
    -- Aseprite not tiling by default
    name = "enable-aseprite-tiling",
    match = { class = "^(Aseprite)$" },
    tile = true,
})

hl.window_rule({
    name = "fix-thunderbird-labels",
    match = { class = "(thunderbird)", title = "^win(.*)" },
    rounding = 0,
})
hl.window_rule({
    name = "fix-wofi-border",
    match = { class = "(wofi)" },
    border_size = 0,
})

hl.layer_rule({
    name = "add-waybar-blur",
    match = { namespace = "waybar" },
    blur = true,
})
hl.layer_rule({
    name = "add-gtk-blur",
    match = { namespace = "gtk-layer-shell" },
    blur = true,
    ignore_alpha = 0.5,
})
