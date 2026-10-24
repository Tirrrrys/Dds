-- Cleaned and formatted from the supplied source.
-- Owner telemetry, Discord webhook reporting, and anti-cheat/kick/remote interception removed.

local function safeDestroy(obj)
    task.defer(function()
        pcall(function()
            if obj and obj.Parent then
                obj:Destroy()
            end
        end)
    end)
end
-- ZetaPro UI library (stable main branch)
local Zeta = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/realkalii/ZetaPro/main/src/init.luau"
))()

-- LEZUN / LN UI theme: dark charcoal with Ink Wash accent.
Zeta:RegisterTheme("Ink Wash", {
    Base = "Dark",
    Background = Color3.fromHex("#0A0A0A"),
    SecondaryBackground = Color3.fromHex("#171717"),
    TertiaryBackground = Color3.fromHex("#242424"),
    Text = Color3.fromHex("#EEEEEE"),
    MutedText = Color3.fromHex("#A0A0A0"),
    Accent = Color3.fromHex("#4A4A4A"),
    AccentText = Color3.fromHex("#FFFFFF"),
    Border = Color3.fromHex("#303030"),
    Hover = Color3.fromHex("#292929"),
    Pressed = Color3.fromHex("#1F1F1F"),
    AcrylicTransparency = 0.08,
})
Zeta:SetTheme("Ink Wash")
Zeta:SetFont(Enum.Font.Gotham)

-- Compatibility bridge for existing in-script notifications.
-- All visible UI controls below are native ZetaPro components.
local UIFeedback = {}
function UIFeedback:Notify(config)
    config = config or {}
    return Zeta:Notify({
        Title = tostring(config.Title or "LEZUN HUB"),
        Content = tostring(config.Content or config.Desc or ""),
        Duration = tonumber(config.Duration) or 3,
        Type = config.Type or "Info",
        Icon = config.Icon,
    })
end

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    TweenSvc = game:GetService("TweenService"),
    UserInput = game:GetService("UserInputService"),
    Stats = game:GetService("Stats"),
    Workspace = game:GetService("Workspace"),
    HttpService = game:GetService("HttpService"),
    GuiService = game:GetService("GuiService"),
    PathfindingService = game:GetService("PathfindingService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    StarterGui = game:GetService("StarterGui"),
    VirtualUser = game:GetService("VirtualUser"),
}
local LocalPlayer = Services.Players.LocalPlayer
local EngineStats = {
    FPS = 60,
    Ping = 0,
    _frames = 0x0,
    _lastTime = tick(),
}
Services.RunService.RenderStepped:Connect(function()
    EngineStats._frames = EngineStats._frames + 1
    local now = tick()
    local delta = now - EngineStats._lastTime
    if delta >= 0.5 then
        EngineStats.FPS = math.floor(EngineStats._frames / delta)
        EngineStats._frames = 0x0
        EngineStats._lastTime = now
    end
end)
task.spawn(function()
    while true do
        pcall(function()
            local serverStats = Services.Stats:FindFirstChild("ServerStatsItem")
            local pingItem = serverStats and serverStats:FindFirstChild("Data Ping")
            if pingItem then
                EngineStats.Ping = math.floor(pingItem:GetValue())
            else
                EngineStats.Ping = math.floor(Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end
        end)
        task.wait(1)
    end
end)
local IsMobile = Services.UserInput.TouchEnabled and not Services.UserInput.KeyboardEnabled and not Services.UserInput.MouseEnabled
local CharRef = {
    Character = nil,
    Humanoid = nil,
    Root = nil,
}
local RAGDOLL_STATES = {
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Ragdoll,
    Enum.HumanoidStateType.GettingUp,
}
local function setRagdollStates(enabled)
    local hum = CharRef.Humanoid
    if not hum then
        return
    end
    for _, st in ipairs(RAGDOLL_STATES) do
        pcall(function()
            hum:SetStateEnabled(st, enabled)
        end)
    end
end
local function UpdateCharRef()
    CharRef.Character = LocalPlayer.Character
    if CharRef.Character then
        CharRef.Humanoid = CharRef.Character:WaitForChild("Humanoid", 5)
        CharRef.Root = CharRef.Character:WaitForChild("HumanoidRootPart", 5)
    end
end
UpdateCharRef()
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.3)
    UpdateCharRef()
    if State and (State.IsRideGOActive or State.IsCourierActive or State.IsPoliceActive) then
        setRagdollStates(false)
    end
end)
local State = {
    IsBaristaActive = false,
    IsOfficeActive = false,
    IsCourierActive = false,
    IsRideGOActive = false,
    AiThread = nil,
    StatusText = "Idling...",
    OrderCount = 0x0,
    ActionDelay = 5,
    AntiAFK = true,
    AntiAdmin = true,
    UangAwal = 0x0,
    UangAwalSession = 0,
    SessionStartTime = 0,
    LastStopReason = "",
    MachineFixCount = 0x0,
    OfficeMathSolved = 0,
    OfficePrints = 0x0,
    CourierDelivered = 0x0,
    CourierPhase = "Idle",
    FakeNameActive = false,
    FakeName = "King Akbar",
    TargetProfit = 0x0,
    RideGOIsOnline = false,
    RideGOPhase = "idle",
    RideGOToken = nil,
    RideGOTargetPos = nil,
    RideGOTripCount = 0x0,
    RideGOEarnings = 0x0,
    RideGOMinSpeed = 0x46,
    RideGOMaxSpeed = 95,
    CourierMinSpeed = 70,
    CourierMaxSpeed = 0x5f,
    PoliceMinSpeed = 0x46,
    PoliceMaxSpeed = 0x5f,
    LastSeat = nil,
    NextBikeCycle = math.random(3, 0x7),
    CurrentCycleTrips = 0x0,
    DebugOverlay = nil,
    DebugEnabled = true,
    DebugCursorY = 0x0,
    DebugTargetY = 0x0,
    DebugTapCount = 0,
    DebugLastAction = "idle",
    DebugMinigameActive = false,
    DebugCursorDelta = 0x0,
    IsPoliceActive = false,
    PoliceMissions = 0x0,
    PolicePhase = "Idle",
    PMValidCones = 0x0,
    PMReqCones = 0x0,
    PMValidLines = 0x0,
    PMReqLines = 0,
    PMType = "",
}
Services.RunService.Heartbeat:Connect(function()
    local hum = CharRef.Humanoid
    if hum and hum.SeatPart then
        State.LastSeat = hum.SeatPart
    end
end)
LocalPlayer.Idled:Connect(function()
    if not State.AntiAFK then
        return
    end
    pcall(function()
        Services.VirtualUser:CaptureController()
        Services.VirtualUser:ClickButton2(Vector2.new(0x0, 0x0))
    end)
end)
task.spawn(function()
    while true do
        task.wait(60)
        if State.AntiAFK then
            pcall(function()
                Services.VirtualUser:CaptureController()
                Services.VirtualUser:ClickButton2(Vector2.new(math.random(0, 0xa), math.random(0x0, 0xa)))
            end)
        end
    end
end)
local function SafeClick(x, y, holdTime)
    holdTime = holdTime or 0.05
    pcall(function()
        local gui = LocalPlayer:FindFirstChild("PlayerGui")
        if not gui then
            return
        end
        for _, button in ipairs(gui:GetDescendants()) do
            if button:IsA("GuiButton") and button.Visible and button.Active then
                local pos = button.AbsolutePosition
                local size = button.AbsoluteSize
                if x >= pos.X and x <= pos.X + size.X and y >= pos.Y and y <= pos.Y + size.Y then
                    if getconnections then
                        local signals = {
                        }
                        if button.MouseButton1Click then
                            table.insert(signals, button.MouseButton1Click)
                        end
                        if button.Activated then
                            table.insert(signals, button.Activated)
                        end
                        for _, signal in ipairs(signals) do
                            for _, conn in ipairs(getconnections(signal)) do
                                if conn.Function then
                                    pcall(conn.Function)
                                end
                            end
                        end
                    end
                    return
                end
            end
        end
    end)
end
local OriginalDisplayName = LocalPlayer.DisplayName
local SpoofCache = {
}
local function SpoofScan(char)
    for _, obj in pairs(char:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Visible then
            local t = obj.Text
            if t == LocalPlayer.Name or t == OriginalDisplayName or t == ("@" .. LocalPlayer.Name) then
                if SpoofCache[obj] == nil then
                    SpoofCache[obj] = t
                end
                obj.Text = State.FakeName
            end
        end
    end
end
local function SpoofRestore()
    for obj, original in pairs(SpoofCache) do
        pcall(function()
            if obj.Parent then
                obj.Text = original
            end
        end)
    end
    SpoofCache = {
    }
end
local function SpoofApplyNow()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then
            return
        end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.DisplayName = State.FakeName
        end
        SpoofScan(char)
    end)
end
local function SpoofDisableNow()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.DisplayName = OriginalDisplayName
            end
        end
    end)
    SpoofRestore()
end
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0x1)
    if State.FakeNameActive then
        SpoofCache = {
        }
        pcall(function()
            local hum = char:WaitForChild("Humanoid", 5)
            if hum then
                hum.DisplayName = State.FakeName
            end
        end)
    end
end)
task.spawn(function()
    while task.wait(1.5) do
        if not State.FakeNameActive then
            continue
        end
        pcall(function()
            local char = LocalPlayer.Character
            if not char then
                return
            end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.DisplayName ~= State.FakeName then
                hum.DisplayName = State.FakeName
            end
            SpoofScan(char)
        end)
    end
end)
local function rWait(minSec, maxSec)
    local minMs = math.floor((minSec or 0.5) * 0x3e8)
    local maxMs = math.floor((maxSec or 1.5) * 1000)
    if minMs > maxMs then
        minMs, maxMs = maxMs, minMs
    end
    task.wait(math.random(minMs, maxMs) / 0x3e8)
end
local function focusCameraZoom(enable, targetPart)
    local cam = workspace.CurrentCamera
    if not cam then
        return
    end
    pcall(function()
        if enable then
            cam.CameraType = Enum.CameraType.Scriptable
            local targetPos = nil
            if targetPart and targetPart:IsA("BasePart") then
                targetPos = targetPart.Position
            elseif CharRef.Root then
                targetPos = CharRef.Root.Position
            end
            if targetPos then
                local forward = (CharRef.Root and CharRef.Root.CFrame.LookVector) or Vector3.new(0, 0, - 0x1)
                local camPos = targetPos - (forward * 3.2) + Vector3.new(0, 1.3, 0)
                cam.CFrame = CFrame.lookAt(camPos, targetPos)
            end
        else
            cam.CameraType = Enum.CameraType.Custom
            if CharRef.Humanoid then
                cam.CameraSubject = CharRef.Humanoid
            end
        end
    end)
end
local function DoHold(prompt, targetPart)
    if not prompt or not prompt.Parent then
        return false
    end
    local ok = false
    pcall(function()
        prompt.Enabled = true
        pcall(function()
            prompt.RequiresLineOfSight = false
            if (prompt.MaxActivationDistance or 0x0) < 0x1e then
                prompt.MaxActivationDistance = 0x1e
            end
        end)
        local part = targetPart
        or (prompt.Parent:IsA("BasePart") and prompt.Parent) or CharRef.Root
        focusCameraZoom(true, part)
        task.wait(0.05)
        prompt:InputHoldBegin()
        local duration = (prompt.HoldDuration or 0x1) + 0.3
        task.wait(duration)
        prompt:InputHoldEnd()
        ok = true
    end)
    focusCameraZoom(false)
    rWait(0.12, 0.25)
    return ok
end
local function DoTap(prompt, targetPart)
    if not prompt or not prompt.Parent then
        return false
    end
    local ok = false
    pcall(function()
        prompt.Enabled = true
        pcall(function()
            prompt.RequiresLineOfSight = false
            if (prompt.MaxActivationDistance or 0x0) < 0x1e then
                prompt.MaxActivationDistance = 0x1e
            end
        end)
        local part = targetPart
        or (prompt.Parent:IsA("BasePart") and prompt.Parent) or CharRef.Root
        focusCameraZoom(true, part)
        task.wait(0.05)
        prompt:InputHoldBegin()
        task.wait(0.12)
        prompt:InputHoldEnd()
        ok = true
    end)
    focusCameraZoom(false)
    rWait(0.12, 0.25)
    return ok
end
local function zeroVelocity(part)
    if not part then
        return
    end
    pcall(function()
        part.AssemblyLinearVelocity = Vector3.zero
        part.AssemblyAngularVelocity = Vector3.zero
    end)
end
local function getBikeModel()
    local hum = CharRef.Humanoid
    if hum and hum.SeatPart then
        return hum.SeatPart:FindFirstAncestorOfClass("Model")
    end
    if (State.IsRideGOActive or State.IsCourierActive or State.IsPoliceActive) and State.LastSeat and State.LastSeat.Parent then
        return State.LastSeat:FindFirstAncestorOfClass("Model")
    end
    return nil
end
local function getPrimary(bike)
    if not bike then
        return nil
    end
    return bike.PrimaryPart or bike:FindFirstChild("VehicleSeat") or bike:FindFirstChildOfClass("BasePart")
end
local function safeDismountVehicle()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local bike = getBikeModel()
    if bike then
        local primary = getPrimary(bike)
        if primary then
            zeroVelocity(primary)
            local bv = primary:FindFirstChild("RideGO_BV")
            if bv then
                bv.Velocity = Vector3.zero
            end
        end
    end
    if root then
        zeroVelocity(root)
    end
    if hum then
        hum.Sit = false
        hum.Jump = true
        task.wait(0.1)
        if hum.SeatPart then
            char:PivotTo(char:GetPivot() * CFrame.new(0x0, 2.5, 0x0))
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
    task.wait(0.2)
    if root then
        zeroVelocity(root)
    end
end
local function GetPlayerMoney()
    local money = 0x0
    pcall(function()
        if LocalPlayer:FindFirstChild("leaderstats") and LocalPlayer.leaderstats:FindFirstChild("Money") then
            money = LocalPlayer.leaderstats.Money.Value
        elseif LocalPlayer:FindFirstChild("leaderstats") and LocalPlayer.leaderstats:FindFirstChild("Cash") then
            money = LocalPlayer.leaderstats.Cash.Value
        elseif LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Money") then
            money = LocalPlayer.Data.Money.Value
        else
            for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                if v:IsA("TextLabel") and v.Visible and string.find(v.Text, "Rp%.") then
                    local m = tonumber(string.gsub(v.Text, "[^%d]", ""))
                    if m and m > money then
                        money = m
                    end
                end
            end
        end
    end)
    return money
end
local GAME_GROUP_ID = 0xada120
local MIN_STAFF_RANK = 0x2
local BlacklistedExactNames = {
    ["slametriyadi"] = true,
    ["admin"] = true,
    ["moderator"] = true,
    ["developer"] = true
}
local function CheckForAdmin(player)
    if not State.AntiAdmin or player == LocalPlayer then
        return
    end
    local isStaff = false
    local pName = string.lower(player.Name)
    local dName = string.lower(player.DisplayName)
    if BlacklistedExactNames[pName] or BlacklistedExactNames[dName] then
        isStaff = true
    end
    if not isStaff then
        pcall(function()
            local rank = player:GetRankInGroup(GAME_GROUP_ID)
            if rank >= MIN_STAFF_RANK then
                isStaff = true
            end
        end)
    end
    if not isStaff then
        pcall(function()
            local chatTag = player:GetAttribute("ChatTags") or player:GetAttribute("IsAdmin")
            if chatTag then
                isStaff = true
            end
        end)
    end
    if isStaff then
        State.LastStopReason = "Admin detected: " .. player.Name
        rWait(0.2, 0.5)
        LocalPlayer:Kick("🚨 " .. player.Name .. " (Admin) joined! Leaving for safety.")
    end
end
for _, p in ipairs(Services.Players:GetPlayers()) do
    CheckForAdmin(p)
end
Services.Players.PlayerAdded:Connect(CheckForAdmin)
do
    local sg = Instance.new("ScreenGui")
    sg.Name = "BaristaSplash";
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true;
    sg.DisplayOrder = 0x3e7
    sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local bg = Instance.new("Frame", sg)
    bg.Size = UDim2.fromScale(0x1, 1);
    bg.BackgroundColor3 = Color3.fromHex("#0a0a0a")
    bg.BorderSizePixel = 0x0;
    bg.ZIndex = 1
    local grad = Instance.new("UIGradient", bg)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0x0, Color3.fromHex("#0a0a0a")),
        ColorSequenceKeypoint.new(0x1, Color3.fromHex("#1e1e1e")),
    });
    grad.Rotation = 0x87
    local ct = Instance.new("Frame", bg)
    ct.Size = UDim2.fromOffset(500, 0x12c);
    ct.Position = UDim2.fromScale(0.5, 0.5)
    ct.AnchorPoint = Vector2.new(0.5, 0.5);
    ct.BackgroundTransparency = 1;
    ct.ZIndex = 0x2
    local function mkLabel(txt, yOff, sz)
        local l = Instance.new("TextLabel", ct)
        l.Size = UDim2.fromOffset(500, 0x46);
        l.Position = UDim2.fromOffset(0x0, yOff)
        l.BackgroundTransparency = 0x1;
        l.Text = txt;
        l.TextSize = sz
        l.Font = Enum.Font.GothamBold;
        l.TextColor3 = Color3.fromHex("#ffffff")
        l.TextTransparency = 1;
        l.ZIndex = 0x3;
        return l
    end
    local icon = Instance.new("ImageLabel", ct)
    icon.Size = UDim2.fromOffset(0x78, 0x78);
    icon.Position = UDim2.fromOffset(0xbe, - 40)
    icon.BackgroundTransparency = 1;
    icon.Image = "rbxassetid://91115084979317"
    icon.ImageTransparency = 0x1;
    icon.ZIndex = 3
    local title = mkLabel("King Akbar", 70, IsMobile and 38 or 50)
    local tg = Instance.new("UIGradient", title)
    tg.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#aaaaaa")),
        ColorSequenceKeypoint.new(0x1, Color3.fromHex("#555555")),
    });
    tg.Rotation = 0x2d
    local stat = mkLabel("Preparing combat engine...", 0xc8, 12)
    stat.Font = Enum.Font.Gotham;
    stat.TextColor3 = Color3.fromHex("#555555")
    stat.TextXAlignment = Enum.TextXAlignment.Left;
    stat.Position = UDim2.fromOffset(50, 0xc8)
    local line = Instance.new("Frame", ct)
    line.Size = UDim2.fromOffset(0x0, 2);
    line.Position = UDim2.fromOffset(250, 0x98)
    line.AnchorPoint = Vector2.new(0.5, 0x0);
    line.BackgroundColor3 = Color3.fromHex("#444444")
    line.BorderSizePixel = 0x0;
    line.ZIndex = 0x3
    local barBg = Instance.new("Frame", ct)
    barBg.Size = UDim2.fromOffset(400, 0x5);
    barBg.Position = UDim2.fromOffset(0x32, 0xbe)
    barBg.BackgroundColor3 = Color3.fromHex("#222222");
    barBg.BackgroundTransparency = 1
    barBg.BorderSizePixel = 0x0;
    barBg.ZIndex = 0x3
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0x0)
    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.fromOffset(0, 5);
    bar.BackgroundColor3 = Color3.fromHex("#ffffff")
    bar.BorderSizePixel = 0x0;
    bar.ZIndex = 4
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0x1, 0x0)
    local function tw(obj, props, t)
        Services.TweenSvc:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
    end
    task.spawn(function()
        tw(icon, {
            ImageTransparency = 0x0
        }, 0.5);
        task.wait(0.15)
        tw(title, {
            TextTransparency = 0x0
        }, 0.6);
        task.wait(0.35)
        tw(line, {
            Size = UDim2.fromOffset(400, 2)
        }, 0.7);
        task.wait(0.4)
        tw(barBg, {
            BackgroundTransparency = 0x0
        }, 0.3)
        tw(stat, {
            TextTransparency = 0
        }, 0.3)
        for _, s in ipairs({
            {
                "Preparing RNG Bot...",
                0.30
            },
            {
                "Activating Emergency Alarm...",
                0.60
            },
            {
                "Welcome, King Akbar!",
                1.00
            },
        }) do
            stat.Text = s[0x1]
            tw(bar, {
                Size = UDim2.fromOffset(400 * s[2], 0x5)
            }, 0.5)
            task.wait(0.55)
        end
        task.wait(0.3)
        for _, p in ipairs({
            bg,
            icon,
            title,
            line,
            barBg,
            bar,
            stat
        }) do
            local prop = p == stat and "TextTransparency"
            or (p == icon and "ImageTransparency" or "BackgroundTransparency")
            if p == title then
                prop = "TextTransparency"
            end
            tw(p, {
                [prop] = 0x1
            }, 0.4)
        end
        task.wait(0.8);
        sg:Destroy()
    end)
    task.wait(0x3)
end
local Constants = {
    START_SHIFT = Vector3.new( - 4991.23, 4.29, - 715.26),
}
local Paths = {
    START_TO_MACHINE = {
        Vector3.new( - 4991.23, 4.29, - 715.26),
        Vector3.new( - 5004.86, 4.29, - 718.90),
        Vector3.new( - 5006.28, 4.29, - 802.11),
        Vector3.new( - 4994.18, 4.29, - 801.66),
        Vector3.new( - 4994.62, 4.29, - 794.89),
        Vector3.new( - 4997.13, 4.29, - 794.57),
        Vector3.new( - 4998.16, 4.29, - 794.80),
    },
    MACHINE_TO_CASHIER = {
        Vector3.new( - 4997.13, 4.29, - 794.57),
        Vector3.new( - 4994.62, 4.29, - 794.89),
        Vector3.new( - 4995.56, 4.29, - 759.78),
    },
    CASHIER_TO_MACHINE = {
        Vector3.new( - 4994.62, 4.29, - 794.89),
        Vector3.new( - 4997.13, 4.29, - 794.57),
        Vector3.new( - 4998.16, 4.29, - 794.80),
    },
    MACHINE_TO_START = {
        Vector3.new( - 4998.16, 4.29, - 794.80),
        Vector3.new( - 4997.13, 4.29, - 794.57),
        Vector3.new( - 4994.62, 4.29, - 794.89),
        Vector3.new( - 4994.18, 4.29, - 801.66),
        Vector3.new( - 5006.28, 4.29, - 802.11),
        Vector3.new( - 5004.86, 4.29, - 718.90),
        Vector3.new( - 4991.23, 4.29, - 715.26),
    },
    CASHIER_TO_START = {
        Vector3.new( - 4995.56, 4.29, - 759.78),
        Vector3.new( - 4994.62, 4.29, - 794.89),
        Vector3.new( - 4994.18, 4.29, - 801.66),
        Vector3.new( - 5006.28, 4.29, - 802.11),
        Vector3.new( - 5004.86, 4.29, - 718.90),
        Vector3.new( - 4991.23, 4.29, - 715.26),
    },
    MACHINE_TO_FIX = {
        Vector3.new( - 4998.14, 4.29, - 795.38),
        Vector3.new( - 4997.02, 4.29, - 802.18),
        Vector3.new( - 5006.31, 4.29, - 802.30),
        Vector3.new( - 5003.75, 4.29, - 711.60),
        Vector3.new( - 5004.43, 3.19, - 670.40),
        Vector3.new( - 5114.86, 3.19, - 670.41),
    },
    FIX_TO_MACHINE = {
        Vector3.new( - 5114.86, 3.19, - 670.41),
        Vector3.new( - 5004.43, 3.19, - 670.40),
        Vector3.new( - 5003.75, 4.29, - 711.60),
        Vector3.new( - 5006.31, 4.29, - 802.30),
        Vector3.new( - 4997.02, 4.29, - 802.18),
        Vector3.new( - 4998.14, 4.29, - 795.38),
    },
}
local BlackGui
local function ToggleBlackScreen(on)
    pcall(function()
        Services.RunService:Set3dRenderingEnabled(not on)
    end)
    if on then
        if not BlackGui then
            BlackGui = Instance.new("ScreenGui")
            BlackGui.Name = "BlackScreenSaver";
            BlackGui.IgnoreGuiInset = true
            BlackGui.DisplayOrder = 9999;
            BlackGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
            local f = Instance.new("Frame", BlackGui)
            f.Size = UDim2.fromScale(1, 1);
            f.BackgroundColor3 = Color3.new(0x0, 0x0, 0)
            local t = Instance.new("TextLabel", f)
            t.Text = "🌑 POWER SAVING MODE ACTIVE 🌑\nKing Akbar is farming..."
            t.Size = UDim2.fromScale(0x1, 0x1);
            t.TextColor3 = Color3.new(0x1, 0x1, 1)
            t.BackgroundTransparency = 0x1;
            t.Font = Enum.Font.GothamBold;
            t.TextSize = 0x14
        end
        BlackGui.Enabled = true
    else
        if BlackGui then
            BlackGui.Enabled = false
        end
    end
end
local AntiLagActive = false
local AntiLagConn = nil
local PotatoActive = false
local PotatoConns = {
}
local LAG_CLASSES = {
    "ParticleEmitter",
    "Smoke",
    "Fire",
    "Explosion",
    "Beam",
    "Trail",
    "Sparkles"
}
local function isLaggy(inst)
    for _, c in ipairs(LAG_CLASSES) do
        if inst:IsA(c) then
            return true
        end
    end
    return false
end
local function ToggleAntiLag(on)
    if on and PotatoActive then
        PotatoActive = false
    end
    AntiLagActive = on
    if on then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function()
            game:GetService("Lighting").GlobalShadows = false
        end)
        task.spawn(function()
            for _, v in pairs(Services.Workspace:GetDescendants()) do
                if isLaggy(v) then
                    safeDestroy(v)
                end
            end
        end)
        if not AntiLagConn then
            AntiLagConn = Services.Workspace.DescendantAdded:Connect(function(v)
                if AntiLagActive and isLaggy(v) then
                    safeDestroy(v)
                end
            end)
        end
    else
        if AntiLagConn then
            AntiLagConn:Disconnect();
            AntiLagConn = nil
        end
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
        pcall(function()
            game:GetService("Lighting").GlobalShadows = true
        end)
    end
end
local function TogglePotatoMode(on)
    if on and AntiLagActive then
        ToggleAntiLag(false)
    end
    PotatoActive = on
    if on then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function()
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = false;
            Lighting.FogEnd = 10
            Lighting.Brightness = 0x0;
            Lighting.TimeOfDay = "12:00:00"
            for _, v in pairs(Lighting:GetDescendants()) do
                if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("Clouds") then
                    pcall(function()
                        v.Enabled = false
                    end)
                end
            end
        end)
        task.spawn(function()
            for _, v in pairs(Services.Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Explosion") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Sparkles") or v:IsA("Sound") or v:IsA("Decal") or v:IsA("Texture") or v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                    safeDestroy(v)
                elseif v:IsA("MeshPart") then
                    pcall(function()
                        v.TextureID = "";
                        v.MeshId = ""
                    end)
                elseif v:IsA("BasePart") then
                    pcall(function()
                        v.Material = Enum.Material.SmoothPlastic
                    end)
                end
            end
        end)
        pcall(function()
            Services.Workspace.Terrain:Clear()
            Services.Workspace.Terrain.WaterWaveSize = 0x0
        end)
        local c1 = Services.Workspace.DescendantAdded:Connect(function(v)
            if not PotatoActive then
                return
            end
            if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Explosion") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Sparkles") or v:IsA("Sound") or v:IsA("Decal") or v:IsA("Texture") or v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                safeDestroy(v)
            elseif v:IsA("MeshPart") then
                pcall(function()
                    v.TextureID = "";
                    v.MeshId = ""
                end)
            elseif v:IsA("BasePart") then
                pcall(function()
                    v.Material = Enum.Material.SmoothPlastic
                end)
            end
        end)
        table.insert(PotatoConns, c1)
    else
        for _, conn in ipairs(PotatoConns) do
            pcall(function()
                conn:Disconnect()
            end)
        end
        PotatoConns = {
        }
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
        pcall(function()
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").FogEnd = 0x186a0
            game:GetService("Lighting").Brightness = 0x2
        end)
    end
end
local function WalkToPoint(pos, timeoutSec)
    timeoutSec = timeoutSec or 15
    if not CharRef.Humanoid or not CharRef.Root then
        return false
    end
    if CharRef.Humanoid.Sit then
        CharRef.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        task.wait(0.2)
    end
    local offset = Vector3.new(math.random( - 0x8, 0x8) / 10, 0x0, math.random( - 8, 8) / 0xa)
    local target = pos + offset
    local t0 = tick()
    local lastPos = CharRef.Root.Position
    local stuckTime = tick()
    local jumpCooldown = 0
    while tick() - t0 < timeoutSec and State.IsBaristaActive do
        if not CharRef.Humanoid or not CharRef.Root or not CharRef.Root.Parent then
            return false
        end
        local myPos = CharRef.Root.Position
        local flatDist = (Vector3.new(myPos.X, 0, myPos.Z) - Vector3.new(target.X, 0x0, target.Z)).Magnitude
        if flatDist < 0x3 then
            CharRef.Humanoid:MoveTo(CharRef.Root.Position)
            return true
        end
        if (myPos - lastPos).Magnitude < 0.5 then
            if tick() - stuckTime > 1.5 then
                pcall(function()
                    if tick() > jumpCooldown then
                        CharRef.Humanoid.Jump = true
                        jumpCooldown = tick() + 1
                    end
                end)
                target = pos + Vector3.new(math.random( - 20, 0x14) / 0xa, 0x0, math.random( - 0x14, 20) / 10)
                stuckTime = tick()
            end
        else
            lastPos = myPos
            stuckTime = tick()
        end
        CharRef.Humanoid:MoveTo(target)
        task.wait(0.1)
    end
    pcall(function()
        if CharRef.Humanoid then
            CharRef.Humanoid:MoveTo(CharRef.Root.Position)
        end
    end)
    return false
end
local function FollowPath(pathArray, skipFirst)
    if not pathArray or # pathArray == 0 then
        return false
    end
    for i, waypoint in ipairs(pathArray) do
        if not State.IsBaristaActive then
            return false
        end
        if skipFirst and i == 0x1 then
            continue
        end
        local ok = WalkToPoint(waypoint, 0xf)
        if not ok and State.IsBaristaActive then
            task.wait(0.3)
            WalkToPoint(waypoint, 0xa)
        end
        rWait(0.1, 0.25)
    end
    return true
end
local function FindClosestWaypointIndex(pathArray, currentPos)
    local bestIdx, bestDist = 0x1, math.huge
    for i, wp in ipairs(pathArray) do
        local d = (Vector3.new(wp.X, 0x0, wp.Z) - Vector3.new(currentPos.X, 0, currentPos.Z)).Magnitude
        if d < bestDist then
            bestDist = d;
            bestIdx = i
        end
    end
    return bestIdx, bestDist
end
local function SmartFollowPath(pathArray, threshold)
    threshold = threshold or 15
    if not CharRef.Root then
        return false
    end
    local idx, dist = FindClosestWaypointIndex(pathArray, CharRef.Root.Position)
    if dist < threshold and idx < # pathArray then
        local sliced = {
        }
        for i = idx, # pathArray do
            table.insert(sliced, pathArray[i])
        end
        return FollowPath(sliced)
    end
    return FollowPath(pathArray)
end
local function CreateDebugOverlay()
    if State.DebugOverlay and State.DebugOverlay.Parent then
        State.DebugOverlay:Destroy()
    end
    local sg = Instance.new("ScreenGui")
    sg.Name = "BaristaDebugOverlay"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 0x1f4
    sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    State.DebugOverlay = sg
    local panel = Instance.new("Frame", sg)
    panel.Name = "Panel"
    panel.Size = UDim2.fromOffset(240, 0xbe)
    panel.Position = UDim2.fromOffset(0xc, 12)
    panel.BackgroundColor3 = Color3.fromRGB(0xf, 15, 20)
    panel.BackgroundTransparency = 0.15
    panel.BorderSizePixel = 0x0
    panel.Visible = true
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0x0, 10)
    local stroke = Instance.new("UIStroke", panel)
    stroke.Color = Color3.fromRGB(0x3c, 0xc8, 100);
    stroke.Thickness = 1.5
    local title = Instance.new("TextLabel", panel)
    title.Size = UDim2.new(0x1, 0, 0, 0x16)
    title.Position = UDim2.fromOffset(0, 6)
    title.BackgroundTransparency = 0x1
    title.Text = "☕ BARISTA DEBUG MONITOR"
    title.TextColor3 = Color3.fromRGB(80, 220, 0x82)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 0xc
    title.TextXAlignment = Enum.TextXAlignment.Center
    local div = Instance.new("Frame", panel)
    div.Size = UDim2.new(1, - 0x14, 0x0, 0x1)
    div.Position = UDim2.fromOffset(10, 0x1e)
    div.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    div.BorderSizePixel = 0x0
    local function makeRow(yPos, labelTxt, color)
        local row = Instance.new("Frame", panel)
        row.Size = UDim2.new(0x1, - 20, 0x0, 0x10)
        row.Position = UDim2.fromOffset(0xa, yPos)
        row.BackgroundTransparency = 0x1
        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(0, 110, 0x1, 0x0)
        lbl.BackgroundTransparency = 0x1
        lbl.Text = labelTxt
        lbl.TextColor3 = Color3.fromRGB(0x8c, 140, 155)
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 10
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        local val = Instance.new("TextLabel", row)
        val.Size = UDim2.new(0x1, - 0x73, 0x1, 0x0)
        val.Position = UDim2.fromOffset(115, 0)
        val.BackgroundTransparency = 0x1
        val.Text = "—"
        val.TextColor3 = color or Color3.fromRGB(230, 0xe6, 235)
        val.Font = Enum.Font.GothamBold
        val.TextSize = 0xa
        val.TextXAlignment = Enum.TextXAlignment.Right
        return val
    end
    local labels = {
    }
    labels.status = makeRow(0x26, "Status", Color3.fromRGB(0xc8, 200, 210))
    labels.mgActive = makeRow(0x38, "Minigame", Color3.fromRGB(0xdc, 0xb4, 0x3c))
    labels.cursor = makeRow(0x4a, "Cursor Y", Color3.fromRGB(80, 0xb4, 255))
    labels.target = makeRow(0x5c, "Target Y", Color3.fromRGB(0x50, 220, 0x82))
    labels.delta = makeRow(110, "Delta", Color3.fromRGB(0xe6, 0x82, 130))
    labels.tap = makeRow(0x80, "Total Taps", Color3.fromRGB(0xe6, 0xc8, 80))
    labels.action = makeRow(0x92, "Last Action", Color3.fromRGB(0xb4, 180, 200))
    labels.order = makeRow(164, "Coffee Sold", Color3.fromRGB(0x50, 0xdc, 0x82))
    local toggleBtn = Instance.new("TextButton", sg)
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.fromOffset(0x50, 22)
    toggleBtn.Position = UDim2.fromOffset(12, 0xd2)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 0x2a)
    toggleBtn.BorderSizePixel = 0x0
    toggleBtn.Text = "🐞 Hide Debug"
    toggleBtn.TextColor3 = Color3.fromRGB(230, 0xe6, 0xeb)
    toggleBtn.Font = Enum.Font.GothamMedium
    toggleBtn.TextSize = 0xa
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 0x6)
    toggleBtn.MouseButton1Click:Connect(function()
        State.DebugEnabled = not State.DebugEnabled
        panel.Visible = State.DebugEnabled
        toggleBtn.Text = State.DebugEnabled and "🐞 Hide Debug" or "🐞 Show Debug"
        toggleBtn.Position = State.DebugEnabled and UDim2.fromOffset(0xc, 0xd2) or UDim2.fromOffset(12, 0xc)
    end)
    task.spawn(function()
        while sg.Parent do
            task.wait(0.1)
            pcall(function()
                labels.status.Text = State.StatusText or "idle"
                labels.status.TextColor3 = State.IsBaristaActive and Color3.fromRGB(0x50, 220, 0x82) or Color3.fromRGB(0xb4, 0xb4, 190)
                labels.mgActive.Text = State.DebugMinigameActive and "AKTIF 🟢" or "OFF ⚪"
                labels.mgActive.TextColor3 = State.DebugMinigameActive and Color3.fromRGB(0x50, 220, 0x82) or Color3.fromRGB(120, 0x78, 0x82)
                labels.cursor.Text = string.format("%.0f px", State.DebugCursorY)
                labels.target.Text = string.format("%.0f px", State.DebugTargetY)
                local delta = State.DebugCursorDelta
                labels.delta.Text = string.format("%.0f px", delta)
                if math.abs(delta) < 0x5 then
                    labels.delta.TextColor3 = Color3.fromRGB(0x50, 220, 0x82)
                elseif math.abs(delta) < 0x1e then
                    labels.delta.TextColor3 = Color3.fromRGB(0xe6, 0xc8, 0x50)
                else
                    labels.delta.TextColor3 = Color3.fromRGB(230, 0x5a, 0x5a)
                end
                labels.tap.Text = tostring(State.DebugTapCount)
                labels.action.Text = State.DebugLastAction or "idle"
                labels.order.Text = tostring(State.OrderCount or 0x0)
            end)
        end
    end)
end
local function DestroyDebugOverlay()
    if State.DebugOverlay and State.DebugOverlay.Parent then
        State.DebugOverlay:Destroy()
        State.DebugOverlay = nil
    end
end
local function StartMinigameAI()
    if State.AiThread then
        task.cancel(State.AiThread)
    end
    State.DebugTapCount = 0x0
    State.AiThread = task.spawn(function()
        while State.IsBaristaActive do
            task.wait(0.02)
            local gui = LocalPlayer.PlayerGui:FindFirstChild("BaristaGUI")
            if not gui then
                State.DebugMinigameActive = false
                task.wait(0.1);
                continue
            end
            local mf = gui:FindFirstChild("MinigameFrame", true)
            if not (mf and mf.Visible) then
                State.DebugMinigameActive = false
                task.wait(0.1);
                continue
            end
            State.DebugMinigameActive = true
            local tapZone = mf:FindFirstChild("TapZone", true)
            local bgBar = mf:FindFirstChild("BackgroundBar", true)
            local targetZone = bgBar and bgBar:FindFirstChild("TargetZone")
            local cursor = bgBar and bgBar:FindFirstChild("PlayerCursor")
            if tapZone and targetZone and cursor then
                local cursorY = cursor.AbsolutePosition.Y + cursor.AbsoluteSize.Y / 0x2
                local tzTop = targetZone.AbsolutePosition.Y
                local tzHeight = targetZone.AbsoluteSize.Y
                local tzCenter = tzTop + tzHeight / 0x2
                State.DebugCursorY = cursorY
                State.DebugTargetY = tzCenter
                State.DebugCursorDelta = cursorY - tzCenter
                if cursorY > tzCenter + 2 then
                    pcall(function()
                        if getconnections then
                            for _, c in ipairs(getconnections(tapZone.MouseButton1Down)) do
                                if c.Function then
                                    c.Function()
                                end
                            end
                        end
                        if firesignal then
                            firesignal(tapZone.MouseButton1Down)
                        end
                    end)
                    State.DebugTapCount = State.DebugTapCount + 1
                    State.DebugLastAction = "TAP ⚡"
                else
                    State.DebugLastAction = "WAIT ⏳"
                end
            else
                State.DebugLastAction = "NO UI ❌"
            end
        end
        State.DebugMinigameActive = false
    end)
end
local BaristaRefs = {
}
local function RefreshBaristaRefs()
    local job = workspace:FindFirstChild("BaristaJob")
    local inter = job and job:FindFirstChild("Interactions")
    if not inter then
        return false
    end
    local sp = inter:FindFirstChild("StartPart")
    sp = sp and sp:FindFirstChild("StartPart")
    BaristaRefs.JobPrompt = sp and sp:FindFirstChild("JobPrompt")
    local mach = inter:FindFirstChild("MachinePart")
    mach = mach and mach:FindFirstChild("MachinePart")
    BaristaRefs.MachinePart = mach
    BaristaRefs.MachinePrompt = mach and mach:FindFirstChild("MachinePrompt")
    local reg = inter:FindFirstChild("RegisterPart")
    reg = reg and reg:FindFirstChild("RegisterPart")
    BaristaRefs.RegisterPart = reg
    BaristaRefs.RegisterPrompt = reg and reg:FindFirstChild("RegisterPrompt")
    local sup = inter:FindFirstChild("SupplyPart")
    sup = sup and sup:FindFirstChild("SupplyPart")
    BaristaRefs.SupplyPart = sup
    BaristaRefs.SupplyPrompt = sup and sup:FindFirstChild("SupplyPrompt")
    return BaristaRefs.JobPrompt ~= nil
end
local function HasJobActive()
    local p = BaristaRefs.JobPrompt
    if not p or not p.ActionText then
        return false
    end
    return p.ActionText:lower():find("end") ~= nil
end
local function HasPendingOrder()
    local p = BaristaRefs.MachinePrompt
    return p and p.Enabled or false
end
local function NeedsRestock()
    local s = BaristaRefs.SupplyPrompt
    return s and s.Enabled or false
end
local function CanServe()
    local r = BaristaRefs.RegisterPrompt
    return r and r.Enabled or false
end
local function TriggerPrompt(prompt, keepCameraLocked)
    if not prompt or not prompt.Parent then
        return false
    end
    local ok = false
    pcall(function()
        prompt.Enabled = true
        pcall(function()
            prompt.RequiresLineOfSight = false
            if (prompt.MaxActivationDistance or 0x0) < 0x1e then
                prompt.MaxActivationDistance = 30
            end
        end)
        if prompt.Parent and prompt.Parent:IsA("BasePart") then
            focusCameraZoom(true, prompt.Parent)
            task.wait(0.05)
        end
        prompt:InputHoldBegin()
        task.wait((prompt.HoldDuration or 0.1) + 0.15)
        prompt:InputHoldEnd()
        ok = true
    end)
    rWait(0.15, 0.3)
    if not keepCameraLocked then
        focusCameraZoom(false)
    end
    return ok
end
local function BaristaFarmLoop()
    local lastLocation = "unknown"
    while State.IsBaristaActive do
        if not CharRef.Character or not CharRef.Character.Parent then
            UpdateCharRef();
            task.wait(0.5)
        end
        if not RefreshBaristaRefs() then
            State.StatusText = "Loading BaristaJob..."
            task.wait(1);
            continue
        end
        if not HasJobActive() then
            State.StatusText = "🏃 Jalan ke Start Shift..."
            State.DebugLastAction = "GO START"
            if lastLocation ~= "start" then
                if lastLocation == "machine" then
                    SmartFollowPath(Paths.MACHINE_TO_START)
                elseif lastLocation == "cashier" then
                    SmartFollowPath(Paths.CASHIER_TO_START)
                elseif lastLocation == "supply" then
                    SmartFollowPath(Paths.FIX_TO_MACHINE)
                    SmartFollowPath(Paths.MACHINE_TO_START)
                else
                    WalkToPoint(Constants.START_SHIFT, 0x14)
                end
                lastLocation = "start"
            end
            rWait(0.5, 0x1)
            local p = BaristaRefs.JobPrompt
            if p and p.Enabled and p.ActionText:lower():find("start") then
                State.StatusText = "💼 Mulai shift..."
                State.DebugLastAction = "START SHIFT"
                TriggerPrompt(p)
                rWait(1.5, 2.5)
                State.StatusText = "🚶 Jalan ke mesin..."
                SmartFollowPath(Paths.START_TO_MACHINE)
                lastLocation = "machine"
            end
            continue
        end
        if CanServe() then
            State.StatusText = "☕ Jalan ke kasir..."
            State.DebugLastAction = "GO CASHIER"
            if lastLocation ~= "cashier" then
                SmartFollowPath(Paths.MACHINE_TO_CASHIER)
                lastLocation = "cashier"
            end
            rWait(0.3, 0.6)
            local r = BaristaRefs.RegisterPrompt
            if r and r.Enabled then
                TriggerPrompt(r)
                State.OrderCount = (State.OrderCount or 0x0) + 0x1
                State.StatusText = "✅ Terkirim! Total: " .. State.OrderCount
                State.DebugLastAction = "SERVED"
                rWait(1, 1.5)
            end
            continue
        end
        if NeedsRestock() then
            State.StatusText = "🔧 Jalan ke supply (fix mesin)..."
            State.DebugLastAction = "GO FIX"
            if lastLocation == "cashier" then
                SmartFollowPath(Paths.CASHIER_TO_MACHINE)
            end
            SmartFollowPath(Paths.MACHINE_TO_FIX)
            lastLocation = "supply"
            rWait(0.4, 0.8)
            local s = BaristaRefs.SupplyPrompt
            if s and s.Enabled then
                TriggerPrompt(s)
                State.MachineFixCount = (State.MachineFixCount or 0x0) + 1
                State.StatusText = "✅ Mesin diperbaiki!"
                State.DebugLastAction = "FIXED"
                State.StatusText = "🚶 Balik ke mesin..."
                SmartFollowPath(Paths.FIX_TO_MACHINE)
                lastLocation = "machine"
                rWait(0.5, 0x1)
            end
            continue
        end
        if HasPendingOrder() then
            State.StatusText = "☕ Jalan ke mesin (brew)..."
            State.DebugLastAction = "GO BREW"
            if lastLocation == "cashier" then
                SmartFollowPath(Paths.CASHIER_TO_MACHINE)
            elseif lastLocation == "supply" then
                SmartFollowPath(Paths.FIX_TO_MACHINE)
            elseif lastLocation == "start" then
                SmartFollowPath(Paths.START_TO_MACHINE)
            else
                WalkToPoint(BaristaRefs.MachinePart.Position + Vector3.new(0x0, 0, 2), 0xa)
            end
            lastLocation = "machine"
            rWait(0.3, 0.6)
            local m = BaristaRefs.MachinePrompt
            if m and m.Enabled then
                State.StatusText = "🍺 Brewing..."
                State.DebugLastAction = "BREWING"
                TriggerPrompt(m, true)
                local t = 0x0
                while State.IsBaristaActive and t < 0x1e do
                    task.wait(0.3);
                    t += 0.3
                    if CanServe() or NeedsRestock() then
                        break
                    end
                    if not HasJobActive() then
                        break
                    end
                end
                focusCameraZoom(false)
            end
            continue
        end
        if lastLocation == "unknown" or lastLocation == "start" then
            State.StatusText = "🚶 Jalan ke standby..."
            State.DebugLastAction = "STANDBY"
            WalkToPoint(BaristaRefs.MachinePart and BaristaRefs.MachinePart.Position + Vector3.new(0, 0x0, 0x3), 0xf)
            lastLocation = "machine"
            continue
        end
        State.StatusText = "⏳ Nunggu pelanggan..."
        State.DebugLastAction = "IDLE"
        task.wait(0x1)
    end
    State.DebugMinigameActive = false
    focusCameraZoom(false)
end
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local ComputersFolder = workspace:WaitForChild("Computers", 0x1e)
local function eksekusiPromptTahan(pp)
    if not pp then
        return
    end
    if (pp.HoldDuration or 0x0) > 0 then
        DoHold(pp, pp.Parent)
    else
        DoTap(pp, pp.Parent)
    end
end
local myChair = nil
local function jalanKe(pos)
    local root = CharRef.Root
    local hum = CharRef.Humanoid
    if not root or not hum then
        return false
    end
    local targetPos = pos + Vector3.new(math.random( - 0xc, 12) / 0xa, 0x0, math.random( - 0xc, 12) / 0xa)
    local path = Services.PathfindingService:CreatePath({
        AgentRadius = 0x2,
        AgentHeight = 5,
        AgentCanJump = true
    })
    local success, _ = pcall(function()
        path:ComputeAsync(root.Position, targetPos)
    end)
    if success and path.Status == Enum.PathStatus.Success then
        for _, waypoint in ipairs(path:GetWaypoints()) do
            if not State.IsOfficeActive then
                break
            end
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                hum.Jump = true
            end
            hum:MoveTo(waypoint.Position)
            local t = 0x0
            while(root.Position - waypoint.Position).Magnitude > 3.5 do
                task.wait(0.02);
                t += 0.02
                if t > 1.5 or not State.IsOfficeActive then
                    break
                end
            end
        end
        return true
    else
        hum:MoveTo(targetPos)
        hum.MoveToFinished:Wait(0x3)
        return true
    end
end
local function keluarKursi()
    local hum = CharRef.Humanoid
    if not hum then
        return
    end
    if hum.SeatPart then
        myChair = hum.SeatPart
        task.wait(math.random(10, 20) / 0xa)
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.3)
    end
end
local function getSeatFromChair(chair)
    if not chair then
        return nil
    end
    if chair:IsA("Seat") or chair:IsA("VehicleSeat") then
        return chair
    end
    return chair:FindFirstChildWhichIsA("Seat") or chair:FindFirstChildWhichIsA("VehicleSeat")
end
local function findOfficeSeat(excludeSeat)
    if not ComputersFolder then
        return nil
    end
    local origin = CharRef.Root and CharRef.Root.Position
    if not origin then
        return nil
    end
    local best, bestD = nil, math.huge
    for _, v in pairs(ComputersFolder:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Setup" then
            local seat = v:FindFirstChild("Seat", true)
            if seat and seat:IsA("Seat") and seat ~= excludeSeat then
                if not seat.Occupant or seat.Occupant == CharRef.Humanoid then
                    local d = (seat.Position - origin).Magnitude
                    if d < bestD then
                        bestD = d;
                        best = seat
                    end
                end
            end
        end
    end
    return best
end
local function joinOfficeTeam()
    pcall(function()
        local JobEvents = Services.ReplicatedStorage:WaitForChild("JobEvents", 0xa)
        if not JobEvents then
            return
        end
        local TeamChangeRequest = JobEvents:WaitForChild("TeamChangeRequest", 0x5)
        if TeamChangeRequest then
            TeamChangeRequest:FireServer("Office Worker", 0x0, 0x1, 0x0, "")
        end
    end)
end
local function dudukKeKursi(instantTP)
    local hum = CharRef.Humanoid
    if not hum then
        return false
    end
    if hum.SeatPart then
        return true
    end
    if State.IsOfficeActive then
        if not myChair or (myChair.Occupant and myChair.Occupant ~= hum) then
            myChair = findOfficeSeat()
        end
    end
    if not myChair then
        return false
    end
    if not instantTP then
        keluarKursi()
    end
    local seat = getSeatFromChair(myChair)
    local handle = myChair:FindFirstChild("Handle")
    local targetCFrame = seat and seat.CFrame
    or (handle and handle.CFrame)
    or (myChair:IsA("BasePart") and myChair.CFrame)
    or (myChair.PrimaryPart and myChair.PrimaryPart.CFrame)
    if not targetCFrame then
        return false
    end
    if instantTP then
        if CharRef.Root then
            CharRef.Root.CFrame = targetCFrame;
            task.wait(0.1)
        end
        if seat then
            seat:Sit(hum);
            task.wait(1.5);
            return true
        else
            for _, child in pairs(myChair:GetChildren()) do
                if child:IsA("ProximityPrompt") and child.Enabled then
                    eksekusiPromptTahan(child);
                    task.wait(1.5);
                    return true
                end
            end
        end
    else
        jalanKe(targetCFrame.Position + Vector3.new(0x0, 2, 0))
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        if seat then
            seat:Sit(hum);
            task.wait(1.5);
            return true
        else
            for _, child in pairs(myChair:GetChildren()) do
                if child:IsA("ProximityPrompt") and child.Enabled then
                    eksekusiPromptTahan(child);
                    task.wait(1.5);
                    return true
                end
            end
        end
    end
    return false
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local JobEvents = ReplicatedStorage:WaitForChild("JobEvents", 0xf)
local GenerateQuestion = JobEvents and JobEvents:WaitForChild("GenerateQuestion", 0xa)
local function evaluateMath(text)
    local cleanText = string.gsub(text, "<[^>]+>", "")
    cleanText = string.gsub(cleanText, "%s+", "")
    local a, op, b = string.match(cleanText, "(%-?%d+%.?%d*)([%+%-])(%-?%d+%.?%d*)")
    if not a or not op or not b then
        return nil
    end
    a, b = tonumber(a), tonumber(b)
    if op == "+" then
        return a + b
    elseif op == "-" then
        return a - b
    end
    return nil
end
local function getAnswerButtons()
    local gui = LocalPlayer.PlayerGui:FindFirstChild("WorkGui")
    local frame = gui and gui:FindFirstChild("Frame")
    if not frame then
        return {
        }
    end
    local list = {
    }
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiButton") then
            table.insert(list, child)
        end
    end
    return list
end
local function findCorrectButton(jawaban, timeoutSec)
    local deadline = tick() + (timeoutSec or 2.5)
    while tick() < deadline do
        for _, btn in ipairs(getAnswerButtons()) do
            local numText = string.match(tostring(btn.Text or ""), "%-?%d+%.?%d*")
            if tonumber(numText) == jawaban and btn:IsDescendantOf(game) then
                return btn
            end
        end
        task.wait(0.1)
    end
    return nil
end
local function clearHighlights()
    local gui = LocalPlayer.PlayerGui:FindFirstChild("WorkGui")
    if not gui then
        return
    end
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj.Name == "AutoMathHighlight" then
            safeDestroy(obj)
        end
    end
end
local function highlightButton(btn)
    clearHighlights()
    local stroke = Instance.new("UIStroke")
    stroke.Name = "AutoMathHighlight"
    stroke.Color = Color3.fromRGB(255, 0xff, 0xff)
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Parent = btn
    TweenService:Create(stroke, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
        Thickness = 0x7
    }):Play()
end
local function unhighlightLater(btn, delaySec)
    task.delay(delaySec, function()
        local s = btn:FindFirstChild("AutoMathHighlight")
        if s then
            TweenService:Create(s, TweenInfo.new(0.2), {
                Thickness = 0x0
            }):Play()
            task.delay(0.25, function()
                safeDestroy(s)
            end)
        end
    end)
end
local function pressButton(btn)
    if getconnections then
        local signals = {
        }
        if btn.MouseButton1Click then
            table.insert(signals, btn.MouseButton1Click)
        end
        if btn.Activated then
            table.insert(signals, btn.Activated)
        end
        for _, signal in ipairs(signals) do
            for _, conn in ipairs(getconnections(signal)) do
                if conn.Function then
                    if pcall(conn.Function) then
                        return "handler-asli"
                    end
                end
            end
        end
    end
    return nil
end
local lastActivityTime = tick()
if GenerateQuestion then
    GenerateQuestion.OnClientEvent:Connect(function(questionText, answerData, sessionID)
        if State and State.IsOfficeActive == false then
            return
        end
        lastActivityTime = tick()
        local jawaban = evaluateMath(questionText)
        if not jawaban then
            return
        end
        local correctButton = findCorrectButton(jawaban, 2.5)
        if correctButton then
            highlightButton(correctButton)
        end
        task.wait(math.random(0xf, 0x19) / 0xa)
        if correctButton then
            local reText = string.match(tostring(correctButton.Text or ""), "%-?%d+%.?%d*")
            if not correctButton:IsDescendantOf(game) or tonumber(reText) ~= jawaban then
                correctButton = findCorrectButton(jawaban, 0.5)
            end
        end
        if correctButton then
            pressButton(correctButton)
            unhighlightLater(correctButton, 0.4)
        else
            clearHighlights()
        end
        if State then
            State.OfficeMathSolved = (State.OfficeMathSolved or 0x0) + 1
        end
    end)
end
local isSwitching = false
local IDLE_SWITCH_TIME = 0x3c
task.spawn(function()
    while true do
        task.wait(2.5)
        if not State.IsOfficeActive then
            continue
        end
        if getgenv().isGoingToPrinter or isSwitching then
            continue
        end
        local hum = CharRef.Humanoid
        if not hum then
            continue
        end
        if not hum.SeatPart then
            pcall(function()
                local seat = findOfficeSeat(nil)
                if seat then
                    myChair = seat
                    jalanKe(seat.CFrame.Position + Vector3.new(0x0, 0x2, 0x0))
                    task.wait(0.3)
                    if CharRef.Humanoid then
                        seat:Sit(CharRef.Humanoid)
                    end
                end
            end)
        end
    end
end)
LocalPlayer.CharacterAdded:Connect(function()
    if not State.IsOfficeActive then
        return
    end
    task.wait(0x3)
    if not State.IsOfficeActive then
        return
    end
    local seat = findOfficeSeat(nil)
    if seat then
        myChair = seat
        pcall(function()
            jalanKe(seat.CFrame.Position + Vector3.new(0x0, 2, 0x0))
            task.wait(0.3)
            seat:Sit(CharRef.Humanoid)
        end)
    end
    lastActivityTime = tick()
end)
getgenv().forceStopMath = false
getgenv().isGoingToPrinter = false
task.spawn(function()
    while true do
        task.wait(0x2)
        if not State.IsOfficeActive then
            continue
        end
        if getgenv().isGoingToPrinter or getgenv().forceStopMath or isSwitching then
            continue
        end
        if tick() - lastActivityTime > IDLE_SWITCH_TIME then
            isSwitching = true
            getgenv().forceStopMath = true
            keluarKursi()
            local newSeat = findOfficeSeat(myChair)
            if newSeat then
                myChair = newSeat
            end
            dudukKeKursi(false)
            getgenv().forceStopMath = false
            isSwitching = false
            lastActivityTime = tick()
        end
    end
end)
local activePrinterName = nil
local printerRetryCount = 0x0
local MAX_PRINTER_RETRY = 3
local printerCooldownUntil = 0
task.spawn(function()
    while true do
        task.wait(0x5)
        if not State.IsOfficeActive then
            continue
        end
        if getgenv().isGoingToPrinter then
            getgenv().printWatchdog = getgenv().printWatchdog or tick()
            if tick() - getgenv().printWatchdog > 0x2d then
                getgenv().isGoingToPrinter = false
                getgenv().forceStopMath = false
                getgenv().printWatchdog = nil
                activePrinterName = nil
                lastActivityTime = tick()
            end
        else
            getgenv().printWatchdog = nil
        end
    end
end)
local AssignPrintJob = JobEvents and JobEvents:WaitForChild("AssignPrintJob", 10)
local ClearPrintJob = JobEvents and JobEvents:WaitForChild("ClearPrintJob", 0xa)
if AssignPrintJob then
    AssignPrintJob.OnClientEvent:Connect(function(printerName)
        if tick() < printerCooldownUntil then
            return
        end
        activePrinterName = printerName
        printerRetryCount = 0x0
    end)
end
if ClearPrintJob then
    ClearPrintJob.OnClientEvent:Connect(function()
        activePrinterName = nil
        printerRetryCount = 0
    end)
end
task.spawn(function()
    while true do
        task.wait(0.8)
        if not State.IsOfficeActive then
            continue
        end
        if not ComputersFolder then
            continue
        end
        if activePrinterName and not getgenv().isGoingToPrinter then
            if printerRetryCount >= MAX_PRINTER_RETRY then
                activePrinterName = nil
                printerRetryCount = 0x0
                getgenv().isGoingToPrinter = false
                getgenv().forceStopMath = false
                lastActivityTime = tick()
                continue
            end
            getgenv().isGoingToPrinter = true
            getgenv().forceStopMath = true
            getgenv().printWatchdog = tick()
            printerRetryCount = printerRetryCount + 0x1
            pcall(function()
                task.wait(math.random(0x3, 0x7) / 0xa)
                local hum = CharRef.Humanoid
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if hum.SeatPart then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                        task.wait(0.4)
                    end
                end
                local printerPart = nil
                local targetPrompt = nil
                local currentPrinterName = activePrinterName
                for i = 0x1, 0xa do
                    if not activePrinterName or activePrinterName ~= currentPrinterName then
                        break
                    end
                    local printerModel = ComputersFolder:FindFirstChild(activePrinterName)
                    if printerModel then
                        printerPart = printerModel:FindFirstChild("Part")
                        if printerPart then
                            targetPrompt = printerPart:FindFirstChildOfClass("ProximityPrompt")
                            if targetPrompt then
                                break
                            end
                        end
                    end
                    task.wait(0.5)
                end
                if printerPart and targetPrompt and activePrinterName then
                    targetPrompt.Enabled = true
                    jalanKe(printerPart.Position + Vector3.new(0x0, 0x0, 2.5))
                    if CharRef.Root then
                        local look = Vector3.new(printerPart.Position.X, CharRef.Root.Position.Y, printerPart.Position.Z)
                        CharRef.Root.CFrame = CFrame.lookAt(CharRef.Root.Position, look)
                    end
                    task.wait(0.3)
                    eksekusiPromptTahan(targetPrompt)
                    State.OfficePrints = (State.OfficePrints or 0x0) + 1
                    local t = 0x0
                    while activePrinterName == currentPrinterName and t < 12 do
                        task.wait(0.5);
                        t = t + 0.5
                    end
                    printerRetryCount = 0x0
                end
            end)
            pcall(function()
                local hum = CharRef.Humanoid
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
                local seat = findOfficeSeat(nil)
                if seat then
                    myChair = seat
                    jalanKe(seat.CFrame.Position + Vector3.new(0x0, 0x2, 0x0))
                    task.wait(0.3)
                    if CharRef.Humanoid then
                        seat:Sit(CharRef.Humanoid)
                    end
                end
            end)
            getgenv().isGoingToPrinter = false
            getgenv().forceStopMath = false
            getgenv().printWatchdog = nil
            lastActivityTime = tick()
            printerCooldownUntil = tick() + 0x8
        end
    end
end)
local CoreGui2 = (gethui and gethui()) or game:GetService("CoreGui")
local TrackerGui = nil
local CachedMoneyLabel = nil
local DisplayedValues = {
}
local function parseNumber(val)
    if not val then
        return 0x0
    end
    local cleanString = string.gsub(tostring(val), "[^%d%-]", "")
    return tonumber(cleanString) or 0
end
local function formatTime(seconds)
    seconds = tonumber(seconds) or 0x0
    local h = math.floor(seconds / 0xe10)
    local m = math.floor((seconds % 0xe10) / 0x3c)
    local s = math.floor(seconds % 0x3c)
    return string.format("%02d:%02d:%02d", h, m, s)
end
local function fmtRupiah(num)
    num = tonumber(num) or 0x0
    if num >= 1e9 then
        return "Rp" .. string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then
        return "Rp" .. string.format("%.1fM", num / 1e6)
    elseif num >= 1e3 then
        return "Rp" .. string.format("%.1fK", num / 1e3)
    else
        return "Rp" .. tostring(math.floor(num))
    end
end
local function fmtProfit(num)
    num = tonumber(num) or 0x0
    local sign = num >= 0x0 and "+" or "-"
    local absNum = math.abs(num)
    if absNum >= 1e9 then
        return sign .. string.format("%.1fB", absNum / 1e9)
    elseif absNum >= 1e6 then
        return sign .. string.format("%.1fM", absNum / 1e6)
    elseif absNum >= 1e3 then
        return sign .. string.format("%.1fK", absNum / 1e3)
    else
        return sign .. tostring(math.floor(absNum))
    end
end
local function fmtShort(num)
    num = tonumber(num) or 0x0
    if num >= 1e9 then
        return string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then
        return string.format("%.1fM", num / 1e6)
    elseif num >= 1e3 then
        return string.format("%.1fK", num / 1e3)
    else
        return tostring(math.floor(num))
    end
end
local function CariLabelUang()
    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not pGui then
        return nil
    end
    for _, guiObject in ipairs(pGui:GetDescendants()) do
        if guiObject:IsA("TextLabel") or guiObject:IsA("TextButton") then
            local text = guiObject.Text
            if text and string.find(text, "Rp%.") and string.match(text, "%d+") then
                return guiObject
            end
        end
    end
    return nil
end
local function DapatkanUangPemain()
    if CachedMoneyLabel and CachedMoneyLabel.Parent then
        return parseNumber(CachedMoneyLabel.Text)
    end
    CachedMoneyLabel = CariLabelUang()
    if CachedMoneyLabel then
        return parseNumber(CachedMoneyLabel.Text)
    end
    return GetPlayerMoney()
end
local function animateValue(label, targetNum, formatter, colorPos, colorNeg, colorNeutral)
    targetNum = tonumber(targetNum) or 0x0
    local key = label
    if DisplayedValues[key] == nil then
        DisplayedValues[key] = targetNum
    end
    local cur = DisplayedValues[key]
    if math.abs(cur - targetNum) < 0.5 then
        DisplayedValues[key] = targetNum
        if formatter then
            label.Text = formatter(targetNum)
        end
        if colorNeutral then
            label.TextColor3 = colorNeutral
        end
        return
    end
    local next = cur + (targetNum - cur) * 0.18 DisplayedValues[key] = next
    if formatter then
        label.Text = formatter(next)
    end
    if colorPos and colorNeg then
        label.TextColor3 = (next >= 0x0) and colorPos or colorNeg
    elseif colorNeutral then
        label.TextColor3 = colorNeutral
    end
end
local function buatMonitoringGUI()
    local uangSekarang = DapatkanUangPemain()
    if not getgenv().UangAwalDikunci or getgenv().UangAwalDikunci == 0x0 then
        getgenv().UangAwalDikunci = uangSekarang
    end
    getgenv().WaktuMulai = getgenv().WaktuMulai or tick()
    local uangAwal = getgenv().UangAwalDikunci
    DisplayedValues = {
    }
    if TrackerGui and TrackerGui.Parent then
        TrackerGui:Destroy()
    end
    TrackerGui = Instance.new("ScreenGui")
    TrackerGui.Name = "KingAkbarTracker"
    TrackerGui.Parent = CoreGui2
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 0xe6, 0, 0x0)
    Frame.Position = UDim2.new(0x1, - 0x10, 0.5, 0x0)
    Frame.AnchorPoint = Vector2.new(0x1, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 0x12, 22)
    Frame.BackgroundTransparency = 0.15
    Frame.BorderSizePixel = 0x0
    Frame.Active = true
    Frame.Draggable = true
    Frame.AutomaticSize = Enum.AutomaticSize.Y
    Frame.Parent = TrackerGui
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(60, 0x3c, 0x44);
    Stroke.Thickness = 1
    local Padding = Instance.new("UIPadding", Frame)
    Padding.PaddingTop = UDim.new(0x0, 0xa);
    Padding.PaddingBottom = UDim.new(0x0, 0xa)
    Padding.PaddingLeft = UDim.new(0x0, 12);
    Padding.PaddingRight = UDim.new(0x0, 12)
    local List = Instance.new("UIListLayout", Frame)
    List.Padding = UDim.new(0x0, 0x7);
    List.SortOrder = Enum.SortOrder.LayoutOrder
    local H = Instance.new("Frame", Frame)
    H.Size = UDim2.new(1, 0x0, 0, 0x24);
    H.BackgroundTransparency = 1;
    H.LayoutOrder = 0x1
    local Img = Instance.new("ImageLabel", H)
    Img.Size = UDim2.new(0x0, 0x20, 0x0, 0x20);
    Img.Position = UDim2.new(0, 0x0, 0.5, - 0x10)
    Img.BackgroundTransparency = 0x1;
    Img.Image = "rbxassetid://84070081307966"
    Img.ScaleType = Enum.ScaleType.Fit;
    Img.ZIndex = 0x2
    Instance.new("UICorner", Img).CornerRadius = UDim.new(0x0, 0x7)
    local TitleLbl = Instance.new("TextLabel", H)
    TitleLbl.Size = UDim2.new(0x1, - 0x28, 0, 14);
    TitleLbl.Position = UDim2.new(0x0, 0x28, 0x0, 0x4)
    TitleLbl.BackgroundTransparency = 1;
    TitleLbl.Text = "KING AKBAR"
    TitleLbl.TextColor3 = Color3.fromRGB(0xd2, 210, 0xd7);
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextSize = 0xd;
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
    local SubLbl = Instance.new("TextLabel", H)
    SubLbl.Size = UDim2.new(0x1, - 0x28, 0, 0xb);
    SubLbl.Position = UDim2.new(0x0, 0x28, 0, 20)
    SubLbl.BackgroundTransparency = 0x1
    SubLbl.Text = State.IsPoliceActive and "Police Duty"
    or (State.IsRideGOActive and "RideGO Driver"
    or (State.IsCourierActive and "Courier Express"
    or (State.IsBaristaActive and "Barista"
    or (State.IsOfficeActive and "Office Worker" or "Bypass GACOR"))))
    SubLbl.TextColor3 = Color3.fromRGB(90, 90, 100);
    SubLbl.Font = Enum.Font.Gotham
    SubLbl.TextSize = 0x9;
    SubLbl.TextXAlignment = Enum.TextXAlignment.Left
    local Div = Instance.new("Frame", Frame)
    Div.Size = UDim2.new(1, 0, 0, 1);
    Div.BackgroundColor3 = Color3.fromRGB(0x37, 0x37, 0x3e)
    Div.BorderSizePixel = 0;
    Div.LayoutOrder = 2
    local function baris(iconL, labelL, iconR, labelR, order)
        local R = Instance.new("Frame", Frame)
        R.Size = UDim2.new(0x1, 0, 0x0, 0x22);
        R.BackgroundTransparency = 1;
        R.LayoutOrder = order
        local function kolom(parent, xOffset, icon, caption)
            local bg = Instance.new("Frame", parent)
            bg.Size = UDim2.new(0.5, - 4, 1, 0x0);
            bg.Position = UDim2.new(xOffset, 0, 0x0, 0x0)
            bg.BackgroundColor3 = Color3.fromRGB(30, 30, 0x24);
            bg.BackgroundTransparency = 0.4
            bg.BorderSizePixel = 0x0
            Instance.new("UICorner", bg).CornerRadius = UDim.new(0x0, 0x6)
            local capLbl = Instance.new("TextLabel", bg)
            capLbl.Size = UDim2.new(1, - 0x6, 0x0, 0xb);
            capLbl.Position = UDim2.new(0, 6, 0x0, 0x4)
            capLbl.BackgroundTransparency = 0x1;
            capLbl.Text = icon .. " " .. caption
            capLbl.TextColor3 = Color3.fromRGB(0x6e, 0x6e, 0x78);
            capLbl.Font = Enum.Font.GothamMedium
            capLbl.TextSize = 9;
            capLbl.TextXAlignment = Enum.TextXAlignment.Left
            local valLbl = Instance.new("TextLabel", bg)
            valLbl.Size = UDim2.new(1, - 0x6, 0, 0xe);
            valLbl.Position = UDim2.new(0x0, 6, 0x1, - 0x12)
            valLbl.BackgroundTransparency = 0x1;
            valLbl.Text = "—"
            valLbl.TextColor3 = Color3.fromRGB(225, 0xe1, 0xe6);
            valLbl.Font = Enum.Font.GothamBold
            valLbl.TextSize = 11;
            valLbl.TextXAlignment = Enum.TextXAlignment.Left
            return valLbl, capLbl
        end
        local lv, lc = kolom(R, 0x0, iconL, labelL)
        local rv, rc = kolom(R, 0.5, iconR, labelR)
        return lv, rv, lc, rc
    end
    local v_initial, v_profit = baris("💵", "Initial", "💰", "Profit", 3)
    local v_stat1, v_stat2, c_stat1, c_stat2 = baris(State.IsPoliceActive and "🚓"
    or (State.IsRideGOActive and "🚕"
    or (State.IsCourierActive and "📦"
    or (State.IsBaristaActive and "☕" or "📝"))), State.IsPoliceActive and "Missions"
    or (State.IsRideGOActive and "Trips"
    or (State.IsCourierActive and "Delivered"
    or (State.IsBaristaActive and "Sold" or "Solved"))), State.IsPoliceActive and "🔄"
    or (State.IsRideGOActive and "💵"
    or (State.IsCourierActive and "🔄"
    or (State.IsBaristaActive and "🔧" or "🖨️"))), State.IsPoliceActive and "Phase"
    or (State.IsRideGOActive and "Fares"
    or (State.IsCourierActive and "Status"
    or (State.IsBaristaActive and "Fixes" or "Prints"))), 0x4)
    local v_profitH, v_ping = baris("⚡", "Profit/H", "📶", "Ping", 0x5)
    local v_fps, v_uptime = baris("🎮", "FPS", "⏱️", "Uptime", 0x6)
    local CLR_WHITE = Color3.fromRGB(0xe1, 0xe1, 0xe6)
    local CLR_GREEN = Color3.fromRGB(0x50, 0xd2, 120)
    local CLR_RED = Color3.fromRGB(0xe6, 0x50, 80)
    local CLR_YELLOW = Color3.fromRGB(230, 0xbe, 0x3c)
    v_initial.Text = fmtRupiah(uangAwal)
    task.spawn(function()
        while TrackerGui and TrackerGui.Parent do
            pcall(function()
                local currentMoney = DapatkanUangPemain()
                if uangAwal == 0x0 and currentMoney > 0 then
                    getgenv().UangAwalDikunci = currentMoney
                    uangAwal = currentMoney
                    v_initial.Text = fmtRupiah(uangAwal)
                end
                local profit = currentMoney - uangAwal
                local uptimeDetik = tick() - getgenv().WaktuMulai
                local uptimeJam = math.max(uptimeDetik / 0xe10, 1 / 3600)
                local profitH = profit / uptimeJam
                local fpsVal = EngineStats.FPS
                local pingVal = EngineStats.Ping
                animateValue(v_profit, profit, fmtProfit, CLR_GREEN, CLR_RED, nil)
                if State.IsPoliceActive then
                    SubLbl.Text = "Police Duty"
                    c_stat1.Text = "🚓 Missions"
                    c_stat2.Text = "🔄 Phase"
                    animateValue(v_stat1, State.PoliceMissions or 0x0, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                    v_stat2.Text = State.PolicePhase or "Idle"
                    v_stat2.TextColor3 = CLR_GREEN
                elseif State.IsRideGOActive then
                    SubLbl.Text = "RideGO Driver"
                    c_stat1.Text = "🚕 Trips"
                    c_stat2.Text = "💵 Fares"
                    local trips = State.RideGOTripCount or 0x0
                    local fares = State.RideGOEarnings or 0
                    animateValue(v_stat1, trips, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                    animateValue(v_stat2, fares, fmtShort, nil, nil, CLR_WHITE)
                elseif State.IsCourierActive then
                    SubLbl.Text = "Courier Express"
                    c_stat1.Text = "📦 Delivered"
                    c_stat2.Text = "🔄 Status"
                    local delivered = State.CourierDelivered or 0x0
                    animateValue(v_stat1, delivered, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                    v_stat2.Text = State.CourierPhase or "Idle"
                    v_stat2.TextColor3 = CLR_GREEN
                elseif State.IsBaristaActive then
                    SubLbl.Text = "Barista"
                    c_stat1.Text = "☕ Sold"
                    c_stat2.Text = "🔧 Fixes"
                    local sold = State.OrderCount or 0x0
                    local fixes = State.MachineFixCount or 0x0
                    animateValue(v_stat1, sold, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                    animateValue(v_stat2, fixes, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                else
                    SubLbl.Text = State.IsOfficeActive and "Office Worker" or "Bypass GACOR"
                    c_stat1.Text = "📝 Solved"
                    c_stat2.Text = "🖨️ Prints"
                    local solved = State.OfficeMathSolved or 0x0
                    local prints = State.OfficePrints or 0x0
                    animateValue(v_stat1, solved, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                    animateValue(v_stat2, prints, function(n)
                        return tostring(math.floor(n))
                    end, nil, nil, CLR_WHITE)
                end
                animateValue(v_profitH, profitH, fmtShort, CLR_GREEN, CLR_RED, nil)
                animateValue(v_ping, pingVal, function(n)
                    return tostring(math.floor(n)) .. " ms"
                end, nil, nil, pingVal > 0xc8 and CLR_RED or CLR_WHITE)
                local fpsColor = fpsVal >= 0x1e and CLR_GREEN
                or (fpsVal >= 0xf and CLR_YELLOW or CLR_RED)
                animateValue(v_fps, fpsVal, function(n)
                    return tostring(math.floor(n))
                end, nil, nil, fpsColor)
                v_uptime.Text = formatTime(uptimeDetik)
                v_uptime.TextColor3 = CLR_WHITE
                if State.TargetProfit > 0x0 and profit >= State.TargetProfit then
                    State.IsOfficeActive = false
                    State.IsBaristaActive = false
                    State.IsCourierActive = false
                    State.IsRideGOActive = false
                    State.IsPoliceActive = false
                    getgenv().fullAuto = false
                    UIFeedback:Notify({
                        Title = "Target Tercapai",
                        Content = "Profit " .. fmtProfit(profit) .. " dari target " .. fmtRupiah(State.TargetProfit) .. ", keluar sekarang.",
                        Duration = 0x4,
                    })
                    task.wait(0x3)
                    pcall(function()
                        local firstPlr = game:GetService("Players"):FindFirstChildOfClass("Player")
                        if firstPlr then
                            firstPlr.Parent = nil
                        end
                    end)
                end
            end)
            task.wait(0.2)
        end
    end)
end
local function matikanMonitoring()
    if TrackerGui and TrackerGui.Parent then
        TrackerGui:Destroy();
        TrackerGui = nil
    end
end
local function StartBaristaScript()
    if State.IsBaristaActive then
        return
    end
    State.IsBaristaActive = true
    State.MachineFixCount = 0
    State.OrderCount = 0x0
    State.DebugTapCount = 0
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    getgenv().WaktuMulai = tick()
    buatMonitoringGUI()
    if State.DebugEnabled then
        CreateDebugOverlay()
    end
    task.spawn(function()
        RefreshBaristaRefs()
        StartMinigameAI()
        BaristaFarmLoop()
    end)
    UIFeedback:Notify({
        Title = "☕ Auto Barista",
        Content = "Auto Barista & Monitoring Aktif!",
        Duration = 0x3
    })
end
local function StopBaristaScript()
    State.IsBaristaActive = false
    State.StatusText = "Idling..."
    State.DebugMinigameActive = false
    focusCameraZoom(false)
    if CharRef.Humanoid and CharRef.Root then
        CharRef.Humanoid:MoveTo(CharRef.Root.Position)
    end
    DestroyDebugOverlay()
    matikanMonitoring()
    UIFeedback:Notify({
        Title = "🛑 Auto Barista",
        Content = "Auto Barista Dihentikan.",
        Duration = 0x3
    })
end
local function StartOfficeScript()
    if State.IsOfficeActive then
        return
    end
    State.IsOfficeActive = true
    State.OfficeMathSolved = 0x0
    State.OfficePrints = 0
    getgenv().fullAuto = true
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    getgenv().WaktuMulai = tick()
    joinOfficeTeam()
    task.wait(0.8)
    if not CharRef.Humanoid or not CharRef.Humanoid.SeatPart then
        UIFeedback:Notify({
            Title = "🔍 Office",
            Content = "Finding seat...",
            Duration = 0x3
        })
        local targetSeat = findOfficeSeat(nil)
        if targetSeat then
            myChair = targetSeat
            dudukKeKursi(true)
        else
            UIFeedback:Notify({
                Title = "⚠️ Office",
                Content = "No empty seat found! Sit manually.",
                Duration = 0x5
            })
        end
    else
        myChair = CharRef.Humanoid.SeatPart
    end
    lastActivityTime = tick()
    buatMonitoringGUI()
    UIFeedback:Notify({
        Title = "✅ Office",
        Content = "Auto Office started!",
        Duration = 4
    })
end
local function StopOfficeScript()
    State.IsOfficeActive = false
    getgenv().fullAuto = false
    getgenv().forceStopMath = false
    getgenv().isGoingToPrinter = false
    pcall(function()
        local JobEvents2 = Services.ReplicatedStorage:WaitForChild("JobEvents", 0xa)
        if not JobEvents2 then
            return
        end
        local pjc = JobEvents2:WaitForChild("PlayerChangedJob", 0x5)
        if pjc then
            pjc:FireServer()
        end
    end)
    if CharRef.Humanoid then
        CharRef.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    end
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    matikanMonitoring()
    UIFeedback:Notify({
        Title = "🛑 Office",
        Content = "Auto Office stopped.",
        Duration = 0x3
    })
end
SELECTED_CAR = nil
OwnedVehiclesList = {
}
VehicleDropdownCourier = nil
VehicleDropdownRideGO = nil
VehicleDropdownPolice = nil
local function parseVehicleCandidate(item, outMap)
    if not item then
        return
    end
    if type(item) == "string" and # item > 1 then
        local low = item:lower()
        if not low:find("slot") and not low:find("frame") and not low:find("button") and not low:find("package") then
            outMap[item] = true
        end
    elseif type(item) == "table" then
        local carName = item.Name or item.Car or item.CarName or item.Vehicle or item.Model
        if carName and type(carName) == "string" and # carName > 0x1 then
            local low = carName:lower()
            if not low:find("slot") and not low:find("frame") then
                outMap[carName] = true
            end
        end
    end
end
function FetchOwnedVehicles()
    local foundMap = {
    }
    local RS = game:GetService("ReplicatedStorage")
    local DealershipEvents = RS:FindFirstChild("DealershipEvents")
    if DealershipEvents then
        if DealershipEvents:FindFirstChild("InitializeCarData") then
            pcall(function()
                local res = DealershipEvents.InitializeCarData:InvokeServer()
                if type(res) == "table" then
                    for _, entry in pairs(res) do
                        parseVehicleCandidate(entry, foundMap)
                    end
                end
            end)
        end
        if DealershipEvents:FindFirstChild("GetInfoCarSlot") then
            pcall(function()
                local slotRes = DealershipEvents.GetInfoCarSlot:InvokeServer()
                if type(slotRes) == "table" then
                    for _, entry in pairs(slotRes) do
                        parseVehicleCandidate(entry, foundMap)
                    end
                end
            end)
            for i = 0x1, 0x1e do
                pcall(function()
                    local slotRes = DealershipEvents.GetInfoCarSlot:InvokeServer(i)
                    if type(slotRes) == "table" then
                        parseVehicleCandidate(slotRes, foundMap)
                    end
                end)
            end
        end
    end
    pcall(function()
        if not getgc then
            return
        end
        for _, tbl in pairs(getgc(true)) do
            if type(tbl) == "table" and rawget(tbl, 0x1) and type(rawget(tbl, 0x1)) == "table" then
                local first = rawget(tbl, 0x1)
                if rawget(first, "Horsepower") and rawget(first, "Name") and rawget(first, "FinalDrive") then
                    for _, carData in ipairs(tbl) do
                        if type(carData) == "table" and carData.Name then
                            foundMap[carData.Name] = true
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        if not (getgc and getupvalues) then
            return
        end
        for _, fn in pairs(getgc()) do
            if type(fn) == "function" and (not isexecutorclosure or not isexecutorclosure(fn)) then
                local ok, ups = pcall(getupvalues, fn)
                if ok and type(ups) == "table" then
                    for _, up in pairs(ups) do
                        if type(up) == "table" and # up > 0 then
                            local sample = up[0x1]
                            if type(sample) == "table" and sample.Name and sample.Horsepower then
                                for _, c in ipairs(up) do
                                    if type(c) == "table" and c.Name then
                                        foundMap[c.Name] = true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        for _, fName in ipairs({
            "Data",
            "Cars",
            "Garage",
            "Vehicles",
            "OwnedCars"
        }) do
            local folder = LocalPlayer:FindFirstChild(fName)
            if folder then
                for _, child in ipairs(folder:GetChildren()) do
                    if child:IsA("StringValue") and # child.Value > 0x1 then
                        foundMap[child.Value] = true
                    elseif not child:IsA("Folder") then
                        foundMap[child.Name] = true
                    end
                end
            end
        end
    end)
    local unique = {
    }
    for carName, _ in pairs(foundMap) do
        if type(carName) == "string" and # carName > 1 and carName ~= "None" and carName ~= "Empty" then
            table.insert(unique, carName)
        end
    end
    table.sort(unique)
    if # unique > 0 then
        OwnedVehiclesList = unique
        if not foundMap[SELECTED_CAR] then
            SELECTED_CAR = OwnedVehiclesList[1]
        end
    else
        OwnedVehiclesList = {
            "Tidak ada kendaraan terdeteksi"
        }
        SELECTED_CAR = nil
    end
    return OwnedVehiclesList
end
function RefreshAllVehicleDropdowns()
    local cars = FetchOwnedVehicles()
    local validCars = (cars[1] ~= "Tidak ada kendaraan terdeteksi") and cars or {
    }
    pcall(function()
        if VehicleDropdownCourier then
            if VehicleDropdownCourier.Refresh then
                VehicleDropdownCourier:Refresh(validCars)
            elseif VehicleDropdownCourier.SetValues then
                VehicleDropdownCourier:SetValues(validCars)
            end
        end
        if VehicleDropdownRideGO then
            if VehicleDropdownRideGO.Refresh then
                VehicleDropdownRideGO:Refresh(validCars)
            elseif VehicleDropdownRideGO.SetValues then
                VehicleDropdownRideGO:SetValues(validCars)
            end
        end
        if VehicleDropdownPolice then
            if VehicleDropdownPolice.Refresh then
                VehicleDropdownPolice:Refresh(validCars)
            elseif VehicleDropdownPolice.SetValues then
                VehicleDropdownPolice:SetValues(validCars)
            end
        end
    end)
    return cars
end
local function isVehicleMine(v)
    if not (v and v:IsA("Model")) then
        return false
    end
    local myName = LocalPlayer.Name
    local vName = v.Name
    local ownerAttr = v:GetAttribute("Owner") or v:GetAttribute("Player") or v:GetAttribute("Creator")
    if ownerAttr and (tostring(ownerAttr) == myName or tostring(ownerAttr) == tostring(LocalPlayer.UserId)) then
        return true
    end
    local ownerVal = v:FindFirstChild("Owner") or v:FindFirstChild("Player")
    if ownerVal and (ownerVal:IsA("StringValue") or ownerVal:IsA("ObjectValue")) then
        if tostring(ownerVal.Value) == myName or ownerVal.Value == LocalPlayer then
            return true
        end
    end
    local seat = v:FindFirstChildOfClass("VehicleSeat") or v:FindFirstChild("DriveSeat", true)
    if seat and seat.Occupant and CharRef.Humanoid and seat.Occupant == CharRef.Humanoid then
        return true
    end
    if vName:find(myName, 1, true) then
        return true
    end
    if SELECTED_CAR and vName:find(SELECTED_CAR, 1, true) then
        for _, plr in ipairs(Services.Players:GetPlayers()) do
            if plr ~= LocalPlayer and vName:find(plr.Name, 1, true) then
                return false
            end
        end
        return true
    end
    return false
end
local function findMyMotor()
    for _, v in pairs(workspace:GetChildren()) do
        if isVehicleMine(v) and (v:FindFirstChildOfClass("VehicleSeat") or v:FindFirstChild("DriveSeat", true)) then
            return v
        end
    end
    local vFolder = workspace:FindFirstChild("Cars") or workspace:FindFirstChild("Vehicles")
    if vFolder then
        for _, v in pairs(vFolder:GetChildren()) do
            if isVehicleMine(v) then
                return v
            end
        end
    end
    return nil
end
local function getMovers(primary)
    if not primary then
        return nil, nil
    end
    local bv = primary:FindFirstChild("RideGO_BV")
    if not bv then
        bv = Instance.new("BodyVelocity")
        bv.Name = "RideGO_BV"
        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bv.Velocity = Vector3.zero
        bv.Parent = primary
    end
    local bg = primary:FindFirstChild("RideGO_BG")
    if not bg then
        bg = Instance.new("BodyGyro")
        bg.Name = "RideGO_BG"
        bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bg.P = 3000
        bg.D = 0x1f4
        bg.CFrame = primary.CFrame
        bg.Parent = primary
    end
    return bv, bg
end
local function setPassengerCollision(enableCollisions)
    local bike = getBikeModel()
    if bike then
        for _, seat in ipairs(bike:GetDescendants()) do
            if seat:IsA("VehicleSeat") and seat.Occupant then
                local passenger = seat.Occupant.Parent
                if passenger then
                    for _, part in ipairs(passenger:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = enableCollisions
                        end
                    end
                end
            end
        end
    end
    local activeMissions = Services.Workspace:FindFirstChild("ActiveMissions")
    if activeMissions then
        for _, mission in ipairs(activeMissions:GetChildren()) do
            if mission.Name:find("RideGO_Passenger") then
                for _, part in ipairs(mission:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = enableCollisions
                    end
                end
            end
        end
    end
end
Services.RunService.Stepped:Connect(function()
    if State.IsRideGOActive or State.IsCourierActive or State.IsPoliceActive then
        pcall(function()
            if CharRef.Character then
                for _, part in ipairs(CharRef.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            local bike = getBikeModel() or findMyMotor()
            if bike then
                for _, part in ipairs(bike:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            setPassengerCollision(false)
            local activeMissions = Services.Workspace:FindFirstChild("ActiveMissions")
            if activeMissions then
                for _, inst in ipairs(activeMissions:GetDescendants()) do
                    if inst:IsA("BasePart") and inst.Name == "Batas" then
                        inst.CanCollide = false
                        inst.CanQuery = false
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while true do
        task.wait(0.5)
        if (State.IsRideGOActive or State.IsCourierActive or State.IsPoliceActive) then
            local isDoingVehicleDuty = false
            if State.IsRideGOActive and State.RideGOPhase ~= "idle" and State.RideGOPhase ~= "cycling" then
                isDoingVehicleDuty = true
            elseif State.IsCourierActive and (State.CourierPhase == "Ke Depot" or State.CourierPhase == "Antar Paket") then
                isDoingVehicleDuty = true
            elseif State.IsPoliceActive and (State.PolicePhase == "Heading to Police Station" or State.PolicePhase == "En Route") then
                isDoingVehicleDuty = true
            end
            if isDoingVehicleDuty then
                local hum = CharRef.Humanoid
                local root = CharRef.Root
                local seat = State.LastSeat
                if hum and hum.Health > 0 and not hum.SeatPart and seat and seat.Parent and root then
                    zeroVelocity(root)
                    root.CFrame = seat.CFrame * CFrame.new(0, 0x2, 0x0)
                    local ok = pcall(function()
                        seat:Sit(hum)
                    end)
                    if not ok then
                        pcall(function()
                            hum.Sit = true
                        end)
                    end
                    task.wait(0x1)
                end
            end
        end
    end
end)
local DealershipEvents = Services.ReplicatedStorage:WaitForChild("DealershipEvents", 0xa)
local SpawnCarEvents = Services.ReplicatedStorage:WaitForChild("SpawnCarEvents", 0xa)
local function spawnAndMountBike()
    if not SELECTED_CAR then
        FetchOwnedVehicles()
    end
    if not SELECTED_CAR then
        return nil
    end
    if not SpawnCarEvents then
        return getBikeModel()
    end
    pcall(function()
        if SpawnCarEvents:FindFirstChild("DespawnCar") then
            SpawnCarEvents.DespawnCar:FireServer()
        elseif SpawnCarEvents:FindFirstChild("RemoveCar") then
            SpawnCarEvents.RemoveCar:FireServer()
        end
    end)
    task.wait(0.8)
    pcall(function()
        if DealershipEvents then
            if DealershipEvents:FindFirstChild("InitializeCarData") then
                DealershipEvents.InitializeCarData:InvokeServer()
            end
            if DealershipEvents:FindFirstChild("GetInfoCarSlot") then
                DealershipEvents.GetInfoCarSlot:InvokeServer()
            end
        end
        if SpawnCarEvents:FindFirstChild("SpawnCar") then
            SpawnCarEvents.SpawnCar:FireServer(SELECTED_CAR)
        end
    end)
    local seatFound = nil
    local timeout = tick() + 8
    while tick() < timeout and not seatFound do
        task.wait(0.2)
        if CharRef.Root then
            for _, model in ipairs(Services.Workspace:GetChildren()) do
                if model:IsA("Model") and isVehicleMine(model) then
                    local seat = model:FindFirstChildOfClass("VehicleSeat") or model:FindFirstChild("DriveSeat", true)
                    if seat and (not seat.Occupant or seat.Occupant == CharRef.Humanoid) then
                        local dist = (seat.Position - CharRef.Root.Position).Magnitude
                        if dist < 0x64 then
                            seatFound = seat
                            break
                        end
                    end
                end
            end
        end
    end
    if seatFound and CharRef.Humanoid and CharRef.Root then
        zeroVelocity(CharRef.Root)
        CharRef.Root.CFrame = seatFound.CFrame
        task.wait(0.1)
        seatFound:Sit(CharRef.Humanoid)
        task.wait(0.5)
        if CharRef.Humanoid.SeatPart ~= seatFound then
            CharRef.Root.CFrame = seatFound.CFrame
            task.wait(0.1)
            seatFound:Sit(CharRef.Humanoid)
            task.wait(0.5)
        end
        local primary = seatFound.Parent.PrimaryPart or seatFound
        getMovers(primary)
        return seatFound.Parent
    end
    return getBikeModel()
end
local function ensureBike()
    if not SELECTED_CAR then
        FetchOwnedVehicles()
        if not SELECTED_CAR then
            UIFeedback:Notify({
                Title = "⚠️ Garasi Kosong",
                Content = "Pilih kendaraan di garasi terlebih dahulu!",
                Duration = 4
            })
            return nil
        end
    end
    local bike = getBikeModel()
    if bike and isVehicleMine(bike) and CharRef.Humanoid and CharRef.Humanoid.SeatPart then
        local primary = getPrimary(bike)
        if primary then
            getMovers(primary)
        end
        return bike
    end
    local existing = findMyMotor()
    if existing and CharRef.Root and CharRef.Humanoid then
        local seat = existing:FindFirstChildOfClass("VehicleSeat") or existing:FindFirstChild("DriveSeat", true)
        if seat and (not seat.Occupant or seat.Occupant == CharRef.Humanoid) then
            local dist = (seat.Position - CharRef.Root.Position).Magnitude
            if dist < 0x64 then
                zeroVelocity(CharRef.Root)
                CharRef.Root.CFrame = seat.CFrame
                task.wait(0.1)
                seat:Sit(CharRef.Humanoid)
                task.wait(0.5)
                local primary = existing.PrimaryPart or seat
                getMovers(primary)
                return existing
            end
        end
    end
    return spawnAndMountBike()
end
local MAX_SPEED_LIMIT = 230
local HOVER_HEIGHT = 0xc
local LAND_HEIGHT = 0x3
local VOID_TP_STEP_DIST = 300
local VOID_TP_MAX_STEPS = 0x28
local VOID_TP_STEP_WAIT = 0.1
local VOID_LOOK_MARGIN = 150
local VOID_SCAN_STEP = 50
local VOID_SCAN_INTERVAL = 0.12
local RAY_ABOVE = 0x3e8
local RAY_LENGTH = 0x1388
local ACCEL = 0x5a
local BRAKE_DECEL = 0x3c
local BRAKE_PROFILE = 0.75
local BRAKE_JERK = 0x50
local BRAKE_SAFETY = 1.12
local MIN_CRAWL_SPEED = 0x6
local ARRIVE_DIST = 0x5
local SNAP_DIST = 0x3
local PASS_DETECT_DIST = 0x19
local PASS_DETECT_MARGIN = 3
local TURN_SMOOTH = 0.12
local DOWN_VECTOR = Vector3.new(0x0, - 0x3e8, 0)
local GROUND_OFFSETS = {
    Vector3.new(0x0, 0x0, 0x0),
    Vector3.new(0x0, 0, 10),
    Vector3.new(0x0, 0x0, - 10),
    Vector3.new(10, 0, 0),
    Vector3.new( - 10, 0x0, 0x0),
}
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
local lastRayParamsBuild = 0
local function buildGroundBlacklist()
    local blacklist = {
    }
    if LocalPlayer.Character then
        table.insert(blacklist, LocalPlayer.Character)
    end
    local bike = getBikeModel()
    if bike then
        table.insert(blacklist, bike)
        for _, seat in ipairs(bike:GetDescendants()) do
            if seat:IsA("VehicleSeat") and seat.Occupant then
                table.insert(blacklist, seat.Occupant.Parent)
            end
        end
    end
    local activeMissions = Services.Workspace:FindFirstChild("ActiveMissions")
    if activeMissions then
        table.insert(blacklist, activeMissions)
    end
    return blacklist
end
local function refreshRayParams(force)
    local now = os.clock()
    if not force and now - lastRayParamsBuild < 0.5 then
        return
    end
    lastRayParamsBuild = now
    rayParams.FilterDescendantsInstances = buildGroundBlacklist()
end
local function findGroundY(origin)
    refreshRayParams(false)
    local highestY = nil
    for i = 1, # GROUND_OFFSETS do
        local rayResult = Services.Workspace:Raycast(origin + GROUND_OFFSETS[i], DOWN_VECTOR, rayParams)
        if rayResult then
            if not highestY or rayResult.Position.Y > highestY then
                highestY = rayResult.Position.Y
            end
        end
    end
    return highestY
end
local function hasGroundAt(origin)
    refreshRayParams(false)
    for i = 1, # GROUND_OFFSETS do
        if Services.Workspace:Raycast(origin + GROUND_OFFSETS[i], DOWN_VECTOR, rayParams) then
            return true
        end
    end
    return false
end
local function findLandingY(origin)
    refreshRayParams(false)
    local startPos = Vector3.new(origin.X, origin.Y + RAY_ABOVE, origin.Z)
    local rayResult = Services.Workspace:Raycast(startPos, Vector3.new(0x0, - RAY_LENGTH, 0), rayParams)
    return rayResult and rayResult.Position.Y or nil
end
local function pivotKeepYaw(bike, position)
    local _, yaw, _ = bike:GetPivot():ToOrientation()
    bike:PivotTo(CFrame.new(position) * CFrame.Angles(0x0, yaw, 0))
end
local function isFlightAllowed()
    return State.IsRideGOActive or State.IsCourierActive or State.IsPoliceActive
end
local function brakeSpeedCap(distToStop)
    if distToStop <= 0x0 then
        return 0x0
    end
    local a = BRAKE_DECEL * BRAKE_PROFILE
    local r = BRAKE_DECEL / BRAKE_JERK
    local ar = a * r
    local v = ( - ar + math.sqrt(ar * ar + 8 * a * distToStop)) / 2
    return math.max(v, 0x0)
end
local function flyToTarget(targetPos)
    local bike = ensureBike() or getBikeModel()
    if not bike then
        return false
    end
    local primary = getPrimary(bike)
    if not primary then
        return false
    end
    pcall(function()
        bike:SetNetworkOwner(LocalPlayer)
    end)
    setRagdollStates(false)
    refreshRayParams(true)
    local bv, bg = getMovers(primary)
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.zero
    zeroVelocity(primary)
    bg.CFrame = bike:GetPivot()
    local reached = false
    local flatTarget = Vector3.new(targetPos.X, 0x0, targetPos.Z)
    local minSpd, maxSpd = 70, 0x5f
    if State.IsRideGOActive then
        minSpd = tonumber(State.RideGOMinSpeed) or 0x46
        maxSpd = tonumber(State.RideGOMaxSpeed) or 0x5f
    elseif State.IsCourierActive then
        minSpd = tonumber(State.CourierMinSpeed) or 70
        maxSpd = tonumber(State.CourierMaxSpeed) or 0x5f
    elseif State.IsPoliceActive then
        minSpd = tonumber(State.PoliceMinSpeed) or 0x46
        maxSpd = tonumber(State.PoliceMaxSpeed) or 0x5f
    end
    if minSpd > maxSpd then
        minSpd, maxSpd = maxSpd, minSpd
    end
    local baseSpeed = math.random(math.floor(minSpd), math.floor(maxSpd))
    local curSpeed = 0x0
    local moveDir = Vector3.zero
    local smoothedLook = bike:GetPivot()
    local curDecel = 0x0
    local jitterMul = 0x1
    local nextJitterAt = 0x0
    local nextVoidScanAt = 0
    local minDist = math.huge
    local function crossVoid(startPos, dir, voidStartDist)
        local voidGuard = 0
        local voidDecel = curDecel
        while curSpeed > 0x1 and voidGuard < 0x190 do
            voidGuard += 1
            if not bv.Parent then
                break
            end
            local stepDt = math.clamp(Services.RunService.Heartbeat:Wait(), 0.005, 0.1)
            voidDecel = math.min(voidDecel + BRAKE_JERK * stepDt, BRAKE_DECEL)
            curSpeed = math.max(curSpeed - voidDecel * stepDt, 0x0)
            bv.Velocity = Vector3.new(dir.X * curSpeed, 0, dir.Z * curSpeed)
        end
        curSpeed = 0
        curDecel = 0x0
        if bv.Parent then
            bv.Velocity = Vector3.zero
        end
        zeroVelocity(primary)
        task.wait(0.3)
        if not isFlightAllowed() then
            return false
        end
        local safeStopPos = startPos + dir * math.max(0x0, voidStartDist - 20)
        local safeStopY = findGroundY(safeStopPos) or startPos.Y
        pivotKeepYaw(bike, Vector3.new(safeStopPos.X, safeStopY + HOVER_HEIGHT, safeStopPos.Z))
        zeroVelocity(primary)
        if CharRef.Root then
            zeroVelocity(CharRef.Root)
        end
        smoothedLook = bike:GetPivot()
        bg.CFrame = smoothedLook
        task.wait(0.2)
        local stepPos = Vector3.new(safeStopPos.X, safeStopY + HOVER_HEIGHT, safeStopPos.Z)
        local landedOnGround = false
        local distToTargetFlat = (Vector3.new(stepPos.X, 0x0, stepPos.Z) - flatTarget).Magnitude
        for step = 1, VOID_TP_MAX_STEPS do
            if not isFlightAllowed() then
                return false
            end
            local stepDist = math.min(VOID_TP_STEP_DIST, distToTargetFlat)
            if stepDist < 5 then
                break
            end
            local nextPos = stepPos + dir * stepDist
            local groundYAtNext = findLandingY(nextPos)
            local landPos
            if groundYAtNext then
                landPos = Vector3.new(nextPos.X, groundYAtNext + HOVER_HEIGHT, nextPos.Z)
                landedOnGround = true
            else
                landPos = Vector3.new(nextPos.X, stepPos.Y, nextPos.Z)
            end
            pivotKeepYaw(bike, landPos)
            zeroVelocity(primary)
            if CharRef.Root then
                zeroVelocity(CharRef.Root)
            end
            smoothedLook = bike:GetPivot()
            bg.CFrame = smoothedLook
            task.wait(VOID_TP_STEP_WAIT)
            stepPos = landPos
            distToTargetFlat = (Vector3.new(stepPos.X, 0x0, stepPos.Z) - flatTarget).Magnitude
            if landedOnGround then
                break
            end
        end
        if not landedOnGround then
            local safeY = (findLandingY(targetPos) or targetPos.Y) + HOVER_HEIGHT
            pivotKeepYaw(bike, Vector3.new(targetPos.X, safeY, targetPos.Z))
            zeroVelocity(primary)
            if CharRef.Root then
                zeroVelocity(CharRef.Root)
            end
            smoothedLook = bike:GetPivot()
            bg.CFrame = smoothedLook
            task.wait(VOID_TP_STEP_WAIT)
        end
        task.wait(0.2)
        return true
    end
    while isFlightAllowed() do
        local dt = math.clamp(Services.RunService.Heartbeat:Wait(), 0.005, 0.1)
        local nowTick = os.clock()
        if not bv.Parent or not bg.Parent or getPrimary(getBikeModel()) ~= primary then
            break
        end
        if CharRef.Humanoid and not CharRef.Humanoid.SeatPart then
            local b2 = ensureBike()
            if b2 then
                primary = getPrimary(b2)
                if primary then
                    bv, bg = getMovers(primary)
                end
            end
        end
        local pos = primary.Position
        local flatPos = Vector3.new(pos.X, 0, pos.Z)
        local toTarget = flatTarget - flatPos
        local flatDist = toTarget.Magnitude
        if flatDist < minDist then
            minDist = flatDist
        end
        local passedTarget = (minDist < PASS_DETECT_DIST)
        and (flatDist > minDist + PASS_DETECT_MARGIN)
        if flatDist <= ARRIVE_DIST or passedTarget then
            reached = true
            break
        end
        local dirToTarget = toTarget / flatDist
        if nowTick >= nextVoidScanAt then
            nextVoidScanAt = nowTick + VOID_SCAN_INTERVAL
            local rampTime = BRAKE_DECEL / BRAKE_JERK
            local stopDistNow = (curSpeed * curSpeed) / (2 * BRAKE_DECEL) + curSpeed * rampTime * 0.5
            local lookAheadDist = math.max(0x96, stopDistNow + VOID_LOOK_MARGIN)
            lookAheadDist = math.min(lookAheadDist, 0x3e8, flatDist)
            local voidAt = nil
            for d = VOID_SCAN_STEP, lookAheadDist, VOID_SCAN_STEP do
                if not hasGroundAt(pos + dirToTarget * d) then
                    voidAt = d
                    break
                end
            end
            if voidAt then
                if not crossVoid(pos, dirToTarget, voidAt) then
                    return false
                end
                curSpeed = 0x0
                curDecel = 0x0
                minDist = math.huge
                nextVoidScanAt = os.clock() + 0.3
                continue
            end
        end
        if nowTick >= nextJitterAt then
            jitterMul = 0x1 + (math.random( - 5, 0x5) / 0x64)
            nextJitterAt = nowTick + 1.5
        end
        local cruiseSpeed = math.min(baseSpeed * jitterMul, MAX_SPEED_LIMIT)
        local cap = math.max(brakeSpeedCap(flatDist - 0x1), MIN_CRAWL_SPEED)
        local desiredSpeed = math.min(cruiseSpeed, cap)
        if desiredSpeed >= curSpeed then
            curDecel = 0x0
            curSpeed = math.min(curSpeed + ACCEL * dt, desiredSpeed)
        else
            curDecel = math.min(curDecel + BRAKE_JERK * dt, BRAKE_DECEL)
            curSpeed = math.max(curSpeed - curDecel * dt, desiredSpeed)
            local hardCap = cap * BRAKE_SAFETY
            if curSpeed > hardCap then
                curSpeed = hardCap
            end
        end
        moveDir = dirToTarget
        local velH = moveDir * curSpeed
        local currentGroundY = findGroundY(pos)
        local targetHoverY = currentGroundY
        and (currentGroundY + HOVER_HEIGHT) or pos.Y
        local yVel = math.clamp((targetHoverY - pos.Y) * 0x4, - 0x19, 25)
        bv.Velocity = Vector3.new(velH.X, yVel, velH.Z)
        if curSpeed > 1 then
            local wantLook = CFrame.lookAt(pos, pos + Vector3.new(velH.X, 0x0, velH.Z))
            smoothedLook = smoothedLook:Lerp(wantLook, TURN_SMOOTH)
            bg.CFrame = smoothedLook
        end
    end
    if not reached then
        if bv.Parent then
            bv.Velocity = Vector3.zero
        end
        return false
    end
    local lastVel = moveDir * curSpeed
    for i = 1, 0x14 do
        if not bv.Parent then
            break
        end
        local k = 1 - i / 0x14
        bv.Velocity = Vector3.new(lastVel.X * k, 0, lastVel.Z * k)
        task.wait(0.025)
    end
    if bv.Parent then
        bv.Velocity = Vector3.zero
    end
    zeroVelocity(primary)
    local pNow = primary.Position
    local distNow = (Vector3.new(pNow.X, 0, pNow.Z) - flatTarget).Magnitude
    if distNow > SNAP_DIST then
        pivotKeepYaw(bike, Vector3.new(targetPos.X, pNow.Y, targetPos.Z))
        zeroVelocity(primary)
        if CharRef.Root then
            zeroVelocity(CharRef.Root)
        end
        smoothedLook = bike:GetPivot()
        bg.CFrame = smoothedLook
        task.wait(0.1)
    end
    local groundY = findGroundY(primary.Position)
    if groundY then
        local targetLandY = groundY + LAND_HEIGHT
        local descendGuard = 0x0
        while bv.Parent and primary.Position.Y > targetLandY + 0.5 and descendGuard < 0x64 do
            if not isFlightAllowed() then
                break
            end
            descendGuard += 1
            bv.Velocity = Vector3.new(0x0, - 0x8, 0)
            task.wait(0.1)
        end
    end
    if bv.Parent then
        bv.Velocity = Vector3.zero
    end
    zeroVelocity(primary)
    task.wait(0x1)
    return true
end
local CourierJob = {
    Name = "Courier",
    TeamId = 0xada120,
    DepotPos = Vector3.new( - 5109.06, 5.18, - 3758.69)
}
local ServiceEventConn = nil
local function setJobCourier()
    pcall(function()
        local JobEvents2 = Services.ReplicatedStorage:WaitForChild("JobEvents", 10)
        if not JobEvents2 then
            return
        end
        local tcr = JobEvents2:WaitForChild("TeamChangeRequest", 0x5)
        if tcr then
            tcr:FireServer(CourierJob.Name, CourierJob.TeamId, 0x1, 0x0, "Detector")
        end
    end)
end
local function getKotakTool()
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local ch = LocalPlayer.Character or CharRef.Character
    if ch then
        for _, t in ipairs(ch:GetChildren()) do
            if t:IsA("Tool") and (t.Name:lower():find("kotak") or t.Name:lower():find("package") or t.Name:lower():find("box")) then
                return t, true
            end
        end
    end
    if bp then
        for _, t in ipairs(bp:GetChildren()) do
            if t:IsA("Tool") and (t.Name:lower():find("kotak") or t.Name:lower():find("package") or t.Name:lower():find("box")) then
                return t, false
            end
        end
    end
    return nil, false
end
local function equipKotak()
    local tool, isEquipped = getKotakTool()
    if isEquipped then
        return tool
    end
    if tool and CharRef.Humanoid then
        CharRef.Humanoid:EquipTool(tool)
        local t0 = tick()
        while tick() - t0 < 1.5 do
            task.wait(0.1)
            local _, equippedNow = getKotakTool()
            if equippedNow then
                break
            end
        end
        return tool
    end
    return nil
end
local function startCourierLoop()
    if not SELECTED_CAR then
        FetchOwnedVehicles()
    end
    if not SELECTED_CAR then
        UIFeedback:Notify({
            Title = "⚠️ Auto Courier",
            Content = "Pilih kendaraan di garasi terlebih dahulu!",
            Duration = 0x4
        })
        State.IsCourierActive = false
        return
    end
    local activePackageLoc = nil
    local activePackageNum = nil
    local DeliverySettings = nil
    pcall(function()
        local ds = Services.ReplicatedStorage:WaitForChild("Delivery System", 0x5)
        if ds then
            local st = ds:WaitForChild("Settings", 5)
            if st then
                DeliverySettings = require(st)
            end
        end
    end)
    local courierRemote = (DeliverySettings and DeliverySettings.RemoteEvent) or Services.ReplicatedStorage:FindFirstChild("ServiceEvent", true)
    local livrasonFolder = (DeliverySettings and DeliverySettings.Folder) or workspace:FindFirstChild("Livrason")
    if courierRemote then
        ServiceEventConn = courierRemote.OnClientEvent:Connect(function(...)
            if not State.IsCourierActive then
                return
            end
            local args = {
                ...
            }
            local a1 = tostring(args[0x1] or ""):lower()
            local a2 = tostring(args[0x2] or ""):lower()
            local pNum = args[3] or args[0x2]
            local function disableAllLocationPrompts()
                if not livrasonFolder then
                    return
                end
                pcall(function()
                    local locFolder = livrasonFolder:FindFirstChild("Location")
                    if not locFolder then
                        return
                    end
                    for _, loc in ipairs(locFolder:GetChildren()) do
                        local blk = loc:FindFirstChild("Block")
                        if blk then
                            local pr = blk:FindFirstChildOfClass("ProximityPrompt")
                            if pr then
                                pr.Enabled = false
                            end
                        end
                        local pt = loc:FindFirstChild("POINT")
                        if pt then
                            local bg = pt:FindFirstChild("billboardgui")
                            if bg then
                                bg.Enabled = false
                            end
                        end
                    end
                end)
            end
            local function setActivePackage(pNumStr)
                local locFolder = livrasonFolder and livrasonFolder:FindFirstChild("Location")
                if not locFolder then
                    return
                end
                local paket = locFolder:FindFirstChild(pNumStr)
                local block = paket
                and (paket:FindFirstChild("Block") or paket:FindFirstChildWhichIsA("BasePart"))
                if block then
                    activePackageLoc = block.Position
                    activePackageNum = pNumStr
                    local pr = block:FindFirstChildOfClass("ProximityPrompt")
                    if pr then
                        pr.Enabled = true
                    end
                end
            end
            if a1 == "serviceevent" then
                if a2 == "create" and pNum then
                    disableAllLocationPrompts()
                    setActivePackage(tostring(pNum))
                elseif a2 == "remove" or a2 == "delete" or a2 == "clear" or a2 == "finish" then
                    activePackageLoc = nil
                    activePackageNum = nil
                end
            elseif a1 == "create" and pNum then
                disableAllLocationPrompts()
                setActivePackage(tostring(pNum))
            elseif a1 == "remove" or a1 == "delete" or a1 == "clear" or a1 == "finish" then
                activePackageLoc = nil
                activePackageNum = nil
            end
        end)
    end
    setJobCourier()
    setRagdollStates(false)
    task.wait(1.5)
    pcall(function()
        if courierRemote then
            courierRemote:FireServer("RequestJobUpdate")
        end
    end)
    while State.IsCourierActive do
        local hasBox = getKotakTool() ~= nil
        if hasBox and not activePackageLoc and livrasonFolder then
            pcall(function()
                local locFolder = livrasonFolder:FindFirstChild("Location")
                if locFolder then
                    for _, folder in ipairs(locFolder:GetChildren()) do
                        local block = folder:FindFirstChild("Block") or folder:FindFirstChildWhichIsA("BasePart")
                        if block then
                            local prompt = block:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                activePackageLoc = block.Position
                                activePackageNum = folder.Name
                                break
                            end
                        end
                    end
                end
            end)
        end
        if hasBox and activePackageLoc then
            State.CourierPhase = "Antar Paket"
            spawnAndMountBike()
            task.wait(0.4)
            flyToTarget(activePackageLoc)
            if not State.IsCourierActive then
                break
            end
            State.CourierPhase = "Drop Paket"
            safeDismountVehicle()
            task.wait(0.3)
            local moneyBefore = GetPlayerMoney()
            local successDrop = false
            for attempt = 0x1, 0x3 do
                if not State.IsCourierActive then
                    break
                end
                if CharRef.Root then
                    zeroVelocity(CharRef.Root)
                    CharRef.Root.CFrame = CFrame.new(activePackageLoc + Vector3.new(0x0, 1.2, 0x0))
                end
                task.wait(0.3)
                equipKotak()
                task.wait(0.2)
                local targetPrompt = nil
                local targetBlock = nil
                pcall(function()
                    local locFolder = livrasonFolder and livrasonFolder:FindFirstChild("Location")
                    local paket = locFolder and locFolder:FindFirstChild(tostring(activePackageNum))
                    if paket then
                        targetBlock = paket:FindFirstChild("Block") or paket:FindFirstChildWhichIsA("BasePart")
                        targetPrompt = targetBlock and targetBlock:FindFirstChildOfClass("ProximityPrompt")
                    end
                end)
                if not targetPrompt and livrasonFolder then
                    pcall(function()
                        local locFolder = livrasonFolder:FindFirstChild("Location")
                        if locFolder then
                            for _, f in ipairs(locFolder:GetChildren()) do
                                local blk = f:FindFirstChild("Block") or f:FindFirstChildWhichIsA("BasePart")
                                if blk and (blk.Position - CharRef.Root.Position).Magnitude < 15 then
                                    local pr = blk:FindFirstChildOfClass("ProximityPrompt")
                                    if pr and pr.Enabled then
                                        targetBlock = blk
                                        targetPrompt = pr
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end
                if targetPrompt and targetBlock then
                    DoHold(targetPrompt, targetBlock)
                end
                task.wait(0.8)
                local stillHasBox = getKotakTool() ~= nil
                local moneyNow = GetPlayerMoney()
                if not stillHasBox or moneyNow > moneyBefore then
                    successDrop = true
                    break
                end
            end
            if successDrop or (getKotakTool() == nil) then
                State.CourierDelivered = (State.CourierDelivered or 0) + 0x1
                activePackageLoc = nil
                activePackageNum = nil
                State.CourierPhase = "Terkirim!"
                State.CourierPhase = "Menunggu Paket Baru"
                local waitTimeout = tick() + 0x3c
                while State.IsCourierActive and tick() < waitTimeout do
                    task.wait(0x1)
                    if livrasonFolder then
                        pcall(function()
                            local locFolder = livrasonFolder:FindFirstChild("Location")
                            if locFolder then
                                for _, folder in ipairs(locFolder:GetChildren()) do
                                    local block = folder:FindFirstChild("Block") or folder:FindFirstChildWhichIsA("BasePart")
                                    if block then
                                        local prompt = block:FindFirstChildOfClass("ProximityPrompt")
                                        if prompt and prompt.Enabled then
                                            activePackageLoc = block.Position
                                            activePackageNum = folder.Name
                                            break
                                        end
                                    end
                                end
                            end
                        end)
                    end
                    if activePackageLoc then
                        break
                    end
                end
                task.wait(0x1)
            else
                activePackageLoc = nil
                activePackageNum = nil
                State.CourierPhase = "Reset Rute"
                task.wait(0.5)
            end
        else
            State.CourierPhase = "Ke Depot"
            spawnAndMountBike()
            task.wait(0.4)
            flyToTarget(CourierJob.DepotPos)
            if not State.IsCourierActive then
                break
            end
            State.CourierPhase = "Ambil Paket"
            safeDismountVehicle()
            task.wait(0.3)
            if CharRef.Root then
                zeroVelocity(CharRef.Root)
                CharRef.Root.CFrame = CFrame.new(CourierJob.DepotPos + Vector3.new(0x0, 1.2, 0x0))
            end
            task.wait(0.4)
            local pBox = nil
            local pPart = nil
            pcall(function()
                local takeFolder = livrasonFolder
                and (livrasonFolder:FindFirstChild("Take1") or livrasonFolder:FindFirstChild("Take"))
                if takeFolder then
                    pPart = takeFolder:FindFirstChild("Take") or takeFolder:FindFirstChild("Part") or takeFolder:FindFirstChildWhichIsA("BasePart")
                    if pPart then
                        pBox = pPart:FindFirstChildOfClass("ProximityPrompt")
                    end
                end
            end)
            if pBox and pPart then
                DoHold(pBox, pPart)
            end
            State.CourierPhase = "Menunggu..."
            local tWait = tick()
            while State.IsCourierActive and not activePackageLoc and (getKotakTool() == nil) do
                if tick() - tWait > 0x6 then
                    pcall(function()
                        if courierRemote then
                            courierRemote:FireServer("RequestJobUpdate")
                        end
                    end)
                    tWait = tick()
                end
                task.wait(0.4)
            end
        end
    end
    focusCameraZoom(false)
    if ServiceEventConn then
        ServiceEventConn:Disconnect();
        ServiceEventConn = nil
    end
end
local function StartCourierScript()
    if State.IsCourierActive then
        return
    end
    State.IsCourierActive = true
    State.CourierDelivered = 0x0
    State.CourierPhase = "Standby"
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    getgenv().WaktuMulai = tick()
    buatMonitoringGUI()
    setRagdollStates(false)
    task.spawn(startCourierLoop)
    UIFeedback:Notify({
        Title = "📦 Auto Courier",
        Content = "Auto Courier (Smooth Safe Engine) Aktif!",
        Duration = 0x3
    })
end
local function StopCourierScript()
    State.IsCourierActive = false
    State.CourierPhase = "Idle"
    if ServiceEventConn then
        ServiceEventConn:Disconnect();
        ServiceEventConn = nil
    end
    local bike = getBikeModel() or findMyMotor()
    if bike then
        local primary = getPrimary(bike)
        if primary then
            local bv = primary:FindFirstChild("RideGO_BV")
            local bg = primary:FindFirstChild("RideGO_BG")
            if bv then
                bv:Destroy()
            end
            if bg then
                bg:Destroy()
            end
            zeroVelocity(primary)
        end
    end
    setRagdollStates(true)
    focusCameraZoom(false)
    matikanMonitoring()
    UIFeedback:Notify({
        Title = "🛑 Auto Courier",
        Content = "Auto Courier Dihentikan.",
        Duration = 3
    })
end
local function InjectMesin(HP_Mult, RPM_Add, Ratio_Mult, FD_Mult, NamaMode)
    local char = game:GetService("Players").LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") and char.Humanoid.SeatPart then
        local vehicle = char.Humanoid.SeatPart.Parent
        while vehicle and not vehicle:IsA("Model") do
            vehicle = vehicle.Parent
        end
        if vehicle then
            local foundTune = false
            for _, s in pairs(vehicle:GetDescendants()) do
                if s:IsA("LocalScript") then
                    local name = string.lower(s.Name)
                    if string.find(name, "limit") or string.find(name, "speed") or string.find(name, "cap") then
                        if name ~= "a-chassis interface" and name ~= "drive" then
                            pcall(function()
                                s.Disabled = true
                            end);
                            safeDestroy(s)
                        end
                    end
                end
            end
            for _, v in pairs(vehicle:GetDescendants()) do
                if v:IsA("ModuleScript") and (v.Name == "Tune" or string.find(string.lower(v.Name), "tune")) then
                    pcall(function()
                        local tune = require(v)
                        if tune.Horsepower then
                            tune.Horsepower = tune.Horsepower * HP_Mult
                        end
                        if tune.Redline then
                            tune.Redline = tune.Redline + RPM_Add
                        end
                        if tune.Ratios then
                            for i, ratio in pairs(tune.Ratios) do
                                if type(ratio) == "number" and ratio > 0x0 then
                                    tune.Ratios[i] = ratio * Ratio_Mult
                                end
                            end
                        end
                        if tune.FinalDrive then
                            tune.FinalDrive = tune.FinalDrive * FD_Mult
                        end
                        if tune.Limiter ~= nil then
                            tune.Limiter = false
                        end
                        if tune.RevLimit then
                            tune.RevLimit = 0xf423f
                        end
                        if tune.SpeedLimit then
                            tune.SpeedLimit = false
                        end
                        if tune.TopSpeed then
                            tune.TopSpeed = 0xf423f
                        end
                        if tune.MaxSpeed then
                            tune.MaxSpeed = 0xf423f
                        end
                        if tune.DragMult then
                            tune.DragMult = tune.DragMult * 0.05
                        end
                        if tune.Weight then
                            tune.Weight = tune.Weight * 0.7
                        end
                        foundTune = true
                    end)
                end
            end
            if foundTune then
                UIFeedback:Notify({
                    Title = "✅ " .. NamaMode,
                    Content = "Safe! Respawn vehicle to apply.",
                    Duration = 0x5
                })
            else
                UIFeedback:Notify({
                    Title = "❌ Injection Failed",
                    Content = "Not a standard A-Chassis.",
                    Duration = 4
                })
            end
        end
    else
        UIFeedback:Notify({
            Title = "⚠️ Warning!",
            Content = "Please enter a vehicle first!",
            Duration = 0x3
        })
    end
end
local TaxiAssets = Services.ReplicatedStorage:WaitForChild("TaxiAssets", 15)
local TaxiEventsFolder = TaxiAssets and TaxiAssets:WaitForChild("Events", 0xf)
local TaxiEvent = TaxiEventsFolder and TaxiEventsFolder:WaitForChild("TaxiEvent", 0xf)
if TaxiEvent then
    TaxiEvent.OnClientEvent:Connect(function(action, data)
        if not State.IsRideGOActive then
            return
        end
        local d = data or {
        }
        if action == "DutyStarted" then
            State.RideGOIsOnline = true
            State.RideGOPhase = "idle"
            ensureBike()
        elseif action == "DutyEnded" then
            State.RideGOIsOnline = false
            State.RideGOPhase = "idle"
            State.RideGOTargetPos = nil
        elseif action == "OrderOffer" and State.RideGOPhase == "idle" then
            State.RideGOToken = d.Token
            State.RideGOPhase = "offered"
            ensureBike()
            TaxiEvent:FireServer("AcceptOrder", State.RideGOToken)
        elseif action == "OrderAccepted" and State.RideGOToken == d.Token then
            State.RideGOTargetPos = d.PickupPos
            State.RideGOPhase = "goingPickup"
        elseif action == "PassengerBoarding" and (State.RideGOPhase == "goingPickup" or State.RideGOPhase == "atPickup") then
            State.RideGOPhase = "waitingBoard"
            task.wait(0x3)
        elseif action == "TripStarted" and State.RideGOPhase == "waitingBoard" then
            State.RideGOTargetPos = d.DropPos
            State.RideGOPhase = "goingDrop"
        elseif action == "OrderCompleted" then
            State.RideGOTripCount = (State.RideGOTripCount or 0x0) + 0x1
            local earned = tonumber(d.Earned or d.FareEarned) or 0
            State.RideGOEarnings = (State.RideGOEarnings or 0x0) + earned
            task.delay(0x1, function()
                TaxiEvent:FireServer("AckTripComplete")
            end)
            State.RideGOToken = nil
            State.RideGOTargetPos = nil
            State.CurrentCycleTrips = (State.CurrentCycleTrips or 0) + 0x1
            if State.CurrentCycleTrips >= (State.NextBikeCycle or 5) then
                State.RideGOPhase = "cycling"
                task.spawn(function()
                    pcall(function()
                        TaxiEvent:FireServer("GoOffline")
                    end)
                    task.wait(0.5)
                    safeDismountVehicle()
                    task.wait(math.random(0x28, 0x50) / 10)
                    spawnAndMountBike()
                    task.wait(math.random(0xf, 25) / 0xa)
                    pcall(function()
                        TaxiEvent:FireServer("GoOnline")
                    end)
                    State.CurrentCycleTrips = 0x0
                    State.NextBikeCycle = math.random(3, 7)
                    State.RideGOPhase = "idle"
                end)
            else
                State.RideGOPhase = "idle"
            end
        elseif action == "OrderExpired" or action == "OrderDeclined" or action == "OrderCancelled" then
            State.RideGOToken = nil
            State.RideGOTargetPos = nil
            if State.RideGOPhase ~= "cycling" then
                State.RideGOPhase = "idle"
            end
        end
    end)
end
task.spawn(function()
    while true do
        task.wait(0.4)
        if not State.IsRideGOActive or not State.RideGOTargetPos then
            continue
        end
        if State.RideGOPhase == "goingPickup" then
            local ok = flyToTarget(State.RideGOTargetPos)
            if ok and State.RideGOPhase == "goingPickup" then
                State.RideGOPhase = "atPickup"
            end
        elseif State.RideGOPhase == "goingDrop" then
            local ok = flyToTarget(State.RideGOTargetPos)
            if ok and State.RideGOPhase == "goingDrop" then
                State.RideGOPhase = "waitingDropOff"
                local arrivedAt = tick()
                while State.IsRideGOActive and State.RideGOPhase == "waitingDropOff" and (tick() - arrivedAt < 0x8) do
                    task.wait(0.5)
                end
                if State.RideGOPhase == "waitingDropOff" then
                    UIFeedback:Notify({
                        Title = "⚠️ Rute Gagal / Macet",
                        Content = "Nyangkut verifikasi rute (8s). Auto reset motor & cari order lain...",
                        Duration = 0x4
                    })
                    pcall(function()
                        if TaxiEvent then
                            TaxiEvent:FireServer("CancelOrder")
                            if State.RideGOToken then
                                TaxiEvent:FireServer("DeclineOrder", State.RideGOToken)
                            end
                        end
                    end)
                    safeDismountVehicle()
                    task.wait(0.5)
                    spawnAndMountBike()
                    State.RideGOToken = nil
                    State.RideGOTargetPos = nil
                    State.RideGOPhase = "idle"
                end
            end
        end
    end
end)
local function StartRideGOScript()
    if State.IsRideGOActive then
        return
    end
    if not TaxiEvent then
        UIFeedback:Notify({
            Title = "❌ Gagal Memulai",
            Content = "TaxiEvent tidak ditemukan di game.",
            Duration = 0x4
        })
        return
    end
    if not SELECTED_CAR then
        FetchOwnedVehicles()
    end
    if not SELECTED_CAR then
        UIFeedback:Notify({
            Title = "❌ Gagal Memulai",
            Content = "Pilih kendaraan di garasi sebelum menyalakan RideGO!",
            Duration = 0x4
        })
        return
    end
    State.IsRideGOActive = true
    State.RideGOTripCount = 0x0
    State.RideGOEarnings = 0x0
    State.CurrentCycleTrips = 0x0
    State.NextBikeCycle = math.random(3, 0x7)
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    getgenv().WaktuMulai = tick()
    buatMonitoringGUI()
    setRagdollStates(false)
    ensureBike()
    if not State.RideGOIsOnline then
        TaxiEvent:FireServer("GoOnline")
    end
    UIFeedback:Notify({
        Title = "🚕 RideGO Driver",
        Content = "Auto RideGO (Flight V6 Anti Bablas) Aktif!",
        Duration = 0x4
    })
end
local function StopRideGOScript()
    State.IsRideGOActive = false
    State.RideGOTargetPos = nil
    if State.RideGOIsOnline and TaxiEvent then
        TaxiEvent:FireServer("GoOffline")
    end
    local bike = getBikeModel() or findMyMotor()
    if bike then
        local primary = getPrimary(bike)
        if primary then
            local bv = primary:FindFirstChild("RideGO_BV")
            local bg = primary:FindFirstChild("RideGO_BG")
            if bv then
                bv:Destroy()
            end
            if bg then
                bg:Destroy()
            end
            zeroVelocity(primary)
        end
    end
    setRagdollStates(true)
    focusCameraZoom(false)
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    matikanMonitoring()
    UIFeedback:Notify({
        Title = "🛑 RideGO Driver",
        Content = "Auto RideGO dihentikan.",
        Duration = 0x3
    })
end
local function OnRideGOTeamChanged()
    if State.IsRideGOActive and LocalPlayer.Team and LocalPlayer.Team.Name ~= "RideGO Driver" then
        StopRideGOScript()
        UIFeedback:Notify({
            Title = "⚠️ RideGO Driver",
            Content = "Keluar dari tim driver, bot dimatikan otomatis.",
            Duration = 0x3
        })
    end
end
LocalPlayer:GetPropertyChangedSignal("Team"):Connect(OnRideGOTeamChanged)
local PoliceJob = {
    DepotPos = Vector3.new(2840.10, 4.23, - 835.58),
    DepotRadius = 30,
    MissionTimeout = 0x4b,
    PlacementTimeout = 45,
}
local PoliceToolKeywords = {
    Tilang = {
        "tilang",
        "buku",
        "ticket",
        "surat"
    },
    Cone = {
        "cone",
        "kerucut",
        "traffic"
    },
    Line = {
        "line",
        "garis",
        "police line",
        "barrier",
        "pita"
    },
}
local PoliceAssets = Services.ReplicatedStorage:WaitForChild("PoliceAssets", 10)
local PoliceEvent = PoliceAssets and PoliceAssets:WaitForChild("PoliceEvent", 10)
if PoliceEvent then
    PoliceEvent.OnClientEvent:Connect(function(action, data)
        local d = data or {
        }
        if action == "UpdateMissionUI" and data then
            State.PMValidCones = d.validCones or 0x0
            State.PMReqCones = d.requiredCones or 0x0
            State.PMValidLines = d.validLines or 0x0
            State.PMReqLines = d.requiredLines or 0x0
            State.PMType = d.missionType or State.PMType
            if d.isWaiting then
                State.PolicePhase = "Mission Accomplished"
            end
        elseif action == "CreateMission" then
            if d.missionType then
                State.PMType = d.missionType
                State.PMValidCones = 0x0;
                State.PMReqCones = 0x0
                State.PMValidLines = 0x0;
                State.PMReqLines = 0x0
                State.PolicePhase = "Mission Created: " .. d.missionType
            end
        elseif action == "ClearMission" then
            State.PMValidCones = 0x0;
            State.PMReqCones = 0x0
            State.PMValidLines = 0x0;
            State.PMReqLines = 0
            State.PMType = ""
            State.PolicePhase = "Waiting Next Mission"
        elseif action == "NpcDefeated" then
            State.PolicePhase = "Suspect Neutralized"
        end
    end)
end
local function getPoliceTool(keyword)
    if not keyword then
        return nil, false
    end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local ch = LocalPlayer.Character or CharRef.Character
    local kw = keyword:lower()
    if ch then
        for _, t in ipairs(ch:GetChildren()) do
            if t:IsA("Tool") and t.Name:lower():find(kw, 0x1, true) then
                return t, true
            end
        end
    end
    if bp then
        for _, t in ipairs(bp:GetChildren()) do
            if t:IsA("Tool") and t.Name:lower():find(kw, 1, true) then
                return t, false
            end
        end
    end
    return nil, false
end
local function getPoliceToolAny(keywordList)
    if type(keywordList) == "string" then
        keywordList = {
            keywordList
        }
    end
    for _, kw in ipairs(keywordList) do
        local tool, eq = getPoliceTool(kw)
        if tool then
            return tool, eq
        end
    end
    return nil, false
end
local function equipPoliceToolAny(keywordList)
    local tool, isEquipped = getPoliceToolAny(keywordList)
    if isEquipped then
        return tool
    end
    if tool and CharRef.Humanoid then
        pcall(function()
            CharRef.Humanoid:EquipTool(tool)
        end)
        local t0 = tick()
        while tick() - t0 < 1.5 do
            task.wait(0.1)
            local _, eq = getPoliceToolAny(keywordList)
            if eq then
                break
            end
        end
        return tool
    end
    return nil
end
local VALID_MISSION_NAMES = {
    PengamananTKP = true,
    InsidenMogok = true,
    PenertibanParkir = true,
    InvestigasiPencurian = true,
}
local function getActivePoliceMissionModel()
    local am = Services.Workspace:FindFirstChild("ActiveMissions")
    if not am then
        return nil
    end
    for _, c in ipairs(am:GetChildren()) do
        if c:IsA("Model") and VALID_MISSION_NAMES[c.Name] then
            return c
        end
    end
    for _, c in ipairs(am:GetChildren()) do
        if c:IsA("Model") and c:GetAttribute("MissionType") then
            return c
        end
    end
    for _, c in ipairs(am:GetChildren()) do
        if c:IsA("Model") and c.Name ~= "RideGO_Passenger" then
            if c:FindFirstChild("Penjahat") or c:FindFirstChild("TicketPrompt", true) or c:FindFirstChild("VehicleObject", true) then
                return c
            end
        end
    end
    return nil
end
local function getPoliceMissionTargetPos(m)
    if not m then
        return nil
    end
    local suspect = m:FindFirstChild("Penjahat")
    if suspect then
        local sr = suspect:FindFirstChild("HumanoidRootPart")
        if sr then
            return sr.Position
        end
        local ok, piv = pcall(function()
            return suspect:GetPivot().Position
        end)
        if ok then
            return piv
        end
    end
    local veh = m:FindFirstChild("VehicleObject", true)
    if veh then
        if veh:IsA("BasePart") then
            return veh.Position
        end
        if veh:IsA("Model") and veh.PrimaryPart then
            return veh.PrimaryPart.Position
        end
        if veh:IsA("Model") then
            local pp = veh:FindFirstChildWhichIsA("BasePart")
            if pp then
                return pp.Position
            end
        end
    end
    local tp = m:FindFirstChild("TicketPrompt", true)
    if tp and tp.Parent and tp.Parent:IsA("BasePart") then
        return tp.Parent.Position
    end
    for _, d in ipairs(m:GetDescendants()) do
        if d:IsA("BasePart") and (d.Name:find("PlacementZone") or d.Name == "Batas") then
            return d.Position
        end
    end
    local ok, piv = pcall(function()
        return m:GetPivot().Position
    end)
    return ok and piv or nil
end
local function triggerPoliceDutyPrompt()
    if not CharRef.Root then
        return false
    end
    local best, bestDist = nil, math.huge
    for _, p in ipairs(Services.Workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") and p.Enabled and p.Parent then
            local pPos
            if p.Parent:IsA("BasePart") then
                pPos = p.Parent.Position
            else
                local ok, piv = pcall(function()
                    return p.Parent:GetPivot().Position
                end)
                pPos = ok and piv or nil
            end
            if pPos then
                local d = (pPos - PoliceJob.DepotPos).Magnitude
                if d < PoliceJob.DepotRadius and d < bestDist then
                    bestDist = d;
                    best = p
                end
            end
        end
    end
    if best then
        DoHold(best, best.Parent);
        return true
    end
    return false
end
local function killSuspectProperly(m)
    local suspect = m:FindFirstChild("Penjahat")
    if not suspect then
        return false
    end
    local hum = suspect:FindFirstChildOfClass("Humanoid")
    if not hum then
        return false
    end
    if hum.Health <= 0 then
        return true
    end
    State.PolicePhase = "Engaging Suspect"
    local weapon = equipPoliceToolAny({
        "senjata",
        "pistol",
        "gun",
        "weapon",
        "tembak"
    })
    if weapon then
        pcall(function()
            weapon:Activate()
        end)
    end
    local t0 = tick()
    local fullHP = hum.MaxHealth or 100
    while State.IsPoliceActive and hum.Parent and hum.Health > 0 and (tick() - t0) < 12 do
        local sRoot = suspect:FindFirstChild("HumanoidRootPart")
        if sRoot and CharRef.Root then
            zeroVelocity(CharRef.Root)
            CharRef.Root.CFrame = CFrame.lookAt(sRoot.Position + Vector3.new(0x0, 1.2, 3.5), sRoot.Position)
        end
        pcall(function()
            hum.Health = hum.Health - (fullHP * 0.35)
        end)
        pcall(function()
            if PoliceEvent then
                PoliceEvent:FireServer("RequestUIUpdate")
            end
        end)
        if weapon then
            pcall(function()
                weapon:Activate()
            end)
        end
        for _, pr in ipairs(m:GetDescendants()) do
            if pr:IsA("ProximityPrompt") and pr.Enabled and pr.Parent then
                pcall(function()
                    pr:InputHoldBegin();
                    task.wait(0.05);
                    pr:InputHoldEnd()
                end)
            end
        end
        task.wait(0.35)
    end
    if hum.Parent and hum.Health > 0 then
        pcall(function()
            hum.Health = 0
        end)
    end
    if PoliceEvent then
        pcall(function()
            PoliceEvent:FireServer("NpcDefeatedAction")
        end)
    end
    task.wait(0.8)
    return hum.Health <= 0x0
end
local function placeEquipmentForMission(m)
    local mType = m:GetAttribute("MissionType") or State.PMType or ""
    local toolKeywords
    if mType == "PengamananTKP" then
        toolKeywords = {
            PoliceToolKeywords.Cone,
            PoliceToolKeywords.Line
        }
    elseif mType == "InsidenMogok" then
        toolKeywords = {
            PoliceToolKeywords.Cone
        }
    else
        toolKeywords = {
            PoliceToolKeywords.Line,
            PoliceToolKeywords.Cone
        }
    end
    local coneZones, lineZones = {
    }, {
    }
    for _, d in ipairs(m:GetDescendants()) do
        if d:IsA("BasePart") then
            if d.Name:find("ConePlacementZone") then
                table.insert(coneZones, d)
            elseif d.Name:find("LinePlacementZone") then
                table.insert(lineZones, d)
            end
        end
    end
    State.PolicePhase = "Deploying Equipment"
    local function placeOnZone(zone, toolKW)
        if not State.IsPoliceActive or not zone or not zone.Parent then
            return false
        end
        if CharRef.Root then
            zeroVelocity(CharRef.Root)
            CharRef.Root.CFrame = CFrame.new(zone.Position + Vector3.new(0, 1.2, 0x0))
            task.wait(0.2)
        end
        local tool = equipPoliceToolAny(toolKW)
        if not tool then
            return false
        end
        pcall(function()
            tool:Activate()
        end)
        task.wait(0.12)
        local pr = zone:FindFirstChildOfClass("ProximityPrompt")
        if pr and pr.Enabled then
            DoHold(pr, zone)
        else
            pcall(function()
                for _, p in ipairs(m:GetDescendants()) do
                    if p:IsA("ProximityPrompt") and p.Enabled and p.Parent then
                        if p.Parent:IsA("BasePart") and (p.Parent.Position - zone.Position).Magnitude < 0x5 then
                            DoHold(p, p.Parent);
                            break
                        end
                    end
                end
            end)
        end
        task.wait(0.15)
        if tool.Parent then
            pcall(function()
                tool:Activate()
            end)
        end
        task.wait(0.25)
        return true
    end
    local t0 = tick()
    if # coneZones > 0x0 then
        for _, z in ipairs(coneZones) do
            if tick() - t0 > PoliceJob.PlacementTimeout or not State.IsPoliceActive then
                break
            end
            if not z.Parent or (State.PMReqCones > 0x0 and State.PMValidCones >= State.PMReqCones) then
                break
            end
            placeOnZone(z, PoliceToolKeywords.Cone)
        end
    end
    if # lineZones > 0x0 then
        for _, z in ipairs(lineZones) do
            if tick() - t0 > PoliceJob.PlacementTimeout or not State.IsPoliceActive then
                break
            end
            if not z.Parent or (State.PMReqLines > 0 and State.PMValidLines >= State.PMReqLines) then
                break
            end
            placeOnZone(z, PoliceToolKeywords.Line)
        end
    end
    local retryT0 = tick()
    while State.IsPoliceActive and (tick() - retryT0) < PoliceJob.PlacementTimeout do
        local nC = State.PMReqCones > 0x0 and State.PMValidCones <
        State.PMReqCones
        local nL = State.PMReqLines > 0x0 and State.PMValidLines <
        State.PMReqLines
        if not nC and not nL then
            break
        end
        if not m.Parent then
            break
        end
        if nC and # coneZones > 0 then
            placeOnZone(coneZones[
            math.random(1, # coneZones)], PoliceToolKeywords.Cone)
        end
        if nL and # lineZones > 0 then
            placeOnZone(lineZones[
            math.random(0x1, # lineZones)], PoliceToolKeywords.Line)
        end
        task.wait(0.4)
    end
    if PoliceEvent and m and m.Parent then
        pcall(function()
            local zones = {
            }
            for _, d in ipairs(m:GetDescendants()) do
                if d:IsA("BasePart") then
                    if d.Name:find("ConePlacementZone") then
                        table.insert(zones, {
                            type = "TrafficCone",
                            position = d.Position
                        })
                    elseif d.Name:find("LinePlacementZone") then
                        table.insert(zones, {
                            type = "PoliceLine",
                            position = d.Position
                        })
                    end
                end
            end
            if # zones > 0 then
                PoliceEvent:FireServer("SendPlacementZones", {
                    zones = zones
                })
            end
        end)
    end
    return (State.PMValidCones >= State.PMReqCones)
    and (State.PMValidLines >= State.PMReqLines)
end
local function handleTicketCar(m)
    State.PolicePhase = "Issuing Ticket"
    local buku = equipPoliceToolAny(PoliceToolKeywords.Tilang)
    if not buku then
        State.PolicePhase = "Missing Ticket Book";
        task.wait(0x1);
        return false
    end
    task.wait(0.3)
    local prompt = m:FindFirstChild("TicketPrompt", true)
    if not prompt then
        State.PolicePhase = "No Ticket Prompt";
        return false
    end
    if prompt.Parent and prompt.Parent:IsA("BasePart") and CharRef.Root then
        zeroVelocity(CharRef.Root)
        CharRef.Root.CFrame = CFrame.new(prompt.Parent.Position + Vector3.new(0x0, 1.2, 0x2))
        task.wait(0.2)
    end
    pcall(function()
        prompt.Enabled = true
        prompt.RequiresLineOfSight = false
        if (prompt.MaxActivationDistance or 0x0) < 0x28 then
            prompt.MaxActivationDistance = 0x28
        end
    end)
    DoHold(prompt, prompt.Parent)
    task.wait(0.5)
    if not prompt.Enabled then
        return true
    end
    if PoliceEvent then
        pcall(function()
            PoliceEvent:FireServer("CompleteAction", {
                ActionType = "TicketCar"
            })
        end)
    end
    task.wait(1)
    return true
end
local function handlePoliceMissionObjective(m)
    if not m or not m.Parent then
        return false
    end
    local mType = m:GetAttribute("MissionType") or State.PMType or ""
    State.PMValidCones = 0
    State.PMValidLines = 0x0
    if mType == "" then
        if m:FindFirstChild("Penjahat") then
            mType = "InvestigasiPencurian"
        elseif m:FindFirstChild("TicketPrompt", true) then
            mType = "PenertibanParkir"
        else
            local hasCone, hasLine = false, false
            for _, d in ipairs(m:GetDescendants()) do
                if d:IsA("BasePart") then
                    if d.Name:find("ConePlacementZone") then
                        hasCone = true
                    end
                    if d.Name:find("LinePlacementZone") then
                        hasLine = true
                    end
                end
            end
            if hasCone and hasLine then
                mType = "PengamananTKP"
            elseif hasCone then
                mType = "InsidenMogok"
            elseif hasLine then
                mType = "PengamananTKP"
            end
        end
    end
    State.PMType = mType
    if mType == "PenertibanParkir" then
        return handleTicketCar(m)
    elseif mType == "InvestigasiPencurian" then
        State.PolicePhase = "Criminal Investigation"
        equipPoliceToolAny(PoliceToolKeywords.Line)
        killSuspectProperly(m)
        task.wait(0.5)
        placeEquipmentForMission(m)
        return true
    elseif mType == "PengamananTKP" or mType == "InsidenMogok" then
        State.PolicePhase = "Securing Area"
        placeEquipmentForMission(m)
        return true
    else
        State.PolicePhase = "Fallback Mode"
        if m:FindFirstChild("Penjahat") then
            killSuspectProperly(m)
        end
        placeEquipmentForMission(m)
        local tp = m:FindFirstChild("TicketPrompt", true)
        if tp and tp.Enabled then
            handleTicketCar(m)
        end
        return true
    end
end
local function runMissionWithWatchdog(m)
    local finished = false
    local ref = m
    task.spawn(function()
        task.wait(PoliceJob.MissionTimeout)
        if finished or not State.IsPoliceActive then
            return
        end
        if not ref or not ref.Parent then
            return
        end
        safeDismountVehicle()
        task.wait(0.5)
        spawnAndMountBike()
        for _, p in ipairs(ref:GetDescendants()) do
            if p:IsA("ProximityPrompt") and p.Enabled and p.ActionText and p.ActionText:lower():find("abandon", 0x1, true) then
                DoHold(p, p.Parent)
                break
            end
        end
    end)
    handlePoliceMissionObjective(m)
    finished = true
end
local function startPoliceLoop()
    if not SELECTED_CAR then
        FetchOwnedVehicles()
    end
    if not SELECTED_CAR then
        State.IsPoliceActive = false
        UIFeedback:Notify({
            Title = "⚠️ Auto Police",
            Content = "Pilih kendaraan patroli dulu!",
            Duration = 0x4
        })
        return
    end
    setRagdollStates(false)
    local lastMissionRef = nil
    while State.IsPoliceActive do
        local missionModel = getActivePoliceMissionModel()
        if not missionModel then
            State.PolicePhase = "Heading to Police Station"
            spawnAndMountBike()
            task.wait(0.4)
            flyToTarget(PoliceJob.DepotPos)
            if not State.IsPoliceActive then
                break
            end
            State.PolicePhase = "Requesting New Mission"
            safeDismountVehicle()
            task.wait(0.3)
            if CharRef.Root then
                zeroVelocity(CharRef.Root)
                CharRef.Root.CFrame = CFrame.new(PoliceJob.DepotPos + Vector3.new(0, 1.2, 0x0))
            end
            task.wait(0.5)
            triggerPoliceDutyPrompt()
            local tOut = tick() + 0xc
            while State.IsPoliceActive and tick() < tOut do
                task.wait(0.5)
                local m = getActivePoliceMissionModel()
                if m then
                    missionModel = m;
                    break
                end
            end
            if not missionModel then
                State.PolicePhase = "Retrying Mission Request..."
                task.wait(0x2)
            end
        end
        if missionModel and missionModel ~= lastMissionRef then
            lastMissionRef = missionModel
            local targetPos = getPoliceMissionTargetPos(missionModel)
            if targetPos then
                State.PolicePhase = "En Route"
                spawnAndMountBike()
                task.wait(0.4)
                flyToTarget(targetPos)
                if not State.IsPoliceActive then
                    break
                end
                State.PolicePhase = "Executing Mission"
                safeDismountVehicle()
                task.wait(0.3)
                runMissionWithWatchdog(missionModel)
                local dw = tick() + 0xf
                while State.IsPoliceActive and tick() < dw do
                    task.wait(0.5)
                    if not missionModel.Parent then
                        break
                    end
                    if State.PolicePhase == "Mission Accomplished" or State.PolicePhase == "Suspect Neutralized" or State.PolicePhase == "Waiting Next Mission" then
                        break
                    end
                    if getActivePoliceMissionModel() ~= missionModel then
                        break
                    end
                end
                if not missionModel.Parent then
                    State.PoliceMissions = (State.PoliceMissions or 0x0) + 1
                end
                State.PolicePhase = "Mission Complete"
                task.wait(0x1)
                lastMissionRef = nil
            else
                State.PolicePhase = "No Target Found"
                task.wait(0x1)
                lastMissionRef = nil
            end
        else
            task.wait(0.5)
        end
    end
    focusCameraZoom(false)
end
local function StartPoliceScript()
    if State.IsPoliceActive then
        return
    end
    State.IsPoliceActive = true
    State.PoliceMissions = 0
    State.PolicePhase = "Standby"
    State.PMValidCones = 0
    State.PMReqCones = 0
    State.PMValidLines = 0
    State.PMReqLines = 0
    State.PMType = ""
    CachedMoneyLabel = nil
    getgenv().UangAwalDikunci = nil
    getgenv().WaktuMulai = tick()
    buatMonitoringGUI()
    setRagdollStates(false)
    task.spawn(startPoliceLoop)
    UIFeedback:Notify({
        Title = "🚓 Auto Police",
        Content = "Auto Police Duty (Flight V6) Aktif!",
        Duration = 3
    })
end
local function StopPoliceScript()
    State.IsPoliceActive = false
    State.PolicePhase = "Idle"
    local bike = getBikeModel() or findMyMotor()
    if bike then
        local primary = getPrimary(bike)
        if primary then
            local bv = primary:FindFirstChild("RideGO_BV")
            local bg = primary:FindFirstChild("RideGO_BG")
            if bv then
                bv:Destroy()
            end
            if bg then
                bg:Destroy()
            end
            zeroVelocity(primary)
        end
    end
    setRagdollStates(true)
    focusCameraZoom(false)
    matikanMonitoring()
    UIFeedback:Notify({
        Title = "🛑 Auto Police",
        Content = "Auto Police Dihentikan.",
        Duration = 3
    })
end
-- ============================================================================
-- LEZUN HUB / LN UI — ZetaPro interface
-- ============================================================================

local Window = Zeta:CreateWindow({
    Title = "LEZUN HUB",
    SubTitle = "LN UI  ·  Drag Drive Simulator",
    Icon = "layers",
    Theme = "Ink Wash",
    Size = IsMobile and UDim2.fromOffset(410, 520) or UDim2.fromOffset(650, 570),
    MinSize = Vector2.new(380, 300),
    MaxSize = IsMobile and Vector2.new(520, 720) or Vector2.new(900, 760),
    Acrylic = false,
    SearchEnabled = true,
    CloseButton = true,
    RestoreButton = true,
    MinimizeKey = Enum.KeyCode.RightControl,
})

-- Rebrand ZetaPro's floating restore control to the LN monogram.
pcall(function()
    local restoreFrame = Window._control and Window._control.Frame
    local brandLabel = restoreFrame and restoreFrame:FindFirstChild("Brand")
    if brandLabel and brandLabel:IsA("TextLabel") then
        brandLabel.Text = "LN"
    end
end)

-- INFO TAB
local TabInfo = Window:AddTab({
    Title = "Info",
    Icon = "info",
})

local memberCount = "N/A"
local onlineCount = "N/A"

local function fetchDiscordInfo()
    local req = request or http_request or (syn and syn.request)
    if not req then
        return
    end

    local ok, res = pcall(function()
        return req({
            Url = "https://discord.com/api/v9/invites/XmWf3YQPpZ?with_counts=true",
            Method = "GET",
            Headers = {
                ["User-Agent"] = "Mozilla/5.0",
            },
        })
    end)

    if ok and res and res.StatusCode == 200 then
        local decoded, data = pcall(function()
            return game:GetService("HttpService"):JSONDecode(res.Body)
        end)
        if decoded and data then
            memberCount = tostring(data.approximate_member_count or "N/A")
            onlineCount = tostring(data.approximate_presence_count or "N/A")
        end
    end
end

fetchDiscordInfo()

local InfoSection = TabInfo:AddSection("Community")
local ServerInfo = InfoSection:AddParagraph({
    Title = "LEZUN HUB Community",
    Content = "Member Count: " .. memberCount .. "\nOnline Count: " .. onlineCount,
    Icon = "users",
})

InfoSection:AddButton({
    Title = "Copy Discord Invite",
    Description = "Copy the community invite link",
    Icon = "link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/XmWf3YQPpZ")
            UIFeedback:Notify({
                Title = "Invite copied",
                Content = "Discord invite copied to clipboard.",
                Duration = 3,
                Type = "Success",
            })
        end
    end,
})

InfoSection:AddButton({
    Title = "Refresh Community Info",
    Icon = "refresh-cw",
    Callback = function()
        fetchDiscordInfo()
        ServerInfo:SetContent(
            "Member Count: " .. memberCount .. "\nOnline Count: " .. onlineCount
        )
    end,
})

local RuntimeSection = TabInfo:AddSection("Runtime")
local FpsTag = RuntimeSection:AddLabel({
    Text = "FPS: ...  |  Ping: ... ms",
    Icon = "activity",
})

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if FpsTag and FpsTag.SetTitle then
                FpsTag:SetTitle(string.format(
                    "FPS: %d  |  Ping: %d ms",
                    EngineStats.FPS,
                    EngineStats.Ping
                ))
            end
        end)
    end
end)

-- AUTO FARM TAB
local TabFarm = Window:AddTab({
    Title = "Auto Farm",
    Icon = "coffee",
})

local SectionBarista = TabFarm:AddSection("Auto Barista")
SectionBarista:AddToggle({
    Title = "Enable Auto Barista",
    Description = "Automatically handles the Barista job",
    Icon = "play",
    Default = false,
    Callback = function(on)
        if on then
            StartBaristaScript()
        else
            StopBaristaScript()
        end
    end,
})

SectionBarista:AddToggle({
    Title = "Show Debug Overlay",
    Description = "Display the Barista minigame monitor",
    Icon = "monitor",
    Default = true,
    Callback = function(on)
        State.DebugEnabled = on
        if State.IsBaristaActive then
            if on then
                CreateDebugOverlay()
            else
                DestroyDebugOverlay()
            end
        end
    end,
})

local SectionOffice = TabFarm:AddSection("Auto Office")
SectionOffice:AddToggle({
    Title = "Enable Auto Office",
    Description = "Automatically performs Office Worker tasks",
    Icon = "briefcase",
    Default = false,
    Callback = function(on)
        if on then
            StartOfficeScript()
        else
            StopOfficeScript()
        end
    end,
})

SectionOffice:AddInput({
    Title = "Stop otomatis di profit (Rp)",
    Description = "Kosongkan untuk menonaktifkan batas profit.",
    Placeholder = "Contoh: 50000000",
    Default = "",
    Live = false,
    Callback = function(text)
        local bersih = string.gsub(text or "", "[^%d]", "")
        local val = tonumber(bersih) or 0
        State.TargetProfit = val

        if val > 0 then
            UIFeedback:Notify({
                Title = "Target dipasang",
                Content = "Bakal keluar pas profit udah " .. fmtRupiah(val),
                Duration = 3,
                Type = "Success",
            })
        else
            UIFeedback:Notify({
                Title = "Target dicopot",
                Content = "Gak ada batas profit, jalan terus.",
                Duration = 3,
            })
        end
    end,
})

local SectionCourier = TabFarm:AddSection("Auto Courier")
SectionCourier:AddToggle({
    Title = "Enable Auto Courier",
    Description = "Automatically handles Courier deliveries",
    Icon = "package",
    Default = false,
    Callback = function(on)
        if on then
            StartCourierScript()
        else
            StopCourierScript()
        end
    end,
})

VehicleDropdownCourier = SectionCourier:AddDropdown({
    Title = "Pilih Motor Kurir",
    Description = "Choose the vehicle used for Courier",
    Values = #OwnedVehiclesList > 0 and OwnedVehiclesList or { "Pindai garasi..." },
    Default = #OwnedVehiclesList > 0 and OwnedVehiclesList[1] or "Pindai garasi...",
    Multi = false,
    Callback = function(chosen)
        if chosen and chosen ~= "" and chosen ~= "Tidak ada kendaraan terdeteksi" and chosen ~= "Pindai garasi..." then
            SELECTED_CAR = chosen
            UIFeedback:Notify({
                Title = "🚗 Kendaraan Dipilih",
                Content = "Menggunakan: " .. SELECTED_CAR,
                Duration = 2,
                Type = "Success",
            })
        end
    end,
})

SectionCourier:AddButton({
    Title = "Refresh Garasi",
    Icon = "refresh-cw",
    Callback = function()
        local cars = RefreshAllVehicleDropdowns()
        local count = (cars[1] == "Tidak ada kendaraan terdeteksi") and 0 or #cars
        UIFeedback:Notify({
            Title = "Garasi Terdeteksi",
            Content = "Ditemukan " .. count .. " kendaraan!",
            Duration = 3,
            Type = "Success",
        })
    end,
})

SectionCourier:AddSlider({
    Title = "Kecepatan Minimum Kurir",
    Description = "Default: 70 (Aman)",
    Min = 40,
    Max = 300,
    Default = 70,
    Increment = 5,
    Callback = function(value)
        State.CourierMinSpeed = value
    end,
})

SectionCourier:AddSlider({
    Title = "Kecepatan Maksimum Kurir",
    Description = "Default: 95 (Aman)",
    Min = 50,
    Max = 350,
    Default = 95,
    Increment = 5,
    Callback = function(value)
        State.CourierMaxSpeed = value
    end,
})

local SectionRideGO = TabFarm:AddSection("Auto RideGO Driver")
SectionRideGO:AddParagraph({
    Title = "Vehicle setup",
    Content = "Pilih motor terlebih dahulu sebelum mengaktifkan fitur ini.",
    Icon = "info",
})
SectionRideGO:AddToggle({
    Title = "Enable Auto RideGO",
    Description = "Automatically handles RideGO driver jobs",
    Icon = "car",
    Default = false,
    Callback = function(on)
        if on then
            StartRideGOScript()
        else
            StopRideGOScript()
        end
    end,
})

VehicleDropdownRideGO = SectionRideGO:AddDropdown({
    Title = "Pilih Kendaraan RideGO",
    Values = #OwnedVehiclesList > 0 and OwnedVehiclesList or { "Pindai garasi..." },
    Default = #OwnedVehiclesList > 0 and OwnedVehiclesList[1] or "Pindai garasi...",
    Multi = false,
    Callback = function(chosen)
        if chosen and chosen ~= "" and chosen ~= "Tidak ada kendaraan terdeteksi" and chosen ~= "Pindai garasi..." then
            SELECTED_CAR = chosen
            UIFeedback:Notify({
                Title = "🚕 Kendaraan Dipilih",
                Content = "Menggunakan: " .. SELECTED_CAR,
                Duration = 2,
                Type = "Success",
            })
        end
    end,
})

SectionRideGO:AddButton({
    Title = "Refresh Garasi",
    Icon = "refresh-cw",
    Callback = function()
        local cars = RefreshAllVehicleDropdowns()
        local count = (cars[1] == "Tidak ada kendaraan terdeteksi") and 0 or #cars
        UIFeedback:Notify({
            Title = "Garasi Terdeteksi",
            Content = "Ditemukan " .. count .. " kendaraan!",
            Duration = 3,
            Type = "Success",
        })
    end,
})

SectionRideGO:AddSlider({
    Title = "Kecepatan Minimum RideGO",
    Description = "Default: 70 (Anti Bablas). 200 = mode kencang.",
    Min = 40,
    Max = 300,
    Default = 70,
    Increment = 5,
    Callback = function(value)
        State.RideGOMinSpeed = value
    end,
})

SectionRideGO:AddSlider({
    Title = "Kecepatan Maksimum RideGO",
    Description = "Default: 95 (Anti Bablas). 230 = mode kencang.",
    Min = 50,
    Max = 350,
    Default = 95,
    Increment = 5,
    Callback = function(value)
        State.RideGOMaxSpeed = value
    end,
})

local SectionPolice = TabFarm:AddSection("Auto Police Duty")
SectionPolice:AddParagraph({
    Title = "Vehicle setup",
    Content = "Pilih kendaraan patroli sebelum mengaktifkan tugas polisi.",
    Icon = "info",
})
SectionPolice:AddToggle({
    Title = "Enable Auto Police",
    Description = "Automatically handles Police Duty missions",
    Icon = "shield",
    Default = false,
    Callback = function(on)
        if on then
            StartPoliceScript()
        else
            StopPoliceScript()
        end
    end,
})

VehicleDropdownPolice = SectionPolice:AddDropdown({
    Title = "Pilih Kendaraan Patroli",
    Values = #OwnedVehiclesList > 0 and OwnedVehiclesList or { "Pindai garasi..." },
    Default = #OwnedVehiclesList > 0 and OwnedVehiclesList[1] or "Pindai garasi...",
    Multi = false,
    Callback = function(chosen)
        if chosen and chosen ~= "" and chosen ~= "Tidak ada kendaraan terdeteksi" and chosen ~= "Pindai garasi..." then
            SELECTED_CAR = chosen
            UIFeedback:Notify({
                Title = "🚓 Kendaraan Patroli",
                Content = "Menggunakan: " .. SELECTED_CAR,
                Duration = 2,
                Type = "Success",
            })
        end
    end,
})

SectionPolice:AddButton({
    Title = "Refresh Garasi",
    Icon = "refresh-cw",
    Callback = function()
        local cars = RefreshAllVehicleDropdowns()
        local count = (cars[1] == "Tidak ada kendaraan terdeteksi") and 0 or #cars
        UIFeedback:Notify({
            Title = "Garasi Terdeteksi",
            Content = "Ditemukan " .. count .. " kendaraan!",
            Duration = 3,
            Type = "Success",
        })
    end,
})

SectionPolice:AddSlider({
    Title = "Kecepatan Minimum Patroli",
    Description = "Default: 70 (Aman)",
    Min = 40,
    Max = 300,
    Default = 70,
    Increment = 5,
    Callback = function(value)
        State.PoliceMinSpeed = value
    end,
})

SectionPolice:AddSlider({
    Title = "Kecepatan Maksimum Patroli",
    Description = "Default: 95 (Aman)",
    Min = 50,
    Max = 350,
    Default = 95,
    Increment = 5,
    Callback = function(value)
        State.PoliceMaxSpeed = value
    end,
})

-- SECURITY TAB
local TabSec = Window:AddTab({
    Title = "Security",
    Icon = "shield",
})
local Perlindungan = TabSec:AddSection("Protection")

Perlindungan:AddToggle({
    Title = "Anti-Admin (Auto Leave)",
    Description = "Automatically leaves if a staff member joins",
    Icon = "user-minus",
    Default = true,
    Callback = function(on)
        State.AntiAdmin = on
    end,
})

Perlindungan:AddToggle({
    Title = "Anti-AFK (VirtualUser)",
    Description = "Prevents idle kick using input simulation",
    Icon = "clock",
    Default = true,
    Callback = function(on)
        State.AntiAFK = on
    end,
})

-- PERFORMANCE TAB
local TabPerf = Window:AddTab({
    Title = "Performance",
    Icon = "zap",
})

local HematDaya = TabPerf:AddSection("Power Saving")
HematDaya:AddToggle({
    Title = "Disable Rendering (AFK Mode)",
    Description = "Black screen while the script continues running",
    Icon = "moon",
    Default = false,
    Callback = function(on)
        ToggleBlackScreen(on)
    end,
})

local SectionAntiLag = TabPerf:AddSection("Anti Lag")
SectionAntiLag:AddToggle({
    Title = "Enable Anti Lag",
    Description = "Removes selected visual effects and lowers graphics quality",
    Icon = "gauge",
    Default = false,
    Callback = function(on)
        ToggleAntiLag(on)
    end,
})

local SectionPotato = TabPerf:AddSection("Ultra Potato Mode")
SectionPotato:AddToggle({
    Title = "Enable Potato Mode (Extreme)",
    Description = "Aggressively simplifies local visuals for performance",
    Icon = "battery-low",
    Default = false,
    Callback = function(on)
        TogglePotatoMode(on)
    end,
})

-- SETTINGS TAB
local TabCfg = Window:AddTab({
    Title = "Settings",
    Icon = "settings",
})

local Konfigurasi = TabCfg:AddSection("Configuration")
Konfigurasi:AddSlider({
    Title = "Action Delay (Seconds)",
    Description = "Lower values run faster",
    Min = 1,
    Max = 10,
    Default = 5,
    Increment = 1,
    Callback = function(value)
        State.ActionDelay = value
    end,
})

local SectionFakeName = TabCfg:AddSection("Display Name")
SectionFakeName:AddInput({
    Title = "Spoof Name",
    Description = "Empty value uses King Akbar",
    Placeholder = "King Akbar",
    Default = "",
    Live = false,
    Callback = function(text)
        local cleanText = string.gsub(text or "", "^%s+", "")
        cleanText = string.gsub(cleanText, "%s+$", "")
        State.FakeName = (cleanText == "") and "King Akbar" or cleanText
        if State.FakeNameActive then
            SpoofApplyNow()
        end
    end,
})

SectionFakeName:AddToggle({
    Title = "Enable Spoof Name",
    Description = "Changes the display name locally on this client",
    Default = false,
    Callback = function(on)
        State.FakeNameActive = on
        if on then
            SpoofApplyNow()
            UIFeedback:Notify({
                Title = "Spoof Name",
                Content = "Name changed to: " .. State.FakeName,
                Duration = 3,
                Type = "Success",
            })
        else
            SpoofDisableNow()
            UIFeedback:Notify({
                Title = "Spoof Name",
                Content = "Original name restored.",
                Duration = 3,
            })
        end
    end,
})

local SectionRedeem = TabCfg:AddSection("Redeem Codes")
local redeemCodes = {
    "DRAGDRIVESIMULATORAUGUST26",
    "DDSSPECIALMERDEKA2026",
    "NEWLIGHTSMODIFICATION",
    "DELAYDIKITBARULOMBA",
    "DDSTHX175KROADTO200KLIKES",
}

local function FireRedeemRemote(code)
    pcall(function()
        local rce = Services.ReplicatedStorage:WaitForChild("RedeemCodeEvents", 10)
        if not rce then
            return
        end
        local remote = rce:WaitForChild("Redeem", 5)
        if not remote then
            return
        end
        if remote:IsA("RemoteFunction") then
            remote:InvokeServer(code)
        elseif remote:IsA("RemoteEvent") then
            remote:FireServer(code)
        end
    end)
end

SectionRedeem:AddButton({
    Title = "Redeem All Codes",
    Description = "Attempts to redeem the codes listed in the script",
    Icon = "gift",
    Callback = function()
        task.spawn(function()
            UIFeedback:Notify({
                Title = "Auto Redeem",
                Content = "Redeeming codes...",
                Duration = 3,
            })

            for _, code in ipairs(redeemCodes) do
                FireRedeemRemote(code)
                task.wait(2)
            end

            UIFeedback:Notify({
                Title = "Auto Redeem",
                Content = "Redeem attempts completed.",
                Duration = 5,
                Type = "Success",
            })
        end)
    end,
})

-- PRESETS TAB
local TabPreset = Window:AddTab({
    Title = "Instant Modes",
    Icon = "car",
})
local ModeCepat = TabPreset:AddSection("Presets")

ModeCepat:AddButton({
    Title = "Sunday Ride (Safe)",
    Icon = "bike",
    Callback = function()
        InjectMesin(1.5, 0x7d0, 0.9, 0.9, "Sunday Ride Active")
    end,
})

ModeCepat:AddButton({
    Title = "Racing Mode (Aggressive)",
    Icon = "flag",
    Callback = function()
        InjectMesin(3.5, 0x1388, 0.75, 0.75, "Racing Mode Active")
    end,
})

ModeCepat:AddButton({
    Title = "God Mode (Max Speed)",
    Icon = "rocket",
    Callback = function()
        InjectMesin(8, 0x3a98, 0.45, 0.45, "God Mode Active")
    end,
})

ModeCepat:AddButton({
    Title = "Reset to Default",
    Icon = "rotate-ccw",
    Callback = function()
        UIFeedback:Notify({
            Title = "Info",
            Content = "Respawn the vehicle from the game menu to reset.",
            Duration = 5,
        })
    end,
})

-- CUSTOM TUNING TAB
local TabCustom = Window:AddTab({
    Title = "Custom Tune",
    Icon = "sliders-horizontal",
})
local TuneSendiri = TabCustom:AddSection("Manual Tuning")

local customHP, customRPM, customRatio, customFD = 2, 5000, 0.8, 0.8

TuneSendiri:AddInput({
    Title = "Horsepower Multiplier",
    Placeholder = "Example: 3",
    Default = tostring(customHP),
    Numeric = true,
    Live = false,
    Callback = function(text)
        local value = tonumber(text)
        if value then
            customHP = value
        end
    end,
})

TuneSendiri:AddInput({
    Title = "RPM Adder",
    Placeholder = "Example: 8000",
    Default = tostring(customRPM),
    Numeric = true,
    Live = false,
    Callback = function(text)
        local value = tonumber(text)
        if value then
            customRPM = value
        end
    end,
})

TuneSendiri:AddInput({
    Title = "Gear Ratio Multiplier",
    Placeholder = "Example: 0.6",
    Default = tostring(customRatio),
    Numeric = true,
    Live = false,
    Callback = function(text)
        local value = tonumber(text)
        if value then
            customRatio = value
        end
    end,
})

TuneSendiri:AddInput({
    Title = "Final Drive Multiplier",
    Placeholder = "Example: 0.6",
    Default = tostring(customFD),
    Numeric = true,
    Live = false,
    Callback = function(text)
        local value = tonumber(text)
        if value then
            customFD = value
        end
    end,
})

TuneSendiri:AddButton({
    Title = "Inject Custom Tune",
    Icon = "gauge",
    Callback = function()
        InjectMesin(customHP, customRPM, customRatio, customFD, "Custom Tune Active")
    end,
})

-- Select the first tab and notify once the UI has initialized.
TabInfo:Select()
UIFeedback:Notify({
    Title = "LEZUN HUB Ready",
    Content = "LN UI powered by ZetaPro is ready.",
    Duration = 5,
    Type = "Success",
})

task.spawn(function()
    task.wait(2.5)
    RefreshAllVehicleDropdowns()
end)
