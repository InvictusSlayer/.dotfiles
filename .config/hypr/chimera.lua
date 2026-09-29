local hl = hl -- consolidating all errors to one place


hl.monitor({ output = "eDP-1",    mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1, mirror = "eDP-1" })


hl.bind("SUPER + SHIFT + DOWN", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh bottom"))
hl.bind("SUPER + SHIFT + UP",   hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh top"))
hl.bind("SUPER + SHIFT + J",    hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh bottom"))
hl.bind("SUPER + SHIFT + K",    hl.dsp.exec_cmd(os.getenv("HOME").."/.config/hypr/scripts/hyprgrid.sh top"))


-- TODO: fix hyprgrid menu
--hl.bind("SUPER + TAB", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/eww/hyprgrid/scripts/hyprgrid_menu.sh open"))
--hl.bind("SUPER + RIGHT", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/eww/hyprgrid/scripts/hyprgrid_menu.sh right"))
--hl.bind("SUPER + ALT", hl.dsp.exec_cmd(os.getenv("HOME").."/.config/eww/hyprgrid/scripts/hyprgrid_menu.sh release"))
