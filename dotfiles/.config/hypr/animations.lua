local M = {}

-- Function to apply and enable the animations
function M.apply()
    hl.config({
        animations = {
            enabled = true,
        },
    })

    -- Animation curves
    hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
    hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
    hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
    hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

    -- Animation configs
    hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide" })
    hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide" })
    hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard" })

    hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "emphasizedDecel" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "emphasizedAccel" })
    hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard" })

    hl.animation({
        leaf    = "specialWorkspace",
        enabled = true,
        speed   = 4,
        bezier  = "specialWorkSwitch",
        style   = "slidefadevert 15%",
    })
    hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
    hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
    hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })
end

-- Function to disable animations
function M.disable()
    hl.config({
        animations = {
            enabled = false,
        },
    })
end

-- Function to toggle animations on and off
function M.toggle()
    local is_enabled = hl.get_config("animations:enabled")
    if is_enabled then
        M.disable()
        hl.exec_cmd("omarchy-osd -i window -m 'Animations disabled' 2>/dev/null || notify-send 'Animations' 'Disabled' -t 1500")
    else
        M.apply()
        hl.exec_cmd("omarchy-osd -i window -m 'Animations enabled' 2>/dev/null || notify-send 'Animations' 'Enabled' -t 1500")
    end
end

-- Apply by default when required
M.apply()

return M
