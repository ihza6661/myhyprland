-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
	input = {
		repeat_delay = 200,
		repeat_rate = 20,
		sensitivity = 0.5,
		kb_options = "ctrl:nocaps,shift:both_capslock_cancel,altwin:swap_alt_win",
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			scroll_factor = 0.2,
		},
	},
	gestures = {
		workspace_swipe_distance = 500,
		workspace_swipe_cancel_ratio = 0.2,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_create_new = true,
	},
})

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces (Hyprland built-in 1:1 continuous swipe).
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable 4-finger swipe to move/drag floating windows.
hl.gesture({ fingers = 4, direction = "swipe", action = "move" })

-- 3-finger swipe up to fullscreen
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })

-- 3-finger swipe down to toggle special workspace (scratchpad)
hl.gesture({ fingers = 3, direction = "down", action = function() hl.dispatch(hl.dsp.workspace.toggle_special("scratchpad")) end })


