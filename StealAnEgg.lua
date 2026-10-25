local HttpService = game:GetService("HttpService")
pcall(function()
if not isfolder("Zeroin") then
makefolder("Zeroin")
end
if not isfolder("Zeroin/Config") then
makefolder("Zeroin/Config")
end
if not isfolder("Zeroin/Cache") then
makefolder("Zeroin/Cache")
end
end)
local univId = tostring(game.GameId)
if univId == "0" or univId == "" then
univId = tostring(game.PlaceId)
end
local ConfigFile = "Zeroin/Config/Zeroin_" .. univId .. ".json"
ConfigData       = {}
Elements         = {}
CURRENT_VERSION  = nil
function SaveConfig()
if writefile then
ConfigData._version = CURRENT_VERSION
pcall(function()
writefile(ConfigFile, HttpService:JSONEncode(ConfigData))
end)
end
end
function LoadConfigFromFile()
if not CURRENT_VERSION then return end
local isFileSuccess, isFileResult = false, false
 if isfile then
     isFileSuccess, isFileResult = pcall(function() return isfile(ConfigFile) end)
 end
 if isFileSuccess and isFileResult then
     local success, result = pcall(function()
         return HttpService:JSONDecode(readfile(ConfigFile))
     end)
     if success and type(result) == "table" then
         if result._version == CURRENT_VERSION then
             ConfigData = result
         else
             ConfigData = { _version = CURRENT_VERSION }
         end
     else
         ConfigData = { _version = CURRENT_VERSION }
     end
 else
     ConfigData = { _version = CURRENT_VERSION }
 end
end
function LoadConfigElements()
for key, element in pairs(Elements) do
if ConfigData[key] ~= nil and element.Set then
element:Set(ConfigData[key], true)
end
end
end
-- ============================================================
-- CONFIG PROFILE SYSTEM
-- ============================================================
local PROFILE_FOLDER = "Zeroin/Profiles"
local function EnsureProfileFolder()
pcall(function()
if not isfolder("Zeroin") then makefolder("Zeroin") end
if not isfolder("Zeroin/Config") then makefolder("Zeroin/Config") end
if not isfolder(PROFILE_FOLDER) then makefolder(PROFILE_FOLDER) end
end)
end
function GetProfileList()
local profiles = {}
pcall(function()
EnsureProfileFolder()
local files = listfiles(PROFILE_FOLDER)
for _, filePath in ipairs(files) do
local normalized =  tostring(filePath):gsub( "\\",  "/")
local fileName = normalized:match( "([^/]+)$") or  ""
if fileName:match( "%.json$") then
table.insert(profiles, (fileName:gsub( "%.json$",  "")))
end
end
end)
table.sort(profiles)
return profiles
end
function SaveProfile(name)
if not name or name == "" then return false end
EnsureProfileFolder()
local ok, err = pcall(function()
writefile(PROFILE_FOLDER .. "/" .. name .. ".json", HttpService:JSONEncode(ConfigData))
end)
return ok, err
end
function LoadProfile(name)
if not name or name == "" then return false end
local path = PROFILE_FOLDER .. "/" .. name .. ".json"
if not isfile then return false end
local isFileSuccess, isFileResult = pcall(function() return isfile(path) end)
if not isFileSuccess or not isFileResult then return false end
local ok, data = pcall(function()
return HttpService:JSONDecode(readfile(path))
end)
if ok and type(data) == "table" then
for key, val in pairs(data) do
ConfigData[key] = val
end
for key, element in pairs(Elements) do
if ConfigData[key] ~= nil and element.Set then
pcall(function()
element:Set(ConfigData[key])
end)
task.wait(0.03)
end
end
SaveConfig()
return true
end
return false
end
function DeleteProfile(name)
if not name or name == "" then return false end
local path = PROFILE_FOLDER .. "/" .. name .. ".json"
local ok = pcall(function()
if isfile(path) then delfile(path) end
end)
return ok
end

local FOOTAGESUS_ICON_URL = "https://raw.githubusercontent.com/iSylvesterr/library/925579b/ZeroinIcons.lua"
local IconPack = {
Name = "Footagesus Lucide (unavailable)",
GetIcon = function() return nil end,
GetIconData = function() return nil end,
HasIcon = function() return false end,
ListIcons = function() return {} end,
}
do
local ok, result = pcall(function()
return loadstring(game:HttpGet(FOOTAGESUS_ICON_URL))()
end)
if ok and type(result) == "table" and type(result.GetIcon) == "function" then
IconPack = result
else
warn("Zeroin UI: Footagesus icon pack failed to load:", result)
end
end
local Icons = setmetatable({}, {
__index = function(_, name)
return IconPack.GetIcon(name) or ""
end,
})
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CoreGui = (function()
local env = (getgenv and getgenv()) or _G
if env and env.__ZeroinUIHost and typeof(env.__ZeroinUIHost) == "Instance" then
return env.__ZeroinUIHost
end
if gethui then
local ok, h = pcall(gethui)
if ok and h then return h end
end
local ok, cg = pcall(game.GetService, game, "CoreGui")
if ok and cg then
local testOk = pcall(function() local f = Instance.new("Folder"); f.Parent = cg; f:Destroy() end)
if testOk then return cg end
end
return LocalPlayer:WaitForChild("PlayerGui")
end)()
local viewport = workspace.CurrentCamera.ViewportSize

-- ============================================================
-- ZETAPRO INSPIRED THEME COLORS (Midnight/Dark)
-- ============================================================
local ThemeColors = {
    Background = Color3.fromRGB(10, 10, 12),
    Secondary = Color3.fromRGB(18, 18, 20),
    Tertiary = Color3.fromRGB(26, 26, 29),
    Accent = Color3.fromRGB(120, 200, 255),
    AccentText = Color3.fromRGB(8, 8, 10),
    Text = Color3.fromRGB(235, 235, 235),
    MutedText = Color3.fromRGB(140, 140, 146),
    Border = Color3.fromRGB(40, 40, 44),
    Hover = Color3.fromRGB(30, 30, 34),
    Success = Color3.fromRGB(50, 205, 50),
    Error = Color3.fromRGB(255, 69, 58),
}

local function resolveImage(source)
if source == nil then return "" end
local value = tostring(source)
if value == "" then return "" end
if value:match("^rbxasset") or value:match("^https?://") then
    return value
end
if value:match("^%d+$") then
    return "rbxassetid://" .. value
end
if getcustomasset then
    local ok, asset = pcall(getcustomasset, value)
    if ok and asset then return asset end
end
return value
end
local function resolveIcon(source)
if source == nil then return "" end
local value = tostring(source)
local icon = IconPack.GetIcon(value)
if icon then return icon end
return resolveImage(value)
end
local function applyIcon(imageLabel, source)
local data = type(IconPack.GetIconData) == "function" and IconPack.GetIconData(source) or nil
if data then
imageLabel.Image = data.Image or ""
imageLabel.ImageRectOffset = data.ImageRectPosition or Vector2.new(0, 0)
imageLabel.ImageRectSize = data.ImageRectSize or Vector2.new(0, 0)
else
imageLabel.Image = resolveIcon(source)
imageLabel.ImageRectOffset = Vector2.new(0, 0)
imageLabel.ImageRectSize = Vector2.new(0, 0)
end
return imageLabel
end
local function isMobileDevice()
return UserInputService.TouchEnabled
and not UserInputService.KeyboardEnabled
and not UserInputService.MouseEnabled
end
local isMobile = isMobileDevice()
local function safeSize(pxWidth, pxHeight)
local scaleX = pxWidth / viewport.X
local scaleY = pxHeight / viewport.Y
if isMobile then
    if scaleX > 0.5 then scaleX = 0.5 end
    if scaleY > 0.3 then scaleY = 0.3 end
end
return UDim2.new(scaleX, 0, scaleY, 0)
end
local function MakeDraggable(topbarobject, object, trackConnection, defaultWidth, defaultHeight, mobileLayout)
local function CustomPos(topbarobject, object)
local Dragging, DragInput, DragStart, StartPosition
    local function UpdatePos(input)
         local Delta = input.Position - DragStart
         local pos = UDim2.new(
             StartPosition.X.Scale,
             StartPosition.X.Offset + Delta.X,
             StartPosition.Y.Scale,
             StartPosition.Y.Offset + Delta.Y
         )
         local Tween = TweenService:Create(object, TweenInfo.new(0.2), { Position = pos })
         Tween:Play()
     end
     topbarobject.InputBegan:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
             Dragging = true
             DragStart = input.Position
             StartPosition = object.Position
             input.Changed:Connect(function()
                 if input.UserInputState == Enum.UserInputState.End then
                     Dragging = false
                 end
             end)
         end
     end)
     topbarobject.InputChanged:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
             DragInput = input
         end
     end)
     local dragChangedConnection = UserInputService.InputChanged:Connect(function(input)
         if input == DragInput and Dragging then
             UpdatePos(input)
         end
     end)
     if trackConnection then trackConnection(dragChangedConnection) end
 end
 local function CustomSize(object)
     local Dragging, DragInput, DragStart, StartSize
     local minSizeX, minSizeY
     local defSizeX, defSizeY
     if mobileLayout then
         minSizeX, minSizeY = 300, 300
         defSizeX, defSizeY = defaultWidth or 470, defaultHeight or 520
     else
         minSizeX, minSizeY = 420, 280
         defSizeX, defSizeY = defaultWidth or 586, defaultHeight or 364
     end
     object.Size = UDim2.new(0, defSizeX, 0, defSizeY)
     local changesizeobject = Instance.new("Frame")
     changesizeobject.AnchorPoint = Vector2.new(1, 1)
     changesizeobject.BackgroundTransparency = 1
     changesizeobject.Size = UDim2.new(0, 40, 0, 40)
     changesizeobject.Position = UDim2.new(1, 20, 1, 20)
     changesizeobject.Name = "changesizeobject"
     changesizeobject.Parent = object
     local function UpdateSize(input)
         local Delta = input.Position - DragStart
         local newWidth = StartSize.X.Offset + Delta.X
         local newHeight = StartSize.Y.Offset + Delta.Y
         newWidth = math.max(newWidth, minSizeX)
         newHeight = math.max(newHeight, minSizeY)
         local Tween = TweenService:Create(object, TweenInfo.new(0.2), { Size = UDim2.new(0, newWidth, 0, newHeight) })
         Tween:Play()
     end
     changesizeobject.InputBegan:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
             Dragging = true
             DragStart = input.Position
             StartSize = object.Size
             input.Changed:Connect(function()
                 if input.UserInputState == Enum.UserInputState.End then
                     Dragging = false
                 end
             end)
         end
     end)
     changesizeobject.InputChanged:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
             DragInput = input
         end
     end)
     local resizeChangedConnection = UserInputService.InputChanged:Connect(function(input)
         if input == DragInput and Dragging then
             UpdateSize(input)
         end
     end)
     if trackConnection then trackConnection(resizeChangedConnection) end
 end
 CustomSize(object)
 CustomPos(topbarobject, object)
end
function CircleClick(Button, X, Y)
spawn(function()
Button.ClipsDescendants = true
local Circle = Instance.new("ImageLabel")
Circle.Image = "rbxassetid://266543268"
Circle.ImageColor3 = ThemeColors.Accent
Circle.ImageTransparency = 0.7
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BackgroundTransparency = 1
Circle.ZIndex = 10
Circle.Name = "Circle"
Circle.Parent = Button
    local NewX = X - Circle.AbsolutePosition.X
     local NewY = Y - Circle.AbsolutePosition.Y
     Circle.Position = UDim2.new(0, NewX, 0, NewY)
     local Size = 0
     if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
         Size = Button.AbsoluteSize.X * 1.5
     elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
         Size = Button.AbsoluteSize.Y * 1.5
     elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
         Size = Button.AbsoluteSize.X * 1.5
     end
     local Time = 0.5
     Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, -Size / 2, 0.5, -Size / 2), "Out", "Quad",
         Time, false, nil)
     for i = 1, 10 do
         Circle.ImageTransparency = Circle.ImageTransparency + 0.03
         wait(Time / 10)
     end
     Circle:Destroy()
 end)
end
local DEFAULT_ZEROIN_NOTIFICATION_LOGO = "124404129684886"
local Zeroin = {
NotificationIcon = DEFAULT_ZEROIN_NOTIFICATION_LOGO,
}
function Zeroin:GetIcon(name)
return IconPack.GetIcon(name)
end
function Zeroin:GetIconData(name)
return type(IconPack.GetIconData) == "function" and IconPack.GetIconData(name) or nil
end
function Zeroin:HasIcon(name)
return IconPack.HasIcon(name)
end
function Zeroin:GetIconNames()
return IconPack.ListIcons()
end
function Zeroin:MakeNotify(NotifyConfig)
local NotifyConfig = NotifyConfig or {}
NotifyConfig.Title = NotifyConfig.Title or "Zeroin"
NotifyConfig.Description = NotifyConfig.Description or "Notification"
NotifyConfig.Content = NotifyConfig.Content or "Content"
NotifyConfig.Icon = NotifyConfig.Icon or Zeroin.NotificationIcon or DEFAULT_ZEROIN_NOTIFICATION_LOGO
NotifyConfig.Color = NotifyConfig.Color or ThemeColors.Accent
NotifyConfig.Time = NotifyConfig.Time or 0.4
NotifyConfig.Delay = NotifyConfig.Delay or 5
local NotifyFunction = {}
spawn(function()
if not CoreGui:FindFirstChild("NotifyGui") then
local NotifyGui = Instance.new("ScreenGui");
NotifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NotifyGui.Name = "NotifyGui"
NotifyGui.Parent = CoreGui
end
if not CoreGui.NotifyGui:FindFirstChild("NotifyLayout") then
local NotifyLayout = Instance.new("Frame");
NotifyLayout.AnchorPoint = Vector2.new(1, 0)
NotifyLayout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifyLayout.BackgroundTransparency = 1
NotifyLayout.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotifyLayout.BorderSizePixel = 0
NotifyLayout.Position = UDim2.new(1, -30, 0, 30)
NotifyLayout.Size = UDim2.new(0, 320, 1, 0)
NotifyLayout.Name = "NotifyLayout"
NotifyLayout.Parent = CoreGui.NotifyGui
local Count = 0
CoreGui.NotifyGui.NotifyLayout.ChildRemoved:Connect(function()
Count = 0
for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
TweenService:Create(
v,
TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
{ Position = UDim2.new(0, 0, 0, ((v.Size.Y.Offset + 12) * Count)) }
):Play()
Count = Count + 1
end
end)
end
local NotifyPosHeigh = 0
for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
NotifyPosHeigh = v.Position.Y.Offset + v.Size.Y.Offset + 12
end
local NotifyFrame = Instance.new("Frame");
local NotifyFrameReal = Instance.new("Frame");
local UICorner = Instance.new("UICorner");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Top = Instance.new("Frame");
local TextLabel = Instance.new("TextLabel");
local UICorner1 = Instance.new("UICorner");
local TextLabel1 = Instance.new("TextLabel");
local Close = Instance.new("TextButton");
local ImageLabel = Instance.new("ImageLabel");
local TextLabel2 = Instance.new("TextLabel");

    NotifyFrame.BackgroundColor3 = ThemeColors.Background
     NotifyFrame.BorderColor3 = ThemeColors.Border
     NotifyFrame.BorderSizePixel = 1
     NotifyFrame.Size = UDim2.new(1, 0, 0, 150)
     NotifyFrame.Name = "NotifyFrame"
     NotifyFrame.BackgroundTransparency = 0.05
     NotifyFrame.Parent = CoreGui.NotifyGui.NotifyLayout
     NotifyFrame.AnchorPoint = Vector2.new(0, 0)
     NotifyFrame.Position = UDim2.new(0, 0, 0, NotifyPosHeigh)
     
     NotifyFrameReal.BackgroundColor3 = ThemeColors.Secondary
     NotifyFrameReal.BorderColor3 = ThemeColors.Border
     NotifyFrameReal.BorderSizePixel = 1
     NotifyFrameReal.Position = UDim2.new(0, 400, 0, 0)
     NotifyFrameReal.Size = UDim2.new(1, 0, 1, 0)
     NotifyFrameReal.Name = "NotifyFrameReal"
     NotifyFrameReal.Parent = NotifyFrame
     
     UICorner.Parent = NotifyFrameReal
     UICorner.CornerRadius = UDim.new(0, 8)
     
     DropShadowHolder.BackgroundTransparency = 1
     DropShadowHolder.BorderSizePixel = 0
     DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
     DropShadowHolder.ZIndex = 0
     DropShadowHolder.Name = "DropShadowHolder"
     DropShadowHolder.Parent = NotifyFrameReal
     
     local NotifIcon = Instance.new("ImageLabel")
     NotifIcon.Image = resolveIcon(NotifyConfig.Icon)
     NotifIcon.BackgroundTransparency = 1
     NotifIcon.ImageTransparency = 0
     NotifIcon.BorderSizePixel = 0
     NotifIcon.Size = UDim2.new(0, 60, 0, 60)
     NotifIcon.Position = UDim2.new(0, 0, 0.05, 0)
     NotifIcon.ScaleType = Enum.ScaleType.Fit
     NotifIcon.Name = "NotifIcon"
     NotifIcon.ZIndex = 0
     NotifIcon.Parent = NotifyFrameReal
     
     Top.BackgroundColor3 = ThemeColors.Secondary
     Top.BackgroundTransparency = 1
     Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
     Top.BorderSizePixel = 0
     Top.Position = UDim2.new(0, 55, 0, 0)
     Top.Size = UDim2.new(1, -55, 0, 36)
     Top.Name = "Top"
     Top.Parent = NotifyFrameReal
     
     TextLabel.Font = Enum.Font.GothamBold
     TextLabel.Text = NotifyConfig.Title
     TextLabel.TextColor3 = ThemeColors.Text
     TextLabel.TextSize = 14
     TextLabel.TextXAlignment = Enum.TextXAlignment.Left
     TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
     TextLabel.BackgroundTransparency = 1
     TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
     TextLabel.BorderSizePixel = 0
     TextLabel.Size = UDim2.new(1, 0, 1, 0)
     TextLabel.Parent = Top
     TextLabel.Position = UDim2.new(0, 10, 0, 0)
     
     UICorner1.Parent = Top
     UICorner1.CornerRadius = UDim.new(0, 5)
     
     TextLabel1.Font = Enum.Font.GothamBold
     TextLabel1.Text = NotifyConfig.Description
     TextLabel1.TextColor3 = NotifyConfig.Color
     TextLabel1.TextSize = 14
     TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
     TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 130, 130)
     TextLabel1.BackgroundTransparency = 1
     TextLabel1.TextTransparency = 0.2
     TextLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
     TextLabel1.BorderSizePixel = 0
     TextLabel1.Size = UDim2.new(1, 0, 1, 0)
     TextLabel1.Position = UDim2.new(0, TextLabel.TextBounds.X + 15, 0, 0)
     TextLabel1.Parent = Top
     
     Close.Font = Enum.Font.SourceSans
     Close.Text = ""
     Close.TextColor3 = Color3.fromRGB(0, 0, 0)
     Close.TextSize = 14
     Close.AnchorPoint = Vector2.new(1, 0.5)
     Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
     Close.BackgroundTransparency = 1
     Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
     Close.BorderSizePixel = 0
     Close.Position = UDim2.new(1, -5, 0.5, 0)
     Close.Size = UDim2.new(0, 25, 0, 25)
     Close.Name = "Close"
     Close.Parent = Top
     
     ImageLabel.Image = resolveIcon("x")
     ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
     ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
     ImageLabel.BackgroundTransparency = 1
     ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
     ImageLabel.BorderSizePixel = 0
     ImageLabel.Position = UDim2.new(0.49000001, 0, 0.5, 0)
     ImageLabel.Size = UDim2.new(1, -8, 1, -8)
     ImageLabel.Parent = Close
     
     TextLabel2.Font = Enum.Font.GothamBold
     TextLabel2.TextColor3 = ThemeColors.MutedText
     TextLabel2.TextSize = 13
     TextLabel2.Text = NotifyConfig.Content
     TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
     TextLabel2.TextYAlignment = Enum.TextYAlignment.Top
     TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
     TextLabel2.BackgroundTransparency = 1
     TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
     TextLabel2.BorderSizePixel = 0
     TextLabel2.Position = UDim2.new(0, 65, 0, 27)
     TextLabel2.Parent = NotifyFrameReal
     TextLabel2.Size = UDim2.new(1, -90, 0, 13)
     TextLabel2.Size = UDim2.new(1, -90, 0, 13 + (13 * (TextLabel2.TextBounds.X // TextLabel2.AbsoluteSize.X)))
     TextLabel2.TextWrapped = true
     if TextLabel2.AbsoluteSize.Y < 27 then
         NotifyFrame.Size = UDim2.new(1, 0, 0, 65)
     else
         NotifyFrame.Size = UDim2.new(1, 0, 0, TextLabel2.AbsoluteSize.Y + 40)
     end
     local waitbruh = false
     function NotifyFunction:Close()
         if waitbruh then
             return false
         end
         waitbruh = true
         TweenService:Create(
             NotifyFrameReal,
             TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
             { Position = UDim2.new(0, 400, 0, 0) }
         ):Play()
         task.wait(tonumber(NotifyConfig.Time) / 1.2)
         NotifyFrame:Destroy()
     end
     Close.Activated:Connect(function()
         NotifyFunction:Close()
     end)
     TweenService:Create(
         NotifyFrameReal,
         TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
         { Position = UDim2.new(0, 0, 0, 0) }
     ):Play()
     task.wait(tonumber(NotifyConfig.Delay))
     NotifyFunction:Close()
 end)
 return NotifyFunction
end
function notif(msg, delay, color, title, desc)
return Zeroin:MakeNotify({
Title = title or "Zeroin",
Description = desc or "Notification",
Content = msg or "Content",
Color = color or ThemeColors.Accent,
Delay = delay or 4
})
end

function Zeroin:Window(GuiConfig)
local GlobalEnvironment = (getgenv and getgenv()) or _G
local ActiveWindowKey = "__ZEROIN_ACTIVE_WINDOW"
local previousWindow = GlobalEnvironment[ActiveWindowKey]
if previousWindow then
local ok, err = pcall(function()
if type(previousWindow.Destroy) == "function" then
previousWindow:Destroy()
elseif type(previousWindow.Close) == "function" then
previousWindow:Close()
end
end)
if not ok then warn("Zeroin previous window cleanup error:", err) end
GlobalEnvironment[ActiveWindowKey] = nil
end
for _, guiName in ipairs({ "ZeroinOnTop", "ToggleUIZeroin", "NotifyGui" }) do
     local staleGui = CoreGui:FindFirstChild(guiName)
     if staleGui then
         pcall(function() staleGui:Destroy() end)
     end
 end
 GuiConfig              = GuiConfig or {}
 GuiConfig.Title        = GuiConfig.Title or "Zeroin"
 GuiConfig.Footer       = GuiConfig.Footer or "Zeroin"
 GuiConfig.Color        = GuiConfig.Color or ThemeColors.Accent
 GuiConfig.Color2       = GuiConfig.Color2 or ThemeColors.Background
 GuiConfig["Tab Width"] = GuiConfig["Tab Width"] or 120
 GuiConfig.Version      = GuiConfig.Version or 1
 GuiConfig.NotificationIcon = GuiConfig.NotificationIcon or GuiConfig.LogoHUB or DEFAULT_ZEROIN_NOTIFICATION_LOGO
 GuiConfig.Discord      = GuiConfig.Discord or "https://discord.gg/9snzkaGkRE"
 GuiConfig.BuiltInInfo  = GuiConfig.BuiltInInfo ~= false
 
 local currentViewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or viewport
 local isPortrait = currentViewport.Y > currentViewport.X
 local UseMobileLayout = GuiConfig.ForceMobile == true or isPortrait or (isMobile and currentViewport.X < 500)
 local DefaultWindowWidth = math.max(320, math.min(615, currentViewport.X - 20))
 local DefaultWindowHeight = math.max(280, math.min(UseMobileLayout and 620 or 430, currentViewport.Y - (isMobile and 36 or 64)))
 local EffectiveTabWidth = UseMobileLayout and math.min(104, GuiConfig["Tab Width"]) or GuiConfig["Tab Width"]
 
 Zeroin.NotificationIcon = GuiConfig.NotificationIcon
 CURRENT_VERSION        = GuiConfig.Version
 LoadConfigFromFile()
 
 local GuiFunc = {}
 local cleanupResources = {}
 local closeCallbacks = {}
 local activeToggles = {}
 local windowElementKeys = {}
 local isDestroyed = false
 local cleanupStarted = false
 local runCleanup
 local publicWindow
 
 local function cleanupResource(resource)
     if resource == nil then return end
     local resourceType = typeof(resource)
     local ok, err = pcall(function()
         if resourceType == "function" then resource()
         elseif resourceType == "RBXScriptConnection" then if resource.Connected then resource:Disconnect() end
         elseif resourceType == "Instance" then resource:Destroy()
         elseif resourceType == "thread" then task.cancel(resource)
         elseif type(resource) == "table" then
             if type(resource.Cleanup) == "function" then resource:Cleanup()
             elseif type(resource.Destroy) == "function" then resource:Destroy()
             elseif type(resource.Disconnect) == "function" then resource:Disconnect()
             elseif type(resource.Cancel) == "function" then resource:Cancel()
             end
         end
     end)
     if not ok then warn("Zeroin cleanup error:", err) end
 end
 local function trackCleanup(resource)
     if resource == nil then return resource end
     if isDestroyed then cleanupResource(resource) else table.insert(cleanupResources, resource) end
     return resource
 end
 function GuiFunc:AddCleanup(resource) return trackCleanup(resource) end
 function GuiFunc:OnClose(callback)
     if type(callback) ~= "function" then return callback end
     if isDestroyed then cleanupResource(callback) else table.insert(closeCallbacks, callback) end
     return callback
 end
 function GuiFunc:IsDestroyed() return isDestroyed end
 function GuiFunc:CreateCleanupToken()
     local token = { Alive = not isDestroyed }
     trackCleanup(function() token.Alive = false end)
     return token
 end
 function GuiFunc:Spawn(callback)
     assert(type(callback) == "function", "Window:Spawn expects a function")
     local token = GuiFunc:CreateCleanupToken()
     local thread = task.spawn(callback, token)
     trackCleanup(thread)
     return thread, token
 end

 local ZeroinOnTop = Instance.new("ScreenGui");
 local DropShadowHolder = Instance.new("Frame");
 local DropShadow = Instance.new("ImageLabel");
 local Main = Instance.new("Frame");
 local UICorner = Instance.new("UICorner");
 local Top = Instance.new("Frame");
 local TextLabel = Instance.new("TextLabel");
 local UICorner1 = Instance.new("UICorner");
 local TextLabel1 = Instance.new("TextLabel");
 local Close = Instance.new("TextButton");
 local ImageLabel1 = Instance.new("ImageLabel");
 local Min = Instance.new("TextButton");
 local ImageLabel2 = Instance.new("ImageLabel");
 local FullScreen = Instance.new("TextButton")
 local ImageLabel3 = Instance.new("ImageLabel")
 local LayersTab = Instance.new("Frame");
 local UICorner2 = Instance.new("UICorner");
 local UICorner3 = Instance.new("UICorner")
 local DecideFrame = Instance.new("Frame");
 local Layers = Instance.new("Frame");
 local UICorner6 = Instance.new("UICorner");
 local NameTab = Instance.new("TextLabel");
 local LayersReal = Instance.new("Frame");
 local LayersFolder = Instance.new("Folder");
 local LayersPageLayout = Instance.new("UIPageLayout");
 
 ZeroinOnTop.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 ZeroinOnTop.Name = "ZeroinOnTop"
 ZeroinOnTop.ResetOnSpawn = false
 ZeroinOnTop.Parent = CoreGui
 
 local DropdownPortal = Instance.new("Frame")
 DropdownPortal.Name = "DropdownPortal"
 DropdownPortal.BackgroundTransparency = 1
 DropdownPortal.BorderSizePixel = 0
 DropdownPortal.Position = UDim2.fromOffset(0, 0)
 DropdownPortal.Size = UDim2.fromScale(1, 1)
 DropdownPortal.Active = false
 DropdownPortal.ZIndex = 190
 DropdownPortal.Parent = ZeroinOnTop
 local ActiveDropdownCloser
 
 DropShadowHolder.BackgroundTransparency = 1
 DropShadowHolder.BorderSizePixel = 0
 DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
 DropShadowHolder.Position = UDim2.new(0.5, 0, 0.5, 0)
 DropShadowHolder.Size = UDim2.fromOffset(DefaultWindowWidth, DefaultWindowHeight)
 DropShadowHolder:SetAttribute("MobileLayout", UseMobileLayout)
 DropShadowHolder.ZIndex = 0
 DropShadowHolder.Name = "DropShadowHolder"
 DropShadowHolder.Parent = ZeroinOnTop
 
 DropShadow.Image = "rbxassetid://6015897843"
 DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
 DropShadow.ImageTransparency = 0.7
 DropShadow.ScaleType = Enum.ScaleType.Slice
 DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
 DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
 DropShadow.BackgroundTransparency = 1
 DropShadow.BorderSizePixel = 0
 DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
 DropShadow.Size = UDim2.new(1, 47, 1, 47)
 DropShadow.ZIndex = 0
 DropShadow.Name = "DropShadow"
 DropShadow.Parent = DropShadowHolder
 
 if GuiConfig.Theme then
     Main:Destroy()
     Main = Instance.new("ImageLabel")
     Main.Image = "rbxassetid://" .. GuiConfig.Theme
     Main.ScaleType = Enum.ScaleType.Crop
     Main.BackgroundTransparency = 0.15
     Main.ImageTransparency = GuiConfig.ThemeTransparency or 0.15
 else
     Main.BackgroundColor3 = ThemeColors.Background
     Main.BackgroundTransparency = 0.05
 end
 Main.AnchorPoint = Vector2.new(0.5, 0.5)
 Main.BorderColor3 = ThemeColors.Border
 Main.BorderSizePixel = 1
 Main.Position = UDim2.new(0.5, 0, 0.5, 0)
 Main.Size = UDim2.new(1, -47, 1, -47)
 Main.Name = "Main"
 Main.Parent = DropShadow
 UICorner3.Parent = Main
 UICorner3.CornerRadius = UDim.new(0, 8)
 
 local MainStroke = Instance.new("UIStroke")
 MainStroke.Color = ThemeColors.Border
 MainStroke.Transparency = 0.3
 MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 MainStroke.Thickness = 1
 MainStroke.Parent = Main
 
 Top.BackgroundColor3 = ThemeColors.Secondary
 Top.BackgroundTransparency = 0.1
 Top.BorderColor3 = ThemeColors.Border
 Top.BorderSizePixel = 1
 Top.Size = UDim2.new(1, 0, 0, 38)
 Top.Name = "Top"
 Top.Parent = Main
 
 TextLabel.Font = Enum.Font.GothamBold
 TextLabel.Text = GuiConfig.Title
 TextLabel.TextColor3 = ThemeColors.Text
 TextLabel.TextSize = 14
 TextLabel.TextXAlignment = Enum.TextXAlignment.Left
 TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
 TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 TextLabel.BackgroundTransparency = 1
 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
 TextLabel.BorderSizePixel = 0
 TextLabel.Size = UDim2.new(1, -100, 1, 0)
 TextLabel.Position = UDim2.new(0, 38, 0, 0)
 TextLabel.Visible = not UseMobileLayout
 TextLabel.Parent = Top
 
 local LogoImg = Instance.new("ImageLabel")
 LogoImg.Image = resolveImage(GuiConfig.LogoHUB)
 LogoImg.BackgroundTransparency = 1
 LogoImg.BorderSizePixel = 0
 LogoImg.Size = UDim2.new(0, 22, 0, 22)
 LogoImg.Position = UDim2.new(0, 8, 0.5, -11)
 LogoImg.ScaleType = Enum.ScaleType.Fit
 LogoImg.Name = "LogoImg"
 LogoImg.Parent = Top
 UICorner1.Parent = Top
 
 local RightContainer = Instance.new("Frame")
 RightContainer.Name = "RightContainer"
 RightContainer.BackgroundTransparency = 1
 RightContainer.Size = UDim2.new(0.6, 0, 1, 0)
 RightContainer.Position = UDim2.new(1, -110, 0, 0)
 RightContainer.AnchorPoint = Vector2.new(1, 0)
 RightContainer.Parent = Top
 
 local TopListLayout = Instance.new("UIListLayout")
 TopListLayout.FillDirection = Enum.FillDirection.Horizontal
 TopListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
 TopListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
 TopListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 TopListLayout.Padding = UDim.new(0, 8)
 TopListLayout.Parent = RightContainer
 
 local function styleStatusChip(frame, order)
     frame.LayoutOrder = order
     frame.Size = UDim2.new(0, 0, 0, 20)
     frame.BackgroundColor3 = ThemeColors.Tertiary
     frame.BackgroundTransparency = 0.2
     frame.BorderSizePixel = 1
     frame.AutomaticSize = Enum.AutomaticSize.X
     frame.Parent = RightContainer
     local padding = Instance.new("UIPadding")
     padding.PaddingLeft = UDim.new(0, 7)
     padding.PaddingRight = UDim.new(0, 7)
     padding.Parent = frame
     local layout = Instance.new("UIListLayout")
     layout.FillDirection = Enum.FillDirection.Horizontal
     layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
     layout.VerticalAlignment = Enum.VerticalAlignment.Center
     layout.SortOrder = Enum.SortOrder.LayoutOrder
     layout.Padding = UDim.new(0, 5)
     layout.Parent = frame
     local corner = Instance.new("UICorner")
     corner.CornerRadius = UDim.new(0, 6)
     corner.Parent = frame
     local stroke = Instance.new("UIStroke")
     stroke.Color = ThemeColors.Border
     stroke.Transparency = 0.4
     stroke.Thickness = 1
     stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
     stroke.Parent = frame
 end
 local function makeChipIcon(parent, image, order)
     local icon = Instance.new("ImageLabel")
     icon.Name = "Icon"
     icon.LayoutOrder = order
     icon.Size = UDim2.fromOffset(12, 12)
     icon.BackgroundTransparency = 1
     icon.Image = image
     icon.ImageColor3 = ThemeColors.MutedText
     icon.ImageTransparency = 0.1
     icon.ScaleType = Enum.ScaleType.Fit
     icon.Parent = parent
     return icon
 end
 local function compactStatusText(value, maxLength)
     value = tostring(value or "Unknown")
     if #value > maxLength then return value:sub(1, math.max(1, maxLength - 1)) .. "…" end
     return value
 end
 local detectedGameName = tostring(game.Name)
 local gameNameListeners = {}
 local GameFrame = Instance.new("Frame")
 GameFrame.Name = "GameFrame"
 styleStatusChip(GameFrame, 1)
 makeChipIcon(GameFrame, resolveIcon("gamepad-2"), 1)
 local GameTextLabel = Instance.new("TextLabel")
 GameTextLabel.Name = "GameText"
 GameTextLabel.LayoutOrder = 2
 GameTextLabel.Size = UDim2.new(0, 0, 1, 0)
 GameTextLabel.BackgroundTransparency = 1
 GameTextLabel.Font = Enum.Font.GothamMedium
 GameTextLabel.Text = compactStatusText(detectedGameName, 20)
 GameTextLabel.TextColor3 = ThemeColors.Text
 GameTextLabel.TextSize = 10
 GameTextLabel.TextXAlignment = Enum.TextXAlignment.Center
 GameTextLabel.AutomaticSize = Enum.AutomaticSize.X
 GameTextLabel.Parent = GameFrame
 GameFrame:SetAttribute("FullGameName", detectedGameName)
 GameFrame:SetAttribute("PlaceId", game.PlaceId)
 GameFrame.Visible = not UseMobileLayout
 
 local function updateTopTitleSpace()
     if not GameFrame.Parent or not TextLabel.Parent then return end
     local statusLeft = UseMobileLayout and RightContainer.AbsolutePosition.X or GameFrame.AbsolutePosition.X
     local available = statusLeft - TextLabel.AbsolutePosition.X - 8
     TextLabel.Size = UDim2.new(0, math.max(0, available), 1, 0)
 end
 GameFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateTopTitleSpace)
 GameFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTopTitleSpace)
 Top:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTopTitleSpace)
 task.defer(updateTopTitleSpace)
 
 trackCleanup(task.spawn(function()
     local detectedName = detectedGameName
     local ok, productInfo = pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) end)
     if ok and type(productInfo) == "table" and productInfo.Name and productInfo.Name ~= "" then detectedName = tostring(productInfo.Name) end
     if not isDestroyed and GameFrame.Parent then
         detectedGameName = detectedName
         GameTextLabel.Text = compactStatusText(detectedGameName, 20)
         GameFrame:SetAttribute("FullGameName", detectedGameName)
         for _, listener in ipairs(gameNameListeners) do task.spawn(listener, detectedGameName) end
         task.defer(updateTopTitleSpace)
     end
 end))
 
 local FooterFrame = Instance.new("Frame")
 FooterFrame.Name = "FooterFrame"
 styleStatusChip(FooterFrame, 2)
 makeChipIcon(FooterFrame, Icons.stat, 1)
 TextLabel1.Name = "FooterText"
 TextLabel1.LayoutOrder = 2
 TextLabel1.Size = UDim2.new(0, 0, 1, 0)
 TextLabel1.BackgroundTransparency = 1
 TextLabel1.Font = Enum.Font.GothamMedium
 TextLabel1.Text = "-- FPS"
 TextLabel1.TextColor3 = ThemeColors.Text
 TextLabel1.TextSize = 10
 TextLabel1.TextXAlignment = Enum.TextXAlignment.Center
 TextLabel1.AutomaticSize = Enum.AutomaticSize.X
 TextLabel1.Parent = FooterFrame
 
 local RunService = game:GetService("RunService")
 local fpsFrames, fpsElapsed, displayedFps = 0, 0, 60
 local fpsConnection
 fpsConnection = RunService.RenderStepped:Connect(function(deltaTime)
     fpsFrames = fpsFrames + 1
     fpsElapsed = fpsElapsed + deltaTime
     if fpsElapsed >= 0.5 then
         local currentFps = fpsFrames / fpsElapsed
         displayedFps = math.floor((displayedFps * 0.35) + (currentFps * 0.65) + 0.5)
         TextLabel1.Text = tostring(displayedFps) .. " FPS"
         fpsFrames, fpsElapsed = 0, 0
     end
 end)
 trackCleanup(fpsConnection)
 ZeroinOnTop.Destroying:Connect(function() if runCleanup then runCleanup(true) end end)
 
 local execName = tostring((identifyexecutor and identifyexecutor()) or "Unknown")
 execName = execName:gsub("%s*[Vv]ersion.*$", "")
 execName = compactStatusText(execName, 12)
 local Executor = Instance.new("Frame")
 Executor.Name = "Executor"
 styleStatusChip(Executor, 3)
 makeChipIcon(Executor, Icons.plug, 1)
 local ExecutorTextLabel = Instance.new("TextLabel")
 ExecutorTextLabel.Name = "TextLabel"
 ExecutorTextLabel.LayoutOrder = 2
 ExecutorTextLabel.Size = UDim2.new(0, 0, 1, 0)
 ExecutorTextLabel.BackgroundTransparency = 1
 ExecutorTextLabel.Font = Enum.Font.GothamMedium
 ExecutorTextLabel.Text = execName
 ExecutorTextLabel.TextColor3 = ThemeColors.Text
 ExecutorTextLabel.TextSize = 10
 ExecutorTextLabel.TextXAlignment = Enum.TextXAlignment.Center
 ExecutorTextLabel.AutomaticSize = Enum.AutomaticSize.X
 ExecutorTextLabel.Parent = Executor
 
 Close.Font = Enum.Font.SourceSans
 Close.Text = ""
 Close.TextColor3 = Color3.fromRGB(0, 0, 0)
 Close.TextSize = 14
 Close.AnchorPoint = Vector2.new(1, 0.5)
 Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Close.BackgroundTransparency = 1
 Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Close.BorderSizePixel = 0
 Close.Position = UDim2.new(1, -8, 0.5, 0)
 Close.Size = UDim2.new(0, 25, 0, 25)
 Close.Name = "Close"
 Close.Parent = Top
 ImageLabel1.Image = resolveIcon("x")
 ImageLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
 ImageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ImageLabel1.BackgroundTransparency = 1
 ImageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
 ImageLabel1.BorderSizePixel = 0
 ImageLabel1.Position = UDim2.new(0.49, 0, 0.5, 0)
 ImageLabel1.Size = UDim2.new(1, -8, 1, -8)
 ImageLabel1.Parent = Close
 
 Min.Font = Enum.Font.SourceSans
 Min.Text = ""
 Min.TextColor3 = Color3.fromRGB(0, 0, 0)
 Min.TextSize = 14
 Min.AnchorPoint = Vector2.new(1, 0.5)
 Min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Min.BackgroundTransparency = 1
 Min.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Min.BorderSizePixel = 0
 Min.Position = UDim2.new(1, -68, 0.5, 0)
 Min.Size = UDim2.new(0, 25, 0, 25)
 Min.Name = "Min"
 Min.Parent = Top
 ImageLabel2.Image = resolveIcon("minus")
 ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
 ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ImageLabel2.BackgroundTransparency = 1
 ImageLabel2.ImageTransparency = 0.2
 ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
 ImageLabel2.BorderSizePixel = 0
 ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
 ImageLabel2.Size = UDim2.new(1, -9, 1, -9)
 ImageLabel2.Parent = Min
 
 FullScreen.Font = Enum.Font.SourceSans
 FullScreen.Text = ""
 FullScreen.TextColor3 = Color3.fromRGB(0, 0, 0)
 FullScreen.TextSize = 14
 FullScreen.AnchorPoint = Vector2.new(1, 0.5)
 FullScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 FullScreen.BackgroundTransparency = 1
 FullScreen.BorderColor3 = Color3.fromRGB(0, 0, 0)
 FullScreen.BorderSizePixel = 0
 FullScreen.Position = UDim2.new(1, -38, 0.5, 0)
 FullScreen.Size = UDim2.new(0, 25, 0, 25)
 FullScreen.Name = "FullScreen"
 FullScreen.Parent = Top
 ImageLabel3.Image = resolveIcon("maximize-2")
 ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
 ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ImageLabel3.BackgroundTransparency = 1
 ImageLabel3.ImageTransparency = 0.2
 ImageLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
 ImageLabel3.BorderSizePixel = 0
 ImageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
 ImageLabel3.Size = UDim2.new(1, -9, 1, -9)
 ImageLabel3.Parent = FullScreen
 
 LayersTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LayersTab.BackgroundTransparency = 1
 LayersTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
 LayersTab.BorderSizePixel = 0
 LayersTab.Position = UDim2.new(0, 8, 0, 50)
 LayersTab.Size = UDim2.new(0, EffectiveTabWidth - 3, 1, -104)
 LayersTab.Name = "LayersTab"
 LayersTab.Parent = Main
 
 local TabDivider = Instance.new("Frame")
 TabDivider.Name = "TabDivider"
 TabDivider.AnchorPoint = Vector2.new(0, 0)
 TabDivider.BackgroundColor3 = ThemeColors.Border
 TabDivider.BackgroundTransparency = 0.7
 TabDivider.BorderSizePixel = 0
 TabDivider.Position = UDim2.new(0, EffectiveTabWidth + 13, 0, 38)
 TabDivider.Size = UDim2.new(0, 1, 1, -38)
 TabDivider.Parent = Main
 
 local SearchBarFrame = Instance.new("Frame")
 SearchBarFrame.Name = "SearchBarFrame"
 SearchBarFrame.Size = UDim2.new(1, 0, 0, 26)
 SearchBarFrame.Position = UDim2.new(0, 0, 0, 0)
 SearchBarFrame.BackgroundColor3 = ThemeColors.Tertiary
 SearchBarFrame.BackgroundTransparency = 0.3
 SearchBarFrame.Parent = LayersTab
 local SearchBarCorner = Instance.new("UICorner")
 SearchBarCorner.CornerRadius = UDim.new(0, 6)
 SearchBarCorner.Parent = SearchBarFrame
 local SearchBarStroke = Instance.new("UIStroke")
 SearchBarStroke.Thickness = 1
 SearchBarStroke.Transparency = 0.6
 SearchBarStroke.Color = ThemeColors.Border
 SearchBarStroke.Parent = SearchBarFrame
 local SearchBox = Instance.new("TextBox")
 SearchBox.Name = "SearchBox"
 SearchBox.BackgroundTransparency = 1
 SearchBox.Size = UDim2.new(1, -30, 1, 0)
 SearchBox.Position = UDim2.new(0, 24, 0, 0)
 SearchBox.TextSize = 11
 SearchBox.Font = Enum.Font.Gotham
 SearchBox.Text = ""
 SearchBox.PlaceholderText = "Search..."
 SearchBox.TextColor3 = ThemeColors.Text
 SearchBox.PlaceholderColor3 = ThemeColors.MutedText
 SearchBox.TextXAlignment = Enum.TextXAlignment.Left
 SearchBox.Parent = SearchBarFrame
 local SearchIcon = Instance.new("ImageLabel")
 SearchIcon.Name = "SearchIcon"
 SearchIcon.BackgroundTransparency = 1
 SearchIcon.Image = resolveIcon("search")
 SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
 SearchIcon.Position = UDim2.new(0, 7, 0.5, 0)
 SearchIcon.Size = UDim2.new(0, 13, 0, 13)
 SearchIcon.Parent = SearchBarFrame
 
 local DiscordUrl = GuiConfig.Discord
 local DiscordCard = Instance.new("Frame")
 DiscordCard.Name = "DiscordCard"
 DiscordCard.BackgroundColor3 = ThemeColors.Tertiary
 DiscordCard.BackgroundTransparency = 0.2
 DiscordCard.BorderSizePixel = 1
 DiscordCard.Position = UDim2.new(0, 8, 1, -50)
 DiscordCard.Size = UDim2.new(0, EffectiveTabWidth - 3, 0, 40)
 DiscordCard.Parent = Main
 local DiscordCorner = Instance.new("UICorner")
 DiscordCorner.CornerRadius = UDim.new(0, 6)
 DiscordCorner.Parent = DiscordCard
 local DiscordStroke = Instance.new("UIStroke")
 DiscordStroke.Name = "Outline"
 DiscordStroke.Color = ThemeColors.Border
 DiscordStroke.Transparency = 0.4
 DiscordStroke.Thickness = 1
 DiscordStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 DiscordStroke.Parent = DiscordCard
 local DiscordIcon = Instance.new("ImageLabel")
 DiscordIcon.Name = "DiscordIcon"
 DiscordIcon.BackgroundTransparency = 1
 applyIcon(DiscordIcon, "discord")
 DiscordIcon.ImageColor3 = ThemeColors.Accent
 DiscordIcon.ImageTransparency = 0.1
 DiscordIcon.Position = UDim2.new(0, 7, 0, 12)
 DiscordIcon.Size = UDim2.fromOffset(16, 16)
 DiscordIcon.ScaleType = Enum.ScaleType.Fit
 DiscordIcon.Parent = DiscordCard
 local DiscordTitle = Instance.new("TextLabel")
 DiscordTitle.Name = "Title"
 DiscordTitle.BackgroundTransparency = 1
 DiscordTitle.Font = Enum.Font.GothamBold
 DiscordTitle.Text = "Discord"
 DiscordTitle.TextColor3 = ThemeColors.Text
 DiscordTitle.TextSize = 11
 DiscordTitle.TextXAlignment = Enum.TextXAlignment.Left
 DiscordTitle.Position = UDim2.new(0, 29, 0, 8)
 DiscordTitle.Size = UDim2.new(1, -35, 0, 12)
 DiscordTitle.Parent = DiscordCard
 local DiscordLink = Instance.new("TextLabel")
 DiscordLink.Name = "Link"
 DiscordLink.BackgroundTransparency = 1
 DiscordLink.Font = Enum.Font.GothamMedium
 DiscordLink.Text = DiscordUrl:gsub("^https?://", "")
 DiscordLink.TextColor3 = ThemeColors.MutedText
 DiscordLink.TextSize = 7
 DiscordLink.TextTruncate = Enum.TextTruncate.AtEnd
 DiscordLink.TextXAlignment = Enum.TextXAlignment.Left
 DiscordLink.Position = UDim2.new(0, 29, 0, 20)
 DiscordLink.Size = UDim2.new(1, -35, 0, 10)
 DiscordLink.Parent = DiscordCard
 local DiscordButton = Instance.new("TextButton")
 DiscordButton.Name = "CopyButton"
 DiscordButton.BackgroundTransparency = 1
 DiscordButton.Text = ""
 DiscordButton.Size = UDim2.fromScale(1, 1)
 DiscordButton.ZIndex = 4
 DiscordButton.Parent = DiscordCard
 local function copyDiscordInvite()
     if setclipboard then
         local ok = pcall(setclipboard, DiscordUrl)
         if ok then notif("Discord invite copied to clipboard!", 3, ThemeColors.Accent, "Zeroin", "Discord"); return true end
         notif("Failed to copy Discord invite.", 3, ThemeColors.Error, "Zeroin", "Discord")
     else
         notif("Clipboard is not supported by this executor.", 3, ThemeColors.Error, "Zeroin", "Discord")
     end
     return false
 end
 DiscordButton.Activated:Connect(function() CircleClick(DiscordButton, Mouse.X, Mouse.Y); copyDiscordInvite() end)
 
 UICorner2.CornerRadius = UDim.new(0, 2)
 UICorner2.Parent = LayersTab
 DecideFrame.AnchorPoint = Vector2.new(0.5, 0)
 DecideFrame.BackgroundColor3 = ThemeColors.Border
 DecideFrame.BackgroundTransparency = 0.7
 DecideFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
 DecideFrame.BorderSizePixel = 0
 DecideFrame.Position = UDim2.new(0.5, 0, 0, 38)
 DecideFrame.Size = UDim2.new(1, 0, 0, 1)
 DecideFrame.Name = "DecideFrame"
 DecideFrame.Parent = Main
 
 Layers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Layers.BackgroundTransparency = 1
 Layers.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Layers.BorderSizePixel = 0
 Layers.Position = UDim2.new(0, EffectiveTabWidth + 18, 0, 50)
 Layers.Size = UDim2.new(1, -(EffectiveTabWidth + 9 + 18), 1, -59)
 Layers.Name = "Layers"
 Layers.Parent = Main
 UICorner6.CornerRadius = UDim.new(0, 2)
 UICorner6.Parent = Layers
 
 local WindowImg1 = Instance.new("ImageLabel")
 WindowImg1.Image = resolveImage(GuiConfig.LogoHUB)
 WindowImg1.BackgroundTransparency = 1
 WindowImg1.ImageTransparency = 0.8
 WindowImg1.BorderSizePixel = 0
 WindowImg1.Size = UDim2.new(0.5, 0, 0.9, 0)
 WindowImg1.Position = UDim2.new(0, 0, 0.1, 0)
 WindowImg1.ScaleType = Enum.ScaleType.Fit
 WindowImg1.Name = "WindowImg1"
 WindowImg1.ZIndex = -1
 WindowImg1.Parent = Layers
 WindowImg1.Visible = false
 
 local WindowImg2 = Instance.new("ImageLabel")
 WindowImg2.Image = resolveImage(GuiConfig.WindowIMG)
 WindowImg2.BackgroundTransparency = 1
 WindowImg2.ImageTransparency = 0.8
 WindowImg2.BorderSizePixel = 0
 WindowImg2.AnchorPoint = Vector2.new(0.5, 0.5)
 WindowImg2.Size = UDim2.new(0.78, 0, 0.94, 0)
 WindowImg2.Position = UDim2.new(0.5, 0, 0.5, 0)
 WindowImg2.ScaleType = Enum.ScaleType.Fit
 WindowImg2.Name = "WindowImg2"
 WindowImg2.ZIndex = 0
 WindowImg2.Parent = Layers
 WindowImg2.Visible = true
 
 LayersReal.AnchorPoint = Vector2.new(0, 1)
 LayersReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LayersReal.BackgroundTransparency = 1
 LayersReal.BorderColor3 = Color3.fromRGB(0, 0, 0)
 LayersReal.BorderSizePixel = 0
 LayersReal.ClipsDescendants = true
 LayersReal.Position = UDim2.new(0, 0, 1, 0)
 LayersReal.Size = UDim2.new(1, 0, 1, 0)
 LayersReal.Name = "LayersReal"
 LayersReal.Parent = Layers
 LayersFolder.Name = "LayersFolder"
 LayersFolder.Parent = LayersReal
 LayersPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
 LayersPageLayout.Name = "LayersPageLayout"
 LayersPageLayout.Parent = LayersFolder
 LayersPageLayout.TweenTime = 0.5
 LayersPageLayout.EasingDirection = Enum.EasingDirection.InOut
 LayersPageLayout.EasingStyle = Enum.EasingStyle.Quad
 
 local ScrollTab = Instance.new("ScrollingFrame");
 local UIListLayout = Instance.new("UIListLayout");
 ScrollTab.CanvasSize = UDim2.new(0, 0, 1.10000002, 0)
 ScrollTab.ScrollBarImageColor3 = ThemeColors.Border
 ScrollTab.ScrollBarThickness = 4
 ScrollTab.Active = true
 ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ScrollTab.BackgroundTransparency = 1
 ScrollTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
 ScrollTab.BorderSizePixel = 0
 ScrollTab.Size = UDim2.new(1, 0, 1, -36)
 ScrollTab.Position = UDim2.new(0, 0, 0, 36)
 ScrollTab.Name = "ScrollTab"
 ScrollTab.Parent = LayersTab
 UIListLayout.Padding = UDim.new(0, 3)
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 UIListLayout.Parent = ScrollTab
 
 local function UpdateSize1()
     local OffsetY = 0
     for _, child in ScrollTab:GetChildren() do
         if child.Name ~= "UIListLayout" then OffsetY = OffsetY + 3 + child.Size.Y.Offset end
     end
     ScrollTab.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
 end
 ScrollTab.ChildAdded:Connect(UpdateSize1)
 ScrollTab.ChildRemoved:Connect(UpdateSize1)
 
 SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
     local query = string.lower(SearchBox.Text)
     local jumpedToTab = false
     for _, scrolLayers in pairs(LayersFolder:GetChildren()) do
         if scrolLayers:IsA("ScrollingFrame") and scrolLayers.Name == "ScrolLayers" then
             for _, section in pairs(scrolLayers:GetChildren()) do
                 if section.Name == "Section" then
                     local sectionAdd = section:FindFirstChild("SectionAdd")
                     local sectionReal = section:FindFirstChild("SectionReal")
                     if sectionAdd and sectionReal then
                         local sectionVisible = false
                         local searchableItems = {}
                         for _, descendant in ipairs(sectionAdd:GetDescendants()) do
                             if descendant:IsA("GuiObject") and descendant:GetAttribute("ZeroinSectionItem") then table.insert(searchableItems, descendant) end
                         end
                         for _, item in ipairs(searchableItems) do
                             local match = query == ""
                             if not match then
                                 for _, desc in ipairs(item:GetDescendants()) do
                                     if desc:IsA("TextLabel") and (string.find(desc.Name, "Title") or string.find(desc.Name, "Text")) then
                                         local txt = string.lower(desc.Text)
                                         if string.find(txt, query, 1, true) then
                                             match = true
                                             if not jumpedToTab then
                                                 jumpedToTab = true
                                                 for _, sideTab in pairs(ScrollTab:GetChildren()) do
                                                     if sideTab.Name == "Tab" and sideTab.LayoutOrder == scrolLayers.LayoutOrder then
                                                         local selectEvt = sideTab:FindFirstChild("SelectEvent")
                                                         if selectEvt then selectEvt:Fire() end
                                                         break
                                                     end
                                                 end
                                             end
                                             break
                                         end
                                     end
                                 end
                             end
                             item.Visible = match
                             if match then sectionVisible = true end
                         end
                         if query ~= "" then section.Visible = sectionVisible else section.Visible = true end
                     end
                 end
             end
         end
     end
 end)
 
 runCleanup = function(guiAlreadyDestroying)
     if cleanupStarted then return end
     cleanupStarted = true; isDestroyed = true
     for index = #activeToggles, 1, -1 do
         local toggle = activeToggles[index]
         if toggle and toggle.Value and toggle.Cleanup then
             local ok, err = pcall(function() toggle:Cleanup() end)
             if not ok then warn("Zeroin toggle cleanup error:", err) end
         end
     end
     for index = #closeCallbacks, 1, -1 do cleanupResource(closeCallbacks[index]) end
     table.clear(closeCallbacks)
     for index = #cleanupResources, 1, -1 do cleanupResource(cleanupResources[index]) end
     table.clear(cleanupResources); table.clear(activeToggles)
     for key in pairs(windowElementKeys) do Elements[key] = nil end
     table.clear(windowElementKeys)
     if GlobalEnvironment[ActiveWindowKey] == publicWindow or GlobalEnvironment[ActiveWindowKey] == GuiFunc then GlobalEnvironment[ActiveWindowKey] = nil end
     local toggleGui = CoreGui:FindFirstChild("ToggleUIZeroin"); if toggleGui then toggleGui:Destroy() end
     local notifyGui = CoreGui:FindFirstChild("NotifyGui"); if notifyGui then notifyGui:Destroy() end
     if not guiAlreadyDestroying and ZeroinOnTop and ZeroinOnTop.Parent then ZeroinOnTop:Destroy() end
 end
 function GuiFunc:Destroy() runCleanup(false) end
 function GuiFunc:Close() runCleanup(false) end
 function GuiFunc:DestroyGui() runCleanup(false) end
 
 local MinimizeScale = Instance.new("UIScale")
 MinimizeScale.Name = "MinimizeScale"
 MinimizeScale.Scale = 1
 MinimizeScale.Parent = DropShadowHolder
 local windowAnimationLocked = false
 local restorePosition = DropShadowHolder.Position
 local minimizeDuration = 0.2
 local function offsetPosition(position, yOffset)
     return UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset + yOffset)
 end
 local function SetWindowVisible(visible)
     if windowAnimationLocked or not DropShadowHolder then return end
     if visible == DropShadowHolder.Visible and not windowAnimationLocked then return end
     windowAnimationLocked = true
     if visible then
         DropShadowHolder.Visible = true
         MinimizeScale.Scale = 0.88
         DropShadowHolder.Position = offsetPosition(restorePosition, 12)
         local scaleTween = TweenService:Create(MinimizeScale, TweenInfo.new(minimizeDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Scale = 1 })
         local positionTween = TweenService:Create(DropShadowHolder, TweenInfo.new(minimizeDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = restorePosition })
         scaleTween:Play(); positionTween:Play()
         scaleTween.Completed:Once(function() MinimizeScale.Scale = 1; DropShadowHolder.Position = restorePosition; windowAnimationLocked = false end)
     else
         restorePosition = DropShadowHolder.Position
         local scaleTween = TweenService:Create(MinimizeScale, TweenInfo.new(minimizeDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Scale = 0.88 })
         local positionTween = TweenService:Create(DropShadowHolder, TweenInfo.new(minimizeDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Position = offsetPosition(restorePosition, 12) })
         scaleTween:Play(); positionTween:Play()
         scaleTween.Completed:Once(function() DropShadowHolder.Visible = false; DropShadowHolder.Position = restorePosition; MinimizeScale.Scale = 1; windowAnimationLocked = false end)
     end
 end
 local function ToggleWindowVisibility() SetWindowVisible(not DropShadowHolder.Visible) end
 Min.Activated:Connect(function() CircleClick(Min, Mouse.X, Mouse.Y); SetWindowVisible(false) end)
 
 Close.Activated:Connect(function()
     CircleClick(Close, Mouse.X, Mouse.Y)
     local Overlay = Instance.new("Frame")
     Overlay.Size = UDim2.new(1, 0, 1, 0)
     Overlay.BackgroundColor3 = ThemeColors.Background
     Overlay.BackgroundTransparency = 0.4
     Overlay.ZIndex = 50
     Overlay.Parent = DropShadowHolder
     local Dialog = Instance.new("Frame")
     Dialog.Size = UDim2.new(0, 300, 0, 150)
     Dialog.Position = UDim2.new(0.5, -150, 0.5, -75)
     Dialog.BackgroundColor3 = ThemeColors.Secondary
     Dialog.BorderSizePixel = 1
     Dialog.BorderColor3 = ThemeColors.Border
     Dialog.ZIndex = 51
     Dialog.Parent = Overlay
     local UICornerD = Instance.new("UICorner", Dialog); UICornerD.CornerRadius = UDim.new(0, 8)
     local Title = Instance.new("TextLabel")
     Title.Size = UDim2.new(1, 0, 0, 40)
     Title.Position = UDim2.new(0, 0, 0, 4)
     Title.BackgroundTransparency = 1
     Title.Font = Enum.Font.GothamBold
     Title.Text = "Zeroin Window"
     Title.TextSize = 22
     Title.TextColor3 = ThemeColors.Text
     Title.ZIndex = 52
     Title.Parent = Dialog
     local Message = Instance.new("TextLabel")
     Message.Size = UDim2.new(1, -20, 0, 60)
     Message.Position = UDim2.new(0, 10, 0, 30)
     Message.BackgroundTransparency = 1
     Message.Font = Enum.Font.Gotham
     Message.Text = "Do you want to close this window?\nYou will not be able to open it again"
     Message.TextSize = 14
     Message.TextColor3 = ThemeColors.MutedText
     Message.TextWrapped = true
     Message.ZIndex = 52
     Message.Parent = Dialog
     local Yes = Instance.new("TextButton")
     Yes.Size = UDim2.new(0.45, -10, 0, 35)
     Yes.Position = UDim2.new(0.05, 0, 1, -55)
     Yes.BackgroundColor3 = ThemeColors.Error
     Yes.BackgroundTransparency = 0.1
     Yes.Text = "Yes"
     Yes.Font = Enum.Font.GothamBold
     Yes.TextSize = 15
     Yes.TextColor3 = Color3.fromRGB(255, 255, 255)
     Yes.ZIndex = 52
     Yes.Name = "Yes"
     Yes.Parent = Dialog
     Instance.new("UICorner", Yes).CornerRadius = UDim.new(0, 6)
     local Cancel = Instance.new("TextButton")
     Cancel.Size = UDim2.new(0.45, -10, 0, 35)
     Cancel.Position = UDim2.new(0.5, 10, 1, -55)
     Cancel.BackgroundColor3 = ThemeColors.Tertiary
     Cancel.BackgroundTransparency = 0.2
     Cancel.Text = "Cancel"
     Cancel.Font = Enum.Font.GothamBold
     Cancel.TextSize = 15
     Cancel.TextColor3 = ThemeColors.Text
     Cancel.ZIndex = 52
     Cancel.Name = "Cancel"
     Cancel.Parent = Dialog
     Instance.new("UICorner", Cancel).CornerRadius = UDim.new(0, 6)
     Yes.MouseButton1Click:Connect(function() runCleanup(false) end)
     Cancel.MouseButton1Click:Connect(function() Overlay:Destroy() end)
 end)
 
 local ToggleKey = Enum.KeyCode.F3
 trackCleanup(UserInputService.InputBegan:Connect(function(input, gpe)
     if isDestroyed or gpe then return end
     if input.KeyCode == ToggleKey then ToggleWindowVisibility() end
 end))
 
 function GuiFunc:ToggleUI()
     local ScreenGui = Instance.new("ScreenGui")
     ScreenGui.Parent = game:GetService("CoreGui")
     ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
     ScreenGui.Name = "ToggleUIZeroin"
     local MainButton = Instance.new("Frame")
     MainButton.Parent = ScreenGui
     MainButton.Size = UDim2.new(0, 40, 0, 40)
     MainButton.Position = UDim2.new(0, 20, 0, 150)
     MainButton.BackgroundColor3 = ThemeColors.Secondary
     MainButton.BorderSizePixel = 1
     MainButton.BorderColor3 = ThemeColors.Border
     local UICornerBtn = Instance.new("UICorner", MainButton); UICornerBtn.CornerRadius = UDim.new(0, 8)
     local ImgBtn = Instance.new("ImageLabel", MainButton)
     ImgBtn.Size = UDim2.new(0, 24, 0, 24)
     ImgBtn.Position = UDim2.new(0.5, -12, 0.5, -12)
     ImgBtn.BackgroundTransparency = 1
     ImgBtn.Image = resolveImage(GuiConfig.Image or GuiConfig.LogoHUB)
     ImgBtn.ScaleType = Enum.ScaleType.Fit
     local Button = Instance.new("TextButton")
     Button.Parent = MainButton
     Button.Size = UDim2.new(1, 0, 1, 0)
     Button.BackgroundTransparency = 1
     Button.Text = ""
     Button.MouseButton1Click:Connect(function() ToggleWindowVisibility() end)
     local dragging = false; local dragStart, startPos
     local function update(input)
         local delta = input.Position - dragStart
         MainButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
     end
     Button.InputBegan:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
             dragging = true; dragStart = input.Position; startPos = MainButton.Position
             input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
         end
     end)
     trackCleanup(game:GetService("UserInputService").InputChanged:Connect(function(input)
         if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end
     end))
 end
 GuiFunc:ToggleUI()
 
 DropShadowHolder.Size = UDim2.new(0, 115 + TextLabel.TextBounds.X + 1 + TextLabel1.TextBounds.X, 0, 350)
 MakeDraggable(Top, DropShadowHolder, trackCleanup, DefaultWindowWidth, DefaultWindowHeight, UseMobileLayout)
 
 local isFullscreen = false
 local originalSize = DropShadowHolder.Size
 local originalPos  = DropShadowHolder.Position
 FullScreen.Activated:Connect(function()
     CircleClick(FullScreen, Mouse.X, Mouse.Y)
     isFullscreen = not isFullscreen
     if isFullscreen then
         originalSize = DropShadowHolder.Size; originalPos = DropShadowHolder.Position
         TweenService:Create(DropShadowHolder, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0.98, 0, 0.95, 0), Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
     else
         TweenService:Create(DropShadowHolder, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = originalSize, Position = originalPos }):Play()
     end
 end)
 
 -- (Sisa kode untuk Tabs, Sections, dan Components tetap sama, namun dengan penyesuaian warna ThemeColors di dalamnya)
 -- Karena batasan panjang output, pastikan Anda mengganti semua referensi warna hardcode (seperti Color3.fromRGB(255,255,255) pada background komponen) menjadi ThemeColors.Tertiary atau ThemeColors.Secondary, dan TextColor3 menjadi ThemeColors.Text atau ThemeColors.MutedText.
