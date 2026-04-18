-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  Neverlose UI  Â·  Updated Example
--  Demonstrates: AddTheme Â· CreateMenuIcon Â· window:AttachMenuIcon
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

local NeverLose = loadstring(game:HttpGet'https://pastefy.app/t5hnBpOK/raw')()

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  1.  THEME
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

NeverLose:AddTheme({
    Name        = "Lumi Sakura",
    Accent      = Color3.fromRGB(255, 120, 180),
    Background  = Color3.fromRGB(35,  20,  30),
    Surface     = Color3.fromRGB(60,  30,  50),
    Outline     = Color3.fromRGB(255, 160, 200),
    Text        = Color3.fromRGB(255, 220, 235),
    Placeholder = Color3.fromRGB(200, 140, 170),
    Button      = Color3.fromRGB(255, 140, 190),
    Icon        = Color3.fromRGB(255, 180, 210),
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  2.  MENU ICON
--      Click  â†’ fires the real-time keybind (same as pressing it)
--      Drag   â†’ moves icon (clamped to screen, can't leave)
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

local MenuIcon = NeverLose:CreateMenuIcon({
    Image       = "crosshairs",
    Size        = 48,
    IconColor   = Color3.fromRGB(255, 180, 210),
    BGColor     = Color3.fromRGB(35,  20,  30),
    StrokeColor = Color3.fromRGB(255, 120, 180),
    StrokeThick = 1.5,
    Draggable   = true,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  3.  WINDOW  â€“  default keybind is now RightControl
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

local Notification = NeverLose:CreateNotification()
local Logging      = NeverLose:CreateLogger()
local Indicator    = NeverLose:CreateIndicator()

local window = NeverLose:CreateWindow({
    Logo         = NeverLose.GlobalLogo,
    Name         = "Neverlose",
    Content      = "Counter-Strike 2",
    Size         = NeverLose.Scales.Default,
    ConfigFolder = "NeverLoseConfigs",
    Enable3DRenderer = false,
    Keybind      = "RightControl",   -- default; user can change in UserSettings
})

-- Attach icon â†’ auto-adds Icon Size & Draggable toggles to UserSettings,
-- and makes the icon pulse whenever the window toggles.
window:AttachMenuIcon(MenuIcon)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  4.  WATERMARK BINDABLE
--
--  UITogg:Input() with NO argument now automatically fires the
--  real-time keybind (NeverLose:FireKeybind), so it always matches
--  whatever the user has set â€” no hardcoded toggle call needed.
--
--  You can still pass a custom function if you want extra logic:
--      UITogg:Input(function() ... end)
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

local Watermark = window:Watermark()

local HC = Indicator.new({ Name = "HC", Icon = "crosshairs", Color = "Red" })

window:AddTabLabel("AIMBOT")

local ping   = Watermark:AddBlock("chart-four-vertical-bars", "0MS")
local UITogg = Watermark:AddBlock("cube-vertexes", "Neverlose")

-- No argument â†’ fires FireKeybind in real time (tracks keybind changes)
UITogg:Input()

task.spawn(function()
    while true do task.wait(1)
        ping:SetText(tostring(math.random(30, 90)) .. "MS")
    end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  5.  TABS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

local Rage  = window:AddTab({ Icon = "crosshairs",       Name = "Rage" })
local Legit = window:AddTab({ Icon = "mouse-scrollwheel", Name = "Legit" })

local Raging    = Rage:AddSection({ Name = "MAIN" })
local Selection = Rage:AddSection({ Name = "SELECTION", Position = "left" })
local Other     = Rage:AddSection({ Name = "OTHER",     Position = "right" })
local AntiAim   = Rage:AddSection({ Name = "ANTI-AIM",  Position = "right" })

Raging:AddLabel("Ts so skbidi\nfr noi cap", true)

local EnabledRage = Raging:AddLabel("Enabled")
local SlientAim   = Raging:AddLabel("Silent Aim")

EnabledRage:ToolTip("Dynamically adjusts grenade throw angles to counteract\nmovement velocity, allowing precise straight-line throws\neven while strafing")
EnabledRage:AddToggle({ Default = false, Callback = print, Flag = "Ragebot" })
EnabledRage:AddOption():AddLabel("Force Shoot"):AddToggle({ Default = false, Callback = print, Flag = "FS" })

SlientAim:AddToggle({ Default = false, Callback = print, Flag = "SLIENTAIM" })
local opt = SlientAim:AddOption()
opt:AddLabel("Perfect Silent-Aim"):AddToggle({ Default = false, Callback = print, Flag = "HideShot" })
opt:AddLabel("Perfect Silent-Aim"):AddToggle({ Default = false, Callback = print, Flag = "HideShot2" })

Raging:AddLabel("Automatic Fire"):AddToggle({ Default = false, Flag = "AutoFire" })
Raging:AddLabel("Aim Through Walls"):AddToggle({ Default = false, Flag = "AWALLS" })
Raging:AddLabel("Field of View"):AddSlider({
    Min = 0, Max = 2600, Rounding = 1, Default = 100, Type = "Lv", Size = 100,
    Callback = print, Flag = "fov",
})

Selection:AddLabel("Target"):AddDropdown({
    Default = "Hightest Damage",
    Values  = { "Hightest Damage", "Automatic", "Lowest Damage" },
    Callback = print, Flag = "target_box",
})

Selection:AddLabel("Hitboxes"):AddDropdown({
    Default = { "Head" }, Multi = true,
    Values  = { "Head", "Body", "Arms", "Legs" },
    Flag = "hitboxes", Callback = print,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  6.  USER SETTINGS
--      "Menu Keybind" default is now RightControl.
--      Changing it here also updates what FireKeybind fires.
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({
    Default  = "RightControl",
    Callback = function(v)
        window.Keybind = v
        Logging.new("ps4-touchpad", "Changed ui keybind to " .. tostring(v), 5)
    end,
})

window.UserSettings:AddLabel("Menu Scale"):AddDropdown({
    Default  = "Default",
    Values   = { "Default", "Large", "Mobile", "Small" },
    Callback = function(v)
        window:SetSize(NeverLose.Scales[v])
        Logging.new("crop", "Changed ui size to " .. tostring(v), 5)
    end,
})

window.UserSettings:AddLabel("3D Menu"):AddToggle({
    Default  = false,
    Callback = function(v) window:Set3DRender(v) end,
})

window.UserSettings:AddButton({
    Icon     = "discord",
    Name     = "Discord",
    Callback = function()
        print("invite")
        Logging.new("discord", "Copied discord invite link", 5)
    end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  7.  NOTIFICATIONS + DEMO LOOP
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

Notification.new({ Title = "Notification", Content = "This is Neverlose Notification", Duration = 5 })
task.wait(1)
Notification.new({ Title = "Neverlose", Content = "Initialization in progress", Duration = 7 })

Logging.new("crosshairs",       "Hit thatguy in the neck for 100 damage", 15)
task.wait(2)
Logging.new("crosshairs-slash", "Missed shot due to prediction error & YOUR NN", 15)

HC:SetRender(true)

while true do task.wait(3)
    Watermark:SetRender(true)
    HC:SetColor("Red");   HC:SetText("FL")
    task.wait(3)
    Watermark:SetRender(false)
    HC:SetColor("Green"); HC:SetText("AUTO")
    task.wait(3)
    Watermark:SetRender(true)
    HC:SetColor("White"); HC:SetText("HC")
    task.wait(1)
    Watermark:SetRender(false)
    HC:SetRender(false)
    task.wait(1)
    HC:SetRender(true)
end
