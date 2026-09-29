local hl = hl -- consolidating all errors to one place


hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x650", scale = 1 })
hl.monitor({ output = "DP-3",     mode = "1920x1080@60", position = "1920x0", scale = 1, transform = 1 })


hl.workspace_rule({ workspace = "r[1-5]", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "r[6-10]", monitor = "DP-3" })

hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "8", monitor = "DP-3", default = true })
