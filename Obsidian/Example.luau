loadstring(game:HttpGet("https://raw.githubusercontent.com/JScripter-Lua/ObsidianModed/refs/heads/main/Library_Modified.lua.txt"))()

local Players        = game:GetService("Players")
local RunService     = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting       = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local Camera         = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local function GetCharacter() return LocalPlayer.Character end
local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end
local function GetRootPart()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- LIBRARY INIT
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local Library = getgenv().Library
assert(Library, "[VitaHub] Load the Library first!")

local C = getgenv().Color -- hex â†’ Color3 shorthand

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 1. STYLE & THEME
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
Library:SetStyle("Curved") -- Square / Round / Pill
Library:SetTheme("Blue")

Library:SetColors({
    Background = C("#080c16"),
    Main       = C("#0e1424"),
    Tab        = C("#0e1424"),
    Accent     = C("#2378ff"),
    Slider     = C("#2378ff"),
    Outline    = C("#1c3055"),
    Font       = C("#e8edf8"),
})

-- Custom theme available from Settings
Library:AddTheme("Cherry", {
    BackgroundColor = Color3.fromRGB(16, 5, 8),
    MainColor       = Color3.fromRGB(28, 8, 14),
    AccentColor     = Color3.fromRGB(235, 40, 80),
    OutlineColor    = Color3.fromRGB(70, 18, 30),
    FontColor       = Color3.new(1, 1, 1),
    IsLight         = false,
})

Library:AddTheme("Neon", {
    BackgroundColor = Color3.fromRGB(11, 11, 20),
    MainColor       = Color3.fromRGB(19, 19, 42),
    AccentColor     = Color3.fromRGB(0, 245, 212),
    OutlineColor    = Color3.fromRGB(26, 42, 58),
    FontColor       = Color3.fromRGB(224, 255, 252),
    IsLight         = false,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 2. WINDOW
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local Window = Library:CreateWindow({
    Title               = "Vita Hub",
    Footer              = "v2.0  |  github.com/your/repo",
    Center              = true,
    AutoShow            = true,
    Resizable           = true,
    ToggleKeybind       = Enum.KeyCode.RightControl,
    EnableSidebarResize = true,
    SidebarCompacted    = false,
    GlobalSearch        = false,
    NotifySide          = "Right",
    ShowCustomCursor    = true,
    UnlockMouseWhileOpen = true,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 3. TABS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local TabMain     = Window:AddTab("Main",     "home",     "Player movement & general")
local TabCombat   = Window:AddTab("Combat",   "sword",    "Aimbot & combat automation")
local TabESP      = Window:AddTab("ESP",      "eye",      "Wallhack & entity highlights")
local TabWorld    = Window:AddTab("World",    "globe",    "World manipulation")
local TabMisc     = Window:AddTab("Misc",     "zap",      "Chat, anti-cheat, utilities")
local TabSettings = Window:AddTab("Settings", "settings", "Theme, appearance & window")
local TabSecret   = Window:AddTab("Secret",   "lock",     "Hidden â€” unlock in Settings")
local KeyTab      = Window:AddKeyTab("Keybinds")

TabSecret:SetHidden(true)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 4. MAIN TAB â€” Player Movement
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local ML = TabMain:AddLeftGroupbox("Movement")
local MR = TabMain:AddRightGroupbox("Quick Actions")

-- â”€â”€ Walk Speed â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddToggle("SpeedToggle", {
    Text     = "Custom Walk Speed",
    Default  = false,
    Callback = function(v)
        local hum = GetHumanoid()
        if hum then
            hum.WalkSpeed = v and Toggles.SpeedSlider and Options.SpeedSlider.Value or 16
        end
    end,
})
ML:AddSlider("SpeedSlider", {
    Text     = "Walk Speed",
    Default  = 32,
    Min      = 0,
    Max      = 200,
    Rounding = 0,
    Suffix   = " studs/s",
    Callback = function(v)
        if Toggles.SpeedToggle and Toggles.SpeedToggle.Value then
            local hum = GetHumanoid()
            if hum then hum.WalkSpeed = v end
        end
    end,
})

-- â”€â”€ Jump Power â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddToggle("JumpToggle", {
    Text     = "Custom Jump Power",
    Default  = false,
    Callback = function(v)
        local hum = GetHumanoid()
        if hum then
            hum.JumpPower = v and Options.JumpSlider.Value or 50
        end
    end,
})
ML:AddSlider("JumpSlider", {
    Text     = "Jump Power",
    Default  = 100,
    Min      = 0,
    Max      = 500,
    Rounding = 0,
    Callback = function(v)
        if Toggles.JumpToggle and Toggles.JumpToggle.Value then
            local hum = GetHumanoid()
            if hum then hum.JumpPower = v end
        end
    end,
})

-- â”€â”€ Infinite Jump â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddToggle("InfiniteJump", {
    Text     = "Infinite Jump",
    Default  = false,
    Callback = function(v)
        getgenv()._InfJump = v
    end,
})
do
    local connection
    UserInputService.JumpRequest:Connect(function()
        if not getgenv()._InfJump then return end
        local hum = GetHumanoid()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end

-- â”€â”€ Noclip â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddToggle("NoclipToggle", {
    Text     = "Noclip",
    Default  = false,
    Risky    = true,
    Callback = function(v)
        getgenv()._Noclip = v
    end,
})
RunService.Stepped:Connect(function()
    if not getgenv()._Noclip then return end
    local char = GetCharacter()
    if not char then return end
    for _, part in char:GetDescendants() do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end)

-- â”€â”€ Fly (basic) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddToggle("FlyToggle", {
    Text     = "Fly",
    Default  = false,
    Risky    = true,
    Callback = function(v)
        getgenv()._Fly = v
        if not v then
            local root = GetRootPart()
            if root then
                local bg = root:FindFirstChild("_VitaFlyBG")
                local bv = root:FindFirstChild("_VitaFlyBV")
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
            end
        end
    end,
})
ML:AddSlider("FlySpeedSlider", {
    Text     = "Fly Speed",
    Default  = 50,
    Min      = 1,
    Max      = 300,
    Suffix   = " studs/s",
})
do
    RunService.Heartbeat:Connect(function()
        if not getgenv()._Fly then return end
        local root = GetRootPart()
        if not root then return end

        local bg = root:FindFirstChild("_VitaFlyBG") or (function()
            local b = Instance.new("BodyGyro")
            b.Name = "_VitaFlyBG"
            b.MaxTorque = Vector3.new(9e9,9e9,9e9)
            b.P = 9e9
            b.Parent = root
            return b
        end)()
        local bv = root:FindFirstChild("_VitaFlyBV") or (function()
            local b = Instance.new("BodyVelocity")
            b.Name = "_VitaFlyBV"
            b.MaxForce = Vector3.new(9e9,9e9,9e9)
            b.P = 9e9
            b.Parent = root
            return b
        end)()

        local spd = Options.FlySpeedSlider and Options.FlySpeedSlider.Value or 50
        local dir = Vector3.new()
        local camCF = Camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end

        bv.Velocity = dir.Magnitude > 0 and dir.Unit * spd or Vector3.new()
        bg.CFrame = camCF
    end)
end

-- â”€â”€ Server â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
ML:AddInput("ServerHopInput", {
    Text        = "Server Hop",
    Placeholder = "Min players (blank = any)",
    Numeric     = true,
    Finished    = true,
    Callback    = function(v) end,
})

-- â”€â”€ Quick Actions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
MR:AddButton("NotifyBtn", {
    Text = "Test Notification",
    Func = function()
        Library:Notify({
            Title   = "Vita Hub",
            Content = "Everything is working! âœ”",
            Time    = 4,
        })
    end,
})
MR:AddButton("RejoinBtn", {
    Text = "Rejoin Server",
    Func = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})
MR:AddButton("ResetCharBtn", {
    Text = "Reset Character",
    Func = function()
        local hum = GetHumanoid()
        if hum then hum.Health = 0 end
    end,
})
MR:AddLabel("StatusLabel", { Text = "Status: Idle" })
MR:AddLabel({ Text = "Controls", Size = 13, DoesWrap = false })
MR:AddLabel({
    Text     = "RightControl â€” Toggle UI | See Keybinds tab to customize. All toggles save to current session.",
    DoesWrap = true,
    Size     = 12,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 5. COMBAT TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local CL = TabCombat:AddLeftGroupbox("Aimbot")
local CR = TabCombat:AddRightGroupbox("Combat Misc")

-- State
local AimbotActive = false
local AimbotConnection

local function GetClosestPlayer()
    local closest, closestDist = nil, math.huge
    local fov = Options.FovSlider and Options.FovSlider.Value or 80
    local camPos = Camera.CFrame.Position
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in Players:GetPlayers() do
        if plr == LocalPlayer then continue end
        if Toggles.TeamCheck and Toggles.TeamCheck.Value and plr.Team == LocalPlayer.Team then continue end
        local char = plr.Character
        if not char then continue end
        local targetPart = Options.AimPart and char:FindFirstChild(Options.AimPart.Value) or char:FindFirstChild("Head")
        if not targetPart then continue end

        local screenPos, onScreen = Camera:WorldToScreenPoint(targetPart.Position)
        if not onScreen then continue end
        local dist = Vector2.new(screenPos.X, screenPos.Y) - screenCenter
        if dist.Magnitude <= fov and dist.Magnitude < closestDist then
            closestDist = dist.Magnitude
            closest = targetPart
        end
    end
    return closest
end

CL:AddToggle("AimbotToggle", {
    Text     = "Enable Aimbot",
    Default  = false,
    Callback = function(v)
        AimbotActive = v
        Library:Notify({
            Title   = "Aimbot",
            Content = v and "Aimbot enabled" or "Aimbot disabled",
            Time    = 2,
        })
    end,
})
CL:AddSlider("FovSlider", {
    Text    = "FOV Radius",
    Default = 80,
    Min     = 10,
    Max     = 400,
    Suffix  = " px",
})
CL:AddDropdown("AimPart", {
    Text    = "Target Hitbox",
    Values  = { "Head", "UpperTorso", "LowerTorso", "HumanoidRootPart" },
    Default = "Head",
})
CL:AddSlider("SmoothSlider", {
    Text     = "Smoothness",
    Default  = 5,
    Min      = 0,
    Max      = 20,
    Rounding = 1,
})

CR:AddToggle("SilentAim",   { Text = "Silent Aim",           Default = false, Risky = true })
CR:AddToggle("Prediction",  { Text = "Movement Prediction",  Default = false })
CR:AddToggle("TeamCheck",   { Text = "Team Check",           Default = true })
CR:AddToggle("AntiRecoil",  { Text = "Anti Recoil",          Default = false })
CR:AddSlider("HitboxSlider", {
    Text     = "Hitbox Expander",
    Default  = 0,
    Min      = 0,
    Max      = 20,
    Suffix   = " studs",
    Risky    = true,
    Callback = function(v)
        for _, plr in Players:GetPlayers() do
            if plr == LocalPlayer then continue end
            local char = plr.Character
            if not char then continue end
            for _, part in char:GetDescendants() do
                if part:IsA("BasePart") then
                    part.Size = Vector3.new(v, v, v)
                end
            end
        end
    end,
})

CR:AddLabel("AimCircleLabel", { Text = "FOV Circle Color" })

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 6. ESP TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local EL = TabESP:AddLeftGroupbox("Players")
local ER = TabESP:AddRightGroupbox("World")

-- Minimal ESP using Highlights (works without a drawing lib)
local ESPHighlights = {}

local function RefreshESP()
    for plr, h in ESPHighlights do
        if h and h.Parent then h:Destroy() end
    end
    ESPHighlights = {}

    if not (Toggles.ESPEnabled and Toggles.ESPEnabled.Value) then return end

    for _, plr in Players:GetPlayers() do
        if plr == LocalPlayer then continue end
        if Toggles.ESPTeamCheck and Toggles.ESPTeamCheck.Value and plr.Team == LocalPlayer.Team then continue end
        local char = plr.Character
        if not char then continue end

        local h = Instance.new("Highlight")
        h.FillTransparency  = 0.5
        h.OutlineTransparency = 0
        h.FillColor    = (plr.Team == LocalPlayer.Team)
            and (Options.ESPColorFriend and Options.ESPColorFriend.Value or Color3.fromRGB(0, 200, 100))
            or  (Options.ESPColorEnemy  and Options.ESPColorEnemy.Value  or Color3.fromRGB(255, 60, 60))
        h.OutlineColor = h.FillColor
        h.Adornee = char
        h.Parent  = workspace
        ESPHighlights[plr] = h
    end
end

EL:AddToggle("ESPEnabled",  { Text = "Enable ESP",    Default = false, Callback = function() RefreshESP() end })
EL:AddToggle("ESPBoxes",    { Text = "Boxes",         Default = false })
EL:AddToggle("ESPNames",    { Text = "Player Names",  Default = false })
EL:AddToggle("ESPHealth",   { Text = "Health Bars",   Default = false })
EL:AddToggle("ESPDist",     { Text = "Show Distance", Default = false })
EL:AddToggle("ESPTeamCheck",{ Text = "Team Check",    Default = true, Callback = function() RefreshESP() end })

EL:AddLabel("ESPFriendLabel", { Text = "Friend Color" })
EL:AddLabel("ESPEnemyLabel", { Text = "Enemy Color" })

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function() task.wait(1); RefreshESP() end)
end)
Players.PlayerRemoving:Connect(function(plr)
    if ESPHighlights[plr] then
        ESPHighlights[plr]:Destroy()
        ESPHighlights[plr] = nil
    end
end)

ER:AddToggle("ESPChests",  { Text = "Show Chests",     Default = false })
ER:AddToggle("ESPDrops",   { Text = "Show Item Drops", Default = false })
ER:AddSlider("ESPMaxDist", {
    Text    = "Max Draw Distance",
    Default = 1000,
    Min     = 50,
    Max     = 5000,
    Suffix  = " studs",
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 7. WORLD TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local WL = TabWorld:AddLeftGroupbox("Lighting")
local WR = TabWorld:AddRightGroupbox("Camera")

local OrigFogEnd = Lighting.FogEnd
local OrigBrightness = Lighting.Brightness
local OrigClockTime  = Lighting.ClockTime

WL:AddToggle("FullbrightToggle", {
    Text     = "Fullbright",
    Default  = false,
    Callback = function(v)
        Lighting.Brightness = v and 2 or OrigBrightness
        Lighting.ClockTime  = v and 14 or OrigClockTime
    end,
})
WL:AddToggle("FogToggle", {
    Text     = "Remove Fog",
    Default  = false,
    Callback = function(v)
        Lighting.FogEnd = v and math.huge or OrigFogEnd
    end,
})
WL:AddSlider("TimeSlider", {
    Text     = "Time of Day",
    Default  = math.floor(Lighting.ClockTime),
    Min      = 0,
    Max      = 23,
    Rounding = 0,
    Suffix   = ":00",
    Callback = function(v)
        Lighting.ClockTime = v
    end,
})

WL:AddLabel("AmbientLabel", { Text = "Ambient Color" })

WR:AddSlider("FOVSlider", {
    Text     = "Camera FOV",
    Default  = 70,
    Min      = 30,
    Max      = 120,
    Suffix   = "Â°",
    Callback = function(v)
        Camera.FieldOfView = v
    end,
})
WR:AddDropdown("CameraMode", {
    Text    = "Camera Mode",
    Values  = { "Classic", "Follow", "Orbital" },
    Default = "Classic",
    Callback = function(v)
        -- Extend with your own camera logic
        Library:Notify({ Title = "Camera", Content = "Mode: " .. v, Time = 2 })
    end,
})
WR:AddToggle("ShakeToggle", {
    Text     = "Camera Shake",
    Default  = false,
    Callback = function(v)
        getgenv()._CamShake = v
    end,
})
WR:AddSlider("ShakeIntensity", {
    Text    = "Shake Intensity",
    Default = 3,
    Min     = 1,
    Max     = 20,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 8. MISC TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local MiscL = TabMisc:AddLeftGroupbox("Chat")
local MiscR = TabMisc:AddRightGroupbox("Anti & Utilities")

MiscL:AddToggle("ChatSpamToggle", {
    Text    = "Anti Chat Spam",
    Default = false,
    Risky   = true,
    Callback = function(v)
        -- Hook your anti-spam logic here
    end,
})
MiscL:AddInput("ChatSuffixInput", {
    Text        = "Chat Suffix",
    Placeholder = "e.g.  | Vita Hub",
    Callback    = function(v)
        getgenv()._ChatSuffix = v
    end,
})
MiscL:AddInput("ChatPrefixInput", {
    Text        = "Chat Prefix",
    Placeholder = "e.g. [VH]",
    Callback    = function(v)
        getgenv()._ChatPrefix = v
    end,
})
MiscL:AddDropdown("ChatLanguage", {
    Text    = "Auto-translate To",
    Values  = { "Off", "English", "Spanish", "French", "Japanese" },
    Default = "Off",
})

MiscR:AddToggle("AutoRespawn", {
    Text     = "Auto Respawn",
    Default  = false,
    Callback = function(v)
        getgenv()._AutoRespawn = v
    end,
})
do
    local hum
    LocalPlayer.CharacterAdded:Connect(function(char)
        hum = char:WaitForChild("Humanoid")
        hum.Died:Connect(function()
            if getgenv()._AutoRespawn then
                task.wait(1)
                LocalPlayer:LoadCharacter()
            end
        end)
    end)
end

MiscR:AddToggle("NoAnimations", {
    Text     = "No Animations",
    Default  = false,
    Callback = function(v)
        local char = GetCharacter()
        if not char then return end
        local animate = char:FindFirstChild("Animate")
        if animate then animate.Disabled = v end
    end,
})

MiscR:AddButton("CopyServerID", {
    Text = "Copy Server ID",
    Func = function()
        if setclipboard then
            setclipboard(game.JobId)
            Library:Notify({ Title = "Copied", Content = "Server ID copied to clipboard.", Time = 3 })
        else
            Library:Notify({ Title = "Error", Content = "setclipboard not available.", Time = 3 })
        end
    end,
})

MiscR:AddLabel({
    Text     = string.format("Name: %s  |  Age: %d days  |  %s",
        LocalPlayer.Name,
        LocalPlayer.AccountAge,
        tostring(LocalPlayer.MembershipType)
    ),
    DoesWrap = true,
    Size     = 12,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 9. SETTINGS TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local SL = TabSettings:AddLeftGroupbox("Colors & Style")
local SR = TabSettings:AddRightGroupbox("Window & Display")

-- â”€â”€ Theme Picker â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
SL:AddDropdown("ThemePicker", {
    Text     = "Theme Preset",
    Values   = Library:GetThemeNames(),
    Default  = getgenv().VitaCurrentTheme or "Blue",
    Callback = function(v)
        Library:SetTheme(v)
        Library:Notify({ Title = "Theme", Content = "Applied: " .. v, Time = 2 })
    end,
})

-- â”€â”€ Corner Style â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
SL:AddDropdown("StylePicker", {
    Text     = "Corner Style",
    Values   = { "Square", "Curved", "Round", "Pill" },
    Default  = getgenv().VitaCurrentStyle or "Curved",
    Callback = function(v) Library:SetStyle(v) end,
})

SL:AddLabel("AccentPickerLabel", { Text = "Accent & Slider Color" })

SL:AddLabel("MainColorLabel", { Text = "Main & Tab Color" })

SL:AddLabel("BGColorLabel", { Text = "Background Color" })

SL:AddLabel("OutlineLabel", { Text = "Outline / Border Color" })

-- â”€â”€ Hex Preset Buttons â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
SL:AddButton("PresetNavy", {
    Text = "Apply Navy Preset",
    Func = function()
        Library:SetColors({
            Background = C("#080c16"), Main   = C("#0e1424"),
            Tab        = C("#0e1424"), Accent = C("#2378ff"),
            Slider     = C("#2378ff"), Outline= C("#1c3055"),
            Font       = C("#e8edf8"),
        })
    end,
})
SL:AddButton("PresetNeonBtn", {
    Text = "Apply Neon Preset",
    Func = function()
        Library:SetTheme("Neon")
        Library:Notify({ Title = "Theme", Content = "Neon applied!", Time = 2 })
    end,
})
SL:AddButton("FlashPink", {
    Text = "Flash Pink Accent",
    Func = function()
        Library:FlashAccent(Color3.fromRGB(255, 75, 160), 0.8)
    end,
})

-- â”€â”€ Window Controls â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
SR:AddSlider("DPISlider", {
    Text     = "DPI Scale",
    Default  = 100,
    Min      = 75,
    Max      = 150,
    Suffix   = "%",
    Callback = function(v)
        Library:SetDPIScale(v)
    end,
})
SR:AddToggle("CustomCursorToggle", {
    Text     = "Custom Cursor",
    Default  = true,
    Callback = function(v)
        Library.ShowCustomCursor = v
    end,
})
SR:AddButton("MinimizeBtn", {
    Text = "Minimize Window",
    Func = function() Window:Minimize() end,
})
SR:AddButton("RestoreBtn", {
    Text = "Restore Window",
    Func = function() Window:Restore() end,
})
SR:AddToggle("SecretToggle", {
    Text     = "Show Secret Tab",
    Default  = false,
    Callback = function(v)
        TabSecret:SetHidden(not v)
        if v then
            Library:Notify({ Title = "Secret Tab", Content = "Unlocked! Check sidebar.", Time = 3 })
        end
    end,
})
SR:AddToggle("CombatTabToggle", {
    Text     = "Show Combat Tab",
    Default  = true,
    Callback = function(v)
        TabCombat:SetHidden(not v)
    end,
})
SR:AddDropdown("NotifySidePicker", {
    Text     = "Notification Side",
    Values   = { "Left", "Right" },
    Default  = "Right",
    Callback = function(v)
        Library.NotifySide = v
    end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 10. SECRET TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local SecL = TabSecret:AddLeftGroupbox("Secrets")
local SecR = TabSecret:AddRightGroupbox("Dev Tools")

SecL:AddLabel({
    Text     = "You found the secret tab! Enable 'Show Secret Tab' in Settings to keep it visible. This tab was hidden with TabSecret:SetHidden(true).",
    DoesWrap = true,
    Size     = 12,
})

SecL:AddButton("RainbowBtn", {
    Text = "Rainbow Flash",
    Func = function()
        local Colors = {
            C("ff4b4b"), C("ff9a00"), C("28d25a"),
            C("2378ff"), C("9b37ff"), C("ff4bb1"),
        }
        task.spawn(function()
            for _, col in Colors do
                Library:SetAccent(col)
                task.wait(0.15)
            end
            Library:SetTheme(getgenv().VitaCurrentTheme or "Blue")
        end)
    end,
})

SecL:AddButton("DialogDemo", {
    Text = "Open Demo Dialog",
    Func = function()
        Window:AddDialog("DemoDialog", {
            Title       = "Confirm Action",
            Description = "This is a dialog box. Choose an option below.",
            AutoDismiss         = true,
            OutsideClickDismiss = true,
            FooterButtons = {
                Confirm = {
                    Text    = "Confirm",
                    Primary = true,
                    Func    = function()
                        Library:Notify({ Title = "Dialog", Content = "Confirmed!", Time = 2 })
                    end,
                },
                Cancel = {
                    Text = "Cancel",
                    Func = function()
                        Library:Notify({ Title = "Dialog", Content = "Cancelled.", Time = 2 })
                    end,
                },
            },
        })
    end,
})

SecR:AddButton("PrintScheme", {
    Text = "Print Current Scheme",
    Func = function()
        for k, v in Library.Scheme do
            if typeof(v) == "Color3" then
                print(string.format("[Scheme] %s = rgb(%d,%d,%d)",
                    k,
                    math.floor(v.R * 255),
                    math.floor(v.G * 255),
                    math.floor(v.B * 255)
                ))
            end
        end
        Library:Notify({ Title = "Dev", Content = "Scheme printed to output.", Time = 2 })
    end,
})
SecR:AddButton("PrintThemes", {
    Text = "Print All Themes",
    Func = function()
        print("[Themes] " .. table.concat(Library:GetThemeNames(), ", "))
        Library:Notify({ Title = "Dev", Content = "Themes printed to output.", Time = 2 })
    end,
})
SecR:AddButton("PrintLocalPlayer", {
    Text = "Print LocalPlayer Info",
    Func = function()
        print(string.format(
            "[Player] Name=%s | DisplayName=%s | UserId=%d | Team=%s",
            LocalPlayer.Name,
            LocalPlayer.DisplayName,
            LocalPlayer.UserId,
            tostring(LocalPlayer.Team)
        ))
        Library:Notify({ Title = "Dev", Content = "Player info printed.", Time = 2 })
    end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- 12. STATUS LABEL UPDATER
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
task.spawn(function()
    while task.wait(1) do
        if Library.Unloaded then break end
        local status = {}
        if Toggles.SpeedToggle and Toggles.SpeedToggle.Value then table.insert(status, "Speed") end
        if Toggles.FlyToggle   and Toggles.FlyToggle.Value   then table.insert(status, "Fly")   end
        if Toggles.NoclipToggle and Toggles.NoclipToggle.Value then table.insert(status, "Noclip") end
        if Toggles.AimbotToggle and Toggles.AimbotToggle.Value then table.insert(status, "Aimbot") end
        if Toggles.ESPEnabled  and Toggles.ESPEnabled.Value   then table.insert(status, "ESP")   end

        local text = #status > 0 and ("Active: " .. table.concat(status, ", ")) or "Status: Idle"
        if Labels.StatusLabel then
            Labels.StatusLabel:SetText(text)
        end
    end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
-- DONE
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
Library:Notify({
    Title   = "Vita Hub",
    Content = "Loaded successfully! Press RightControl to toggle.",
    Time    = 5,
})

--[[
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  QUICK API REFERENCE
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  Color("hex")                â€” hex â†’ Color3 (global)
  Library:Color("hex")        â€” same, as method

  Library:SetStyle("Curved")  â€” Square / Curved / Round / Pill
  Library:SetTheme("Blue")    â€” 9 built-in + custom themes
  Library:AddTheme(name, t)   â€” register custom theme
  Library:GetThemeNames()     â€” sorted list of all themes

  Library:SetColors({ ... })  â€” granular color control
    Keys: Main, Tab, Slider, Accent, Background, Outline, Font
  Library:UpdateScheme({...}) â€” partial raw Scheme key override
  Library:SetAccent(color)    â€” quick accent override
  Library:FlashAccent(c, dur) â€” temporary accent flash

  Tab:SetHidden(bool)         â€” hide/show sidebar button
  Tab:IsHidden()              â€” returns bool
  Tab:ToggleHidden()          â€” flip hidden state

  Window:Minimize()           â€” collapse window
  Window:Restore()            â€” expand window
  Window:ToggleMinimize()     â€” flip state
  Window:IsMinimized()        â€” returns bool

  Library:Notify({ Title, Content, Time })
  Window:AddDialog(Idx, { Title, Description, FooterButtons })
  Library:Toggle(bool?)       â€” show/hide UI

  Toggles[id].Value           â€” read toggle state
  Options[id].Value           â€” read slider/dropdown/colorpicker
  Labels[id]:SetText(str)     â€” update label text

  getgenv().VitaCurrentTheme  â€” cached theme name
  getgenv().VitaCurrentStyle  â€” cached style name
  getgenv().Color             â€” global Color() helper

â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--]]
