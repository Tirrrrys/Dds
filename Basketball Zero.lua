--//  ReefHub Main Script — Basketball: Zero
--// ═══════════════════════════════════════════════════════════════

local cloneref = cloneref or function(o) return o end

pcall(function()
    if shared.RH_Unload then shared.RH_Unload() end
    if getgenv and getgenv().RH_Unload then
        getgenv().RH_Unload()
    end
    if getconnections then
        local function sweep(event)
            for _, conn in ipairs(getconnections(event)) do
                local ok, func = pcall(function() return conn.Function end)
                if ok and func and debug.info(func, "s") == "" then
                    pcall(function() conn:Disable() end)
                    pcall(function() conn:Disconnect() end)
                end
            end
        end
        local RunService = cloneref(game:GetService("RunService"))
        local UIS = cloneref(game:GetService("UserInputService"))
        local LP = cloneref(game:GetService("Players").LocalPlayer)
        pcall(function() sweep(RunService.RenderStepped) end)
        pcall(function() sweep(UIS.InputBegan) end)
        pcall(function() sweep(UIS.InputChanged) end)
        pcall(function() sweep(UIS.InputEnded) end)
        pcall(function() sweep(LP.Idled) end)
    end
end)

pcall(function()
    local cg = cloneref(game:GetService("CoreGui"))
    if cg:FindFirstChild("RH_GUI") then cg.RH_GUI:Destroy() end
    if cg:FindFirstChild("BZ_GUI") then cg.BZ_GUI:Destroy() end
end)
pcall(function()
    if gethui then
        local h = gethui()
        if h then
            if h:FindFirstChild("RH_GUI") then h.RH_GUI:Destroy() end
            if h:FindFirstChild("BZ_GUI") then h.BZ_GUI:Destroy() end
        end
    end
end)
pcall(function()
    local Players = cloneref(game:GetService("Players"))
    local lp = Players.LocalPlayer
    if lp then
        local pg = lp:FindFirstChild("PlayerGui")
        if pg then
            if pg:FindFirstChild("RH_GUI") then pg.RH_GUI:Destroy() end
            if pg:FindFirstChild("BZ_GUI") then pg.BZ_GUI:Destroy() end
        end
    end
end)
pcall(function()
    local ws = cloneref(game:GetService("Workspace"))
    local cam = ws.CurrentCamera or ws:FindFirstChildOfClass("Camera")
    if cam then
        for _, n in ipairs({"RH_CorrectionRing", "RH_CorrectionDisc", "RH_CorrectionSphere", "RH_BallTracerLine", "RH_BallSphereGlow", "BZ_CorrectionRing", "BZ_CorrectionDisc", "BZ_CorrectionSphere", "BZ_BallTracerLine", "BZ_BallSphereGlow"}) do
            local c = cam:FindFirstChild(n); if c then c:Destroy() end
        end
    end
    for _, n in ipairs({"RH_CorrectionFloorAnchor", "RH_CorrectionFloor", "BZ_CorrectionFloorAnchor", "BZ_CorrectionFloor"}) do
        if ws:FindFirstChild(n) then ws[n]:Destroy() end
    end
end)

local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local Workspace = cloneref(game:GetService("Workspace"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TweenService = cloneref(game:GetService("TweenService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Camera = Workspace.CurrentCamera or Workspace:FindFirstChildOfClass("Camera")
local RS = cloneref(game:GetService("ReplicatedStorage"))

local isRunning = true

local Controllers = RS:FindFirstChild("Controllers")
local BallCtrl, DefCtrl, MoveCtrl

pcall(function()
    if Controllers then
        if Controllers:FindFirstChild("BallController") then BallCtrl = require(Controllers.BallController) end
        if Controllers:FindFirstChild("DefenseController") then DefCtrl = require(Controllers.DefenseController) end
        if Controllers:FindFirstChild("MovementController") then MoveCtrl = require(Controllers.MovementController) end
    end
end)

local lastSetWalkSpeed = 0
local function SetSafeWalkSpeed(hum, speed)
    if not hum then return end
    local clamped = math.clamp(speed or 16, 16, 120)
    local rounded = math.floor(clamped)
    if rounded == lastSetWalkSpeed then return end
    lastSetWalkSpeed = rounded
    pcall(function() hum.WalkSpeed = clamped end)
    if MoveCtrl and MoveCtrl.WalkSpeed then
        pcall(function() MoveCtrl:WalkSpeed(clamped) end)
    end
end

local IsMatch
pcall(function()
    if RS:FindFirstChild("Shared") and RS.Shared:FindFirstChild("Functions") and RS.Shared.Functions:FindFirstChild("IsMatch") then
        IsMatch = require(RS.Shared.Functions.IsMatch)
    end
end)

local StyleNames = {}
pcall(function()
    local tbl = require(RS.Shared.Tables.Styles)
    if tbl and tbl.Styles then
        for k in pairs(tbl.Styles) do table.insert(StyleNames, tostring(k)) end
    end
end)
table.sort(StyleNames)
if #StyleNames == 0 then StyleNames = {"Clutch", "Shooter", "Playmaker", "Lockdown", "Slasher"} end

local ZoneNames = {}
pcall(function()
    local tbl = require(RS.Shared.Tables.Zones)
    if tbl and tbl.Zones then
        for k in pairs(tbl.Zones) do table.insert(ZoneNames, tostring(k)) end
    end
end)
table.sort(ZoneNames)
if #ZoneNames == 0 then ZoneNames = {"Sprinter", "Dunker", "Sniper", "Thief", "Guardian"} end

local HOOP_HOME_POS = Vector3.new(-146.53, 16.96, -297.51)
local HOOP_AWAY_POS = Vector3.new(146.47, 16.96, -297.51)
local COURT_CENTER = Vector3.new(0, 17, -297.51)
local HOME_HALF_CENTER = Vector3.new(-75, 5, -297.5)
local AWAY_HALF_CENTER = Vector3.new(75, 5, -297.5)
local lastCourtUpdate = 0

local noclipChar = nil
local cachedNoclipParts = {}

local cachedPracticePairs = {}
task.spawn(function()
    task.wait(1)
    pcall(function()
        for _, desc in ipairs(Workspace:GetDescendants()) do
            if desc.Name == "Rims" and desc.Parent and desc.Parent.Name ~= "Court" then
                local rH = desc:FindFirstChild("RimHome")
                local rA = desc:FindFirstChild("RimAway")
                local hRim = rH and rH:FindFirstChild("Rim")
                local aRim = rA and rA:FindFirstChild("Rim")
                if hRim and aRim and hRim:IsA("BasePart") and aRim:IsA("BasePart") then
                    local center = (hRim.Position + aRim.Position) / 2
                    local toCenterH = (center - hRim.Position)
                    local flatDirH = Vector3.new(toCenterH.X, 0, toCenterH.Z).Unit
                    local toCenterA = (center - aRim.Position)
                    local flatDirA = Vector3.new(toCenterA.X, 0, toCenterA.Z).Unit

                    local trueHome = hRim.Position + (flatDirH * 11.4) + Vector3.new(0, 3.46, 0)
                    local trueAway = aRim.Position + (flatDirA * 11.4) + Vector3.new(0, 3.46, 0)
                    table.insert(cachedPracticePairs, {trueHome, trueAway})
                end
            end
        end
    end)
end)

local function updateActiveCourt()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local now = tick()
    if now - lastCourtUpdate < 5.0 then return end
    lastCourtUpdate = now

    local minCourtDist = math.huge
    local bestHome = HOOP_HOME_POS
    local bestAway = HOOP_AWAY_POS

    local function checkPair(homePos, awayPos)
        if homePos and awayPos then
            local center = (homePos + awayPos) / 2
            local d = (root.Position - center).Magnitude
            if d < minCourtDist then
                minCourtDist = d
                bestHome = homePos
                bestAway = awayPos
            end
        end
    end

    local mainHoops = Workspace:FindFirstChild("Hoops")
    if mainHoops then
        local h = mainHoops:FindFirstChild("Home")
        local a = mainHoops:FindFirstChild("Away")
        local hPart = h and h:FindFirstChild("Hoop")
        local aPart = a and a:FindFirstChild("Hoop")
        if hPart and aPart and hPart:IsA("BasePart") and aPart:IsA("BasePart") then
            checkPair(hPart.Position, aPart.Position)
        end
    end

    for _, pair in ipairs(cachedPracticePairs) do
        checkPair(pair[1], pair[2])
    end

    if minCourtDist ~= math.huge then
        HOOP_HOME_POS = bestHome
        HOOP_AWAY_POS = bestAway
        COURT_CENTER = (bestHome + bestAway) / 2
        local dir = (bestAway - bestHome).Unit
        local dist = (bestAway - bestHome).Magnitude
        if dist > 0 then
            HOME_HALF_CENTER = bestHome + (dir * (dist * 0.25))
            AWAY_HALF_CENTER = bestHome + (dir * (dist * 0.75))
        end
    end
end

local Config = {
    HUDVisible = true,
    BallCorrection = false,
    CorrectionForce = 70,
    CorrectionRange = 70,
    VisualRangeRing = true,
    VisualTracers = true,
    AimAssist = false,
    AimSmoothness = 0.35,
    BallFlight = false,
    FlightForce = 22,

    AutoDribble = false,
    DribbleInterval = 0.45,
    SmartMove = false,
    SmartMoveRange = 45,
    FourDash = false,
    DashDist = 14,
    SpeedEnabled = false,
    SpeedValue = 22,
    JumpEnabled = false,
    JumpValue = 65,
    Noclip = false,
    AntiAFK = false,

    AutoSteal = false,
    StealRange = 5,
    StealInterval = 0.65,
    AutoBlock = false,
    BlockRange = 24,
    AutoDefense = false,
    DefenseDist = 5.5,

    SmartPlay = false,
    AutoFarm = false,
    AutoQueue = false,
    AutoRebound = true,
    AutoTipOff = true,
    PlayStyle = "Aggressive",

    Notifications = true,
    AutoSave = true,
    AutoSaveInterval = 45,
    AutoLoadProfile = true,
    AutoLoadName = "default",
    UIKeybind = Enum.KeyCode.RightControl,
    StopKeybind = Enum.KeyCode.End,
}

local activeConnections: { [any]: any } = {}
local rowSearchIndex: { [any]: any } = {}
local ctrls: { [string]: any } = {}
local lastSavedOrLoadedProfile = nil

local Colors = {
    Background       = Color3.fromRGB(10, 8, 18),
    SidebarBg        = Color3.fromRGB(13, 10, 24),
    RowNormal        = Color3.fromRGB(16, 12, 28),
    RowHover         = Color3.fromRGB(24, 18, 42),
    ControlBg        = Color3.fromRGB(22, 16, 38),
    InputBg          = Color3.fromRGB(18, 14, 32),
    BorderSubtle     = Color3.fromRGB(38, 28, 64),
    BorderPurple     = Color3.fromRGB(75, 45, 125),
    Divider          = Color3.fromRGB(28, 20, 48),
    PurplePrimary    = Color3.fromRGB(216, 160, 255),
    PurpleAccent     = Color3.fromRGB(168, 85, 247),
    PurpleGlow       = Color3.fromRGB(192, 132, 252),
    PurpleDark       = Color3.fromRGB(48, 22, 84),
    PurpleMuted      = Color3.fromRGB(140, 100, 190),
    TextWhite        = Color3.fromRGB(245, 240, 255),
    TextSubtle       = Color3.fromRGB(180, 165, 205),
    TextMuted        = Color3.fromRGB(115, 100, 140),
    AccentGreen      = Color3.fromRGB(52, 211, 153),
    AccentRed        = Color3.fromRGB(248, 113, 113),
    AccentOrange     = Color3.fromRGB(251, 146, 60),
    AccentYellow     = Color3.fromRGB(250, 204, 21),
    AccentBlue       = Color3.fromRGB(96, 165, 250),
    DropdownSelected = Color3.fromRGB(36, 26, 56)
}

local PROFILE_DIR = "ReefHub/Configs"

local function EnsureProfileDir()
    pcall(function()
        if makefolder then
            if isfolder then
                if not isfolder("ReefHub") then makefolder("ReefHub") end
                if not isfolder(PROFILE_DIR) then makefolder(PROFILE_DIR) end
            else
                makefolder("ReefHub")
                makefolder(PROFILE_DIR)
            end
        end
    end)
end

local function ListProfiles()
    local profiles = {}
    pcall(function()
        if listfiles then
            EnsureProfileDir()
            for _, path in ipairs(listfiles(PROFILE_DIR)) do
                local name = path:match("([^/\\]+)%.json$")
                if name then table.insert(profiles, name) end
            end
        end
    end)
    table.sort(profiles)
    return profiles
end

local function SaveProfile(name)
    if not writefile then return false end
    EnsureProfileDir()
    local payload = {}
    for k, v in pairs(Config) do
        if typeof(v) == "EnumItem" then
            payload[k] = v.Name
        else
            payload[k] = v
        end
    end
    local ok = pcall(function()
        writefile(PROFILE_DIR .. "/" .. name .. ".json", HttpService:JSONEncode(payload))
    end)
    if ok then lastSavedOrLoadedProfile = name end
    return ok
end

local function LoadProfile(name)
    if not readfile then return false end
    local path = PROFILE_DIR .. "/" .. name .. ".json"

    local ok, content = pcall(function() return readfile(path) end)
    if not ok or type(content) ~= "string" then return false end

    local ok2, data = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    if ok2 and type(data) == "table" then
        for k, v in pairs(data) do
            if Config[k] ~= nil then
                if k == "UIKeybind" or k == "StopKeybind" then
                    if type(v) == "string" and Enum.KeyCode[v] then
                        Config[k] = Enum.KeyCode[v]
                    end
                else
                    Config[k] = v
                end
            end
        end
        lastSavedOrLoadedProfile = name
        return true
    end
    return false
end

local function DeleteProfile(name)
    pcall(function()
        if delfile then
            delfile(PROFILE_DIR .. "/" .. name .. ".json")
        end
    end)
end

local function AutoSaveConfig()
    if not Config.AutoSave then return end
    if lastSavedOrLoadedProfile then
        SaveProfile(lastSavedOrLoadedProfile)
    else
        SaveProfile("default")
    end
end

if Config.AutoLoadProfile then
    LoadProfile(Config.AutoLoadName or "default")
end

local function getGuiParent()
    if gethui then
        local ok, h = pcall(gethui)
        if ok and h then return h end
    end
    local ok, gui = pcall(function() return CoreGui end)
    if ok and gui then return gui end
    return LocalPlayer:WaitForChild("PlayerGui", 5) or LocalPlayer:FindFirstChild("PlayerGui")
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RH_GUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = getGuiParent()

local function UnloadScript()
    isRunning = false
    for _, conn in ipairs(activeConnections) do pcall(function() conn:Disconnect() end) end
    table.clear(activeConnections)
    pcall(function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
        if Camera then
            for _, n in ipairs({"RH_CorrectionRing", "RH_CorrectionDisc", "RH_CorrectionSphere", "RH_BallTracerLine", "RH_BallSphereGlow"}) do
                local c = Camera:FindFirstChild(n); if c then c:Destroy() end
            end
        end
        for _, n in ipairs({"RH_CorrectionSphere", "RH_CorrectionFloorAnchor", "RH_CorrectionFloor"}) do
            local c = Workspace:FindFirstChild(n); if c then c:Destroy() end
        end
        local b = Workspace:FindFirstChild("Basketball")
        if b then
            local g = b:FindFirstChild("RH_RejectionGlow")
            if g then g:Destroy() end
            local g2 = b:FindFirstChild("RH_BallGlow")
            if g2 then g2:Destroy() end
        end
    end)
    if getgenv then getgenv().RH_Unload = nil end
    shared.RH_Unload = nil
end

if getgenv then getgenv().RH_Unload = UnloadScript end
shared.RH_Unload = UnloadScript

local cachedRangeRing = nil
local cachedRangeDisc = nil
local cachedRangeSphere = nil
local lastHoopFloorPos = nil

local notifContainer = Instance.new("Frame")
notifContainer.Name = "Notifications"
notifContainer.Size = UDim2.new(0, 300, 1, -40)
notifContainer.Position = UDim2.new(1, -315, 0, 20)
notifContainer.BackgroundTransparency = 1
notifContainer.ZIndex = 1000
notifContainer.Parent = screenGui

local notifLayout = Instance.new("UIListLayout")
notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
notifLayout.Padding = UDim.new(0, 8)
notifLayout.Parent = notifContainer

local function SendNotification(title, text, duration)
    if not Config.Notifications then return end
    duration = duration or 3
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 60)
    card.BackgroundColor3 = Colors.Background
    card.BackgroundTransparency = 0.05
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.Parent = notifContainer
    local stroke = Instance.new("UIStroke"); stroke.Color = Colors.PurpleAccent; stroke.Thickness = 1.2; stroke.Parent = card
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = card
    local topBar = Instance.new("Frame"); topBar.Size = UDim2.new(1, 0, 0, 20); topBar.BackgroundTransparency = 1; topBar.Position = UDim2.new(0, 10, 0, 6); topBar.Parent = card
    local tLabel = Instance.new("TextLabel"); tLabel.Size = UDim2.new(1, -20, 1, 0); tLabel.BackgroundTransparency = 1; tLabel.Font = Enum.Font.GothamBold; tLabel.Text = title; tLabel.TextColor3 = Colors.PurplePrimary; tLabel.TextSize = 13; tLabel.TextXAlignment = Enum.TextXAlignment.Left; tLabel.Parent = topBar
    local mLabel = Instance.new("TextLabel"); mLabel.Size = UDim2.new(1, -20, 0, 26); mLabel.Position = UDim2.new(0, 10, 0, 26); mLabel.BackgroundTransparency = 1; mLabel.Font = Enum.Font.Gotham; mLabel.Text = text; mLabel.TextColor3 = Colors.TextSubtle; mLabel.TextSize = 11; mLabel.TextXAlignment = Enum.TextXAlignment.Left; mLabel.TextWrapped = true; mLabel.Parent = card
    task.delay(duration, function()
        TweenService:Create(card, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1, Position = card.Position + UDim2.new(1, 20, 0, 0)
        }):Play()
        task.wait(0.35); card:Destroy()
    end)
end

local ToggleUiVisibility

local floatingCrescent = Instance.new("ImageButton")
floatingCrescent.Name = "FloatingCrescent"
floatingCrescent.Size = UDim2.new(0, 44, 0, 44)
floatingCrescent.Position = UDim2.new(0, 20, 0, 20)
floatingCrescent.BackgroundColor3 = Colors.Background
floatingCrescent.BorderSizePixel = 0
floatingCrescent.Visible = false
floatingCrescent.ZIndex = 1000
floatingCrescent.Parent = screenGui

do
    local fcCorner = Instance.new("UICorner"); fcCorner.CornerRadius = UDim.new(1, 0); fcCorner.Parent = floatingCrescent
    local fcStroke = Instance.new("UIStroke"); fcStroke.Color = Colors.PurpleAccent; fcStroke.Thickness = 1.5; fcStroke.Parent = floatingCrescent
    local fcIconContainer = Instance.new("Frame"); fcIconContainer.Size = UDim2.new(0, 24, 0, 24); fcIconContainer.Position = UDim2.new(0.5, -12, 0.5, -12); fcIconContainer.BackgroundTransparency = 1; fcIconContainer.ClipsDescendants = true; fcIconContainer.Parent = floatingCrescent
    local fcOuter = Instance.new("Frame"); fcOuter.Size = UDim2.new(0, 24, 0, 24); fcOuter.BackgroundColor3 = Colors.PurplePrimary; fcOuter.BorderSizePixel = 0; fcOuter.Parent = fcIconContainer
    local fcOC = Instance.new("UICorner"); fcOC.CornerRadius = UDim.new(1, 0); fcOC.Parent = fcOuter
    local fcCutout = Instance.new("Frame"); fcCutout.Size = UDim2.new(0, 20, 0, 20); fcCutout.Position = UDim2.new(0, 6, 0, -3); fcCutout.BackgroundColor3 = Colors.Background; fcCutout.BorderSizePixel = 0; fcCutout.Parent = fcOuter
    local fcCC = Instance.new("UICorner"); fcCC.CornerRadius = UDim.new(1, 0); fcCC.Parent = fcCutout

    local fcDragging, fcDragInput, fcDragStart, fcStartPos = false, nil, nil, nil
    floatingCrescent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            fcDragging = true; fcDragStart = input.Position; fcStartPos = floatingCrescent.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then fcDragging = false end end)
        end
    end)
    floatingCrescent.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then fcDragInput = input end end)
    table.insert(activeConnections, UserInputService.InputChanged:Connect(function(input)
        if input == fcDragInput and fcDragging then
            local delta = input.Position - fcDragStart
            floatingCrescent.Position = UDim2.new(fcStartPos.X.Scale, fcStartPos.X.Offset + delta.X, fcStartPos.Y.Scale, fcStartPos.Y.Offset + delta.Y)
        end
    end))
    floatingCrescent.MouseEnter:Connect(function()
        TweenService:Create(floatingCrescent, TweenInfo.new(0.15), {BackgroundColor3 = Colors.PurpleDark}):Play()
        TweenService:Create(fcStroke, TweenInfo.new(0.15), {Color = Colors.PurpleGlow}):Play()
        fcCutout.BackgroundColor3 = Colors.PurpleDark
    end)
    floatingCrescent.MouseLeave:Connect(function()
        TweenService:Create(floatingCrescent, TweenInfo.new(0.15), {BackgroundColor3 = Colors.Background}):Play()
        TweenService:Create(fcStroke, TweenInfo.new(0.15), {Color = Colors.PurpleAccent}):Play()
        fcCutout.BackgroundColor3 = Colors.Background
    end)
    floatingCrescent.MouseButton1Click:Connect(function() if ToggleUiVisibility then ToggleUiVisibility() end end)
end

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 700, 0, 480)
mainFrame.Position = UDim2.new(0.5, -350, 0.5, -240)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

do
    local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0, 8); mc.Parent = mainFrame
    local ms = Instance.new("UIStroke"); ms.Color = Colors.BorderPurple; ms.Thickness = 1.5; ms.Parent = mainFrame
end

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 38)
titleBar.BackgroundColor3 = Colors.SidebarBg
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

do
    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 8); tc.Parent = titleBar
    local tbf = Instance.new("Frame"); tbf.Size = UDim2.new(1, 0, 0, 10); tbf.Position = UDim2.new(0, 0, 1, -10); tbf.BackgroundColor3 = Colors.SidebarBg; tbf.BorderSizePixel = 0; tbf.Parent = titleBar
    local tdiv = Instance.new("Frame"); tdiv.Size = UDim2.new(1, 0, 0, 1); tdiv.Position = UDim2.new(0, 0, 1, -1); tdiv.BackgroundColor3 = Colors.Divider; tdiv.BorderSizePixel = 0; tdiv.Parent = titleBar
end

do
    local cc = Instance.new("Frame"); cc.Size = UDim2.new(0, 16, 0, 16); cc.Position = UDim2.new(0, 14, 0.5, -8); cc.BackgroundTransparency = 1; cc.ClipsDescendants = true; cc.Parent = titleBar
    local co = Instance.new("Frame"); co.Size = UDim2.new(0, 16, 0, 16); co.BackgroundColor3 = Colors.PurpleAccent; co.BorderSizePixel = 0; co.Parent = cc
    Instance.new("UICorner", co).CornerRadius = UDim.new(1, 0)
    local cut = Instance.new("Frame"); cut.Size = UDim2.new(0, 13, 0, 13); cut.Position = UDim2.new(0, 4, 0, -2); cut.BackgroundColor3 = Colors.SidebarBg; cut.BorderSizePixel = 0; cut.Parent = co
    Instance.new("UICorner", cut).CornerRadius = UDim.new(1, 0)
end

local brandTitle = Instance.new("TextLabel")
brandTitle.Size = UDim2.new(0, 150, 1, 0); brandTitle.Position = UDim2.new(0, 36, 0, 0)
brandTitle.BackgroundTransparency = 1; brandTitle.Font = Enum.Font.GothamBold
brandTitle.Text = "REEFHUB"; brandTitle.TextColor3 = Colors.PurplePrimary
brandTitle.TextSize = 14; brandTitle.TextXAlignment = Enum.TextXAlignment.Left
brandTitle.Parent = titleBar
local gameSubtitle = Instance.new("TextLabel")
gameSubtitle.Size = UDim2.new(0, 200, 1, 0); gameSubtitle.Position = UDim2.new(0, 118, 0, 0)
gameSubtitle.BackgroundTransparency = 1; gameSubtitle.Font = Enum.Font.Gotham
gameSubtitle.Text = "BASKETBALL: ZERO"; gameSubtitle.TextColor3 = Colors.PurpleMuted
gameSubtitle.TextSize = 10; gameSubtitle.TextXAlignment = Enum.TextXAlignment.Left; gameSubtitle.Parent = titleBar

local winControls = Instance.new("Frame"); winControls.Size = UDim2.new(0, 60, 1, 0); winControls.Position = UDim2.new(1, -65, 0, 0); winControls.BackgroundTransparency = 1; winControls.Parent = titleBar
local minBtn = Instance.new("TextButton"); minBtn.Size = UDim2.new(0, 24, 0, 24); minBtn.Position = UDim2.new(0, 4, 0.5, -12); minBtn.BackgroundColor3 = Colors.ControlBg; minBtn.Font = Enum.Font.GothamBold; minBtn.Text = "[-]"; minBtn.TextColor3 = Colors.PurplePrimary; minBtn.TextSize = 11; minBtn.BorderSizePixel = 0; minBtn.Parent = winControls
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 4)
local closeBtn = Instance.new("TextButton"); closeBtn.Size = UDim2.new(0, 24, 0, 24); closeBtn.Position = UDim2.new(0, 32, 0.5, -12); closeBtn.BackgroundColor3 = Colors.ControlBg; closeBtn.Font = Enum.Font.GothamBold; closeBtn.Text = "[X]"; closeBtn.TextColor3 = Colors.AccentRed; closeBtn.TextSize = 11; closeBtn.BorderSizePixel = 0; closeBtn.Parent = winControls
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)

do
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = mainFrame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    titleBar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
    table.insert(activeConnections, UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end))
end

local bodyFrame = Instance.new("Frame"); bodyFrame.Name = "Body"; bodyFrame.Size = UDim2.new(1, 0, 1, -62); bodyFrame.Position = UDim2.new(0, 0, 0, 38); bodyFrame.BackgroundTransparency = 1; bodyFrame.Parent = mainFrame

local sidebar = Instance.new("Frame"); sidebar.Name = "Sidebar"; sidebar.Size = UDim2.new(0, 140, 1, 0); sidebar.BackgroundColor3 = Colors.SidebarBg; sidebar.BorderSizePixel = 0; sidebar.Parent = bodyFrame
do local d = Instance.new("Frame"); d.Size = UDim2.new(0, 1, 1, 0); d.Position = UDim2.new(1, -1, 0, 0); d.BackgroundColor3 = Colors.Divider; d.BorderSizePixel = 0; d.Parent = sidebar end

local searchBox = Instance.new("TextBox")
searchBox.Name = "SearchBar"; searchBox.Size = UDim2.new(1, -16, 0, 26); searchBox.Position = UDim2.new(0, 8, 0, 8)
searchBox.BackgroundColor3 = Colors.InputBg; searchBox.Font = Enum.Font.Gotham; searchBox.PlaceholderText = "Search..."
searchBox.PlaceholderColor3 = Colors.TextMuted; searchBox.Text = ""; searchBox.TextColor3 = Colors.TextWhite
searchBox.TextSize = 11; searchBox.TextXAlignment = Enum.TextXAlignment.Left; searchBox.BorderSizePixel = 0; searchBox.ClearTextOnFocus = false; searchBox.Parent = sidebar
do local p = Instance.new("UIPadding"); p.PaddingLeft = UDim.new(0, 8); p.Parent = searchBox end
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 4)

local navList = Instance.new("ScrollingFrame"); navList.Name = "NavList"; navList.Size = UDim2.new(1, 0, 1, -44); navList.Position = UDim2.new(0, 0, 0, 42); navList.BackgroundTransparency = 1; navList.BorderSizePixel = 0; navList.ScrollBarThickness = 2; navList.ScrollBarImageColor3 = Colors.BorderSubtle; navList.CanvasSize = UDim2.new(0, 0, 0, 0); navList.AutomaticCanvasSize = Enum.AutomaticSize.Y; navList.Parent = sidebar
do
    local nl = Instance.new("UIListLayout"); nl.SortOrder = Enum.SortOrder.LayoutOrder; nl.Padding = UDim.new(0, 4); nl.Parent = navList
    local np = Instance.new("UIPadding"); np.PaddingTop = UDim.new(0, 6); np.PaddingLeft = UDim.new(0, 8); np.PaddingRight = UDim.new(0, 8); np.Parent = navList
end

local contentArea = Instance.new("Frame"); contentArea.Name = "ContentArea"; contentArea.Size = UDim2.new(1, -140, 1, 0); contentArea.Position = UDim2.new(0, 140, 0, 0); contentArea.BackgroundTransparency = 1; contentArea.Parent = bodyFrame

local tabFrames = {}
local tabButtons = {}

local function switchTab(tabName)
    for name, frame in pairs(tabFrames) do frame.Visible = (name == tabName) end
    for name, btn in pairs(tabButtons) do
        if name == tabName then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.PurpleDark, TextColor3 = Colors.TextWhite}):Play()
            local pill = btn:FindFirstChild("ActivePill"); if pill then pill.Visible = true end
        else
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.SidebarBg, TextColor3 = Colors.TextSubtle}):Play()
            local pill = btn:FindFirstChild("ActivePill"); if pill then pill.Visible = false end
        end
    end
end

local function createTab(name)
    local btn = Instance.new("TextButton"); btn.Name = "TabBtn_" .. name; btn.Size = UDim2.new(1, 0, 0, 30); btn.BackgroundColor3 = Colors.SidebarBg; btn.Font = Enum.Font.GothamBold; btn.Text = name; btn.TextColor3 = Colors.TextSubtle; btn.TextSize = 12; btn.TextXAlignment = Enum.TextXAlignment.Left; btn.BorderSizePixel = 0; btn.Parent = navList
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    do local p = Instance.new("UIPadding"); p.PaddingLeft = UDim.new(0, 12); p.Parent = btn end
    local pill = Instance.new("Frame"); pill.Name = "ActivePill"; pill.Size = UDim2.new(0, 3, 0, 16); pill.Position = UDim2.new(0, -9, 0.5, -8); pill.BackgroundColor3 = Colors.PurpleAccent; pill.BorderSizePixel = 0; pill.Visible = false; pill.Parent = btn
    Instance.new("UICorner", pill).CornerRadius = UDim.new(0, 2)
    btn.MouseButton1Click:Connect(function() switchTab(name) end)

    local page = Instance.new("ScrollingFrame"); page.Name = "TabPage_" .. name; page.Size = UDim2.new(1, 0, 1, 0); page.BackgroundTransparency = 1; page.BorderSizePixel = 0; page.ScrollBarThickness = 3; page.ScrollBarImageColor3 = Colors.BorderPurple; page.CanvasSize = UDim2.new(0, 0, 0, 0); page.AutomaticCanvasSize = Enum.AutomaticSize.Y; page.Visible = false; page.Parent = contentArea
    do
        local pl = Instance.new("UIListLayout"); pl.SortOrder = Enum.SortOrder.LayoutOrder; pl.Padding = UDim.new(0, 10); pl.Parent = page
        local pp = Instance.new("UIPadding"); pp.PaddingTop = UDim.new(0, 12); pp.PaddingBottom = UDim.new(0, 16); pp.PaddingLeft = UDim.new(0, 14); pp.PaddingRight = UDim.new(0, 14); pp.Parent = page
    end
    tabFrames[name] = page; tabButtons[name] = btn
    return page
end

local tabs = {
    Home     = createTab("Home"),
    Shooting = createTab("Shooting"),
    Movement = createTab("Movement"),
    Defense  = createTab("Defense"),
    AutoPlay = createTab("Auto Play"),
    Profiles = createTab("Profiles"),
}

local footerBar = Instance.new("Frame"); footerBar.Name = "FooterBar"; footerBar.Size = UDim2.new(1, 0, 0, 24); footerBar.Position = UDim2.new(0, 0, 1, -24); footerBar.BackgroundColor3 = Colors.SidebarBg; footerBar.BorderSizePixel = 0; footerBar.Parent = mainFrame
Instance.new("UICorner", footerBar).CornerRadius = UDim.new(0, 8)
do
    local tf = Instance.new("Frame"); tf.Size = UDim2.new(1, 0, 0, 10); tf.BackgroundColor3 = Colors.SidebarBg; tf.BorderSizePixel = 0; tf.Parent = footerBar
    local fd = Instance.new("Frame"); fd.Size = UDim2.new(1, 0, 0, 1); fd.BackgroundColor3 = Colors.Divider; fd.BorderSizePixel = 0; fd.Parent = footerBar
end
local footerBrand = Instance.new("TextLabel"); footerBrand.Size = UDim2.new(0, 260, 1, 0); footerBrand.Position = UDim2.new(0, 12, 0, 0); footerBrand.BackgroundTransparency = 1; footerBrand.Font = Enum.Font.Gotham; footerBrand.Text = "ReefHub v1.0 - Basketball: Zero | discord.gg/BeXJBSE9Fn"; footerBrand.TextColor3 = Colors.TextMuted; footerBrand.TextSize = 10; footerBrand.TextXAlignment = Enum.TextXAlignment.Left; footerBrand.Parent = footerBar
local footerKey = Instance.new("TextLabel"); footerKey.Size = UDim2.new(0, 280, 1, 0); footerKey.Position = UDim2.new(1, -292, 0, 0); footerKey.BackgroundTransparency = 1; footerKey.Font = Enum.Font.Gotham; footerKey.Text = "[R-CTRL] Menu | [END] Stop | F1-F6 Hotkeys"; footerKey.TextColor3 = Colors.TextMuted; footerKey.TextSize = 10; footerKey.TextXAlignment = Enum.TextXAlignment.Right; footerKey.Parent = footerBar

local function createCategoryHeader(parent, text)
    local hdr = Instance.new("Frame"); hdr.Size = UDim2.new(1, 0, 0, 22); hdr.BackgroundTransparency = 1; hdr.Parent = parent
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1, 0, 1, 0); lbl.BackgroundTransparency = 1; lbl.Font = Enum.Font.GothamBold; lbl.Text = string.upper(text); lbl.TextColor3 = Colors.PurplePrimary; lbl.TextSize = 11; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = hdr
    return hdr
end

local function createCardGroup(parent)
    local group = Instance.new("Frame"); group.Size = UDim2.new(1, 0, 0, 0); group.AutomaticSize = Enum.AutomaticSize.Y; group.BackgroundColor3 = Colors.RowNormal; group.BorderSizePixel = 0; group.Parent = parent
    local s = Instance.new("UIStroke"); s.Color = Colors.BorderSubtle; s.Thickness = 1; s.Parent = group
    Instance.new("UICorner", group).CornerRadius = UDim.new(0, 6)
    local l = Instance.new("UIListLayout"); l.SortOrder = Enum.SortOrder.LayoutOrder; l.Padding = UDim.new(0, 0); l.Parent = group
    return group
end

local function createBaseRow(parent, title, desc, tag)
    local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 42); row.BackgroundColor3 = Colors.RowNormal; row.BorderSizePixel = 0; row.Parent = parent
    local pad = Instance.new("UIPadding"); pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10); pad.Parent = row
    local tf = Instance.new("Frame"); tf.Size = UDim2.new(1, -190, 1, 0); tf.BackgroundTransparency = 1; tf.Parent = row
    local tl = Instance.new("TextLabel"); tl.Size = UDim2.new(1, 0, 0, 18); tl.Position = UDim2.new(0, 0, 0, 4); tl.BackgroundTransparency = 1; tl.Font = Enum.Font.GothamBold; tl.Text = title; tl.TextColor3 = Colors.TextWhite; tl.TextSize = 12; tl.TextXAlignment = Enum.TextXAlignment.Left; tl.Parent = tf
    local dl = Instance.new("TextLabel"); dl.Size = UDim2.new(1, 0, 0, 14); dl.Position = UDim2.new(0, 0, 0, 22); dl.BackgroundTransparency = 1; dl.Font = Enum.Font.Gotham; dl.Text = desc or ""; dl.TextColor3 = Colors.TextMuted; dl.TextSize = 10; dl.TextXAlignment = Enum.TextXAlignment.Left; dl.Parent = tf
    row.MouseEnter:Connect(function() TweenService:Create(row, TweenInfo.new(0.15), {BackgroundColor3 = Colors.RowHover}):Play() end)
    row.MouseLeave:Connect(function() TweenService:Create(row, TweenInfo.new(0.15), {BackgroundColor3 = Colors.RowNormal}):Play() end)
    if tag ~= false then
        table.insert(rowSearchIndex, {frame = row, query = (title .. " " .. (desc or "")):lower()})
    end
    return row
end

local function createToggleRow(parent, title, desc, initVal, onChange, tag)
    if type(initVal) == "function" then
        tag = onChange
        onChange = initVal
        initVal = false
    end
    local row = createBaseRow(parent, title, desc, tag)
    local state = initVal or false
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0, 40, 0, 20); btn.Position = UDim2.new(1, -40, 0.5, -10); btn.BackgroundColor3 = state and Colors.PurpleAccent or Colors.ControlBg; btn.Text = ""; btn.BorderSizePixel = 0; btn.Parent = row
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    local knob = Instance.new("Frame"); knob.Size = UDim2.new(0, 14, 0, 14); knob.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7); knob.BackgroundColor3 = Colors.TextWhite; knob.BorderSizePixel = 0; knob.Parent = btn
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local function updateVisuals()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = state and Colors.PurpleAccent or Colors.ControlBg}):Play()
        TweenService:Create(knob, TweenInfo.new(0.15), {Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}):Play()
    end
    btn.MouseButton1Click:Connect(function()
        state = not state
        updateVisuals()
        if type(onChange) == "function" then onChange(state) end
        AutoSaveConfig()
    end)
    return {frame = row, SetState = function(val) state = val; updateVisuals() end}
end

local function createSliderRow(parent, title, desc, min, max, cur, floatMode, suffix, onUpdate, tag)
    local row = createBaseRow(parent, title, desc, tag)
    local currentVal = cur or min; suffix = suffix or ""
    local container = Instance.new("Frame"); container.Size = UDim2.new(0, 180, 0, 24); container.Position = UDim2.new(1, -180, 0.5, -12); container.BackgroundTransparency = 1; container.Parent = row
    local valLabel = Instance.new("TextLabel"); valLabel.Size = UDim2.new(0, 68, 1, 0); valLabel.Position = UDim2.new(1, -68, 0, 0); valLabel.BackgroundTransparency = 1; valLabel.Font = Enum.Font.GothamBold; valLabel.TextColor3 = Colors.PurplePrimary; valLabel.TextSize = 11; valLabel.TextXAlignment = Enum.TextXAlignment.Right; valLabel.Parent = container
    valLabel.Text = floatMode and string.format("%.2f", currentVal)..suffix or tostring(math.floor(currentVal))..suffix
    local track = Instance.new("Frame"); track.Size = UDim2.new(1, -74, 0, 6); track.Position = UDim2.new(0, 0, 0.5, -3); track.BackgroundColor3 = Colors.ControlBg; track.BorderSizePixel = 0; track.Parent = container
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)
    local pct = math.clamp((currentVal - min) / (max - min), 0, 1)
    local fill = Instance.new("Frame"); fill.Size = UDim2.new(pct, 0, 1, 0); fill.BackgroundColor3 = Colors.PurpleAccent; fill.BorderSizePixel = 0; fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    local sliding = false
    local function updateFromX(x)
        local rel = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local val = min + (max - min) * rel
        if not floatMode then val = math.floor(val + 0.5) end
        currentVal = val; fill.Size = UDim2.new(rel, 0, 1, 0)
        valLabel.Text = floatMode and string.format("%.2f", val)..suffix or tostring(val)..suffix
        AutoSaveConfig()
        if type(onUpdate) == "function" then onUpdate(val) end
    end
    track.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true; updateFromX(input.Position.X) end end)
    table.insert(activeConnections, UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end end))
    table.insert(activeConnections, UserInputService.InputChanged:Connect(function(input) if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then updateFromX(input.Position.X) end end))
    return {frame = row, SetValue = function(val) currentVal = val; local p2 = math.clamp((val - min) / (max - min), 0, 1); fill.Size = UDim2.new(p2, 0, 1, 0); valLabel.Text = floatMode and string.format("%.2f", val)..suffix or tostring(math.floor(val))..suffix end}
end

local function createDropdownRow(parent, title, desc, options, selected, onSelect, tag)
    if type(options) == "table" and type(selected) == "function" then
        tag = onSelect
        onSelect = selected
        selected = options[1]
    end
    local currentChoice = selected or options[1]
    local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 42); row.AutomaticSize = Enum.AutomaticSize.Y; row.BackgroundColor3 = Colors.RowNormal; row.BorderSizePixel = 0; row.ClipsDescendants = true; row.Parent = parent
    local rl = Instance.new("UIListLayout"); rl.SortOrder = Enum.SortOrder.LayoutOrder; rl.Padding = UDim.new(0, 4); rl.Parent = row
    local header = Instance.new("Frame"); header.Size = UDim2.new(1, 0, 0, 42); header.BackgroundTransparency = 1; header.Parent = row
    local pad = Instance.new("UIPadding"); pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10); pad.Parent = header
    local tf = Instance.new("Frame"); tf.Size = UDim2.new(1, -145, 1, 0); tf.BackgroundTransparency = 1; tf.Parent = header
    local tl = Instance.new("TextLabel"); tl.Size = UDim2.new(1, 0, 0, 18); tl.Position = UDim2.new(0, 0, 0, 4); tl.BackgroundTransparency = 1; tl.Font = Enum.Font.GothamBold; tl.Text = title; tl.TextColor3 = Colors.TextWhite; tl.TextSize = 12; tl.TextXAlignment = Enum.TextXAlignment.Left; tl.Parent = tf
    local dl = Instance.new("TextLabel"); dl.Size = UDim2.new(1, 0, 0, 14); dl.Position = UDim2.new(0, 0, 0, 22); dl.BackgroundTransparency = 1; dl.Font = Enum.Font.Gotham; dl.Text = desc or ""; dl.TextColor3 = Colors.TextMuted; dl.TextSize = 10; dl.TextXAlignment = Enum.TextXAlignment.Left; dl.Parent = tf
    local ddBtn = Instance.new("TextButton"); ddBtn.Size = UDim2.new(0, 130, 0, 24); ddBtn.Position = UDim2.new(1, -130, 0.5, -12); ddBtn.BackgroundColor3 = Colors.ControlBg; ddBtn.Font = Enum.Font.GothamBold; ddBtn.Text = tostring(currentChoice) .. "  v"; ddBtn.TextColor3 = Colors.PurplePrimary; ddBtn.TextSize = 11; ddBtn.BorderSizePixel = 0; ddBtn.Parent = header
    Instance.new("UICorner", ddBtn).CornerRadius = UDim.new(0, 4)
    local optC = Instance.new("Frame"); optC.Size = UDim2.new(1, 0, 0, 0); optC.AutomaticSize = Enum.AutomaticSize.Y; optC.BackgroundTransparency = 1; optC.Visible = false; optC.Parent = row
    do local p = Instance.new("UIPadding"); p.PaddingLeft = UDim.new(0, 10); p.PaddingRight = UDim.new(0, 10); p.PaddingBottom = UDim.new(0, 8); p.Parent = optC end
    Instance.new("UIListLayout", optC).SortOrder = Enum.SortOrder.LayoutOrder
    local optButtons = {}
    local function populate(opts)
        for _, c in ipairs(optC:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        table.clear(optButtons)
        for _, opt in ipairs(opts) do
            local ob = Instance.new("TextButton"); ob.Size = UDim2.new(1, 0, 0, 26); ob.BackgroundColor3 = (opt == currentChoice) and Colors.DropdownSelected or Colors.InputBg; ob.Font = Enum.Font.Gotham; ob.Text = (opt == currentChoice and "> " or "   ") .. tostring(opt); ob.TextColor3 = (opt == currentChoice) and Colors.PurplePrimary or Colors.TextWhite; ob.TextSize = 11; ob.TextXAlignment = Enum.TextXAlignment.Left; ob.BorderSizePixel = 0; ob.Parent = optC
            Instance.new("UICorner", ob).CornerRadius = UDim.new(0, 4)
            do local p = Instance.new("UIPadding"); p.PaddingLeft = UDim.new(0, 10); p.Parent = ob end
            optButtons[opt] = ob
            ob.MouseEnter:Connect(function() if opt ~= currentChoice then TweenService:Create(ob, TweenInfo.new(0.15), {BackgroundColor3 = Colors.RowHover}):Play() end end)
            ob.MouseLeave:Connect(function() if opt ~= currentChoice then TweenService:Create(ob, TweenInfo.new(0.15), {BackgroundColor3 = Colors.InputBg}):Play() end end)
            ob.MouseButton1Click:Connect(function()
                currentChoice = opt; ddBtn.Text = tostring(opt) .. "  v"; optC.Visible = false
                for oN, b in pairs(optButtons) do b.BackgroundColor3 = (oN == opt) and Colors.DropdownSelected or Colors.InputBg; b.TextColor3 = (oN == opt) and Colors.PurplePrimary or Colors.TextWhite; b.Text = (oN == opt and "> " or "   ") .. tostring(oN) end
                AutoSaveConfig()
                if type(onSelect) == "function" then onSelect(opt) end
            end)
        end
    end
    populate(options)
    ddBtn.MouseButton1Click:Connect(function() optC.Visible = not optC.Visible; ddBtn.Text = tostring(currentChoice) .. (optC.Visible and "  ^" or "  v") end)
    header.MouseEnter:Connect(function() TweenService:Create(row, TweenInfo.new(0.15), {BackgroundColor3 = Colors.RowHover}):Play() end)
    header.MouseLeave:Connect(function() TweenService:Create(row, TweenInfo.new(0.15), {BackgroundColor3 = Colors.RowNormal}):Play() end)
    if tag ~= false then table.insert(rowSearchIndex, {frame = row, query = (title .. " " .. (desc or "")):lower()}) end
    return {
        frame = row,
        SetSelected = function(opt)
            currentChoice = opt; ddBtn.Text = tostring(opt) .. "  v"
            for oN, b in pairs(optButtons) do b.BackgroundColor3 = (oN == opt) and Colors.DropdownSelected or Colors.InputBg; b.TextColor3 = (oN == opt) and Colors.PurplePrimary or Colors.TextWhite; b.Text = (oN == opt and "> " or "   ") .. tostring(oN) end
        end,
        UpdateOptions = function(newOpts)
            populate(newOpts)
        end
    }
end

local function createInfoRow(parent, title, statVal, tag)
    local row = createBaseRow(parent, title, "", tag)
    local vl = Instance.new("TextLabel"); vl.Size = UDim2.new(0, 140, 1, 0); vl.Position = UDim2.new(1, -140, 0, 0); vl.BackgroundTransparency = 1; vl.Font = Enum.Font.GothamBold; vl.Text = statVal; vl.TextColor3 = Colors.PurplePrimary; vl.TextSize = 11; vl.TextXAlignment = Enum.TextXAlignment.Right; vl.Parent = row
    return {frame = row, SetValue = function(nv) vl.Text = nv end}
end

local function createButtonRow(parent, title, actionText, desc, onClick, tag)
    if type(desc) == "function" then
        tag = onClick
        onClick = desc
        desc = ""
    end
    local row = createBaseRow(parent, title, desc, tag)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0, 90, 0, 24); btn.Position = UDim2.new(1, -90, 0.5, -12); btn.BackgroundColor3 = Colors.ControlBg; btn.Font = Enum.Font.GothamBold; btn.Text = actionText; btn.TextColor3 = Colors.PurplePrimary; btn.TextSize = 11; btn.BorderSizePixel = 0; btn.Parent = row
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.PurpleDark, TextColor3 = Colors.TextWhite}):Play() end)
    btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Colors.ControlBg, TextColor3 = Colors.PurplePrimary}):Play() end)
    btn.MouseButton1Click:Connect(function()
        if type(onClick) == "function" then
            onClick()
        end
    end)
    return row
end

local function createTextInputRow(parent, title, desc, val, onEnter, tag)
    if type(val) == "function" then
        tag = onEnter
        onEnter = val
        val = ""
    end
    local row = createBaseRow(parent, title, desc, tag)
    local box = Instance.new("TextBox"); box.Size = UDim2.new(0, 130, 0, 24); box.Position = UDim2.new(1, -130, 0.5, -12); box.BackgroundColor3 = Colors.InputBg; box.Font = Enum.Font.GothamBold; box.Text = val or ""; box.TextColor3 = Colors.PurplePrimary; box.TextSize = 11; box.BorderSizePixel = 0; box.ClearTextOnFocus = false; box.Parent = row
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
    do local p = Instance.new("UIPadding"); p.PaddingLeft = UDim.new(0, 8); p.Parent = box end
    local s = Instance.new("UIStroke"); s.Color = Colors.BorderSubtle; s.Thickness = 1; s.Parent = box
    box.FocusLost:Connect(function()
        AutoSaveConfig()
        if type(onEnter) == "function" then onEnter(box.Text) end
    end)
    return {frame = row, GetText = function() return box.Text end, SetText = function(t) box.Text = t end}
end

local function fetchMatchState()
    if IsMatch then
        local ok, res = pcall(function() return IsMatch() end)
        if ok and res then return "In Match" end
    end
    local matchFolder = LocalPlayer:FindFirstChild("InMatch")
    if matchFolder then
        local matches = matchFolder:FindFirstChild("Matches")
        if matches and matches.Value > 0 then return "In Match" end
    end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root and math.abs(root.Position.Z + 297.5) < 80 then
        return "In Match"
    end
    return "Lobby"
end

local function findPlrTeam(plr)
    if not plr then return nil end
    local RS = game:GetService("ReplicatedStorage")
    local rsTeams = RS:FindFirstChild("Teams")
    if rsTeams then
        for _, teamName in ipairs({"Home", "Away"}) do
            local folder = rsTeams:FindFirstChild(teamName)
            if folder then
                for _, objVal in ipairs(folder:GetChildren()) do
                    if (objVal:IsA("ObjectValue") and objVal.Value == plr) or objVal.Name == plr.Name then
                        return teamName
                    end
                end
            end
        end
    end
    local TeamsService = game:GetService("Teams")
    for _, teamName in ipairs({"Home", "Away"}) do
        local t = TeamsService:FindFirstChild(teamName)
        if t and plr.Team == t then
            return teamName
        end
    end
    local team = plr.Team
    if team and (team.Name == "Home" or team.Name == "Away") then
        return team.Name
    end
    return "Visitor"
end

local teamCache = {}
local lastTeamCacheTime = 0
local function cachedFindPlrTeam(plr)
    local now = tick()
    if now - lastTeamCacheTime > 1.0 then
        table.clear(teamCache)
        lastTeamCacheTime = now
    end
    if teamCache[plr] then return teamCache[plr] end
    local team = findPlrTeam(plr)
    teamCache[plr] = team
    return team
end

local function fetchMyTeam()
    return cachedFindPlrTeam(LocalPlayer)
end

local function isTeamMember(plr)
    if not plr or plr == LocalPlayer then return true end
    local myTeam = fetchMyTeam()
    local theirTeam = cachedFindPlrTeam(plr)
    if myTeam == "Visitor" or theirTeam == "Visitor" then return false end
    return myTeam == theirTeam
end

local function isOpponent(plr)
    if not plr or plr == LocalPlayer then return false end
    local myTeam = fetchMyTeam()
    local theirTeam = cachedFindPlrTeam(plr)
    if myTeam ~= "Visitor" and theirTeam ~= "Visitor" then
        return myTeam ~= theirTeam
    end
    local d = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"))
    if d then
        local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        if dist < 65 then return true end
    end
    return false
end

local function fetchMyHoop()
    local team = fetchMyTeam()
    if team == "Home" then
        return HOOP_HOME_POS
    elseif team == "Away" then
        return HOOP_AWAY_POS
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        local cam = workspace.CurrentCamera
        local camLook = cam and cam.CFrame.LookVector or root.CFrame.LookVector
        local toAway = (HOOP_AWAY_POS - root.Position).Unit
        local toHome = (HOOP_HOME_POS - root.Position).Unit
        return (camLook:Dot(toHome) > camLook:Dot(toAway)) and HOOP_HOME_POS or HOOP_AWAY_POS
    end
    return HOOP_HOME_POS
end

local function fetchDefenseHoop()
    local team = fetchMyTeam()
    if team == "Home" then
        return HOOP_AWAY_POS
    elseif team == "Away" then
        return HOOP_HOME_POS
    end
    local target = fetchMyHoop()
    return target == HOOP_HOME_POS and HOOP_AWAY_POS or HOOP_HOME_POS
end

local function iHaveBall()
    if BallCtrl and BallCtrl.LocalPlayerPossessesBall then
        local ok, possesses = pcall(function() return BallCtrl:LocalPlayerPossessesBall() end)
        if ok and possesses ~= nil then return possesses end
    end
    local char = LocalPlayer.Character
    if not char then return false end
    local plrBall = char:FindFirstChild("PlrBall")
    if plrBall and plrBall:IsA("BasePart") and plrBall.Transparency < 0.9 then
        return true
    end
    return (char:FindFirstChild("Basketball") ~= nil or char:FindFirstChildOfClass("Tool") ~= nil)
end

local lastCarrierCheckTime = 0
local cachedCarrierPlr, cachedCarrierChar = nil, nil

local function getBallCarrier()
    local now = tick()
    if (now - lastCarrierCheckTime) < 0.04 then
        return cachedCarrierPlr, cachedCarrierChar
    end
    lastCarrierCheckTime = now

    local foundPlr, foundChar = nil, nil
    if BallCtrl and BallCtrl.GetPlayerPossessingBall then
        local ok, plrVal = pcall(function() return BallCtrl:GetPlayerPossessingBall() end)
        if ok and plrVal then
            if typeof(plrVal) == "Instance" then
                if plrVal:IsA("Player") and plrVal.Character then
                    foundPlr, foundChar = plrVal, plrVal.Character
                elseif plrVal:IsA("Model") then
                    local p = Players:GetPlayerFromCharacter(plrVal)
                    foundPlr, foundChar = p or plrVal, plrVal
                end
            elseif type(plrVal) == "string" and plrVal ~= "" then
                local plr = Players:FindFirstChild(plrVal)
                local char = plr and plr.Character or Workspace:FindFirstChild(plrVal)
                if char then
                    foundPlr, foundChar = plr or char, char
                end
            end
        end
    end
    if not foundChar then
        for _, plr in ipairs(Players:GetPlayers()) do
            local char = plr.Character
            if char then
                local pb = char:FindFirstChild("PlrBall")
                if (pb and pb:IsA("BasePart") and pb.Transparency < 0.9) or char:FindFirstChild("Basketball") or char:FindFirstChildOfClass("Tool") then
                    foundPlr, foundChar = plr, char
                    break
                end
            end
        end
    end
    cachedCarrierPlr, cachedCarrierChar = foundPlr, foundChar
    return foundPlr, foundChar
end

local function isBallHeld(ball)
    if ball.Transparency >= 0.9 then return false end
    local parent = ball.Parent
    if parent and parent:IsA("Model") and Players:GetPlayerFromCharacter(parent) then
        return true
    end
    local root = ball.AssemblyRootPart
    if root and root.Parent and root.Parent:IsA("Model") and Players:GetPlayerFromCharacter(root.Parent) then
        return true
    end
    return false
end

local cachedAirborneBalls = {}
local seenBalls = {}
local function getInPlayBalls(currentHaveBallValue)
    table.clear(cachedAirborneBalls)
    table.clear(seenBalls)
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

    local function checkAndAdd(b)
        if b and b:IsA("BasePart") and not seenBalls[b] and not b.Anchored and not isBallHeld(b) then
            seenBalls[b] = true
            local vel = b.AssemblyLinearVelocity or Vector3.zero
            if vel.Magnitude > 0.5 then
                if not (myRoot and currentHaveBallValue and (b.Position - myRoot.Position).Magnitude < 2.5) then
                    table.insert(cachedAirborneBalls, b)
                end
            end
        end
    end

    checkAndAdd(Workspace:FindFirstChild("Basketball"))
    checkAndAdd(Workspace:FindFirstChild("Ball"))
    checkAndAdd(Workspace:FindFirstChild("PlrBall"))

    local ballsFolder = Workspace:FindFirstChild("Balls") or Workspace:FindFirstChild("FastBalls")
    if ballsFolder then
        for _, b in ipairs(ballsFolder:GetChildren()) do
            checkAndAdd(b)
        end
    end

    return cachedAirborneBalls
end

local function findBallPos()
    if BallCtrl and BallCtrl.GetServerBallPosition then
        local ok, pos = pcall(function() return BallCtrl:GetServerBallPosition() end)
        if ok and typeof(pos) == "Vector3" and pos.Magnitude > 1.0 then return pos end
    end
    local _, carrierC = getBallCarrier()
    if carrierC then
        local root = carrierC:FindFirstChild("HumanoidRootPart")
        if root then return root.Position end
    end
    local activeBall = Workspace:FindFirstChild("Basketball")
    if activeBall and activeBall:IsA("BasePart") then return activeBall.Position end
    return nil
end

local function findNearestDefender(myPos)
    local closestPlr, closestDist = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if isOpponent(plr) and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local d = (myPos - root.Position).Magnitude
                if d < closestDist then
                    closestDist = d
                    closestPlr = plr
                end
            end
        end
    end
    return closestPlr, closestDist
end

local offBallTarget = nil
local lastOffBallSwitch = 0

local function findOffBallSpot(carrierRoot)
    local now = tick()
    if offBallTarget and (now - lastOffBallSwitch < 3.0) then
        return offBallTarget
    end

    local hoop = fetchMyHoop()
    local center = COURT_CENTER
    local isHome = (fetchMyTeam() == "Home")
    local sign = isHome and -1 or 1

    local spots = {
        hoop + Vector3.new(sign * 28, 0, 32),
        hoop + Vector3.new(sign * 28, 0, -32),
        hoop + Vector3.new(sign * 42, 0, 0),
        center + Vector3.new(sign * 20, 0, 25),
        center + Vector3.new(sign * 20, 0, -25),
        hoop + Vector3.new(sign * 18, 0, 18),
        hoop + Vector3.new(sign * 18, 0, -18),
    }

    if carrierRoot then
        local cPos = carrierRoot.Position
        local candidates = {}
        for _, spot in ipairs(spots) do
            local dToCarrier = (spot - cPos).Magnitude
            local _, defDist = findNearestDefender(spot)
            if dToCarrier >= 18 and dToCarrier <= 60 then
                local score = defDist - (math.abs(dToCarrier - 32) * 0.4)
                table.insert(candidates, {pos = spot, score = score})
            end
        end
        table.sort(candidates, function(a, b) return a.score > b.score end)
        if #candidates > 0 then
            offBallTarget = candidates[1].pos
        else
            offBallTarget = spots[1]
        end
        lastOffBallSwitch = now
    end

    return offBallTarget
end

local function getScore()
    local homeScore, awayScore = 0, 0
    pcall(function()
        for _, plr in ipairs(Players:GetPlayers()) do
            local matchF = plr:FindFirstChild("InMatch")
            if matchF then
                local pts = matchF:FindFirstChild("Points")
                if pts and typeof(pts.Value) == "number" then
                    local t = findPlrTeam(plr)
                    if t == "Home" then homeScore = homeScore + pts.Value
                    elseif t == "Away" then awayScore = awayScore + pts.Value end
                end
            end
        end
    end)
    return homeScore, awayScore
end

local function getTimerText()
    local txt = "--:--"
    pcall(function()
        local gui = LocalPlayer:FindFirstChild("PlayerGui")
        if gui then
            for _, d in ipairs(gui:GetDescendants()) do
                if d:IsA("TextLabel") and d.Text:match("^%d+:%d%d$") then
                    txt = d.Text
                    break
                end
            end
        end
    end)
    return txt
end

createCategoryHeader(tabs.Home, "Game Info")
local statusCard = createCardGroup(tabs.Home)
local scoreRow = createInfoRow(statusCard, "Score", "0 -- 0", false)
local timerRow = createInfoRow(statusCard, "Clock", "--:--", false)
local stateRow = createInfoRow(statusCard, "Game State", fetchMatchState(), false)
local teamRow = createInfoRow(statusCard, "Team", fetchMyTeam(), false)
local styleRow = createInfoRow(statusCard, "Style", "--", false)
local zoneRow = createInfoRow(statusCard, "Zone", "--", false)

createCategoryHeader(tabs.Home, "Current Status")
local runCard = createCardGroup(tabs.Home)
local runStatusRow = createInfoRow(runCard, "Action", "Idle", false)

createCategoryHeader(tabs.Home, "Quick Toggles")
local qkCard = createCardGroup(tabs.Home)
ctrls.SmartPlay_Quick = createToggleRow(qkCard, "Auto Play", "Plays match, scores, and defends automatically", Config.SmartPlay, function(v)
    Config.SmartPlay = v
    Config.AutoFarm = v
    if ctrls.SmartPlay and ctrls.SmartPlay.SetState then ctrls.SmartPlay.SetState(v) end
end, true)
ctrls.BallCorrection_Quick = createToggleRow(qkCard, "Ball Magnet", "Pulls shot directly into the hoop", Config.BallCorrection, function(v)
    Config.BallCorrection = v
    if ctrls.BallCorrection and ctrls.BallCorrection.SetState then ctrls.BallCorrection.SetState(v) end
end, true)
ctrls.AutoSteal_Quick = createToggleRow(qkCard, "Auto Steal", "Steals from ball carrier when in range", Config.AutoSteal, function(v)
    Config.AutoSteal = v
    if ctrls.AutoSteal and ctrls.AutoSteal.SetState then ctrls.AutoSteal.SetState(v) end
end, true)
ctrls.AutoBlock_Quick = createToggleRow(qkCard, "Auto Block", "Jumps to block opponent shots", Config.AutoBlock, function(v)
    Config.AutoBlock = v
    if ctrls.AutoBlock and ctrls.AutoBlock.SetState then ctrls.AutoBlock.SetState(v) end
end, true)

createCategoryHeader(tabs.Home, "Hotkeys")
local hotkeyCard = createCardGroup(tabs.Home)

createCategoryHeader(tabs.Home, "Server")
local sessionCard = createCardGroup(tabs.Home)
createButtonRow(sessionCard, "Rejoin Server", "REJOIN", "Rejoin the current server", function()
    pcall(function()
        local ts = game:GetService("TeleportService")
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end, true)
createButtonRow(sessionCard, "Server Hop", "HOP", "Find and join a different server", function()
    local ok, res = pcall(function() return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games?universeIds=" .. game.GameId)) end)
    local rootPlaceId = (ok and res and res.data and res.data[1]) and res.data[1].rootPlaceId or game.PlaceId

    local ok2, servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. rootPlaceId .. "/servers/Public?sortOrder=Asc&limit=25"))
    end)
    if ok2 and servers and servers.data then
        for _, s in ipairs(servers.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                pcall(function() TeleportService:TeleportToPlaceInstance(rootPlaceId, s.id, LocalPlayer) end)
                break
            end
        end
    end
end, true)

createButtonRow(sessionCard, "Join ReefHub Discord", "DISCORD", "Copy ReefHub Discord invite", function()
    if typeof(setclipboard) == "function" then
        setclipboard("https://discord.gg/BeXJBSE9Fn")
    elseif typeof(toclipboard) == "function" then
        toclipboard("https://discord.gg/BeXJBSE9Fn")
    elseif syn and typeof(syn.set_clipboard) == "function" then
        syn.set_clipboard("https://discord.gg/BeXJBSE9Fn")
    end
    SendNotification("ReefHub", "Discord invite copied!", 2)
end, true)

createButtonRow(sessionCard, "Unload Script", "UNLOAD", "Close UI and stop all script loops", UnloadScript, true)

createCategoryHeader(tabs.Shooting, "Ball Magnet")
local shootCard = createCardGroup(tabs.Shooting)
ctrls.BallCorrection = createToggleRow(shootCard, "Ball Magnet", "Pulls shot directly into the hoop", Config.BallCorrection, function(v) Config.BallCorrection = v; AutoSaveConfig() end, true)
ctrls.CorrectionRange = createSliderRow(shootCard, "Magnet Range", "Distance threshold for magnet pull", 8, 200, Config.CorrectionRange, false, " studs", function(v) Config.CorrectionRange = v end, true)
ctrls.CorrectionForce = createSliderRow(shootCard, "Magnet Speed", "Speed the ball pulls into the hoop", 20, 100, Config.CorrectionForce, false, "", function(v) Config.CorrectionForce = v end, true)
ctrls.VisualRangeRing = createToggleRow(shootCard, "Range Circle", "Shows magnet range disc on court floor", Config.VisualRangeRing, function(v) Config.VisualRangeRing = v end, true)
ctrls.VisualTracers = createToggleRow(shootCard, "Ball Trail", "Adds glowing purple trail behind the ball", Config.VisualTracers, function(v) Config.VisualTracers = v end, true)

createCategoryHeader(tabs.Shooting, "Aim Assist & Flight")
local aimCard = createCardGroup(tabs.Shooting)
ctrls.AimAssist = createToggleRow(aimCard, "Aim Assist", "Smoothly aims camera at the hoop", Config.AimAssist, function(v) Config.AimAssist = v end, true)
ctrls.AimSmoothness = createSliderRow(aimCard, "Aim Smoothness", "Camera smoothing speed (0 = instant)", 0, 1, Config.AimSmoothness, true, "", function(v) Config.AimSmoothness = v end, true)
ctrls.BallFlight = createToggleRow(aimCard, "Ball Flight", "Fly and steer ball mid-air using WASD", Config.BallFlight, function(v) Config.BallFlight = v end, true)
ctrls.FlightForce = createSliderRow(aimCard, "Flight Speed", "Ball flight movement responsiveness", 5, 50, Config.FlightForce, false, "", function(v) Config.FlightForce = v end, true)

createCategoryHeader(tabs.Movement, "Dribbling & Spacing")
local dribbleCard = createCardGroup(tabs.Movement)
ctrls.AutoDribble = createToggleRow(dribbleCard, "Auto Dribble", "Auto dribbles on cooldown while holding ball", Config.AutoDribble, function(v) Config.AutoDribble = v end, true)
ctrls.DribbleInterval = createSliderRow(dribbleCard, "Dribble Delay", "Delay between dribbles", 0.1, 2.0, Config.DribbleInterval, true, "s", function(v) Config.DribbleInterval = v end, true)
ctrls.SmartMove = createToggleRow(dribbleCard, "Auto Spacing", "Moves to open court space for clear shot", Config.SmartMove, function(v) Config.SmartMove = v end, true)
ctrls.SmartMoveRange = createSliderRow(dribbleCard, "Spacing Range", "Max distance to move for open space", 10, 100, Config.SmartMoveRange, false, " studs", function(v) Config.SmartMoveRange = v end, true)

createCategoryHeader(tabs.Movement, "Dash & Teleports")
local dashCard = createCardGroup(tabs.Movement)
ctrls.FourDash = createToggleRow(dashCard, "Directional Dash", "Dash in any direction with I/J/K/L keys", Config.FourDash, function(v) Config.FourDash = v end, true)
ctrls.DashDist = createSliderRow(dashCard, "Dash Distance", "Distance covered per dash", 5, 35, Config.DashDist, false, " studs", function(v) Config.DashDist = v end, true)
createButtonRow(dashCard, "TP Home", "TELEPORT", "Teleport to home side center", function()
    local char = LocalPlayer.Character; local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then root.CFrame = CFrame.new(HOME_HALF_CENTER) end
end, true)
createButtonRow(dashCard, "TP Away", "TELEPORT", "Teleport to away side center", function()
    local char = LocalPlayer.Character; local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then root.CFrame = CFrame.new(AWAY_HALF_CENTER) end
end, true)
createButtonRow(dashCard, "TP Ball", "TELEPORT", "Teleport directly to the ball", function()
    local ballPos = findBallPos()
    local char = LocalPlayer.Character; local root = char and char:FindFirstChild("HumanoidRootPart")
    if root and ballPos then
        root.CFrame = CFrame.new(ballPos + Vector3.new(0, 2, 0))
    end
end, true)

createCategoryHeader(tabs.Movement, "Speed & Jump")
local charCard = createCardGroup(tabs.Movement)
ctrls.SpeedEnabled = createToggleRow(charCard, "Speed Boost", "Increases run and sprint speed", Config.SpeedEnabled, function(v)
    Config.SpeedEnabled = v
    if not v then
        local char = LocalPlayer.Character; local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then SetSafeWalkSpeed(hum, 16) end
    end
end, true)
ctrls.SpeedValue = createSliderRow(charCard, "Walk Speed", "Player movement speed", 16, 60, Config.SpeedValue, false, "", function(v) Config.SpeedValue = v end, true)
ctrls.JumpEnabled = createToggleRow(charCard, "Jump Boost", "Increases jump height power", Config.JumpEnabled, function(v)
    Config.JumpEnabled = v
end, true)
ctrls.JumpValue = createSliderRow(charCard, "Jump Power", "Jump impulse boost power", 50, 110, Config.JumpValue, false, "", function(v) Config.JumpValue = v end, true)
ctrls.Noclip = createToggleRow(charCard, "Noclip", "Walk through walls and court barriers", Config.Noclip, function(v) Config.Noclip = v end, true)
ctrls.AntiAFK = createToggleRow(charCard, "Anti-AFK", "Prevents 20 minute idle kick", Config.AntiAFK, function(v) Config.AntiAFK = v end, true)

createCategoryHeader(tabs.Defense, "Steals & Blocks")
local defCard = createCardGroup(tabs.Defense)
ctrls.AutoSteal = createToggleRow(defCard, "Auto Steal", "Steals from ball carrier when in range", Config.AutoSteal, function(v) Config.AutoSteal = v end, true)
ctrls.StealRange = createSliderRow(defCard, "Steal Range", "Max distance to steal ball", 5, 30, Config.StealRange, false, " studs", function(v) Config.StealRange = v end, true)
ctrls.StealInterval = createSliderRow(defCard, "Steal Delay", "Cooldown between steal attempts", 0.2, 3.0, Config.StealInterval, true, "s", function(v) Config.StealInterval = v end, true)
ctrls.AutoBlock = createToggleRow(defCard, "Auto Block", "Auto jumps to block opponent shots", Config.AutoBlock, function(v) Config.AutoBlock = v end, true)
ctrls.BlockRange = createSliderRow(defCard, "Block Range", "Max distance to contest shots", 10, 45, Config.BlockRange, false, " studs", function(v) Config.BlockRange = v end, true)

createCategoryHeader(tabs.Defense, "Auto Defense")
local defPosCard = createCardGroup(tabs.Defense)
ctrls.AutoDefense = createToggleRow(defPosCard, "Auto Defense", "Sticks to ball carrier and guards basket", Config.AutoDefense, function(v) Config.AutoDefense = v end, true)
ctrls.DefenseDist = createSliderRow(defPosCard, "Defense Distance", "Distance to stay in front of carrier", 3, 15, Config.DefenseDist, false, " studs", function(v) Config.DefenseDist = v end, true)

createCategoryHeader(tabs.AutoPlay, "Auto Play")
local autoCard = createCardGroup(tabs.AutoPlay)
ctrls.SmartPlay = createToggleRow(autoCard, "Auto Play", "Plays match, scores, and defends automatically", Config.SmartPlay, function(v)
    Config.SmartPlay = v
    Config.AutoFarm = v
    if ctrls.SmartPlay_Quick and ctrls.SmartPlay_Quick.SetState then ctrls.SmartPlay_Quick.SetState(v) end
end, true)
ctrls.AutoQueue = createToggleRow(autoCard, "Auto Queue", "Auto walks onto match pads in lobby", Config.AutoQueue, function(v) Config.AutoQueue = v end, true)
ctrls.AutoTipOff = createToggleRow(autoCard, "Auto Tip-Off", "Auto jumps and wins center tip-off", Config.AutoTipOff, function(v) Config.AutoTipOff = v end, true)
ctrls.AutoRebound = createToggleRow(autoCard, "Auto Rebound", "Auto chases down loose rebounds", Config.AutoRebound, function(v) Config.AutoRebound = v end, true)
ctrls.PlayStyle = createDropdownRow(autoCard, "Play Style", "Choose aggressive or conservative style", {"Aggressive", "Conservative"}, Config.PlayStyle, function(v) Config.PlayStyle = v end, true)

createCategoryHeader(tabs.Profiles, "Saved Configs")
local profSaveCard = createCardGroup(tabs.Profiles)
local profileNameInput = createTextInputRow(profSaveCard, "Config Name", "Name to save your config under", "default", nil, false)
local profileDropdown
profileDropdown = createDropdownRow(profSaveCard, "Saved Configs", "Select a saved config to load", ListProfiles(), "default", function(selected)
    if profileNameInput and profileNameInput.SetText then profileNameInput.SetText(selected) end
end, false)

createButtonRow(profSaveCard, "Save Config", "SAVE", "Save current settings to config file", function()
    local name = profileNameInput.GetText()
    if name and name ~= "" then
        if SaveProfile(name) then
            SendNotification("Profile Saved", "Saved to " .. name, 2)
            profileDropdown.UpdateOptions(ListProfiles())
            profileDropdown.SetSelected(name)
        end
    end
end, true)

createButtonRow(profSaveCard, "Load Config", "LOAD", "Load selected config settings", function()
    local name = profileNameInput.GetText()
    if name and name ~= "" then
        if LoadProfile(name) then
            SendNotification("Profile Loaded", "Applied " .. name, 2)
            for k, c in pairs(ctrls) do
                if Config[k] ~= nil then
                    if c.SetState then c.SetState(Config[k])
                    elseif c.SetValue then c.SetValue(Config[k])
                    elseif c.SetSelected then c.SetSelected(Config[k]) end
                end
            end
        end
    end
end, true)

createButtonRow(profSaveCard, "Delete Config", "DELETE", "Delete selected config file", function()
    local name = profileNameInput.GetText()
    if name and name ~= "" and name ~= "default" then
        DeleteProfile(name)
        SendNotification("Profile Removed", "Deleted " .. name, 2)
        local remaining = ListProfiles()
        profileDropdown.UpdateOptions(remaining)
        profileDropdown.SetSelected(remaining[1] or "default")
    end
end, true)

createCategoryHeader(tabs.Profiles, "Settings & Keybinds")
local profOptCard = createCardGroup(tabs.Profiles)
ctrls.AutoSave = createToggleRow(profOptCard, "Auto Save", "Auto saves changes to config", Config.AutoSave, function(v) Config.AutoSave = v end, true)
ctrls.AutoSaveInterval = createSliderRow(profOptCard, "Save Delay", "Delay between auto saves", 15, 120, Config.AutoSaveInterval, false, "s", function(v) Config.AutoSaveInterval = v end, true)
ctrls.AutoLoadProfile = createToggleRow(profOptCard, "Auto Load", "Auto loads default config on start", Config.AutoLoadProfile, function(v) Config.AutoLoadProfile = v end, true)
ctrls.Notifications = createToggleRow(profOptCard, "Notifications", "Show notification popups", Config.Notifications, function(v) Config.Notifications = v end, true)
ctrls.HUDVisible = createToggleRow(profOptCard, "Overlay HUD", "Show the on-screen live stats overlay", Config.HUDVisible, function(v) Config.HUDVisible = v; local hud = screenGui:FindFirstChild("HUDOverlay"); if hud then hud.Visible = v end end, true)

local function createKeybindRow(parent, title, desc, bindKey, onRebind, tag)
    local row = createBaseRow(parent, title, desc, tag)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0, 110, 0, 24); btn.Position = UDim2.new(1, -110, 0.5, -12); btn.BackgroundColor3 = Colors.ControlBg; btn.Font = Enum.Font.GothamBold; btn.Text = bindKey.Name; btn.TextColor3 = Colors.PurplePrimary; btn.TextSize = 11; btn.BorderSizePixel = 0; btn.Parent = row
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    local listening = false
    btn.MouseButton1Click:Connect(function()
        if listening then return end
        listening = true; btn.Text = "..."; btn.TextColor3 = Colors.AccentYellow
        local conn
        conn = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                conn:Disconnect()
                bindKey = input.KeyCode; btn.Text = input.KeyCode.Name; btn.TextColor3 = Colors.PurplePrimary; listening = false
                AutoSaveConfig()
                if type(onRebind) == "function" then onRebind(input.KeyCode) end
            end
        end)
    end)
    return {frame = row, SetKey = function(k) bindKey = k; btn.Text = k.Name end}
end

ctrls.UIKeybind = createKeybindRow(profOptCard, "Menu Keybind", "Key to open/close menu", Config.UIKeybind, function(k) Config.UIKeybind = k end, true)
ctrls.StopKeybind = createKeybindRow(profOptCard, "Unload Keybind", "Key to unload script", Config.StopKeybind, function(k) Config.StopKeybind = k end, true)

local hotkeyLabels = {}
local function addHotkeyLabel(key, configKey, labelText)
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1, 0, 0, 14); lbl.BackgroundTransparency = 1; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 9; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 999; lbl.Parent = hotkeyCard
    lbl.Text = key .. "  " .. labelText .. ": OFF"; lbl.TextColor3 = Colors.TextMuted
    hotkeyLabels[configKey] = {label = lbl, key = key, name = labelText}
end

addHotkeyLabel("[F1]", "BallCorrection", "Ball Magnet")
addHotkeyLabel("[F2]", "SmartPlay", "Auto Play")
addHotkeyLabel("[F3]", "AutoSteal", "Auto Steal")
addHotkeyLabel("[F4]", "AutoBlock", "Auto Block")
addHotkeyLabel("[F5]", "AimAssist", "Aim Assist")
addHotkeyLabel("[F6]", "AutoDefense", "Auto Defense")

local hudFrame = Instance.new("Frame")
hudFrame.Name = "HUDOverlay"
hudFrame.Size = UDim2.new(0, 180, 0, 194)
hudFrame.Visible = Config.HUDVisible
hudFrame.Position = UDim2.new(0, 20, 0, 20)
hudFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
hudFrame.BackgroundTransparency = 0.05
hudFrame.BorderSizePixel = 0
local hudCorner = Instance.new("UICorner"); hudCorner.CornerRadius = UDim.new(0, 6); hudCorner.Parent = hudFrame
local hudStroke = Instance.new("UIStroke"); hudStroke.Color = Colors.BorderPurple; hudStroke.Thickness = 1; hudStroke.Parent = hudFrame
hudFrame.Parent = screenGui

local hudTitle = Instance.new("TextLabel"); hudTitle.Size = UDim2.new(1, 0, 0, 24); hudTitle.BackgroundTransparency = 1; hudTitle.Font = Enum.Font.GothamBold; hudTitle.Text = "REEFHUB • BB:ZERO"; hudTitle.TextColor3 = Colors.PurplePrimary; hudTitle.TextSize = 12; hudTitle.Parent = hudFrame
local hudScore = Instance.new("TextLabel"); hudScore.Size = UDim2.new(1, -16, 0, 16); hudScore.Position = UDim2.new(0, 8, 0, 24); hudScore.BackgroundTransparency = 1; hudScore.Font = Enum.Font.Gotham; hudScore.Text = "Score: 0 -- 0"; hudScore.TextColor3 = Colors.TextWhite; hudScore.TextSize = 11; hudScore.TextXAlignment = Enum.TextXAlignment.Left; hudScore.Parent = hudFrame
local hudClock = Instance.new("TextLabel"); hudClock.Size = UDim2.new(1, -16, 0, 16); hudClock.Position = UDim2.new(0, 8, 0, 40); hudClock.BackgroundTransparency = 1; hudClock.Font = Enum.Font.Gotham; hudClock.Text = "Clock: --:--"; hudClock.TextColor3 = Colors.TextWhite; hudClock.TextSize = 11; hudClock.TextXAlignment = Enum.TextXAlignment.Left; hudClock.Parent = hudFrame
local hudState = Instance.new("TextLabel"); hudState.Size = UDim2.new(1, -16, 0, 16); hudState.Position = UDim2.new(0, 8, 0, 56); hudState.BackgroundTransparency = 1; hudState.Font = Enum.Font.Gotham; hudState.Text = "State: Lobby"; hudState.TextColor3 = Colors.TextMuted; hudState.TextSize = 11; hudState.TextXAlignment = Enum.TextXAlignment.Left; hudState.Parent = hudFrame

local hudDiv = Instance.new("Frame"); hudDiv.Size = UDim2.new(1, -16, 0, 1); hudDiv.Position = UDim2.new(0, 8, 0, 76); hudDiv.BackgroundColor3 = Colors.Divider; hudDiv.BorderSizePixel = 0; hudDiv.Parent = hudFrame

local hudHotkeys = Instance.new("Frame"); hudHotkeys.Size = UDim2.new(1, -16, 1, -90); hudHotkeys.Position = UDim2.new(0, 8, 0, 82); hudHotkeys.BackgroundTransparency = 1; hudHotkeys.Parent = hudFrame
local hudLayout = Instance.new("UIListLayout"); hudLayout.SortOrder = Enum.SortOrder.LayoutOrder; hudLayout.Padding = UDim.new(0, 4); hudLayout.Parent = hudHotkeys

do
    local dragToggle, dragStart, startPos = false, nil, nil
    hudFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true; dragStart = input.Position; startPos = hudFrame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragToggle = false end end)
        end
    end)
    table.insert(activeConnections, game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragToggle then
            local delta = input.Position - dragStart
            hudFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end))
end

local function updateHudHotkeys()
    for _, child in ipairs(hudHotkeys:GetChildren()) do
        if child:IsA("TextLabel") then child:Destroy() end
    end
    for configKey, data in pairs(hotkeyLabels) do
        local on = Config[configKey]
        local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1, 0, 0, 12); lbl.BackgroundTransparency = 1; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 10; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = hudHotkeys
        lbl.Text = data.key .. " " .. data.name
        lbl.TextColor3 = on and Colors.AccentGreen or Colors.TextMuted
    end
end

local function updateHotkeyCard()
    for configKey, data in pairs(hotkeyLabels) do
        local on = Config[configKey]
        if on then
            data.label.Text = data.key .. "  " .. data.name .. ": ON"
            data.label.TextColor3 = Colors.AccentGreen
        else
            data.label.Text = data.key .. "  " .. data.name .. ": OFF"
            data.label.TextColor3 = Colors.TextMuted
        end
    end
    updateHudHotkeys()
end

local function syncAllControls()
    for k, c in pairs(ctrls) do
        if Config[k] ~= nil then
            if c.SetState then c.SetState(Config[k])
            elseif c.SetValue then c.SetValue(Config[k])
            elseif c.SetSelected then c.SetSelected(Config[k]) end
        end
    end
    updateHotkeyCard()
end

if Config.AutoLoadProfile then
    pcall(function()
        if LoadProfile(Config.AutoLoadName or "default") then
            syncAllControls()
        end
    end)
end

switchTab("Home")

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchBox.Text:lower():gsub("^%s*(.-)%s*$", "%1")
    for _, item in ipairs(rowSearchIndex) do
        item.frame.Visible = (q == "" or item.query:find(q, 1, true) ~= nil)
    end
end)

local isMinimized = false
minBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    bodyFrame.Visible = not isMinimized
    footerBar.Visible = not isMinimized
    mainFrame.Size = isMinimized and UDim2.new(0, 700, 0, 38) or UDim2.new(0, 700, 0, 480)
    minBtn.Text = isMinimized and "[+]" or "[-]"
end)

closeBtn.MouseButton1Click:Connect(UnloadScript)

local uiVisible = true
ToggleUiVisibility = function()
    uiVisible = not uiVisible
    mainFrame.Visible = uiVisible
    floatingCrescent.Visible = not uiVisible
end

local recentJumpBoostTick = 0
local recentDribbleTick = 0
local recentStealTick = 0
local recentBlockTick = 0
local recentQueueSearchTick = 0
local prevHeldState = false
local completedShots = {}
local lastStatusMessage = ""

local function SetStatus(text)
    if runStatusRow and text ~= lastStatusMessage then
        lastStatusMessage = text
        runStatusRow.SetValue(text)
    end
end

local myActiveShotBall = nil
local myActiveShotHoop = nil
local myActiveShotTime = 0

local function tagMyShot()
    myActiveShotTime = tick()
    myActiveShotBall = nil
    myActiveShotHoop = nil
    table.clear(completedShots)
end

table.insert(activeConnections, UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.KeyCode == Enum.KeyCode.E or input.KeyCode == Enum.KeyCode.Space) then
        tagMyShot()
    end
end))

local function isLocalPlayerShot(ball)
    if not ball or not ball.Parent then
        if myActiveShotBall == ball then
            myActiveShotBall = nil
            myActiveShotHoop = nil
        end
        return false
    end
    if isBallHeld(ball) then
        if myActiveShotBall == ball then
            myActiveShotBall = nil
            myActiveShotHoop = nil
        end
        completedShots[ball] = nil
        return false
    end
    if completedShots[ball] then
        return false
    end

    if myActiveShotBall == ball then
        return true
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    local now = tick()
    local distToMe = (ball.Position - root.Position).Magnitude

    local shotRecently = (now - myActiveShotTime < 3.5)
        or (now - (shared.LastHeldTime or 0) < 3.5)
        or (BallCtrl and BallCtrl.ShootStarted and (now - BallCtrl.ShootStarted < 3.5))

    if distToMe < 30 and shotRecently then
        myActiveShotBall = ball
        myActiveShotHoop = fetchMyHoop()
        return true
    end

    return false
end

local function setupTrajectoryHook()
    pcall(function()
        local trajModule = RS:FindFirstChild("Shared")
            and RS.Shared:FindFirstChild("Functions")
            and RS.Shared.Functions:FindFirstChild("CalculateBallTrajectory")
        if trajModule then
            local nativeTraj = require(trajModule)
            if type(nativeTraj) == "function" and hookfunction then
                local oldTraj; oldTraj = hookfunction(nativeTraj, function(p1, p2, p3, p4)
                    if Config.BallCorrection then
                        local targetHoop = myActiveShotHoop or fetchMyHoop()
                        if targetHoop and typeof(p2) == "Vector3" then
                            p2 = targetHoop
                        end
                    end
                    return oldTraj(p1, p2, p3, p4)
                end)
            end
        end
    end)
end
task.spawn(setupTrajectoryHook)

table.insert(activeConnections, RunService.RenderStepped:Connect(function(dt)
    if not isRunning then return end
    pcall(function()
        local now = tick()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end

        local isAggressive = (Config.PlayStyle == "Aggressive")
        local isShooting = (now - myActiveShotTime < 0.45)

        updateActiveCourt()

        local currentHaveBall = iHaveBall()
        if currentHaveBall then
            shared.LastHeldTime = now
        end
        if prevHeldState and not currentHaveBall then
            tagMyShot()
        end
        prevHeldState = currentHaveBall

        if not isShooting and Config.SpeedEnabled and hum and root and hum.MoveDirection.Magnitude > 0 then
            local targetSpeed = math.clamp(Config.SpeedValue or 28, 16, 100)
            SetSafeWalkSpeed(hum, targetSpeed)
            local extraSpeed = targetSpeed - 16
            if extraSpeed > 0 then
                root.CFrame = root.CFrame + (hum.MoveDirection.Unit * (extraSpeed * dt))
            end
        end

        if Config.JumpEnabled and root and hum then
            if hum.FloorMaterial == Enum.Material.Air and root.AssemblyLinearVelocity.Y > 5 then
                local jumpBoost = math.clamp(Config.JumpForce or 55, 30, 85)
                local currentVY = root.AssemblyLinearVelocity.Y
                if currentVY < jumpBoost and (now - recentJumpBoostTick > 0.5) then
                    recentJumpBoostTick = now
                    root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, jumpBoost, root.AssemblyLinearVelocity.Z)
                end
            end
        end

        if Config.Noclip and not isShooting and char then
            if noclipChar ~= char then
                noclipChar = char
                table.clear(cachedNoclipParts)
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        table.insert(cachedNoclipParts, part)
                    end
                end
            end
            for _, part in ipairs(cachedNoclipParts) do
                if part.CanCollide then
                    part.CanCollide = false
                end
            end
        end

        local bv = root:FindFirstChild("RH_BodyVelocity")
        if bv and (now - myActiveShotTime >= 0.4 or not currentHaveBall) then
            bv:Destroy()
        end

        local frameAirborneBalls = getInPlayBalls(currentHaveBall)

        if Config.BallCorrection and (myActiveShotBall or (now - myActiveShotTime < 3.5)) then
            local airborneBalls = frameAirborneBalls
            local maxDist = Config.CorrectionRange or 160

            for _, ball in ipairs(airborneBalls) do
                if completedShots[ball] then
                    local hl = ball:FindFirstChild("RH_BallGlow")
                    if hl then hl:Destroy() end
                    continue
                end

                if not isLocalPlayerShot(ball) then
                    local hl = ball:FindFirstChild("RH_BallGlow")
                    if hl then hl:Destroy() end
                    continue
                end

                local targetHoop = myActiveShotHoop or fetchMyHoop()
                if not targetHoop then continue end

                local toHoop = (targetHoop - ball.Position)
                local dist = toHoop.Magnitude

                if dist > 0.3 and dist < maxDist then
                    local flatOffset = Vector3.new(targetHoop.X - ball.Position.X, 0, targetHoop.Z - ball.Position.Z)
                    local flatDist = flatOffset.Magnitude
                    local vertDiff = ball.Position.Y - targetHoop.Y

                    if flatDist <= 2.2 and ball.Position.Y >= targetHoop.Y - 1.2 then
                        local centerVel = Vector3.new(flatOffset.X * 18, -28, flatOffset.Z * 18)
                        ball.AssemblyLinearVelocity = centerVel
                        ball.CFrame = CFrame.new(targetHoop.X + (flatOffset.X * 0.15), ball.Position.Y, targetHoop.Z + (flatOffset.Z * 0.15))

                        ball.CanCollide = false
                        local collider = ball:FindFirstChild("Collider")
                        if collider and collider:IsA("BasePart") then
                            collider.CanCollide = false
                            collider.AssemblyLinearVelocity = centerVel
                        end

                        if vertDiff <= -2.5 then
                            completedShots[ball] = true
                            myActiveShotBall = nil
                            myActiveShotHoop = nil
                            SetStatus("Scored")
                        end
                    else
                        local heightOffset = math.clamp(2.5 + (flatDist * 0.28), 2.5, 8.5)
                        local aimPoint = targetHoop + Vector3.new(0, heightOffset, 0)
                        local pullDir = (aimPoint - ball.Position).Unit

                        local speed = math.clamp(Config.CorrectionForce or 72, 55, 90)
                        local targetVel = pullDir * speed

                        ball.AssemblyLinearVelocity = targetVel
                        local collider = ball:FindFirstChild("Collider")
                        if collider and collider:IsA("BasePart") then
                            collider.AssemblyLinearVelocity = targetVel
                        end
                    end
                end
            end
        end

        if Config.VisualRangeRing then
            local targetHoop = fetchMyHoop()
            if targetHoop then
                local radius = Config.CorrectionRange or 26
                local terrain = Workspace.Terrain or Workspace:FindFirstChildOfClass("Terrain")

                if not cachedRangeRing then
                    cachedRangeRing = Instance.new("CylinderHandleAdornment")
                    cachedRangeRing.Name = "RH_CorrectionRing"
                    cachedRangeRing.Color3 = Color3.fromRGB(216, 160, 255)
                    cachedRangeRing.Transparency = 0.15
                    cachedRangeRing.Height = 0.25
                    cachedRangeRing.ZIndex = 8
                    cachedRangeRing.AlwaysOnTop = true
                    cachedRangeRing.Parent = Camera
                end
                if not cachedRangeDisc then
                    cachedRangeDisc = Instance.new("CylinderHandleAdornment")
                    cachedRangeDisc.Name = "RH_CorrectionDisc"
                    cachedRangeDisc.Color3 = Color3.fromRGB(168, 85, 247)
                    cachedRangeDisc.Transparency = 0.82
                    cachedRangeDisc.InnerRadius = 0
                    cachedRangeDisc.Height = 0.1
                    cachedRangeDisc.ZIndex = 6
                    cachedRangeDisc.AlwaysOnTop = false
                    cachedRangeDisc.Parent = Camera
                end
                if not cachedRangeSphere then
                    cachedRangeSphere = Instance.new("SphereHandleAdornment")
                    cachedRangeSphere.Name = "RH_CorrectionSphere"
                    cachedRangeSphere.Color3 = Color3.fromRGB(192, 132, 252)
                    cachedRangeSphere.Transparency = 0.88
                    cachedRangeSphere.ZIndex = 4
                    cachedRangeSphere.AlwaysOnTop = false
                    cachedRangeSphere.Parent = Camera
                end

                if lastHoopFloorPos ~= targetHoop then
                    lastHoopFloorPos = targetHoop
                    local hoopFloorCF = CFrame.new(targetHoop.X, 16.88, targetHoop.Z) * CFrame.Angles(math.rad(90), 0, 0)
                    cachedRangeRing.Adornee = terrain
                    cachedRangeRing.CFrame = hoopFloorCF
                    cachedRangeDisc.Adornee = terrain
                    cachedRangeDisc.CFrame = hoopFloorCF
                    cachedRangeSphere.Adornee = terrain
                    cachedRangeSphere.CFrame = CFrame.new(targetHoop)
                end

                cachedRangeRing.Radius = radius
                cachedRangeRing.InnerRadius = radius - 0.55
                cachedRangeRing.Visible = true
                cachedRangeDisc.Radius = radius
                cachedRangeDisc.Visible = true
                cachedRangeSphere.Radius = radius
                cachedRangeSphere.Visible = true
            else
                if cachedRangeRing then cachedRangeRing.Visible = false end
                if cachedRangeDisc then cachedRangeDisc.Visible = false end
                if cachedRangeSphere then cachedRangeSphere.Visible = false end
            end
        else
            if cachedRangeRing then cachedRangeRing.Visible = false end
            if cachedRangeDisc then cachedRangeDisc.Visible = false end
            if cachedRangeSphere then cachedRangeSphere.Visible = false end
        end

        local activeBall = Workspace:FindFirstChild("Basketball")
        if activeBall and activeBall:IsA("BasePart") then
            local trail = activeBall:FindFirstChild("RH_PurpleTrail")
            local isFreeAndMoving = (activeBall.Transparency < 0.9 and not isBallHeld(activeBall) and activeBall.AssemblyLinearVelocity.Magnitude > 1.0)

            if Config.VisualTracers and isFreeAndMoving then
                if not trail then
                    local a0 = activeBall:FindFirstChild("RH_TrailA0")
                    if not a0 then
                        a0 = Instance.new("Attachment")
                        a0.Name = "RH_TrailA0"
                        a0.Position = Vector3.new(0, 0.55, 0)
                        a0.Parent = activeBall
                    end

                    local a1 = activeBall:FindFirstChild("RH_TrailA1")
                    if not a1 then
                        a1 = Instance.new("Attachment")
                        a1.Name = "RH_TrailA1"
                        a1.Position = Vector3.new(0, -0.55, 0)
                        a1.Parent = activeBall
                    end

                    trail = Instance.new("Trail")
                    trail.Name = "RH_PurpleTrail"
                    trail.Attachment0 = a0
                    trail.Attachment1 = a1
                    trail.Color = ColorSequence.new(Color3.fromRGB(216, 160, 255), Color3.fromRGB(168, 85, 247))
                    trail.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.15),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                    trail.Lifetime = 0.5
                    trail.MinLength = 0.05
                    trail.LightEmission = 0.8
                    trail.LightInfluence = 0
                    trail.FaceCamera = true
                    trail.Parent = activeBall
                end
                trail.Enabled = true
            else
                if trail then
                    trail.Enabled = false
                end
            end
        end

        if Config.BallFlight then
            local airborneBalls = frameAirborneBalls
            for _, ball in ipairs(airborneBalls) do
                local vel = ball.AssemblyLinearVelocity or Vector3.zero
                if ball.Position.Y > 2.0 then
                    local flightSpeed = math.clamp((Config.FlightForce or 22) * 2.5, 35, 120)
                    local camCF = Camera.CFrame
                    local right = camCF.RightVector
                    local forward = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z).Unit
                    local steer = Vector3.zero

                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then steer = steer + forward end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then steer = steer - forward end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then steer = steer - right end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then steer = steer + right end

                    local upDown = 0
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then upDown = upDown + 1 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then upDown = upDown - 1 end

                    if steer.Magnitude > 0 or upDown ~= 0 then
                        local horizontalVel = steer.Magnitude > 0 and (steer.Unit * flightSpeed) or Vector3.new(vel.X, 0, vel.Z)
                        local verticalVel = upDown ~= 0 and (upDown * flightSpeed * 0.7) or (vel.Y + 0.5)
                        local newVel = Vector3.new(horizontalVel.X, verticalVel, horizontalVel.Z)

                        ball.AssemblyLinearVelocity = newVel
                        local collider = ball:FindFirstChild("Collider")
                        if collider and collider:IsA("BasePart") then
                            collider.AssemblyLinearVelocity = newVel
                        end
                        local prim = ball.PrimaryPart
                        if prim and prim:IsA("BasePart") then
                            prim.AssemblyLinearVelocity = newVel
                        end
                    end
                end
            end
        end

        if Config.AimAssist and currentHaveBall and not isShooting then
            local targetHoop = fetchMyHoop()
            if targetHoop and root then
                local toHoop = (targetHoop - root.Position)
                local flatDir = Vector3.new(toHoop.X, 0, toHoop.Z)
                if flatDir.Magnitude > 3 then
                    local targetCF = CFrame.lookAt(root.Position, Vector3.new(targetHoop.X, root.Position.Y, targetHoop.Z))
                    local smooth = math.clamp(1 - Config.AimSmoothness, 0.05, 1)
                    root.CFrame = root.CFrame:Lerp(targetCF, smooth * dt * 6)
                end
                local lookCF = CFrame.lookAt(Camera.CFrame.Position, targetHoop)
                local smooth = math.clamp(1 - Config.AimSmoothness, 0.05, 1)
                Camera.CFrame = Camera.CFrame:Lerp(lookCF, smooth * dt * 6)
            end
        end

        local matchState = fetchMatchState()
        local inMatch = (matchState == "In Match")

        if Config.AutoDribble and inMatch and currentHaveBall and not isShooting and (now - recentDribbleTick >= Config.DribbleInterval) then
            pcall(function()
                if BallCtrl and BallCtrl.Dribble then
                    BallCtrl:Dribble()
                end
            end)
            recentDribbleTick = now
        end

        if Config.SmartMove and inMatch and currentHaveBall and not isShooting and hum then
            local targetHoop = fetchMyHoop()
            if targetHoop then
                local dir = (targetHoop - root.Position)
                local flatDir = Vector3.new(dir.X, 0, dir.Z)
                if flatDir.Magnitude > 6 then
                    local moveTarget = root.Position + flatDir.Unit * math.min(flatDir.Magnitude, Config.SmartMoveRange)
                    hum:MoveTo(moveTarget)
                end
            end
        end

        local frameCarrier, frameCarrierChar = nil, nil
        if inMatch and (Config.AutoSteal or Config.AutoBlock or Config.AutoDefense or Config.SmartPlay or Config.AutoFarm) then
            frameCarrier, frameCarrierChar = getBallCarrier()
        end

        local isStealEngaged = false
        if Config.AutoSteal and not currentHaveBall and (now - recentStealTick >= (isAggressive and 0.25 or Config.StealInterval)) then
            if frameCarrier and isOpponent(frameCarrier) and frameCarrierChar then
                local cRoot = frameCarrierChar:FindFirstChild("HumanoidRootPart")
                if cRoot then
                    local dist = (root.Position - cRoot.Position).Magnitude
                    local maxReach = Config.StealRange or 16

                    if dist <= maxReach then
                        isStealEngaged = true
                        local ballPart = frameCarrierChar:FindFirstChild("PlrBall") or frameCarrierChar:FindFirstChild("Basketball") or cRoot
                        local targetPos = ballPart and ballPart.Position or cRoot.Position

                        if dist > 3.2 then
                            local interceptPoint = cRoot.Position + cRoot.CFrame.LookVector * 1.5
                            SetSafeWalkSpeed(hum, 28)
                            hum:MoveTo(interceptPoint)
                            local flatDelta = Vector3.new(targetPos.X - root.Position.X, 0, targetPos.Z - root.Position.Z)
                            if flatDelta.Magnitude > 1.2 then
                                root.CFrame = root.CFrame + (flatDelta.Unit * math.min(flatDelta.Magnitude, 26 * dt))
                            end
                        end

                        if dist <= 6.5 then
                            root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
                            pcall(function()
                                if DefCtrl and DefCtrl.Steal then DefCtrl:Steal() end
                                local Knit = require(RS.Packages.Knit)
                                local BallService = Knit and Knit.GetService and Knit.GetService("BallService")
                                if BallService and BallService.Steal then
                                    local targetCF = root.CFrame + root.CFrame.LookVector * 15
                                    BallService.Steal:Fire(targetCF)
                                end
                            end)
                            recentStealTick = now
                            SetStatus("Stealing")
                        end
                    end
                end
            end
        end

        if Config.AutoBlock and inMatch and not currentHaveBall then
            if frameCarrier and isOpponent(frameCarrier) and frameCarrierChar then
                local cRoot = frameCarrierChar:FindFirstChild("HumanoidRootPart")
                local cHum = frameCarrierChar:FindFirstChildOfClass("Humanoid")
                if cRoot and cHum then
                    local dist = (root.Position - cRoot.Position).Magnitude
                    local cVel = cRoot.AssemblyLinearVelocity or Vector3.zero
                    local isAirborneShooting = (cHum.FloorMaterial == Enum.Material.Air and cRoot.Position.Y > 3.0) or (cVel.Y > 2.2)
                    if dist <= (isAggressive and 26 or math.min(Config.BlockRange, 20)) and isAirborneShooting and (now - recentBlockTick >= (isAggressive and 0.5 or 0.75)) then
                        if hum.FloorMaterial ~= Enum.Material.Air then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                        root.CFrame = CFrame.lookAt(root.Position, cRoot.Position)
                        pcall(function()
                            if DefCtrl and DefCtrl.Block then DefCtrl:Block() end
                        end)
                        recentBlockTick = now
                    end
                end
            end
        end

        if Config.AutoDefense and not isStealEngaged and inMatch and not currentHaveBall and not isShooting and hum and root then
            if frameCarrier and isOpponent(frameCarrier) and frameCarrierChar then
                local cRoot = frameCarrierChar:FindFirstChild("HumanoidRootPart")
                if cRoot then
                    local myHoop = fetchDefenseHoop()
                    local cVel = cRoot.AssemblyLinearVelocity or Vector3.zero
                    local leadTime = isAggressive and 0.35 or 0.25
                    local predictedPos = cRoot.Position + Vector3.new(cVel.X, 0, cVel.Z) * leadTime

                    local dirToHoop = (myHoop - predictedPos)
                    local flatDir = Vector3.new(dirToHoop.X, 0, dirToHoop.Z)
                    local cushion = isAggressive and 3.5 or math.clamp(Config.DefenseDist, 3.5, 9)
                    local defensePos = predictedPos + (flatDir.Unit * cushion)

                    root.CFrame = CFrame.lookAt(root.Position, Vector3.new(cRoot.Position.X, root.Position.Y, cRoot.Position.Z))

                    local deltaPos = (defensePos - root.Position)
                    local flatDelta = Vector3.new(deltaPos.X, 0, deltaPos.Z)
                    if flatDelta.Magnitude > 0.8 then
                        local moveSpeed = math.clamp(20 + (flatDelta.Magnitude * 2.5), 18, 30)
                        SetSafeWalkSpeed(hum, moveSpeed)
                        hum:MoveTo(defensePos)
                        root.CFrame = root.CFrame + (flatDelta.Unit * math.min(flatDelta.Magnitude, moveSpeed * dt * 0.95))
                    end

                    SetStatus("Guarding")
                end
            end
        end

        if (Config.SmartPlay or Config.AutoFarm) and not isShooting then
            if matchState == "In Match" then
                if currentHaveBall then

                    local targetHoop = fetchMyHoop()
                    if targetHoop then
                        local cantShoot = false
                        if BallCtrl and BallCtrl.cantShootBallUntilOutOfThreePointLine then
                            pcall(function() cantShoot = BallCtrl:cantShootBallUntilOutOfThreePointLine() end)
                        end
                        if not cantShoot and char then
                            cantShoot = (char:GetAttribute("cantShootBallUntilOutOfThreePointLine") == true)
                        end

                        if cantShoot then
                            hum:MoveTo(COURT_CENTER)
                            if now - recentDribbleTick >= (isAggressive and 0.3 or 0.45) then
                                pcall(function()
                                    if BallCtrl and BallCtrl.Dribble then BallCtrl:Dribble() end
                                end)
                                recentDribbleTick = now
                            end
                        else
                            local dist = (root.Position - targetHoop).Magnitude
                            local closestDef, defDist = findNearestDefender(root.Position)
                            local toHoop = (targetHoop - root.Position).Unit
                            local lateral = Vector3.new(-toHoop.Z, 0, toHoop.X) * (math.sin(now * 4) > 0 and 10 or -10)
                            local moveTarget = root.Position + toHoop * math.min(dist, 24)
                            if closestDef and defDist < 8 then
                                moveTarget = moveTarget + lateral
                            end
                            hum:MoveTo(moveTarget)
                            if now - recentDribbleTick >= (isAggressive and 0.3 or 0.45) then
                                pcall(function()
                                    if BallCtrl and BallCtrl.Dribble then BallCtrl:Dribble() end
                                end)
                                recentDribbleTick = now
                            end
                        end
                    end
                else

                    local carrierIsReal = false
                    if frameCarrier and frameCarrierChar then
                        if frameCarrier == LocalPlayer then
                            carrierIsReal = currentHaveBall
                        else
                            carrierIsReal = (frameCarrierChar:FindFirstChild("PlrBall") ~= nil)
                                or (frameCarrierChar:FindFirstChild("Basketball") ~= nil)
                                or (frameCarrierChar:FindFirstChildOfClass("Tool") ~= nil)
                        end
                    end

                    if carrierIsReal and isTeamMember(frameCarrier) and frameCarrierChar then
                        local cRoot = frameCarrierChar:FindFirstChild("HumanoidRootPart")
                        local dynamicSpot = findOffBallSpot(cRoot)
                        hum:MoveTo(dynamicSpot)
                        SetStatus("Spacing")

                    elseif carrierIsReal and isOpponent(frameCarrier) and frameCarrierChar then
                        local cRoot = frameCarrierChar:FindFirstChild("HumanoidRootPart")
                        local cHum = frameCarrierChar:FindFirstChildOfClass("Humanoid")
                        if cRoot and cHum then
                            local distToCarrier = (root.Position - cRoot.Position).Magnitude
                            local isAirborneShooting = (cHum.FloorMaterial == Enum.Material.Air and cRoot.Position.Y > 3.0) or (cRoot.AssemblyLinearVelocity.Y > 2.2)

                            if isAirborneShooting and distToCarrier <= (isAggressive and 24 or 18) and (now - recentBlockTick >= (isAggressive and 0.5 or 0.75)) then
                                if hum.FloorMaterial ~= Enum.Material.Air then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                                root.CFrame = CFrame.lookAt(root.Position, cRoot.Position)
                                pcall(function()
                                    if DefCtrl and DefCtrl.Block then DefCtrl:Block() end
                                end)
                                recentBlockTick = now
                                SetStatus("Contesting")
                            else
                                local myHoop = fetchDefenseHoop()
                                local dirToHoop = (myHoop - cRoot.Position).Unit
                                local cushion = isAggressive and 3.5 or math.clamp(Config.DefenseDist, 3.5, 9)
                                local defPos = cRoot.Position + dirToHoop * cushion
                                local stealDelay = isAggressive and 0.35 or 0.55

                                local ballPart = frameCarrierChar:FindFirstChild("PlrBall") or frameCarrierChar:FindFirstChild("Basketball") or cRoot
                                local targetPos = ballPart and ballPart.Position or cRoot.Position

                                if distToCarrier > 4.5 then
                                    SetSafeWalkSpeed(hum, 28)
                                    hum:MoveTo(defPos)
                                end

                                if distToCarrier <= 4.8 and (now - recentStealTick >= stealDelay) then
                                    root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
                                    pcall(function()
                                        if DefCtrl and DefCtrl.Steal then DefCtrl:Steal() end
                                    end)
                                    recentStealTick = now
                                end
                            end
                        end
                    else

                        local ballPos = nil
                        local looseBall = Workspace:FindFirstChild("Basketball")
                        if looseBall and looseBall:IsA("BasePart") and not isBallHeld(looseBall) then
                            ballPos = looseBall.Position
                        end
                        if not ballPos then
                            local airborne = frameAirborneBalls
                            if #airborne > 0 then
                                local closestBall, closestBallDist = nil, math.huge
                                for _, b in ipairs(airborne) do
                                    local d = (root.Position - b.Position).Magnitude
                                    if d < closestBallDist then
                                        closestBallDist = d
                                        closestBall = b
                                    end
                                end
                                if closestBall then ballPos = closestBall.Position end
                            end
                        end

                        if ballPos then
                            local d = (root.Position - ballPos).Magnitude
                            if d <= 55 then
                                SetSafeWalkSpeed(hum, 28)
                                hum:MoveTo(ballPos)
                                SetStatus("Rebounding")
                            end
                        end
                    end
                end

            elseif matchState == "Lobby" and Config.AutoQueue then
                if now - recentQueueSearchTick >= 3.0 then
                    recentQueueSearchTick = now
                    local lobby = Workspace:FindFirstChild("Lobby") or Workspace
                    local closestPad, padDist = nil, math.huge
                    for _, child in ipairs(lobby:GetChildren()) do
                        if child:IsA("BasePart") and (child.Name:lower():find("queue") or child.Name:lower():find("pad") or child.Name:lower():find("court")) then
                            local d = (root.Position - child.Position).Magnitude
                            if d < padDist then
                                padDist = d
                                closestPad = child
                            end
                        end
                    end
                    if closestPad and padDist > 3 then
                        hum:MoveTo(closestPad.Position)
                        SetStatus("Queuing")
                    end
                end
            end
        end
    end)
end))

task.spawn(function()
    while isRunning do
        task.wait(0.5)
        if isRunning then
            pcall(function()
                local h, a = getScore()
                local scoreStr = tostring(h) .. " -- " .. tostring(a)
                local timeStr = getTimerText()
                local stateStr = fetchMatchState()
                scoreRow.SetValue(scoreStr)
                timerRow.SetValue(timeStr)
                stateRow.SetValue(stateStr)
                if hudScore then hudScore.Text = "Score: " .. scoreStr end
                if hudClock then hudClock.Text = "Clock: " .. timeStr end
                if hudState then hudState.Text = "State: " .. stateStr end
                teamRow.SetValue(fetchMyTeam())
                local sv = LocalPlayer:FindFirstChild("Style")
                if sv then styleRow.SetValue(tostring(sv.Value)) end
                local zv = LocalPlayer:FindFirstChild("Zone")
                if zv then zoneRow.SetValue(tostring(zv.Value)) end
                updateHotkeyCard()
            end)
        end
    end
end)

task.spawn(function()
    while isRunning do
        task.wait(Config.AutoSaveInterval or 45)
        if isRunning and Config.AutoSave and lastSavedOrLoadedProfile then
            pcall(function()
                SaveProfile(lastSavedOrLoadedProfile)
            end)
        end
    end
end)

local hotkeyMap = {
    [Enum.KeyCode.F1] = "BallCorrection",
    [Enum.KeyCode.F2] = "SmartPlay",
    [Enum.KeyCode.F3] = "AutoSteal",
    [Enum.KeyCode.F4] = "AutoBlock",
    [Enum.KeyCode.F5] = "AimAssist",
    [Enum.KeyCode.F6] = "AutoDefense",
}

table.insert(activeConnections, UserInputService.InputBegan:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Config.UIKeybind then
        ToggleUiVisibility()
        return
    end
    if input.KeyCode == Enum.KeyCode.End or input.KeyCode == Config.StopKeybind then
        UnloadScript()
        return
    end

    if gpe then return end

    local configKey = hotkeyMap[input.KeyCode]
    if configKey and Config[configKey] ~= nil then
        Config[configKey] = not Config[configKey]
        if ctrls[configKey] and ctrls[configKey].SetState then
            ctrls[configKey].SetState(Config[configKey])
        end
        local state = Config[configKey] and "ON" or "OFF"
        SendNotification("ReefHub", configKey .. ": " .. state, 1.5)
        updateHotkeyCard()
        return
    end

    if Config.FourDash then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            local dist = Config.DashDist or 14
            local camCF = Camera.CFrame
            local forward = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z).Unit
            local right = Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z).Unit

            if input.KeyCode == Enum.KeyCode.I then root.CFrame = root.CFrame + (forward * dist)
            elseif input.KeyCode == Enum.KeyCode.K then root.CFrame = root.CFrame - (forward * dist)
            elseif input.KeyCode == Enum.KeyCode.J then root.CFrame = root.CFrame - (right * dist)
            elseif input.KeyCode == Enum.KeyCode.L then root.CFrame = root.CFrame + (right * dist) end
        end
    end
end))

pcall(function()
    table.insert(activeConnections, LocalPlayer.Idled:Connect(function()
        if isRunning and Config.AntiAFK then
            pcall(function()
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end
            end)
        end
    end))
end)
