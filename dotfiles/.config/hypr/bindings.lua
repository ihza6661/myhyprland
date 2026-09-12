-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

o.bind("SUPER + END", "Close active window", hl.dsp.window.close())
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Note: SUPER+T was previously bound to default toggle floating.
hl.unbind("SUPER + T")
o.bind("SUPER + T", "Toggle window floating (800x450 centered)", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.resize({ x = 800, y = 450 }))
	hl.dispatch(hl.dsp.window.center())
end)

-- Disable monitor-related default bindings
hl.unbind("SUPER + SHIFT + ALT + LEFT") -- Move workspace to left monitor
hl.unbind("SUPER + SHIFT + ALT + RIGHT") -- Move workspace to right monitor
hl.unbind("SUPER + SHIFT + ALT + UP") -- Move workspace to up monitor
hl.unbind("SUPER + SHIFT + ALT + DOWN") -- Move workspace to down monitor
hl.unbind("CTRL + ALT + TAB") -- Focus on next monitor
hl.unbind("CTRL + ALT + SHIFT + TAB") -- Focus on previous monitor
hl.unbind("SUPER + CTRL + Delete") -- Toggle laptop display
hl.unbind("SUPER + CTRL + ALT + Delete") -- Toggle laptop display mirroring

-- Window Edit Mode (winedit submap)
hl.unbind("SUPER + X")
o.bind("SUPER + X", "Window edit mode", hl.dsp.submap("winedit"))
o.bind("SUPER + ALT + X", "Window edit mode", hl.dsp.submap("winedit"))

hl.define_submap("winedit", function()
	-- Move active floating window (Arrows & HJKL)
	hl.bind("LEFT", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("RIGHT", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("UP", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("DOWN", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })

	hl.bind("H", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })

	-- Resize active floating window (SHIFT + Arrows & SHIFT + HJKL)
	hl.bind("SHIFT + LEFT", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + RIGHT", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + UP", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("SHIFT + DOWN", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	-- Exit Window Edit Mode
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
	hl.bind("RETURN", hl.dsp.submap("reset"))
end)

-- Disable unwanted preinstalled web app shortcuts (keeping ChatGPT and YouTube)
hl.unbind("SUPER + SHIFT + ALT + A") -- Grok
hl.unbind("SUPER + SHIFT + C") -- Calendar
hl.unbind("SUPER + SHIFT + E") -- Email
hl.unbind("SUPER + SHIFT + ALT + E") -- New email
hl.unbind("SUPER + SHIFT + ALT + G") -- WhatsApp
hl.unbind("SUPER + SHIFT + CTRL + G") -- Google Messages
hl.unbind("SUPER + SHIFT + P") -- Google Photos
hl.unbind("SUPER + SHIFT + S") -- Google Maps
hl.unbind("SUPER + SHIFT + G") -- Signal
hl.unbind("SUPER + SHIFT + ALT + M") -- Music TUI

-- Override XF86AudioMicMute to use debounced toggle script (prevents hardware double-firing)
hl.unbind("XF86AudioMicMute")
o.bind("XF86AudioMicMute", "Mute microphone", "~/.config/hypr/scripts/toggle-mic", { locked = true })

-- Workspace cycling (alphabet A-E): replace with sequential cycling script
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
hl.unbind("SUPER + CTRL + LEFT") -- was: move grouped window focus left
hl.unbind("SUPER + CTRL + RIGHT") -- was: move grouped window focus right

o.bind("SUPER + CTRL + LEFT", "Previous active workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + CTRL + RIGHT", "Next active workspace", hl.dsp.focus({ workspace = "e+1" }))

-- Rebind browser launcher: unbind SUPER + SHIFT + RETURN and bind to SUPER + B
hl.unbind("SUPER + SHIFT + RETURN")
o.bind("SUPER + B", "Browser", { omarchy = "browser" })

-- Rebind file manager: unbind SUPER + SHIFT + F and bind to SUPER + E
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })

-- Rebind file manager (cwd): unbind default and bind to SUPER + ALT + E
hl.unbind("SUPER + ALT + SHIFT + F")
hl.unbind("SUPER + SHIFT + ALT + F")
o.bind("SUPER + ALT + E", "File manager (cwd)", { omarchy = "nautilus-cwd" })

-- Rebind Full width: unbind SUPER + ALT + F and bind to SUPER + D
hl.unbind("SUPER + ALT + F")
o.bind("SUPER + D", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Cycle all workspaces sequentially (alphabet A-Z)
o.bind("SUPER + BRACKETLEFT", "Previous workspace (all)", hl.dsp.focus({ workspace = "-1" }))
o.bind("SUPER + BRACKETRIGHT", "Next workspace (all)", hl.dsp.focus({ workspace = "+1" }))

-- Move active window to previous/next workspace sequentially (alphabet A-Z)
o.bind("SUPER + SHIFT + BRACKETLEFT", "Move window to previous workspace", hl.dsp.window.move({ workspace = "-1" }))
o.bind("SUPER + SHIFT + BRACKETRIGHT", "Move window to next workspace", hl.dsp.window.move({ workspace = "+1" }))

-- Scroll active workspace sequentially (alphabet A-Z)
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + mouse_up")
o.bind("SUPER + mouse_down", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + mouse_up", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- Alternative keybind to move window to workspace 1
o.bind("SUPER + SHIFT + Home", "Move window to workspace 1", hl.dsp.window.move({ workspace = "1" }))

-- Swap windows with SUPER + ALT instead of SUPER + SHIFT
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + UP")
hl.unbind("SUPER + SHIFT + DOWN")

hl.unbind("SUPER + ALT + LEFT") -- was: move window to group on left
hl.unbind("SUPER + ALT + RIGHT") -- was: move window to group on right
hl.unbind("SUPER + ALT + UP") -- was: move window to group on top
hl.unbind("SUPER + ALT + DOWN") -- was: move window to group on bottom

o.bind("SUPER + ALT + LEFT", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + ALT + RIGHT", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + ALT + UP", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + ALT + DOWN", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- Unbind default resize bindings (MINUS / EQUAL -> code:20 / code:21)
hl.unbind("SUPER + code:20")
hl.unbind("SUPER + code:21")
hl.unbind("SUPER + SHIFT + code:20")
hl.unbind("SUPER + SHIFT + code:21")
hl.unbind("SUPER + ALT + code:20")
hl.unbind("SUPER + ALT + code:21")
hl.unbind("SUPER + SHIFT + ALT + code:20")
hl.unbind("SUPER + SHIFT + ALT + code:21")
hl.unbind("SUPER + CTRL + code:20")
hl.unbind("SUPER + CTRL + code:21")
hl.unbind("SUPER + CTRL + SHIFT + code:20")
hl.unbind("SUPER + CTRL + SHIFT + code:21")

-- Rebind resize to semicolon (;) and apostrophe (')
o.bind("SUPER + semicolon", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + apostrophe", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
o.bind("SUPER + SHIFT + semicolon", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
o.bind("SUPER + SHIFT + apostrophe", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

o.bind(
	"SUPER + ALT + semicolon",
	"Expand window left a little",
	hl.dsp.window.resize({ x = -25, y = 0, relative = true })
)
o.bind(
	"SUPER + ALT + apostrophe",
	"Shrink window left a little",
	hl.dsp.window.resize({ x = 25, y = 0, relative = true })
)
o.bind(
	"SUPER + SHIFT + ALT + semicolon",
	"Shrink window up a little",
	hl.dsp.window.resize({ x = 0, y = -25, relative = true })
)
o.bind(
	"SUPER + SHIFT + ALT + apostrophe",
	"Expand window down a little",
	hl.dsp.window.resize({ x = 0, y = 25, relative = true })
)

o.bind(
	"SUPER + CTRL + semicolon",
	"Expand window left a lot",
	hl.dsp.window.resize({ x = -300, y = 0, relative = true })
)
o.bind(
	"SUPER + CTRL + apostrophe",
	"Shrink window left a lot",
	hl.dsp.window.resize({ x = 300, y = 0, relative = true })
)
o.bind(
	"SUPER + CTRL + SHIFT + semicolon",
	"Shrink window up a lot",
	hl.dsp.window.resize({ x = 0, y = -300, relative = true })
)
o.bind(
	"SUPER + CTRL + SHIFT + apostrophe",
	"Expand window down a lot",
	hl.dsp.window.resize({ x = 0, y = 300, relative = true })
)

-- Quick web app shortcuts
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })

-- Rebind SUPER + SHIFT + W from Omawrite to WhatsApp
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "WhatsApp", { webapp = "https://web.whatsapp.com/" })

-- Toggle Bluetooth Power
o.bind("SUPER + Z", "Toggle Bluetooth Power", "omarchy-bluetooth-power toggle")

-- Toggle Animations
local animations = require("hypr.animations")
o.bind("SUPER + ALT + A", "Toggle animations", animations.toggle)

-- Alphabet Workspace Mode (Leader key: SUPER + W)
-- Note: SUPER + W was previously bound to Close window. Use SUPER + END to close windows.
hl.unbind("SUPER + W")
o.bind("SUPER + W", "Workspace leader mode", hl.dsp.submap("workspace"))

hl.define_submap("workspace", function()
	for i = 65, 90 do
		local ws = string.char(i)
		local ws_id = tostring(i - 64)
		-- Switch to workspace (press letter: A-Z -> workspace 1-26)
		hl.bind(ws, function()
			hl.dispatch(hl.dsp.focus({ workspace = ws_id }))
			hl.dispatch(hl.dsp.submap("reset"))
		end)

		-- Move active window to workspace (press Shift + letter: A-Z -> workspace 1-26)
		hl.bind("SHIFT + " .. ws, function()
			hl.dispatch(hl.dsp.window.move({ workspace = ws_id }))
			hl.dispatch(hl.dsp.submap("reset"))
		end)
	end

	-- Cancel / Exit leader mode
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
	hl.bind("RETURN", hl.dsp.submap("reset"))
	hl.bind("SPACE", hl.dsp.submap("reset"))
end)

