-- Formatted by LEZUN helper: whitespace/layout only; logic intentionally not rewritten.
-- Source from: =LUKZ_SCRIPT
local a, b, c
local d = game:GetService('Players')
local e = game:GetService('ReplicatedStorage')
local f = game:GetService('ProximityPromptService')
local g = d.LocalPlayer
local h = game:GetService('RunService') game:GetService('TweenService')
local i = game:GetService('TeleportService')
local j = game:GetService('Workspace')
local function k()
return j:FindFirstChild('World') or j:FindFirstChild('__OBJECTS')
end
local l = getgenv and getgenv() or _G
if type(l.__SenaV4HubShutdown) == 'function' then
    pcall(l.__SenaV4HubShutdown)
end
local m ={} l.__SenaV4HubSession = m
local function n()
return l.__SenaV4HubSession == m
end
do
    local o ={'hookfunction', 'hookmetamethod', 'getconnections', 'getgc', 'getrawmetatable', 'firetouchinterest', 'newcclosure', 'getnamecallmethod', 'checkcaller',
    'getcallingscript'}
    local p = l.iscclosure or rawget(_G, 'iscclosure')
    local q = l.isfunctionhooked or rawget(_G, 'isfunctionhooked')
    local r ={}
    for s, t in ipairs(o) do
        r[t] = l[t]
    end
    local function u(v)
    if type(v) ~= 'function' then
        return false
    end
    if type(p) == 'function' then
        local w, x = pcall(p, v)
        if w and x == false then
            return true
        end
    end
    if type(q) == 'function' then
        local w, x = pcall(q, v)
        if w and x == true then
            return true
        end
    end
    return false
end
local function v()
for w, x in ipairs(o) do
    local y = l[x]
    if y ~= r[x] then
        return 'api:'..x
        elseif
        u(y) then
            return 'api:'..x
        end
    end
    local y = r.getrawmetatable
    if type(y) == 'function' then
        local z, A = pcall(y, game)
        if z and type(A) == 'table' then
            for B, C in ipairs({'__namecall', '__index', '__newindex'}) do
                if u(rawget(A, C)) then
                    return 'mt:'..C
                end
            end
        end
    end
    local z = Instance.new('RemoteEvent')
    local A = Instance.new('RemoteFunction')
    local B =
    if u(z.FireServer) then
        'remote:FireServer'
        else
        if u(A.InvokeServer) then
            'remote:InvokeServer'
            else
            nil z:Destroy() A:Destroy()
            return B
        end
        local function w(y)
        if l.__SenaV4TamperRejoining then
            return
        end
        l.__SenaV4TamperRejoining = true warn('[Sena] tamper detected ('..tostring(y)..') - rejoining') pcall(
        function() i:TeleportToPlaceInstance(game.PlaceId, game.JobId, g)
    end
    ) task.delay(5,
    function() pcall(
    function() i:Teleport(game.PlaceId, g)
end
)
end
)
end
local y, z = pcall(v)
if y and z then
    w(z)
end
task.spawn(
function()
while n() do
    task.wait(3)
    local A, B = pcall(v)
    if A and B then
        w(B)
        break
    end
end
end
)
end
l.__SenaV4IdentityGetter = l.getthreadidentity or l.get_thread_identity or l.getidentity or l.getthreadcontext or l.get_thread_context l.__SenaV4IdentitySetter = l.setthreadidentity or l.set_thread_identity or l.setidentity or l.setthreadcontext or l.set_thread_context
local o = l.__SenaV4IdentitySetter
if type(o) == 'function' then
    pcall(o, 8) l.__SenaV4UICapabilityIdentity = 8
end
if not rawget(_G, 'setfpscap') and not rawget(_G, 'set_fps_cap') then
    o = type(setfpscap) == 'function'
end
l.__SenaV4SetCapFps =
function(p)
local q = tonumber(p) or 240
local r = math.clamp(math.floor(q), 1, 1000)
local s = rawget(_G, 'setfpscap') or rawget(_G, 'set_fps_cap') or type(setfpscap) == 'function' and setfpscap
if type(s) == 'function' then
    return pcall(s, r)
end
return false
end
if type(l.__SenaV4TweenRuntimeCleanup) == 'function' then
    pcall(l.__SenaV4TweenRuntimeCleanup)
end
if type(l.__SenaV4EggRuntimeCleanup) == 'function' then
    pcall(l.__SenaV4EggRuntimeCleanup)
end
if type(l.__SenaV4AntiGuardCleanup) == 'function' then
    pcall(l.__SenaV4AntiGuardCleanup)
end
l.__SenaV4TweenRuntimeGeneration =(l.__SenaV4TweenRuntimeGeneration or 0) + 1
local p ={l.__SenaV4TweenRuntimeGeneration,{KEY = '__SenaV4StealAnEggMovementSpoof', VERSION = 436, INTEGRITY_KEY = '__SenaV4StealAnEggIntegritySpoof',
SIGNAL = 'ClientCharacter: GetDebugSnapshot', HEADROOM = 1.35, CLAMP = 0.15, PADDING = 24, MULTIPLIER = 10, MIN_INPUT = 20, MAX_INPUT = 100, DEF_INPUT = 60,
MIN_SPEED = 200, MAX_SPEED = 1000, DEF_SPEED = 600, FIELDS ={'LastObservedSample', 'LastSample', 'LastGoodSample', 'LastGameplayTrustedSample', 'LastValidatedSample',
'LastValidatedGroundedSample', 'LastConfirmedGroundSample', 'CandidateGroundedSample'}}} p.n = 2
local q a, q = p[1], p[2]
local r = q.KEY
local s = q.VERSION
local t = q.INTEGRITY_KEY
local u = q.SIGNAL
local v = q.HEADROOM
local w = q.CLAMP
local y = q.PADDING
local z = q.MULTIPLIER
local A = q.MIN_INPUT
local B = q.MAX_INPUT
local C = q.DEF_INPUT
local D = q.MIN_SPEED
local E = q.MAX_SPEED
local F = q.DEF_SPEED
local G = q.FIELDS
local H = 60 game:GetService('RunService').Heartbeat:Connect(
function(I)
if I and I > 0 then
    H = H * 0.9 + 1 / I * 0.1
end
end
)
local function I()
return H
end
l.__SenaV4NetPing =
function()
local J = 0 pcall(
function() J = game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()
end
)
return tonumber(J) or 0
end
local J, K, L, M, N = 8, 1, '__SenaV4HoverPad', 'SenaV4RuntimeOwner'
local O = tostring(math.random(100000, 999999))
local P, Q
local R, S, T ={}
local function U()
for V, W in ipairs(j:GetChildren()) do
    if W:IsA('BasePart') and(W.Name == L and W ~= N) then
        pcall(W.Destroy, W)
    end
end
end
local function V(W)
if N then
    if not N.Parent then
        return false
    end
    else
    return false
end
local X = g.Character
local Y = X and X:FindFirstChild('HumanoidRootPart')
local Z = X and X:FindFirstChildOfClass('Humanoid')
if Y then
    if not Z then
        return false
    end
    else
    return false
end
local _ = typeof(W) == 'Vector3' and W or Y.Position
local aa = Z.RigType == Enum.HumanoidRigType.R15 and Y.Size.Y * 0.5 + math.max(Z.HipHeight, 0.5) or Y.Size.Y * 0.5 + 2 N.CFrame = CFrame.new(_.X, _.Y - aa - K * 0.5 - 0.05,
_.Z)
return true
end
local function aa()
if(
if N then
    not N.Parent
    else
    not N) or N:GetAttribute(M) ~= O then
        U()
        if N and N.Parent then
            pcall(N.Destroy, N)
        end
        local W = Instance.new('Part') W.Name = L W:SetAttribute(M, O) W.Anchored = true W.CanCollide = true W.CanQuery = true W.CanTouch = false W.CastShadow = false W.Transparency = 1 W.Material = Enum.Material.SmoothPlastic W.Size = Vector3.new(J,
        K, J) N = W W.Parent = j
    end
    V()
    if not P then
        P = h.PreSimulation:Connect(
        function()
        if not V() then
            aa()
        end
    end
    )
end
if not Q then
    Q = h.PostSimulation:Connect(
    function() V()
end
)
end
end
local function W()
if P then
    pcall(P.Disconnect, P) P = nil
end
if Q then
    pcall(Q.Disconnect, Q) Q = nil
end
if N then
    pcall(N.Destroy, N) N = nil
end
U()
end
W()
local function X() S = nil
end
local function Y(Z, _)
local ab ={}
if Z and typeof(_) == 'CFrame' then
    ab[1] ={} ab[1].Character = g.Character ab[1].RootPart = Z ab[1].CFrame = _ S = ab[1]
end
end
local function ab()
local Z = S
if type(Z) ~= 'table' then
    return false
    elseif
    typeof(Z.CFrame) ~= 'CFrame' then
        return false
    end
    if g.Character ~= Z.Character then
        S = nil
        return false
        else
        if Z.RootPart then
            if not Z.RootPart.Parent then
                S = nil
                return false
            end
            else
            S = nil
            return false
        end
    end
    aa() Z.RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0) Z.RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(Z.CFrame.Position) Z.RootPart.CFrame = Z.CFrame V(Z.CFrame.Position)
    return true
end
local function Z()
local _ = g.Character
local ac = _ and _:FindFirstChild('HumanoidRootPart')
for ad, ae in pairs(R) do
    if type(ae) == 'table' then
        ae.cancelled = true
    end
end
table.clear(R)
if ac then
    ac.AssemblyLinearVelocity = Vector3.new(0, 0, 0) ac.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
X() W()
end
l.__SenaV4TweenRuntimeCleanup =
function()
for ac, ad in pairs(R) do
    if type(ad) == 'table' then
        ad.cancelled = true
    end
end
table.clear(R) X() W()
end
local function ac()
return getgenv and getgenv() or _G
end
local function ad()
local ae = ac()
local _ = ae[r]
if type(_) ~= 'table' or _.Version ~= s then
    if type(_) == 'table' then
        _.Enabled = false
    end
    _ ={Version = s, Installed = false, Enabled = false, Mode = 'StateBaseline', Humanoid = nil, RootPart = nil, WalkSpeed = F} ae[r] = _
end
return _
end
local function ae(_, af)
local ag = ad()
if not ag then
    return false
end
local ah = _ and _:FindFirstChildOfClass('Humanoid')
local ai = _ and _:FindFirstChild('HumanoidRootPart') ag.Humanoid = ah ag.RootPart = ai ag.WalkSpeed = math.clamp(tonumber(af) or F, D, E * v) ag.Enabled = false
return ah ~= nil and ai ~= nil
end
local function af()
local ag = ac()[r]
if type(ag) == 'table' then
    ag.Enabled = false ag.Humanoid = nil ag.RootPart = nil
end
end
local function ag(ah, ai, _)
local aj
if type(getcallbackvalue) == 'function' and type(debug) == 'table' and type(debug.getupvalue) == 'function' then
    local ak = e:FindFirstChild('Packages') and e.Packages:FindFirstChild('Signal')
    if ak then
        local al, am = pcall(require, ak)
        if al and type(am) == 'table' and type(am.Invoked) == 'function' then
            local an, ao = pcall(am.Invoked, u)
            if an and ao then
                local ap, aq = pcall(getcallbackvalue, ao, 'OnInvoke')
                if ap and type(aq) == 'function' then
                    local ar, as = pcall(debug.getinfo, aq)
                    if ar then
                        local function at(au, av, aw)
                        if aj then
                            return
                            elseif
                            type(au) ~= 'table' then
                                return
                                elseif
                                av > 3 then
                                    return
                                    elseif
                                    aw[au] then
                                        return
                                    end
                                    aw[au] = true
                                    if rawget(au, 'Player') == ah and(rawget(au, 'Character') == ah.Character and(rawget(au, 'Humanoid') == ai and(rawget(au, 'RootPart') == _ and(type(rawget(au,
                                    'SampleHistory')) == 'table' and type(rawget(au, 'Evidence')) == 'table')))) then
                                        aj = au
                                        return
                                    end
                                    local ax = 0
                                    for ay, az in pairs(au) do
                                        ax += 1
                                        if ax > 128 then
                                        break
                                    end
                                    if type(az) == 'table' then
                                        at(az, av + 1, aw)
                                    end
                                end
                            end
                            for au = 1, as.nups or 0, 1 do
                                local av, aw = pcall(debug.getupvalue, aq, au)
                                if av and type(aw) == 'table' then
                                    at(aw, 0,{})
                                    if aj then
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if not aj and type(getgc) == 'function' then
        local ak, al = pcall(getgc, true)
        if ak and type(al) == 'table' then
            for am, an in ipairs(al) do
                if type(an) == 'table' and rawget(an, 'Player') == ah and rawget(an, 'Character') == ah.Character and rawget(an, 'Humanoid') == ai and rawget(an, 'RootPart') == _ and type(rawget(an,
                'SampleHistory')) == 'table' and type(rawget(an, 'Evidence')) == 'table' then
                    aj = an
                    break
                end
            end
        end
    end
    return aj
end
local ah ={busy = false, nextAt = 0, misses = 0, found = nil}
local function ai(aj, ak, al)
local am = ah.found
if type(am) == 'table' and(rawget(am, 'Player') == aj and(rawget(am, 'Character') == aj.Character and(rawget(am, 'Humanoid') == ak and rawget(am, 'RootPart') == al))) then
    return am
end
if ah.busy then
    return nil
    elseif
    os.clock() < ah.nextAt then
        return nil
    end
    ah.busy = true task.spawn(
    function() task.wait()
    local an, ao = pcall(ag, aj, ak, al)
    local ap = an and ao or nil ah.found = ap ah.misses = ap and 0 or ah.misses + 1 ah.nextAt = os.clock() +(ap and 0.2 or(ah.misses >= 5 and 10 or 1)) ah.busy = false
end
)
return nil
end
local function aj(ak, al, am)
if type(ak) ~= 'table' then
    return false
end
local an = rawget(ak, 'RootPart')
local ao = an and an.Parent and an.CFrame or nil
local ap = ao and ao.Position or nil
local aq = typeof(am) == 'Vector3' and am or Vector3.new(0, 0, 0)
local function ar(as)
if type(as) == 'table' then
    rawset(as, 'WalkSpeed', al)
    if ao then
        rawset(as, 'CFrame', ao) rawset(as, 'Position', ap) rawset(as, 'LinearVelocity', aq) rawset(as, 'AngularVelocity',(Vector3.new(0, 0, 0)))
    end
end
end
for as, at in ipairs(G) do
    ar(rawget(ak, at))
end
for au, av in pairs(rawget(ak, 'SampleHistory') or{}) do
    ar(av)
end
for aw, ax in pairs(rawget(ak, 'SafeGroundCheckpoints') or{}) do
    ar(ax)
end
local ay = rawget(ak, 'Evidence')
if type(ay) == 'table' then
    ay.Speed = 0 ay.Teleport = 0 ay.Flight = 0
end
local az = rawget(ak, 'ImpulseContext')
if type(az) == 'table' then
    local _ = math.max(tonumber(az.MaxHorizontalSpeed) or 0, al)
    local aA = math.max((tonumber(az.ExpiresAt) or 0) -(tonumber(az.StartedAt) or 0), w) az.MaxHorizontalSpeed = _
    if ap then
        az.OriginPosition = ap
    end
    az.MaxHorizontalDistance = math.max(tonumber(az.MaxHorizontalDistance) or 0, _ * aA + y * 2) ar(az.PreMovementSafeSample)
end
if rawget(ak, 'CorrectionContext') == nil then
    rawset(ak, 'FirstSuspiciousAt', nil)
    if rawget(ak, 'ThreatLevel') == 'Observing' then
        rawset(ak, 'ThreatLevel', 'Trusted')
    end
end
return true
end
local function ak()
local al = ac()
local am = al[t]
if type(am) ~= 'table' then
    am ={} al[t] = am
end
return am
end
local function al(am, an, ao)
return type(am) == 'table' and rawget(am, 'Player') == g and rawget(am, 'Character') == g.Character and rawget(am, 'Humanoid') == an and rawget(am, 'RootPart') == ao
end
local function am(an, ao, ap)
return al(an, ao, ap)
end
local function an(ao, ap, aq)
local ar = ak()
local as = ar.State
if al(as, ao, ap) then
    else
    local at = os.clock()
    if at <(ar.NextSearchAt or 0) then
        return false
    end
    ar.NextSearchAt = at + 0.2 as = ai(g, ao, ap)
end
if not as then
    return false
end
if not am(as, ao, ap) then
    ar.Enabled = false ar.Humanoid = ao ar.RootPart = ap ar.State = as
    return false
end
ar.NextSearchAt = 0 ar.Enabled = true ar.Humanoid = ao ar.RootPart = ap ar.State = as ar.WalkSpeed = math.clamp(aq * v, D, E * v) ar.TravelVelocity = Vector3.new(0,
0, 0) aj(as, ar.WalkSpeed, ar.TravelVelocity)
return true
end
local function ao(ap, aq, ar, as)
local at = ac()[t]
if type(at) ~= 'table' then
    return false
    elseif
    at.Enabled then
        if at.Humanoid ~= ap then
            return false
            elseif
            at.RootPart ~= aq then
                return false
                elseif
                not am(at.State, ap, aq) then
                    return false
                end
                else
                return false
            end
            at.WalkSpeed = math.clamp(ar * v, D, E * v)
            if typeof(as) == 'Vector3' then
                at.TravelVelocity = as
                elseif
                typeof(at.TravelVelocity) ~= 'Vector3' then
                    at.TravelVelocity = Vector3.new(0, 0, 0)
                end
                return aj(at.State, at.WalkSpeed, at.TravelVelocity)
            end
            local function ap(aq)
            local ar = ac()[t]
            if type(ar) ~= 'table' then
                return
            end
            if aq == nil or ar.Humanoid == aq then
                ar.Enabled = false ar.Humanoid = nil ar.RootPart = nil ar.State = nil ar.TravelVelocity = nil ar.NextSearchAt = 0
            end
        end
        local aq
        local function ar()
        if aq then
            return
        end
        aq = h.PreSimulation:Connect(
        function()
        if l.__SenaV4TweenRuntimeGeneration ~= a then
            local as = aq aq = nil
            if as then
                pcall(as.Disconnect, as)
            end
            return
        end
        local as = g.Character
        local at = as and as:FindFirstChild('HumanoidRootPart')
        local aw = as and as:FindFirstChildOfClass('Humanoid')
        if as then
            if at then
                if not aw then
                    return
                end
                else
                return
            end
            else
            return
        end
        local ax = T() ae(as, ax * v)
        if not ao(aw, at, ax) then
            an(aw, at, ax)
        end
        ab()
    end
    )
end
local function as()
if aq then
    pcall(aq.Disconnect, aq) aq = nil
end
af() ap()
end
l.__SenaV4TweenRuntimeCleanup =
function() Z() as()
end
local function at()
local aw = g.Character
local ax = aw and aw:FindFirstChild('HumanoidRootPart')
if not ax then
    return
end
local ay = ax.AssemblyLinearVelocity
local az = aw:FindFirstChildOfClass('Humanoid')
local aA = az and az.WalkSpeed or 0
local _ = Vector3.new(ay.X, 0, ay.Z)
if _.Magnitude > math.max(400, aA * 1.5) or math.abs(ay.Y) > 400 then
    local aB = math.max(100, aA)
    local aC =
    if _.Magnitude > aB then
        _.Unit * aB
        else
        _ ax.AssemblyLinearVelocity = Vector3.new(aC.X, math.clamp(ay.Y, - 100, 100), aC.Z)
    end
end
h.Heartbeat:Connect(at)
local aw = false pcall(
function()
local ax = queue_on_teleport or queueonteleport or syn and syn.queue_on_teleport
if ax then
    pcall(ax, '')
end
end
) pcall(
function() game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
end
)
local ax, ay
local function az(aA)
if not aA then
    return
end
local aB = aA:WaitForChild('Humanoid', 5) or aA:FindFirstChildOfClass('Humanoid')
if not aA:WaitForChild('HumanoidRootPart', 5) then
    aA:FindFirstChild('HumanoidRootPart')
end
if not aB then
    return
end
local aC = math.max(aB.MaxHealth, 100)
local _ = false
local aD = 0
local function aE()
if _ then
    return
    elseif
    not aB.Parent then
        return
    end
    local aF = os.clock()
    if aF - aD < 0.1 and(aB.Health > 0 and aB:GetState() ~= Enum.HumanoidStateType.Dead) then
        return
    end
    aD, _ = aF, true pcall(
    function() aB.BreakJointsOnDeath = false aB.RequiresNeck = false aB:SetStateEnabled(Enum.HumanoidStateType.Dead, false) aB:SetStateEnabled(Enum.HumanoidStateType.FallingDown,
    false) aB:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    if aB.Health <= 0 then
        aB.Health = aC
    end
    if aB:GetState() == Enum.HumanoidStateType.Dead then
        aB:ChangeState(Enum.HumanoidStateType.Running)
    end
end
) _ = false
end
aE()
if ax then
    pcall(ax.Disconnect, ax)
end
if ay then
    pcall(ay.Disconnect, ay)
end
ax = aB.HealthChanged:Connect(
function(aF)
if aF <= 0 then
    aE()
    elseif
    aF < aC then
        aE()
    end
end
) ay = h.Heartbeat:Connect(aE)
end
task.spawn(
function() az(g.Character or g.CharacterAdded:Wait())
end
)
local function aA(aB) az(aB)
end
g.CharacterAdded:Connect(aA)
local aB ={AutoSteal = false, HelpFriend = false, LowSpeedBoost = false, StarAlert = true, ScrambleTradeInTrade = false, ScrambleTradeInReroll = false,
ScrambleTradeInBanners ={}, ScrambleBossAuto = false, StealMode = 'Instant', FlyAerial = false, FlyZigzag = false, StealHoldSeconds = 5, StealAreas ={'None'},
StealRarities ={'None'}, StealNamesFilter ={'None'}, StealMinValue = 0, StealMutations ={'None'}, StealMinWeight = 0, StealPriority = 'Highest Value', TaskOrder ={'auto_steal',
'race', 'star', 'mech_boss', 'butterfly', 'auto_place', 'use_scrambled', 'auto_sell', 'treadmill'}, AutoFavorite = false, FavMode = 'Rarity', FavRarities ={'None'},
FavSpecies ={'None'}, AutoEquipBest = false, AutoClaimOffline = false, AutoBaseUpgrade = false, AutoClaimAlmanac = false, AutoFusePets = false, ScrambleAutoBuy = false,
ScrambleBuyList ={}, ButterflyAutoNet = false, ButterflyAutoCatch = false, ButterflyEsp = false, ButterflyTiers ={}, ButterflyAutoTrade = false, ButterflyTradeRecipe = 'All',
ButterflyCatchMode = 'Tween', ButterflyAutoCraft = false, WispAutoQuest = false, BanjoAuto = false, Noclip = false, BottingMode = false, AntiCutscene = false,
FuseSelectedOnly = false, FuseRarities ={'None'}, FuseSpecies ={'None'}, EspDetails ={'Name', 'Rarity', 'Value'}, BackpackRateEsp = false, AntiAFK = true,
AutoReconnect = true, AutoExecute = false, AutoPlace = false, PlaceRarities ={'None'}, AutoHatch = false, SellAll = false, AutoSell = false, SellNames ={'None'},
SellRarities ={'None'}, AutoSellEgg = false, SellEggRarities ={'None'}, WebhookEnabled = false, WebhookURL = '', WebhookDisconnect = false, TweenSpeedMultiplier = 60,
AutoTreadmillIdle = false, AutoTreadmillUpgrade = false, AntiTreadmill = false, HopNoMatch = false, PrivateServerMax = '2', PrivateServerAuto = false, HopCooldown = 5,
AutoIndex = false, AntiHitGuard = false, FlyForCapture = false, AutoStealCapture = false, InstantGrab = false, InfiniteJump = false, WalkSpeedMultiplier = 1,
AntiGuardKnockback = true, GodMode = true, EggPredictUI = false, EggESP = false, StealPlayers = false, StealPlayerRarities ={'None'}, StealPlayerMinValue = 0,
StealPlayerTarget = 'Any Player', WebhookRarities ={'None'}, WebhookMinValue = 0}
local aC = require(game:GetService('ReplicatedStorage').Client.EggState) aC.GetAreaEggSnapshot = aC.ReadFieldEggs aC.GetAreaEggRecord = aC.ReadFieldEgg aC.RequestAreaEggSnapshot = aC.SyncFieldEggs aC.RequestCarryAreaEgg = aC.CarryFieldEgg aC.RequestDropHeldAreaEgg = aC.DropFieldEgg aC.AreaEggCarryStateChanged = aC.CarryChanged aC.AreaEggClaimed = aC.FieldClaimed aC.AreaEggUpdated = aC.FieldShifted aC.AreaEggRemoved = aC.FieldGone aC.GetOwnerRuntimeRecords = aC.ReadOwnerEggs aC.RequestEquipTool = aC.WearEggTool aC.RequestPlaceEgg = aC.PlantEgg aC.RequestHatchEgg = aC.BeginHatch aC.RequestCompleteHatchEgg = aC.FinishHatch aC.RequestRuntimeSnapshot = aC.SyncOwnedEggs aC.RuntimeOwnerUpdated = aC.OwnerRefreshed aC.RuntimeOwnerCleared = aC.OwnerCleared
local aD = require(game:GetService('ReplicatedStorage').Client.PlotState) aD.GetMySlot = aD.ResolveLocalSlot aD.GetPlotsFolder = aD.ResolveFolder aD.IsWorldPositionWithinLocalPlotBounds = aD.ContainsLocalPoint aD.GetPlotData = aD.ResolvePlot
local aE = require(game:GetService('ReplicatedStorage').Client.AreaEggResetWall) aE.IsClosed = aE.IsSealed T =
function()
if l.__SenaV4AdminBoost == true then
    return 4000
end
return math.clamp(math.floor((tonumber(aB.TweenSpeedMultiplier) or q.DEF_INPUT) + 0.5), q.MIN_INPUT, q.MAX_INPUT) * q.MULTIPLIER
end
aB.applyStealValueInput =
function(aF, _)
local aG = string.lower(tostring(_ or '')):gsub('[%s,]', '')
if aG == '' then
    aF.StealMinValue = 0
    return true
end
local aH, aI = string.match(aG, '^([%d]+%.?[%d]*)([kmb]?)$')
local aJ = tonumber(aH)
if not aJ then
    return false
end
aF.StealMinValue = aJ *(
if aI == 'k' then
    1000
    else
    if aI == 'm' then
        1000000
        else
        if aI == 'b' then
            1000000000
            else
            1)
            return true
        end
        aB.getAreaEggValue =
        function(aF, aG)
        if not aF._assetGenerationUtil then
            aF._assetGenerationUtil = require(game:GetService('ReplicatedStorage').Shared.Util.AssetEarnings)
        end
        return aF._assetGenerationUtil.MutationOnlyRatePerSecond({Category = aG.AssetCategory, Scale = aG.AssetScale or 1, Mutations = aG.Mutations or{}, BaseMutation = aG.BaseMutation,
        EyeColor = aG.AssetEyeColor, ColorSeed = aG.AssetColorSeed, ColorIndex = aG.AssetColorIndex, Gender = aG.Gender, Personality = aG.Personality or 'Normal',
        HasBeenFirstPlaced = aG.HasBeenFirstPlaced == true})
    end
    local aF, aG pcall(
    function() aF = require(e.Shared.Util.AreaEggCycle) aG = require(e.Client.AreaEggResetWall)
end
)
local function aH()
if aF and type(aF.IsNightPhase) == 'function' then
    local aI, aJ = pcall(aF.IsNightPhase, workspace:GetServerTimeNow())
    if aI and aJ == true then
        return true
    end
end
if aG then
    if type(aG.IsSealed) == 'function' then
        local aI, aJ = pcall(aG.IsSealed)
        if aI and aJ == true then
            return true
        end
    end
    if type(aG.IsClosed) == 'function' then
        local aI, aJ = pcall(aG.IsClosed)
        if aI and aJ == true then
            return true
        end
    end
end
return false
end
local aI ={} do
    aI.DEFAULT ={'auto_steal', 'race', 'star', 'mech_boss', 'butterfly', 'auto_place', 'use_scrambled', 'auto_sell', 'treadmill'} aI.TITLES ={auto_steal = 'Auto Steal',
    race = 'Race Rally', star = 'Shooting Star', mech_boss = 'Mech Boss', butterfly = 'Butterfly Bloom', auto_place = 'Auto Place', use_scrambled = 'Use Scrambled',
    auto_sell = 'Auto Sell', treadmill = 'Treadmill'} aI.PINNED ={treadmill = true}
    local aJ ={} aI.register =
    function(_, aK) aJ[_] = aK
end
aI.sanitize =
function(aK)
local _ ={}
local aL ={}
local function aM(aN)
local aO = tostring(aN)
if aI.TITLES[aO] and(not aL[aO] and not aI.PINNED[aO]) then
    aL[aO] = true _[# _ + 1] = aO
end
end
for aN, aO in ipairs(type(aK) == 'table' and aK or{}) do
    aM(aO)
end
for aP, aQ in ipairs(aI.DEFAULT) do
    aM(aQ)
end
for aR, aS in ipairs(aI.DEFAULT) do
    if aI.PINNED[aS] and not aL[aS] then
        aL[aS] = true _[# _ + 1] = aS
    end
end
return _
end
local aK, aL aI.order =
function()
local aM = aB and aB.TaskOrder
if aM ~= aL or not aK then
    aL = aM aK = aI.sanitize(aM)
end
return aK
end
aI.rank =
function(aM)
for aR, aS in ipairs(aI.order()) do
    if aS == aM then
        return aR
    end
end
return 1 / 0
end
local function aM(aR, aS)
local _ = aJ[aR]
local aT = _ and _[aS]
if type(aT) ~= 'function' then
    return nil
end
aS, _ = pcall(aT)
if aS then
    return _
end
return nil
end
aI.wants =
function(aR)
return aM(aR, 'wants') == true
end
aI.active =
function(aR)
return aM(aR, 'active') == true
end
aI.enabled =
function(aR)
return aM(aR, 'enabled') == true
end
aI.bossFighting =
function()
if g:GetAttribute('InScrambleArena') == true then
    return true
end
if type(g:GetAttribute('RaceId')) == 'string' then
    return true
end
local aR = l.__SenaV4ScrambleBoss
return aR ~= nil and not aR.destroyed and aR.enabled == true and aR:_inArena() == true
end
aI.stealCarrying =
function()
local aR = l.__SenaV4EggRuntime
if aR then
    if aR.destroyed then
        return false
    end
    else
    return false
end
if aR._instantReturnToken ~= nil then
    return true
    elseif
    aR._forestDropInProgress ~= nil then
        return true
    end
    local aS = aR.carry
    return aS ~= nil and aS.active == true and aS.uid ~= nil and aS.uid ~= aR.primerUid
end
local aR ={}
local function aS(aT)
if aT ~= 'mech_boss' and aI.bossFighting() then
    return 'mech_boss'
end
if aT ~= 'auto_steal' and aI.stealCarrying() then
    return 'auto_steal'
end
for _, aU in ipairs(aI.order()) do
    if aU == aT then
        return nil
    end
    if aI.wants(aU) then
        return aU
    end
end
return nil
end
aI.blocker =
function(aT)
local aU = os.clock()
local _ = aR[aT]
if _ and aU - _.at < 0.1 then
    return _.value
end
local aV = aS(aT)
if _ then
    _.at = aU _.value = aV
    else
    aR[aT] ={at = aU, value = aV}
end
return aV
end
aI.holder =
function(aT)
for aU, aV in ipairs(aI.order()) do
    if aV ~= aT and(not aI.PINNED[aV] and aI.active(aV)) then
        return aV
    end
end
return nil
end
aI.yieldLabel =
function(aT)
local aU = aI.blocker(aT)
return aU and 'Yielding to '..aI.TITLES[aU] or nil
end
aI.current =
function()
if aI.bossFighting() then
    return 'mech_boss'
end
if aI.stealCarrying() then
    return 'auto_steal'
end
for aT, aU in ipairs(aI.order()) do
    if aI.active(aU) then
        return aU
    end
end
return nil
end
aI.describe =
function(aT)
if not aI.enabled(aT) then
    return 'Off', 'off'
end
local aU = aM(aT, 'status')
local aV = type(aU) == 'string' and aU ~= '' and aU or nil
if aI.active(aT) then
    return aV or 'Running', 'run'
    elseif
    aI.current() == aT then
        return aV or 'Running', 'run'
    end
    local _ = aI.blocker(aT)
    if _ and aI.wants(aT) then
        return 'Yielding to '..aI.TITLES[_], 'wait'
    end
    return aV or 'Idle', 'off'
end
end
l.__SenaV4TaskLadder = aI
local function aJ()
return aI.blocker('auto_sell') == nil
end
local function aK(aL)
if not aL or type(aL.GetValue) ~= 'function' then
    return nil
end
local aM, aR = pcall(
function()
return aL:GetValue()
end
)
if not aM then
    return nil
end
if type(aR) == 'table' then
    local aS ={}
    for aT, aU in pairs(aR) do
        if type(aT) == 'number' then
            table.insert(aS, aU)
            elseif
            type(aT) == 'string' then
                if aU == true then
                    table.insert(aS, aT)
                end
            end
        end
        return aS
    end
    if type(aR) == 'string' then
        return{aR}
    end
    return nil
end
local function aL(aM, aR, aS, aT)
if aB.SellAll then
    return true
end
if type(aS) ~= 'table' then
    return false
    elseif
    type(aT) ~= 'table' then
        return false
    end
    return(
    if # aS == 0 then
        false
        else
        if table.find(aS, 'None') then
            false
            else
            if table.find(aS, 'All') then
                true
                else
                table.find(aS, aM) ~= nil) or(
                if # aT == 0 then
                    false
                    else
                    if table.find(aT, 'None') then
                        false
                        else
                        if table.find(aT, 'All') then
                            true
                            else
                            table.find(aT, aR) ~= nil)
                        end
                        local function aM(aR, aS)
                        if type(aS) ~= 'table' then
                            return false
                        end
                        if # aS == 0 then
                            return false
                            elseif
                            table.find(aS, 'None') then
                                return false
                            end
                            if table.find(aS, 'All') then
                                return true
                            end
                            return table.find(aS, aR) ~= nil
                        end
                        local function aR(aS)
                        local aT = aS and aS:FindFirstChild('HumanoidRootPart')
                        if aT then
                            aT:SetAttribute('KillPartIgnore', true)
                        end
                    end
                    local aS = 0.15
                    local aT = 0.4
                    local aU = Vector3.new(542.93, 71.5, - 405.58)
                    local aV = 5
                    local _ ={CarryRetry = 0.25, CarryTimeout = 2, EarlyCarryDistance = 8, SafeStable = 0.35, ReturnValidation = 0.08, NextTarget = 0.05, SafeHandoff = 0.15}
                    local function aW(aX)
                    local aY = math.clamp(math.floor((tonumber(aX) or q.DEF_INPUT) + 0.5), q.MIN_INPUT, q.MAX_INPUT)
                    if math.abs((aB.TweenSpeedMultiplier or 0) - aY) <= 0.001 then
                        return
                    end
                    aB.TweenSpeedMultiplier = aY
                end
                local aX = 0.08
                local aY ={}
                local function aZ(a_, a0, a1, a2, a3, a4, a5)
                if a_ then
                    if not a0 then
                        return false
                        elseif
                        typeof(a1) ~= 'CFrame' then
                            return false
                        end
                        else
                        return false
                    end
                    if a2 and a2() then
                        return false
                    end
                    local a6 = aY[a_]
                    if a6 then
                        a6.cancelled = true aY[a_] = nil
                    end
                    local a7 = a_.Parent
                    if not a7 then
                        return false
                    end
                    X() aR(a7) ar()
                    local a8 = workspace.CurrentCamera
                    if a8 and a8.CameraSubject ~= a0 then
                        pcall(
                        function() a8.CameraSubject = a0
                    end
                    )
                end
                local a9 = a0.AutoRotate a0.AutoRotate = false
                local ba = a5 and math.max(a_.Position.Y, a1.Position.Y + aV, aU.Y + aV) or nil
                local bb = ba and CFrame.new(a1.Position.X, ba, a1.Position.Z) * a1.Rotation or a1
                local bc = math.clamp(T(), q.MIN_SPEED, l.__SenaV4AdminBoost == true and 3000 or q.MAX_SPEED) ae(a7, bc * q.HEADROOM)
                local bd ={cancelled = false} aY[a_] = bd aa()
                local be = ba and(math.abs(a_.Position.Y - ba) > 0.35 and 'takeoff' or 'cruise') or nil
                local bf =(bb.Position - a_.Position).Magnitude
                local bg = os.clock() + math.max(bf / bc, aX) * 3 + 8
                local bh, bi
                local bj = 0
                local bk = false
                local bl = false
                while not bd.cancelled do
                    if a2 and a2() then
                        break
                    end
                    if not a_.Parent then
                        break
                    end
                    if os.clock() >= bg then
                        break
                    end
                    local bm = h.Heartbeat:Wait()
                    local bn = math.max(math.min(bm, aS), 0.004166666666666667)
                    local bo = math.clamp(T(), q.MIN_SPEED, l.__SenaV4AdminBoost == true and 3000 or q.MAX_SPEED) ae(a7, bo * q.HEADROOM)
                    local bp = ac()[q.INTEGRITY_KEY]
                    local bq = type(bp) == 'table' and bp.State or nil
                    if am(bq, a0, a_) then
                        local br = a_.Position
                        local bs = bb.Position - br
                        local bt = bs.Magnitude
                        local bu = Vector3.new(bs.X, 0, bs.Z) be =
                        if ba then
                            if be == 'takeoff' then
                                if math.abs(br.Y - ba) <= 0.35 then
                                    'cruise'
                                    else
                                    be
                                    else
                                    be
                                    else
                                    be
                                    local bv =(ba and be == 'takeoff' and Vector3.new(br.X, ba, br.Z) or bb.Position) - br
                                    local bw = bv.Magnitude
                                    local bx = ba and bu.Magnitude or bt bj =
                                    if bh then
                                        if bx > bh + 2 then
                                        os.clock() + 0.5
                                        else
                                        bj
                                        else
                                        bj
                                        local by =(os.clock() < bj and math.max(q.MIN_SPEED, bo * 0.45) or bo) * bn
                                        if a4 then
                                        if bk then
                                        else
                                        if bt <= _.EarlyCarryDistance then
                                        task.spawn(a4) bk = true
                                    end
                                end
                            end
                            local bz = Vector3.new(a_.CFrame.LookVector.X, 0, a_.CFrame.LookVector.Z)
                            local bA = bu.Magnitude > 0.001 and bu.Unit or(bz.Magnitude > 0.001 and bz.Unit or Vector3.new(0, 0, - 1))
                            if(
                            if ba then
                                be == 'cruise'
                                else
                                not ba) and bt <= math.max(by, 0.05) then
                                    bi =
                                    if bt > 0.5 then
                                        nil
                                        else
                                        bi V(bb.Position) a_.CFrame = CFrame.lookAt(bb.Position, bb.Position + bA) a_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) a_.AssemblyAngularVelocity = Vector3.new(0,
                                        0, 0) V(bb.Position) ao(a0, a_, bo,(Vector3.new(0, 0, 0))) bi = bi or os.clock()
                                        if os.clock() - bi >= aT then
                                        bh = bx bl = true
                                        break
                                    end
                                    else
                                    bi = nil
                                    if bw <= 0.001 then
                                        a_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) a_.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(br) bh = bx
                                        continue
                                    end
                                    local bB = math.min(by, bw)
                                    local bC = br + bv.Unit * bB
                                    local bD =(bC - br) / bn V(bC) a_.CFrame = CFrame.lookAt(bC, bC + bA) a_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) V(bC)
                                    if not ao(a0, a_, bo, bD) then
                                        an(a0, a_, bo) ao(a0, a_, bo, bD)
                                    end
                                end
                                bh = bx
                                else
                                bh = nil bi = nil a_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) a_.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(a_.Position)
                                if al(bq, a0, a_) then
                                    aj(bq, bo * q.HEADROOM,(Vector3.new(0, 0, 0)))
                                    else
                                    an(a0, a_, bo)
                                end
                            end
                        end
                        if a0.Parent and a9 ~= nil then
                            a0.AutoRotate = a9
                        end
                        a_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) a_.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        if bl then
                            if a3 then
                                Y(a_, bb)
                                else
                                W()
                            end
                            else
                            W()
                        end
                        return bl and not bd.cancelled
                    end
                    do
                        local function a_(a0, a1)
                        if not a0 or typeof(a1) ~= 'CFrame' then
                            return false
                        end
                        if not pcall(
                        function() a0.AssemblyLinearVelocity = Vector3.new(0, 0, 0) a0.AssemblyAngularVelocity = Vector3.new(0, 0, 0) a0.CFrame = a1 a0.AssemblyLinearVelocity = Vector3.new(0,
                        0, 0) a0.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end
                    ) then
                        return false
                    end
                    V(a1.Position)
                    local a2 = a0.Parent
                    local a3 = a2 and a2:FindFirstChildOfClass('Humanoid')
                    if a3 then
                        local a4 = math.clamp(T(), q.MIN_SPEED, l.__SenaV4AdminBoost == true and 3000 or q.MAX_SPEED) ae(a2, a4 * q.HEADROOM)
                        if not ao(a3, a0, a4,(Vector3.new(0, 0, 0))) then
                            an(a3, a0, a4) ao(a3, a0, a4,(Vector3.new(0, 0, 0)))
                        end
                    end
                    return true
                end
                getgenv().SenaV4Config = aB
                local function a0(a1)
                if a1 and a1.Name == 'PlayerTrap' then
                    pcall(
                    function() a1:Destroy()
                end
                )
            end
        end
        local function a1()
        local function a2(a3)
        if not a3 then
            return
        end
        for a4, a5 in ipairs(a3:GetChildren()) do
            a0(a5)
        end
        local function a6(a7) a0(a7)
    end
    a3.ChildAdded:Connect(a6)
end
local a3 = workspace:FindFirstChild('Transient')
if a3 then
    a2(a3)
end
local a4 = workspace:FindFirstChild('__DEBRIS')
if a4 then
    a2(a4)
end
local a5 = workspace
local function a6(a7)
if a7.Name == 'Transient' then
    a2(a7)
    elseif
    a7.Name == '__DEBRIS' then
        a2(a7)
        elseif
        a7.Name == 'PlayerTrap' then
            a0(a7)
            elseif
            a7.Name:lower():find('trap') then
                a0(a7)
            end
        end
        a5.ChildAdded:Connect(a6) task.spawn(
        function()
        while n() do
            for a7, a8 in ipairs({workspace:FindFirstChild('Transient'), workspace:FindFirstChild('__DEBRIS')}) do
                if a8 then
                    for a9, ba in ipairs(a8:GetChildren()) do
                        a0(ba)
                    end
                end
            end
            task.wait(1.5)
        end
    end
    )
end
task.spawn(a1)
local a2
local a3 = false
local a4 ={HoldSeconds = 0.3, ConfirmStableSeconds = 0.3, ConfirmTimeout = 2.5, PollSeconds = 0.05, ArrivalSettle = 0.5, DecoyName = '__SenaV4TweenTreadmillDecoy'}
local function a5()
local a6, a7 = pcall(
function()
return require(game:GetService('ReplicatedStorage').Shared.Remotes).Treadmill.AskRenderSnapshot:InvokeServer()
end
)
if a6 then
    if type(a7) ~= 'table' then
        return nil
    end
    else
    return nil
end
return table.find(a7, g.UserId) ~= nil
end
local function a6()
local a7, a8, a9 = pcall(
function()
return require(game:GetService('ReplicatedStorage').Shared.Remotes).Treadmill.AskDoff:InvokeServer()
end
)
if not a7 then
    return false, tostring(a8)
end
if a8 ~= true then
    return false, tostring(a9)
end
return true
end
local function a7()
local a8, a9 = pcall(
function()
local a8 = require(e.Client.PlotState)
local a9 = type(a8.ResolveLocalSlot) == 'function' and a8.ResolveLocalSlot() or a8.GetMySlot()
local ba = type(a8.ResolveFolder) == 'function' and a8.ResolveFolder() or a8.GetPlotsFolder()
local bb = ba and a9 and ba:FindFirstChild(tostring(a9))
local bc = bb and bb:FindFirstChild('TreadmillBottom')
if bc then
    if not bc:IsA('BasePart') then
        return nil
    end
    else
    return nil
end
local bd = g.Character
local be = bd and bd:FindFirstChild('HumanoidRootPart')
local bf = bd and bd:FindFirstChildOfClass('Humanoid')
if be then
    if not bf then
        return nil
    end
    else
    return nil
end
local bg = bf.RigType == Enum.HumanoidRigType.R15 and be.Size.Y * 0.5 + math.max(bf.HipHeight, 0.5) or be.Size.Y * 0.5 + 2
return bc.CFrame * CFrame.new(0, bc.Size.Y * 0.5 + bg + 0.05, 0)
end
)
return a8 and a9 or nil
end
a4.destroyTrail =
function(a8)
if typeof(a8) == 'Instance' and a8:IsA('Trail') then
    pcall(a8.Destroy, a8)
end
end
a4.destroyStealPopup =
function(a8)
if aI.current() == 'auto_steal' and typeof(a8) == 'Instance' then
    if a8.Name == 'SpeedGainPopup' then
        pcall(a8.Destroy, a8)
        elseif
        a8.Name == 'PlusOne' then
            pcall(a8.Destroy, a8)
        end
    end
end
a4.purgeStealPopups =
function()
local a8 = g:FindFirstChildOfClass('PlayerGui')
if not a8 then
    return
end
for a9, ba in ipairs(a8:GetDescendants()) do
    a4.destroyStealPopup(ba)
end
end
a4.guiConnection = g:WaitForChild('PlayerGui').DescendantAdded:Connect(
function(a8) a4.destroyStealPopup(a8)
end
) a4.removeDecoy =
function()
if a4.cameraConnection then
    pcall(a4.cameraConnection.Disconnect, a4.cameraConnection) a4.cameraConnection = nil
end
if a4.characterConnection then
    pcall(a4.characterConnection.Disconnect, a4.characterConnection) a4.characterConnection = nil
end
for a8, a9 in pairs(a4.transparency or{}) do
    if typeof(a8) == 'Instance' and a8.Parent then
        pcall(
        function() a8.LocalTransparencyModifier = a9
    end
    )
end
end
a4.transparency = nil
local ba = g.Character
local bb = ba and ba:FindFirstChildOfClass('Humanoid')
local bc = workspace.CurrentCamera
if bc then
    pcall(
    function() bc.CameraSubject = bb or a4.cameraSubject
end
)
end
a4.cameraSubject = nil
if a4.decoy then
    pcall(a4.decoy.Destroy, a4.decoy)
end
a4.decoy = nil
end
a4.spawnDecoy =
function(a8) a4.removeDecoy()
local a9 = g.Character
if not a9 then
    return false
end
local ba = a9.Archivable a9.Archivable = true
local bb, bc = pcall(a9.Clone, a9) a9.Archivable = ba
if bb then
    if not bc then
        return false
        elseif
        typeof(bc) ~= 'Instance' then
            return false
        end
        else
        return false
    end
    bc.Name = a4.DecoyName
    for bd, be in ipairs(bc:GetDescendants()) do
        if be:IsA('Script') then
            pcall(be.Destroy, be)
            elseif
            be:IsA('LocalScript') then
                pcall(be.Destroy, be)
                elseif
                be:IsA('BillboardGui') then
                    pcall(be.Destroy, be)
                    elseif
                    be:IsA('Sound') then
                        pcall(be.Destroy, be)
                        elseif
                        be:IsA('Trail') then
                            pcall(be.Destroy, be)
                            elseif
                            be:IsA('BasePart') then
                                be.LocalTransparencyModifier = 0 be.Anchored = true be.CanCollide = false be.CanQuery = false be.CanTouch = false
                            end
                        end
                        local bf = bc:FindFirstChildOfClass('Humanoid')
                        if not bf then
                            bc:Destroy()
                            return false
                        end
                        pcall(
                        function() bf.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None bf.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
                    end
                    ) bc.Parent = workspace bc:PivotTo(a8) a4.decoy = bc
                    local bg = setmetatable({},{__mode = 'k'})
                    local function bh(bi)
                    if bi then
                        if bi:IsA('BasePart') then
                            if not bi:IsDescendantOf(a9) then
                                return
                            end
                            else
                            return
                        end
                        else
                        return
                    end
                    if bg[bi] == nil then
                        bg[bi] = bi.LocalTransparencyModifier
                    end
                    bi.LocalTransparencyModifier = 1
                end
                for bi, bj in ipairs(a9:GetDescendants()) do
                    bh(bj) a4.destroyTrail(bj)
                end
                a4.transparency = bg a4.characterConnection = a9.DescendantAdded:Connect(
                function(bk)
                if a4.decoy == bc then
                    pcall(bh, bk) a4.destroyTrail(bk)
                end
            end
            )
            local bk = workspace.CurrentCamera
            if bk then
                a4.cameraSubject = bk.CameraSubject bk.CameraSubject = bf
            end
            a4.cameraConnection = h.RenderStepped:Connect(
            function()
            if a4.decoy ~= bc then
                return
                elseif
                bc.Parent then
                    if not bf.Parent then
                        return
                    end
                    else
                    return
                end
                for bl in pairs(bg) do
                    if bl.Parent and bl.LocalTransparencyModifier ~= 1 then
                        bl.LocalTransparencyModifier = 1
                    end
                end
                local bm = workspace.CurrentCamera
                if bm and bm.CameraSubject ~= bf then
                    bm.CameraSubject = bf
                end
            end
            )
            return true
        end
        a4.requestEquip =
        function()
        local a8, a9, ba = pcall(
        function()
        return require(e.Shared.Remotes).Treadmill.AskWearStill:InvokeServer()
    end
    )
    if
    if a8 then
        a9 == false
        else
        not a8 then
            return false, tostring(ba or a9)
        end
        return true
    end
    a4.prepare =
    function(a8, a9)
    local ba = g.Character
    local bb = ba and ba:FindFirstChild('HumanoidRootPart')
    local bc = ba and ba:FindFirstChildOfClass('Humanoid')
    if bb then
        if bc then
            if typeof(a8) ~= 'CFrame' then
                return false
            end
            else
            return false
        end
        else
        return false
    end
    local function bf()
    return a9 ~= nil and a9()
end
local function bg()
local bh = g.Character
local bi = bh and bh:FindFirstChild('HumanoidRootPart')
if bi then
    a_(bi, a8) task.wait(0.1)
end
a4.removeDecoy()
end
a3 = true a4.purgeStealPopups() X() W()
if not a4.spawnDecoy(a8) then
    a3 = false
    return false
end
local bh = a7()
if(
if bh then
    bf()
    else
    not bh) or not a_(bb, bh) then
        a6() bg() a3 = false
        return false
    end
    task.wait(a4.ArrivalSettle)
    if bf() then
        a6() bg() a3 = false
        return false
    end
    if not a4.requestEquip() then
        a6() bg() a3 = false
        return false
    end
    ba, bb = os.clock() + a4.ConfirmTimeout bc = false
    while true do
        local bi = bf()
        if not(
        if bi then
            not bi
            else
            os.clock() < ba) then
                break
            end
            if a5() == true then
                bb = bb or os.clock()
                if os.clock() - bb >= a4.ConfirmStableSeconds then
                    bc = true
                    break
                end
                else
                bb = nil
            end
            task.wait(a4.PollSeconds)
        end
        if
        if bc then
            bf()
            else
            not bc then
                a6() bg() a3 = false
                return false
            end
            ba = os.clock() + a4.HoldSeconds
            while true do
                local bi = bf()
                if not(
                if bi then
                    not bi
                    else
                    os.clock() < ba) then
                        break
                    end
                    task.wait(a4.PollSeconds)
                end
                local bi = os.clock() + a4.ConfirmTimeout bb = false
                while true do
                    local bj = bf()
                    if not(
                    if bj then
                        not bj
                        else
                        os.clock() < bi) then
                            break
                        end
                        a6() task.wait(a4.PollSeconds)
                        if a5() == false then
                            a2, bb = nil, true
                            break
                        end
                    end
                    bg() a3 = false
                    return bb and not bf()
                end
                a4.previousCleanup = l.__SenaV4TweenRuntimeCleanup l.__SenaV4TweenRuntimeCleanup =
                function() a3 = false a6() a4.removeDecoy()
                if a4.guiConnection then
                    pcall(a4.guiConnection.Disconnect, a4.guiConnection) a4.guiConnection = nil
                end
                if type(a4.previousCleanup) == 'function' then
                    a4.previousCleanup()
                end
            end
            g.CharacterRemoving:Connect(
            function() a3 = false a4.removeDecoy()
        end
        )
    end
    do
        if type(l.__SenaV4CosmeticSuppressCleanup) == 'function' then
            pcall(l.__SenaV4CosmeticSuppressCleanup)
        end
        local a_ ={}
        local function a0(a1)
        if not a1 or a1.Name ~= 'DropHeldEgg' then
            return
        end
        if not a1:IsA('ScreenGui') and not a1:IsA('LayerCollector') then
            return
        end
        pcall(
        function() a1.Enabled = false
    end
    ) table.insert(a_, a1:GetPropertyChangedSignal('Enabled'):Connect(
    function()
    if a1.Enabled then
        pcall(
        function() a1.Enabled = false
    end
    )
end
end
))
end
local function a1()
local a2 = g:FindFirstChildOfClass('PlayerGui')
if not a2 then
    return
end
for a3, a4 in ipairs(a2:GetChildren()) do
    a0(a4)
end
table.insert(a_, a2.ChildAdded:Connect(a0))
end
a1() table.insert(a_, g.CharacterAdded:Connect(
function() task.defer(a1)
end
)) pcall(
function()
local a2 = require(e.Shared.Modules.GuardAreas.GuardPresentationComponent)
if type(a2) == 'table' then
    l.__SenaV4GuardPresentOrig = l.__SenaV4GuardPresentOrig or{PlayWake = a2.PlayWake, PlayHit = a2.PlayHit, PlayAfterWake = a2.PlayAfterWake, ScheduleAfterWake = a2.ScheduleAfterWake}
    local function a3()
end
a2.PlayWake = a3 a2.PlayHit =
function()
return 0
end
a2.PlayAfterWake = a3 a2.ScheduleAfterWake = a3
end
end
) l.__SenaV4CosmeticSuppressCleanup =
function()
for a2, a3 in ipairs(a_) do
    pcall(
    function() a3:Disconnect()
end
)
end
table.clear(a_)
local a4 = l.__SenaV4GuardPresentOrig
if type(a4) == 'table' then
    pcall(
    function()
    local a5 = require(e.Shared.Modules.GuardAreas.GuardPresentationComponent)
    for a6, a7 in pairs(a4) do
        a5[a6] = a7
    end
end
)
end
end
end
do
    if type(l.__SenaV4StealDeclutterCleanup) == 'function' then
        pcall(l.__SenaV4StealDeclutterCleanup)
    end
    local a_ ={{name = 'ProximityPrompts', restore = true},{name = 'AreaGui', restore = false}}
    local a0 = false
    local a1 ={}
    local function a2(a3)
    return a3 and(a3:IsA('ScreenGui') or a3:IsA('LayerCollector'))
end
local function a3(a4)
if not a4:IsA('LayerCollector') then
    return
end
pcall(
function() a4.Enabled = false
end
) table.insert(a1, a4:GetPropertyChangedSignal('Enabled'):Connect(
function()
if a0 and a4.Enabled then
    pcall(
    function() a4.Enabled = false
end
)
end
end
))
end
local function a4(a5)
if not a2(a5) then
    return
end
pcall(
function() a5.Enabled = false
end
) table.insert(a1, a5:GetPropertyChangedSignal('Enabled'):Connect(
function()
if a0 and a5.Enabled then
    pcall(
    function() a5.Enabled = false
end
)
end
end
))
for a6, a7 in ipairs(a5:GetChildren()) do
    a3(a7)
end
table.insert(a1, a5.ChildAdded:Connect(
function(a8)
if a0 then
    a3(a8)
end
end
))
end
local function a5(a6)
local a7 = g:FindFirstChildOfClass('PlayerGui')
if not a7 then
    return
end
for a8, a9 in ipairs(a_) do
    local ba = a7:FindFirstChild(a9.name)
    if ba then
        a6(ba, a9)
    end
end
end
local function a6()
local a7 = g:FindFirstChildOfClass('PlayerGui')
if not a7 then
    return
end
a5(
function(a8) a4(a8)
end
) table.insert(a1, a7.ChildAdded:Connect(
function(a8)
if not a0 then
    return
end
for a9, ba in ipairs(a_) do
    if a8.Name == ba.name then
        a4(a8)
        break
    end
end
end
))
end
local function a7()
for a8, a9 in ipairs(a1) do
    pcall(
    function() a9:Disconnect()
end
)
end
table.clear(a1) a5(
function(ba, bb) pcall(
function() ba.Enabled = bb.restore
end
)
if bb.restore then
    for bc, bf in ipairs(ba:GetChildren()) do
        if bf:IsA('LayerCollector') then
            pcall(
            function() bf.Enabled = true
        end
        )
    end
end
end
end
)
end
l.__SenaV4SetStealDeclutter =
function(a8)
local a9 = a8 == true
if a9 == a0 then
    return
end
a0 = a9
if a9 then
    a6()
    else
    a7()
end
end
l.__SenaV4StealDeclutterCleanup =
function() a0 = false a7()
end
end
if type(l.__SenaV4DecomBoostCleanup) == 'function' then
    pcall(l.__SenaV4DecomBoostCleanup)
end
local a_ ={}
local a0 = false l.__SenaV4DecomBoostCleanup =
function()
for a1, a2 in ipairs(a_) do
    pcall(
    function() a2:Disconnect()
end
)
end
table.clear(a_) a0 = false
end
local function a1()
local a2 = workspace:FindFirstChild('ClientRenderedAssets')
if not a2 then
    return
end
for a3, a4 in ipairs(a2:GetChildren()) do
    pcall(
    function() a4.Parent = nil
end
)
end
end
local function a2(a3)
return string.sub(a3.Name, 1, # tostring(g.UserId) + 1) == tostring(g.UserId)..'_'
end
local function a3()
for a4, a5 in ipairs(workspace:GetChildren()) do
    if a5.Name == 'PlacedEggRenders' then
        for a6, a7 in ipairs(a5:GetChildren()) do
            pcall(
            function()
            if not a7:FindFirstChildOfClass('ProximityPrompt') and not a2(a7) then
                a7.Parent = nil
            end
        end
        )
    end
end
end
end
local function a4()
for a5, a6 in ipairs({'Transient', '__DEBRIS'}) do
    local a7 = workspace:FindFirstChild(a6)
    if a7 then
        for a8, a9 in ipairs(a7:GetChildren()) do
            if a9.Name == 'PlayerTrap' or a9.Name:lower():find('trap') then
                pcall(
                function() a9:Destroy()
            end
            )
        end
    end
end
end
end
local function a5(a6)
if a6:FindFirstAncestor('SenaVisualBack') then
    return true
    elseif
    a6:FindFirstAncestor('SenaVisualRemote') then
        return true
    end
    local a7 = a6:FindFirstAncestorWhichIsA('Tool')
    return a7 ~= nil and a7:GetAttribute('SenaVisual') ~= nil
end
local a6 ={effects ={}, parts ={}, decals ={}, snapshot = nil}
local a7 ={PlusOne = true, SpeedGainPopup = true, SellPayout = true, SyncedIncomeCash = true}
local a8 ={PlayerPlotSign = true, CanUpgrade = true, AlertGui = true, OfflineMoneyClaimBillboard = true}
local function a9(ba) pcall(
function()
if a5(ba) then
    return
end
if a7[ba.Name] then
    ba:Destroy()
    return
end
if ba:IsA('BillboardGui') and a8[ba.Name] then
    if ba.Enabled then
        a6.effects[ba] = true
    end
    ba.Enabled = false
    return
end
if ba:IsA('ParticleEmitter') or ba:IsA('Trail') or ba:IsA('Beam') or ba:IsA('Sparkles') or ba:IsA('Fire') or ba:IsA('Smoke') or ba:IsA('PostEffect') then
    if ba.Enabled then
        a6.effects[ba] = true
    end
    ba.Enabled = false
end
end
)
end
local function ba()
if a0 then
    return
end
a0 = true table.insert(a_, game.DescendantAdded:Connect(a9)) table.insert(a_, workspace.ChildAdded:Connect(
function(bb)
if bb.Name == 'ClientRenderedAssets' then
    a1() table.insert(a_, bb.ChildAdded:Connect(
    function(bc) pcall(
    function() bc.Parent = nil
end
)
end
))
elseif
bb.Name == 'PlacedEggRenders' then
    a3() table.insert(a_, bb.ChildAdded:Connect(
    function(bc) pcall(
    function()
    if not bc:FindFirstChildOfClass('ProximityPrompt') and not a2(bc) then
        bc.Parent = nil
    end
end
)
end
))
elseif
bb.Name == '__DEBRIS' or bb.Name == 'Transient' then
    table.insert(a_, bb.ChildAdded:Connect(
    function(bc)
    if bc.Name == 'PlayerTrap' or bc.Name:lower():find('trap') then
        pcall(
        function() bc:Destroy()
    end
    )
end
end
))
end
end
))
local bb = workspace:FindFirstChild('ClientRenderedAssets')
if bb then
    table.insert(a_, bb.ChildAdded:Connect(
    function(bc) pcall(
    function() bc.Parent = nil
end
)
end
))
end
for bc, bf in ipairs(workspace:GetChildren()) do
    if bf.Name == 'PlacedEggRenders' then
        table.insert(a_, bf.ChildAdded:Connect(
        function(bg) pcall(
        function()
        if not bg:FindFirstChildOfClass('ProximityPrompt') and not a2(bg) then
            bg.Parent = nil
        end
    end
    )
end
))
end
end
end
local bb = false
local function bc()
if bb then
    return
end
bb = true
local bf = game:GetService('Lighting')
if not a6.snapshot then
    local bg ={} pcall(
    function() bg.quality = settings().Rendering.QualityLevel bg.throttle = settings().Physics.PhysicsEnvironmentalThrottle bg.technology = bf.Technology bg.shadows = bf.GlobalShadows bg.fogEnd = bf.FogEnd bg.brightness = bf.Brightness bg.ambient = bf.Ambient bg.outdoorAmbient = bf.OutdoorAmbient
end
)
local bh = workspace:FindFirstChildOfClass('Terrain')
if bh then
    pcall(
    function() bg.terrain ={WaterWaveSize = bh.WaterWaveSize, WaterWaveSpeed = bh.WaterWaveSpeed, WaterReflectance = bh.WaterReflectance, WaterTransparency = bh.WaterTransparency,
    Decoration = bh.Decoration}
end
) pcall(
function()
local bi = bh:FindFirstChildOfClass('Clouds')
if bi then
    bg.cloudsEnabled = bi.Enabled
end
end
)
end
pcall(
function()
local bi = e.Shared:FindFirstChild('Preferences')
if bi then
    local bj = require(bi) bg.prefs ={HideOtherPets = bj.IsOn('HideOtherPets'), DisableVideos = bj.IsOn('DisableVideos')}
end
end
)
if bg.quality == Enum.QualityLevel.Level01 then
    bg.quality = Enum.QualityLevel.Automatic
end
a6.snapshot = l.__SenaV4DecomSnapshot or bg l.__SenaV4DecomSnapshot = a6.snapshot
end
pcall(
function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Always bf.Technology = Enum.Technology.Compatibility bf.GlobalShadows = false bf.FogEnd = 9000000000 bf.Brightness = 2 bf.Ambient = Color3.new(1,
1, 1) bf.OutdoorAmbient = Color3.new(1, 1, 1)
end
)
local bg ={workspace, bf}
local bh = os.clock()
for bi, bj in ipairs(bg) do
    for bk, bl in ipairs(bj:GetDescendants()) do
        if a5(bl) then
            continue
            elseif
            bl:IsA('BasePart') then
                pcall(
                function()
                if not a6.parts[bl] then
                    a6.parts[bl] ={bl.Material, bl.CastShadow, bl:IsA('MeshPart') and bl.RenderFidelity or nil}
                end
                bl.Material = Enum.Material.SmoothPlastic bl.CastShadow = false
                if bl:IsA('MeshPart') then
                    bl.RenderFidelity = Enum.RenderFidelity.Performance
                end
            end
            )
            elseif
            bl:IsA('Decal') or bl:IsA('Texture') then
                pcall(
                function()
                if bl.Texture ~= '' and not a6.decals[bl] then
                    a6.decals[bl] = bl.Texture
                end
                bl.Texture = ''
            end
            )
            else
            a9(bl)
        end
        if os.clock() - bh > 0.004 then
            task.wait() bh = os.clock()
        end
    end
end
local bk = workspace:FindFirstChildOfClass('Terrain')
if bk then
    pcall(
    function() bk.WaterWaveSize = 0 bk.WaterWaveSpeed = 0 bk.WaterReflectance = 0 bk.WaterTransparency = 1 bk.Decoration = false
    local bl = bk:FindFirstChildOfClass('Clouds')
    if bl then
        bl.Enabled = false
    end
end
)
end
pcall(
function()
local bl = e.Shared
local bm = bl:FindFirstChild('Preferences')
if bm then
    local bn = require(bm) bn.Set('HideOtherPets', true) bn.Set('DisableVideos', true)
    else
    local bn = require(bl.SettingsCmds) bn.Write('HideOtherPets', true) bn.Write('DisableVideos', true)
end
end
) a1() a3() a4() ba() bb = false
end
a6.revert =
function()
for bf, bg in ipairs(a_) do
    pcall(
    function() bg:Disconnect()
end
)
end
table.clear(a_) a0 = false
local bh = a6.snapshot
local bi = game:GetService('Lighting')
if bh then
    pcall(
    function() settings().Rendering.QualityLevel = bh.quality or Enum.QualityLevel.Automatic
end
) pcall(
function() settings().Physics.PhysicsEnvironmentalThrottle = bh.throttle
end
) pcall(
function() bi.Technology = bh.technology bi.GlobalShadows = bh.shadows bi.FogEnd = bh.fogEnd bi.Brightness = bh.brightness bi.Ambient = bh.ambient bi.OutdoorAmbient = bh.outdoorAmbient
end
)
local bj = workspace:FindFirstChildOfClass('Terrain')
if bj and bh.terrain then
    for bk, bl in pairs(bh.terrain) do
        pcall(
        function() bj[bk] = bl
    end
    )
end
if bh.cloudsEnabled ~= nil then
    pcall(
    function()
    local bm = bj:FindFirstChildOfClass('Clouds')
    if bm then
        bm.Enabled = bh.cloudsEnabled
    end
end
)
end
end
if bh.prefs then
    pcall(
    function()
    local bk = require(e.Shared.Preferences)
    for bl, bm in pairs(bh.prefs) do
        bk.Set(bl, bm)
    end
end
)
end
end
local bj = 0
for bk, bl in pairs(a6.parts) do
    if bk.Parent then
        pcall(
        function() bk.Material = bl[1] bk.CastShadow = bl[2]
        if bl[3] ~= nil and bk:IsA('MeshPart') then
            bk.RenderFidelity = bl[3]
        end
    end
    )
end
bj += 1
if bj % 400 == 0 then
    task.wait()
end
end
for bm, bn in pairs(a6.decals) do
    if bm.Parent then
        pcall(
        function() bm.Texture = bn
    end
    )
end
end
for bo in pairs(a6.effects) do
    if bo.Parent then
        pcall(
        function() bo.Enabled = true
    end
    )
end
end
a6.parts ={} a6.decals ={} a6.effects ={} a6.snapshot = nil
end
l.__SenaV4DecomBoostUndo = a6
local bf = false
local function bg(bh)
if bh then
    if not bh:IsA('Model') then
        return
    end
    else
    return
end
local bi = bh.Name:match('^(%d+)_')
local bj = bi and tonumber(bi)
if bj then
    if bj == g.UserId then
        return
    end
    else
    return
end
for bl, bn in ipairs(bh:GetDescendants()) do
    if bn:IsA('BasePart') then
        bn.Transparency = 1 bn.CanCollide = false
        elseif
        bn:IsA('Decal') then
            bn.Transparency = 1
            elseif
            bn:IsA('Texture') then
                bn.Transparency = 1
                elseif
                bn:IsA('ParticleEmitter') then
                    bn.Enabled = false
                    elseif
                    bn:IsA('Trail') then
                        bn.Enabled = false
                        elseif
                        bn:IsA('Beam') then
                            bn.Enabled = false
                            elseif
                            bn:IsA('BillboardGui') then
                                bn.Enabled = false
                                elseif
                                bn:IsA('SurfaceGui') then
                                    bn.Enabled = false
                                end
                            end
                        end
                        local function bh()
                        if aB._fpsEggsReady then
                            return true
                        end
                        local bi = false
                        local bj, bl = pcall(
                        function()
                        local bj = require(game:GetService('ReplicatedStorage').Shared.Eggs.PlacedEggRenderer).GetRenderFolder()
                        if not bj then
                            return
                        end
                        for bl, bn in ipairs((bj:GetChildren())) do
                            bg(bn)
                        end
                        local function bo(bp) task.defer(bg, bp)
                    end
                    bj.ChildAdded:Connect(bo) bi = true
                end
                )
                if not bj then
                    warn('[FPSBoost] Gagal hide egg pemain lain:', bl)
                    return false
                end
                return bi
            end
            local function bi(bj)
            if not bj then
                return
            end
            pcall(
            function() bj.Parent = nil
        end
        )
    end
    local function bj()
    if aB._fpsPetsReady then
        return true
    end
    local bl
    local bn, bo = pcall(
    function()
    local bn = game:GetService('ReplicatedStorage').Shared
    local bo = bn:FindFirstChild('Preferences')
    if bo then
        local bp = require(bo) bp.Set('HideOtherPets', true) bl = bp.IsOn
        else
        local bp = require(bn.SettingsCmds) bp.Write('HideOtherPets', true) bl = bp.Allows
    end
end
)
local bp = false
if bn and bl then
    local bq, br = pcall(bl, 'HideOtherPets') bp = bq and br == true
end
if
if bn then
    not bp
    else
    not bn then
        warn('[FPSBoost] Gagal set HideOtherPets bawaan game:', bo or 'setting belum aktif')
        return false
    end
    local bq = false bo, bn = pcall(
    function()
    local br = workspace:FindFirstChild('ClientRenderedAssets') or workspace:WaitForChild('ClientRenderedAssets', 10)
    if not br then
        return
    end
    for bs, bt in ipairs((br:GetChildren())) do
        bi(bt)
    end
    local function bu(bv) task.defer(bi, bv)
end
br.ChildAdded:Connect(bu) bq = true
end
)
if not bo then
    warn('[FPSBoost] Gagal hide pet (manual):', bn)
    return false
end
return bq
end
local function bl()
if type(l.__SenaV4SetCapFps) == 'function' then
    pcall(l.__SenaV4SetCapFps, 1000)
end
pcall(
function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end
) pcall(
function() UserSettings():GetService('UserGameSettings').SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
end
) pcall(
function()
local bn = game:GetService('ReplicatedStorage')
local bo = require
local bp = bn.Client.LightingsController
local function bq(br)
local bs = table.clone(br) bs.Bloom = nil bs.ColorCorrection = nil bs.SunRays = nil bs.DepthOfField = nil bs.Blur = nil bs.Clouds = nil bs.Atmosphere = nil bs.ShadowSoftness = 1
return bs
end
bo(bp):SetModifier('FPSBoost', bq, 100, 0)
end
) pcall(
function()
local bn = game:GetService('Lighting') bn.GlobalShadows = false bn.Technology = Enum.Technology.Compatibility bn.FogEnd = 9000000000 bn.Brightness = 2
end
) pcall(
function()
local bn = workspace:FindFirstChildOfClass('Terrain')
if bn then
    bn.WaterWaveSize = 0 bn.WaterWaveSpeed = 0 bn.WaterReflectance = 0 bn.WaterTransparency = 1 bn.Decoration = false
end
end
) pcall(
function()
local bn = workspace:FindFirstChild('__DEBRIS')
if bn then
    for bo, bp in ipairs(bn:GetChildren()) do
        if bp.Name == 'PlayerTrap' then
            pcall(
            function() bp:Destroy()
        end
        )
    end
end
end
end
)
end
local bn = Color3.fromRGB(120, 120, 120)
local function bo(bp)
if bp then
    if not bp:IsA('BasePart') then
        return
    end
    else
    return
end
bp.Material = Enum.Material.SmoothPlastic bp.Color = bn bp.CastShadow = false
end
local function bp(bq)
if bq:IsA('ParticleEmitter') then
    bq.Enabled = false bq.Rate = 0 pcall(
    function() bq:Clear()
end
)
elseif
bq:IsA('Trail') then
    bq.Enabled = false
    elseif
    bq:IsA('Beam') then
        bq.Enabled = false
        elseif
        bq:IsA('Smoke') then
            bq.Enabled = false
            elseif
            bq:IsA('Fire') then
                bq.Enabled = false
                elseif
                bq:IsA('Sparkles') then
                    bq.Enabled = false
                    elseif
                    bq:IsA('PostEffect') then
                        bq.Enabled = false
                        elseif
                        bq:IsA('Light') then
                            bq.Enabled = false
                            elseif
                            bq:IsA('Highlight') then
                                bq.Enabled = false
                                elseif
                                bq:IsA('Clouds') then
                                    bq.Enabled = false
                                    elseif
                                    bq:IsA('Atmosphere') then
                                        bq.Density = 0 bq.Haze = 0 bq.Glare = 0
                                        elseif
                                        bq:IsA('Explosion') then
                                        pcall(
                                        function() bq.Visible = false
                                    end
                                    )
                                end
                            end
                            local function bq()
                            if aB._fpsWorldReady then
                                return true
                            end
                            local br = false
                            local bs ={}
                            local bt, bu = pcall(
                            function()
                            local function bt(bu)
                            if a5(bu) then
                                return
                            end
                            bo(bu) bp(bu)
                        end
                        local bu ={workspace, game:GetService('Lighting')}
                        for bv, bw in ipairs(bu) do
                            table.insert(bs, bw.DescendantAdded:Connect(
                            function(bx) task.defer(bt, bx)
                        end
                        ))
                    end
                    local bx ={}
                    for by, bz in ipairs(bu) do
                        for bA, bB in ipairs(bz:GetChildren()) do
                            table.insert(bx, bB)
                        end
                    end
                    bu = 0
                    while # bx > 0 do
                        local bA = table.remove(bx) bt(bA)
                        for bB, bC in ipairs(bA:GetChildren()) do
                            table.insert(bx, bC)
                        end
                        bu += 1
                        if bu >= 250 and # bx > 0 then
                            h.Heartbeat:Wait() bu = 0
                        end
                    end
                    br = true
                end
                )
                if not bt then
                    for bx, by in ipairs(bs) do
                        by:Disconnect()
                    end
                    warn('[FPSBoost] Gagal flatten material workspace:', bu)
                    return false
                end
                return br
            end
            local function br()
            if aB._fpsAreasReady then
                return true
            end
            local bs = k()
            local bt = bs and bs:FindFirstChild('Areas')
            local bu = bt and bt:FindFirstChild('GuardAreas')
            local bx = bs and bs:FindFirstChild('Build')
            if bu then
                if not bx then
                    return false
                end
                else
                return false
            end
            for by, bz in ipairs(bu:GetChildren()) do
                local bA = bz:FindFirstChild('RequiredSpeedSign')
                if bA then
                    pcall(
                    function() bA:Destroy()
                end
                )
            end
        end
        local bA = bx:FindFirstChild('MainMap')
        local bB = bA and bA:FindFirstChild('Bases')
        local function bC(bD)
        if bB and bD:IsDescendantOf(bB) then
            return bD.Size.Y <= 5 and not string.find(string.upper(bD.Name), 'WALL', 1, true)
        end
        local bE = bD
        while bE and bE ~= bx do
            local bF = string.upper(bE.Name)
            if string.find(bF, 'BOTTOM', 1, true) then
                return true
            end
            bE = bE.Parent
        end
        return false
    end
    local bD ={'ENCHANTED', 'FUSEBIOME', 'WISP', 'BUTTERFLY', 'MARKERS', 'PORTAL', 'TRIGGER'}
    local function bE(bF)
    if bF:FindFirstChildOfClass('TouchTransmitter') then
        return true
        elseif
        bF:FindFirstChildWhichIsA('ProximityPrompt', true) then
            return true
        end
        local bG = bF
        while bG and bG ~= bx do
            local bH = string.upper(bG.Name)
            for bI, bJ in ipairs(bD) do
                if string.find(bH, bJ, 1, true) then
                    return true
                end
            end
            bG = bG.Parent
        end
        return false
    end
    local function bF(bG)
    if not bG:IsA('BasePart') then
        return
    end
    if bE(bG) then
        return
    end
    if bC(bG) then
        bo(bG)
        else
        pcall(
        function() bG:Destroy()
    end
    )
end
end
local function bG(bH) task.defer(bF, bH)
end
local bH = bx.DescendantAdded:Connect(bG) bt = 0 bs = 0
for bI, bJ in ipairs(bx:GetDescendants()) do
    local bK = bJ.Parent ~= nil bF(bJ) bt =
    if bK then
        if bJ.Parent == nil then
            bt + 1
            else
            bt
            else
            bt bs += 1
            if bs >= 250 then
                h.Heartbeat:Wait() bs = 0
            end
        end
        aB._fpsAreaListener = bH aB._fpsAreaDeleted = bt aB._fpsAreasReady = true
        return true
    end
    local function bs()
    if aB._fpsPlotsReady then
        return true
    end
    local bt = false
    local bu, bx = pcall(
    function()
    local bu = require(game:GetService('ReplicatedStorage').Client.PlotState)
    if bu.GetMySlot() == nil then
        warn([[[FPSBoost] Slot plot kita belum ke-resolve, skip delete plot dulu (biar aman).]])
        return
    end
    local function bx(bz)
    local bA = bu.GetMySlot()
    return bA ~= nil and bz.Name == tostring(bA)
end
local bz = bu.GetPlotsFolder() or workspace:WaitForChild('Plots', 10)
if not bz then
    warn('[FPSBoost] workspace.Plots gak ketemu sama sekali.')
    return
end
local bA = 0
for bB, bC in ipairs((bz:GetChildren())) do
    bA =
    if bx(bC) then
        bA
        else
        if pcall(
        function() bC:Destroy()
    end
    ) then
        bA + 1
        else
        bA
    end
    local function bD(bE) task.defer(
    function()
    if bE.Parent and not bx(bE) then
        pcall(
        function() bE:Destroy()
    end
    )
end
end
)
end
bz.ChildAdded:Connect(bD) bt = true
end
)
if not bu then
    warn('[FPSBoost] Gagal delete plot pemain lain:', bx)
    return false
end
return bt
end
local function bt()
if aB._fpsTreadmillsReady then
    return true
end
local bu = false
local bx, bz = pcall(
function()
local bx = game:GetService('ReplicatedStorage')
local bz = require(bx.Client.PlotState)
local bA
local bB = bx.Client:FindFirstChild('Modules') or bx.Client:WaitForChild('Modules', 10)
local bC, bD = bB and(bB:FindFirstChild('RuntimeInstanceRegistry') or bB:WaitForChild('RuntimeInstanceRegistry', 10))
if bC then
    bx, bB = pcall(require, bC) bD =
    if bx then
        bB
        else
        bA
        else
        bD = bA
    end
    local bE = workspace:FindFirstChild('__ClientTreadmillRenders') or workspace:WaitForChild('__ClientTreadmillRenders', 10)
    if not bE then
        return
    end
    local function bF()
    local bG = bz.GetMySlot()
    if bG == nil then
        return nil
    end
    local bH = bE:FindFirstChild('TreadmillRender_'..tostring(bG))
    if bH then
        return bH
    end
    local bI = bD and(bD.Peek or bD.Get)
    if not bI then
        return nil
    end
    local bJ, bK = pcall(bI, 'TreadmillPlotRender', tostring(bG))
    if bJ then
        return bK
    end
    return nil
end
local function bG(bH)
local bI = bF()
if bI and bH == bI then
    return true
end
local bJ, bK = pcall(
function()
return bH:GetPivot().Position
end
)
if not bJ then
    return true
end
bJ, bI = pcall(bz.IsWorldPositionWithinLocalPlotBounds, bK)
return bJ and bI
end
bx = 0
for bH, bI in ipairs((bE:GetChildren())) do
    bx =
    if bI:IsA('Model') then
        if bG(bI) then
            bx
            else
            if pcall(
            function() bI:Destroy()
        end
        ) then
            bx + 1
            else
            bx
            else
            bx
        end
        local function bJ(bK) task.defer(
        function()
        if bK.Parent and(bK:IsA('Model') and not bG(bK)) then
            pcall(
            function() bK:Destroy()
        end
        )
    end
end
)
end
bE.ChildAdded:Connect(bJ) bu = true
end
)
if not bx then
    warn('[FPSBoost] Gagal delete treadmill pemain lain:', bz)
    return false
end
return bu
end
local function bu()
if bf then
    return
    elseif
    aB._fpsBoostApplying then
        return
    end
    aB._fpsBoostApplying = true
    local bx, bz = pcall(
    function() bl() aB._fpsPlotsReady = bs() == true aB._fpsTreadmillsReady = bt() == true aB._fpsAreasReady = br() == true aB._fpsWorldReady = bq() == true aB._fpsPetsReady = bj() == true aB._fpsEggsReady = bh() == true bf = aB._fpsEggsReady and aB._fpsPetsReady and aB._fpsWorldReady and aB._fpsPlotsReady and aB._fpsTreadmillsReady and aB._fpsAreasReady
end
) aB._fpsBoostApplying = nil
if not bx then
    warn('[FPSBoost] Gagal menerapkan FPS Boost:', bz)
end
end
local function bx(bz, bA, bB)
local bC = true
local function bD()
local bE ={bB}
local bF = RaycastParams.new() bF.FilterType = Enum.RaycastFilterType.Exclude
local bG = bz
for bH = 1, 8, 1 do
    bF.FilterDescendantsInstances = bE
    local bI = bA - bG
    if bI.Magnitude < 1 then
        break
    end
    local bJ = workspace:Raycast(bG, bI, bF)
    if not bJ then
        break
    end
    if bJ.Instance.CanCollide then
        bC = false
        break
    end
    table.insert(bE, bJ.Instance) bG = bJ.Position + bI.Unit * 0.1
end
end
pcall(bD)
return bC
end
local bz ={}
local bA =(
function()
local bA ={} bA.__index = bA
local bB ={auto_place = true, auto_fuse = true, equip_best = true}
local bC ={auto_steal = 100, auto_hatch = 80, auto_place = 70, auto_fuse = 50, equip_best = 40, rewards = 20}
local function bD(bE)
local bF ={}
for bG, bH in pairs(bE) do
    bF[bG] = bH
end
return bF
end
bA.new =
function()
local bE = setmetatable({}, bA) bE.destroyed = false bE.active = nil bE.background = nil bE.reservations ={} bE.listeners ={} bE.backgroundListeners ={} bE.serial = 0
return bE
end
bA._snapshot =
function(bE)
local bF = bE.active
return{busy = bF ~= nil, operation = bF and bF.owner or nil, priority = bF and bF.priority or 0, reservedCount = bF and # bF.uids or 0, reservations = bD(bE.reservations)}
end
bA._emit =
function(bE)
local bF = bE:_snapshot()
for bG in pairs(bE.listeners) do
    local bH, bI = pcall(bG, bF)
    if not bH then
        warn('[StealAnEgg] Coordinator listener failed:', bI)
    end
end
end
bA._emitBackground =
function(bE)
local bF = bE.background
local bG ={busy = bF ~= nil, operation = bF and bF.owner or nil}
for bH in pairs(bE.backgroundListeners) do
    local bI, bJ = pcall(bH, bG)
    if not bI then
        warn('[StealAnEgg] Background coordinator listener failed:', bJ)
    end
end
end
bA.subscribe =
function(bE, bF) bE.listeners[bF] = true pcall(bF, bE:_snapshot())
return
function() bE.listeners[bF] = nil
end
end
bA.subscribeBackground =
function(bE, bF) bE.backgroundListeners[bF] = true
local bG = pcall
local bH ={busy = bE.background ~= nil} bH.operation = bE.background and bE.background.owner or nil bG(bF, bH)
return
function() bE.backgroundListeners[bF] = nil
end
end
bA.getSnapshot =
function(bE)
return bE:_snapshot()
end
bA.isBackgroundBusy =
function(bE)
return bE.background ~= nil
end
bA.isReserved =
function(bE, bF, bG)
local bH = bE.reservations[bF]
return bH ~= nil and bH ~= bG
end
bA.tryAcquire =
function(bE, bF, bG, bH)
if bE.destroyed then
    return nil, 'Coordinator destroyed'
end
if type(bF) ~= 'string' then
    return nil, 'Invalid operation owner'
    elseif
    bF == '' then
        return nil, 'Invalid operation owner'
    end
    if bE.active then
        return nil, 'Busy: '..bE.active.owner
    end
    if bE.background and bB[bF] then
        return nil, 'Busy: background '..bE.background.owner
    end
    local bI ={}
    local bJ ={}
    for bK, bL in ipairs(type(bG) == 'table' and bG or{}) do
        if type(bL) == 'string' and(bL ~= '' and not bJ[bL]) then
            if bE:isReserved(bL, bF) then
                return nil, 'UID reserved by '..tostring(bE.reservations[bL])
            end
            bJ[bL] = true table.insert(bI, bL)
        end
    end
    bE.serial = bE.serial + 1
    local bM ={id = bE.serial, lane = 'foreground', owner = bF, priority = tonumber(bH) or bC[bF] or 0, uids = bI, released = false} bE.active = bM
    for bN, bO in ipairs(bI) do
        bE.reservations[bO] = bF
    end
    bE:_emit()
    return bM
end
bA.tryAcquireBackground =
function(bE, bF, bG)
if bE.destroyed then
    return nil, 'Coordinator destroyed'
end
if type(bF) ~= 'string' then
    return nil, 'Invalid operation owner'
    elseif
    bF == '' then
        return nil, 'Invalid operation owner'
    end
    if bE.background then
        return nil, 'Background busy: '..bE.background.owner
    end
    if bE.active and bB[bE.active.owner] then
        return nil, 'Foreground tool busy: '..bE.active.owner
    end
    local bH ={}
    local bI ={}
    for bJ, bM in ipairs(type(bG) == 'table' and bG or{}) do
        if type(bM) == 'string' and(bM ~= '' and not bI[bM]) then
            if bE:isReserved(bM, bF) then
                return nil, 'UID reserved by '..tostring(bE.reservations[bM])
            end
            bI[bM] = true table.insert(bH, bM)
        end
    end
    bE.serial = bE.serial + 1
    local bN ={id = bE.serial, lane = 'background', owner = bF, priority = 0, uids = bH, released = false} bE.background = bN
    for bO, bP in ipairs(bH) do
        bE.reservations[bP] = bF
    end
    bE:_emitBackground()
    return bN
end
bA.release =
function(bE, bF)
if type(bF) ~= 'table' then
    return false
    elseif
    bF.released then
        return false
    end
    bF.released = true
    for bG, bH in ipairs(bF.uids or{}) do
        if bE.reservations[bH] == bF.owner then
            bE.reservations[bH] = nil
        end
    end
    local bI = bE.active == bF
    if bI then
        bE.active = nil
        elseif
        bE.background == bF then
            bE.background = nil bE:_emitBackground()
        end
        if bI then
            bE:_emit()
        end
        return true
    end
    bA.destroy =
    function(bE)
    if bE.destroyed then
        return
    end
    bE.destroyed = true
    if bE.active then
        bE:release(bE.active)
    end
    if bE.background then
        bE:release(bE.background)
    end
    table.clear(bE.reservations) table.clear(bE.listeners) table.clear(bE.backgroundListeners)
end
return bA
end
)()
local bB =(
function()
local bB = game:GetService('ReplicatedStorage')
local bC = require(bB.Data.Areas)
local bD = require(bB.Data.Assets)
local bE = require(bB.Data.Guards)
local bF = require(bB.Shared.Modules.Mutations)
local bG ={}
local bH ={Common = 1, Uncommon = 2, Rare = 3, Epic = 4, Legendary = 5, Mythic = 6, Cosmic = 7, Secret = 8, Eternal = 9, Divine = 10} bG.rarityRank =
function(bI)
return bH[bI] or 0
end
local function bI(bN)
local bO ={}
local bP ={}
for bQ, bR in ipairs(bN) do
    if type(bR) == 'string' and(bR ~= '' and not bO[bR]) then
        bO[bR] = true table.insert(bP, bR)
    end
end
table.sort(bP)
return bP
end
bG.getRarities =
function()
local bN ={}
for bO in pairs(bD.ByRarity) do
    table.insert(bN, bO)
end
table.sort(bN,
function(bP, bQ)
local bR = bH[bP] or 99
local bS = bH[bQ] or 99
if bR ~= bS then
    return bR < bS
end
return tostring(bP) < tostring(bQ)
end
)
return bN
end
bG.getNames =
function()
local bN ={}
for bO, bP in pairs(bD.Directory) do
    table.insert(bN, bP.DisplayName or bP._id)
end
return bI(bN)
end
bG.getAreas =
function()
local bN ={}
for bO, bP in pairs(bC.Directory) do
    if type(bO) == 'string' and(type(bP) == 'table' and type(bP.DropTable) == 'table') then
        table.insert(bN, bO)
    end
end
table.sort(bN,
function(bQ, bR)
local bS = bE.Directory[bQ]
local bT = bE.Directory[bR]
local bU = bS and bS.WalkSpeed or 1 / 0
local bV = bT and bT.WalkSpeed or 1 / 0
if bU ~= bV then
    return bU < bV
end
return bQ < bR
end
)
return bN
end
bG.getMutations =
function()
local bN ={}
local bO = bF.Ids()
for bP in pairs(type(bO) == 'table' and bO or{}) do
    if type(bP) == 'string' and bP ~= bF.NO_MUTATION then
        local bQ, bR = pcall(bF.LabelOf, bP) table.insert(bN, bQ and type(bR) == 'string' and bR ~= '' and bR or bP)
    end
end
return bI(bN)
end
bG.resolveMutationId =
function(bN)
if type(bN) ~= 'string' then
    return nil
end
if bF.IdSet[bN] then
    return bN
end
for bO in pairs(bF.Ids()) do
    if bO ~= bF.NO_MUTATION and bF.LabelOf(bO) == bN then
        return bO
    end
end
return nil
end
bG.resolve =
function(bN)
local bO = bN and bD.Directory[bN.AssetCategory]
local bP = bO and bO.Rarity
local bQ = bP and(bP.DisplayName or bP._id) or 'Unknown'
return{name = bO and(bO.DisplayName or bO._id) or bN and bN.AssetCategory or 'Unknown', category = bN and bN.AssetCategory or 'Unknown', rarity = bQ, rarityRank = bH[bQ] or 0,
rarityColor = bP and bP.Color or nil, icon = bO and type(bO.Icon) == 'string' and bO.Icon or nil}
end
return bG
end
)()
local function bC(bD)
if not bD then
    return nil
end
for bE, bF in ipairs(bD:GetDescendants()) do
    if bF:IsA('ModuleScript') and(bF.Name == 'Limits' and(bF.Parent and(bF.Parent:FindFirstChild('Surface') and bF.Parent:FindFirstChild('Runtime')))) then
        return bF
    end
end
return nil
end
local bD = bC(g:FindFirstChildOfClass('PlayerScripts')) or bC(game:GetService('StarterPlayer'):FindFirstChild('StarterPlayerScripts'))
local bE =(
function()
local bE = game:GetService('Players')
local bF = game:GetService('ReplicatedStorage')
local bG = game:GetService('RunService')
local bH = bE.LocalPlayer
local bI = require(bF.Client.EggState)
local bN = require(bF.Shared.Remotes)
local bO = bN.EggWorld
local bP = require(bF.Shared.Types.AreaEggs)
local bQ = require(bF.Shared.Util.AreaEggSlotIdentity)
local bR = require(bF.Client.AreaEggResetWall)
local bS = require(bF.Client.SpeedPowerProjection)
local bT = require(bF.Shared.Util.TreadmillUtil)
local bU = require(bF.Shared.Util.EggRecords)
local bV = require(bF.Shared.Util.AssetEarnings)
local bW = require(bF.Shared.Save)
local bX = require(bF.Client.PlotState)
local bY = 10
local bZ = 20
local b_ = 100
local b0 = 60
local b1 = 0.05
local b2 = 200
local b3 = 1000
local b4 = 600
local b5 = 3000
local function b6()
return l.__SenaV4AdminBoost == true and b5 or b3
end
local b7 = '__SenaV4StealAnEggMovementSpoof'
local b8 = 436
local b9 = '__SenaV4StealAnEggIntegritySpoof'
local ca ={Divine = true, Eternal = true}
local cb = 'ClientCharacter: GetDebugSnapshot'
local cc ={'LastObservedSample', 'LastSample', 'LastGoodSample', 'LastGameplayTrustedSample', 'LastValidatedSample', 'LastValidatedGroundedSample', 'LastConfirmedGroundSample',
'CandidateGroundedSample'}
local cd = 0.15
local ce = 8
local cf = 1
local cg = '__SenaV4HoverPad'
local ch = 'SenaV4RuntimeOwner'
local ci = Vector3.new(542.93, 71.5, - 405.58)
local cj = 612
local ck ={- 364.3, - 367.21, - 371.12, - 375.65} CFrame.new(599.8, 113.5, - 325) Vector3.new(599.8, 70, - 325)
local cl = 3
local cm = 0.7
local cn = 2
local co = 3000
local cp = CFrame.new(554.071, 70.276, - 395.573, 0, 0, 1, 0, 1, 0, - 1, 0, 0)
local cq = 14
local cr = 0.7
local cs = 3
local ct = 6
local cu = 0.45
local cv = 30
local cw = 18
local cx = 0.35
local cy = 2
local cz = 0.1
local cA = '__SenaV4TreadmillDecoy'
local cB ={Script = true, LocalScript = true, BillboardGui = true, Sound = true}
local cC = 0.25
local cD = 5
local cE = 2
local cF = 45
local cG = 10
local cH = 0.03
local cI = 0.65
local cJ = 0.35
local cK = 0.08
local cL = 1.35
local cM = 0.15
local cN = 24
local cO = 2
local cP = 0.5
local cQ = 0.45
local cR = 0.4
local cS = 'PlayerTrap'
local cT = 'Trap'
local cU ={} cU.__index = cU
local cV = game:GetService('Stats')
local function cW(cX, cY)
local cZ = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
if cZ then
    pcall(
    function() cZ.AssemblyLinearVelocity = Vector3.new(0, 0, 0) cZ.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
)
end
local c_ = 0 pcall(
function() c_ = cV.Network.ServerStats.Ping:GetValue()
end
) task.wait(math.max(0.3, c_ * 2.5 / 1000))
local c0 ={Uid = cX}
if cY ~= nil then
    c0.FirstAreaSlotKey = cY
end
cY, cX = bO.AskFieldEggCarry:InvokeServer(c0)
return cY == true, typeof(cX) == 'string' and cX or nil
end
local function cX(cY, cZ, c_)
local c0 = cY:Connect(cZ) table.insert(c_, c0)
return c0
end
local function cY(cZ)
for c_, c0 in ipairs(cZ) do
    pcall(c0.Disconnect, c0)
end
table.clear(cZ)
end
local function cZ(c_, c0)
for c1, c2 in ipairs(c_ or{}) do
    if c2 == c0 then
        return true
    end
end
return false
end
local c_
local function c0(c1)
local c2 = c1 and c1:FindFirstChild('HumanoidRootPart')
if c2 then
    c2:SetAttribute('KillPartIgnore', true)
end
end
local function c1(c2)
if c2._healthPinner then
    pcall(c2._healthPinner.Disconnect, c2._healthPinner) c2._healthPinner = nil
end
if c2._healthChangedConnection then
    pcall(c2._healthChangedConnection.Disconnect, c2._healthChangedConnection) c2._healthChangedConnection = nil
end
end
local function c2(c3, c4) c1(c3)
local c5 = c4 and c4:FindFirstChildOfClass('Humanoid')
local c6 = c4 and c4:FindFirstChild('HumanoidRootPart')
if not c5 then
    return false
end
local c7 = math.max(c5.MaxHealth, 100)
local c8 = false
local c9 = 0
local function da()
if c8 then
    return
    elseif
    c3.destroyed then
        return
        elseif
        bH.Character ~= c4 then
            return
            elseif
            not c5.Parent then
                return
            end
            local db = os.clock()
            if db - c9 < 0.1 and(c5.Health > 0 and c5:GetState() ~= Enum.HumanoidStateType.Dead) then
                return
            end
            c9, c8 = db, true pcall(
            function() c5.BreakJointsOnDeath = false c5.RequiresNeck = false c5:SetStateEnabled(Enum.HumanoidStateType.Dead, false) c5:SetStateEnabled(Enum.HumanoidStateType.FallingDown,
            false) c5:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            if c5.Health <= 0 then
                c5.Health = c7
            end
            if c5:GetState() == Enum.HumanoidStateType.Dead then
                c5:ChangeState(Enum.HumanoidStateType.Running)
            end
            if c6 and(c6.Parent == c4 and c6.Anchored) then
                c6.Anchored = false
            end
        end
        ) c8 = false
    end
    da() c3._healthChangedConnection = c5.HealthChanged:Connect(
    function(db)
    if db <= 0 then
        da()
        elseif
        db < c7 then
            da()
        end
    end
    ) c3._healthPinner = bG.Heartbeat:Connect(da)
    return true
end
local function c3(c4)
local c5 = c4 and c4:FindFirstChildOfClass('Humanoid')
if not c5 then
    return
end
pcall(
function()
if c5.Health <= 0 then
    c5.Health = math.max(c5.MaxHealth, 1)
end
c5:SetStateEnabled(Enum.HumanoidStateType.Dead, true) c5.BreakJointsOnDeath = true c5.RequiresNeck = true
end
)
end
local function c4()
return getgenv and getgenv() or _G
end
local function c5()
if type(getconnections) ~= 'function' then
    return false
    elseif
    type(debug) ~= 'table' then
        return false
        elseif
        type(debug.info) ~= 'function' then
            return false
            elseif
            type(debug.getupvalue) ~= 'function' then
                return false
            end
            local c6, c7 = pcall(getconnections, bH.Idled)
            if c6 then
                if type(c7) ~= 'table' then
                    return false
                end
                else
                return false
            end
            local c8 = '.PlayerScripts.Game.AntiAFK'
            for c9, da in ipairs(c7) do
                local db = da.Function
                if type(db) == 'function' and type(da.Disable) == 'function' then
                    local dc, dd = pcall(debug.info, db, 's')
                    local de, df = pcall(debug.getupvalue, db, 1)
                    if dc and(type(dd) == 'string' and(dd:sub(- 27) == c8 and(de and type(df) == 'number'))) then
                        return(pcall(da.Disable, da))
                    end
                end
            end
            return false
        end
        local function c6()
        local c7 = c4()
        local c8 = c7[b7]
        if type(c8) ~= 'table' or c8.Version ~= b8 then
            if type(c8) == 'table' then
                c8.Enabled = false
            end
            c8 ={Version = b8, Installed = false, Enabled = false, Mode = 'StateBaseline', Humanoid = nil, RootPart = nil, WalkSpeed = b4} c7[b7] = c8
        end
        return c8
    end
    local function c7(c8, c9)
    local da = c6()
    if not da then
        return false
    end
    local db = c8 and c8:FindFirstChildOfClass('Humanoid')
    local dc = c8 and c8:FindFirstChild('HumanoidRootPart') da.Humanoid = db da.RootPart = dc da.WalkSpeed = math.clamp(tonumber(c9) or b4, b2, b3 * cL) da.Enabled = false
    return db ~= nil and dc ~= nil
end
local function c8()
local c9 = c4()[b7]
if type(c9) == 'table' then
    c9.Enabled = false c9.Humanoid = nil c9.RootPart = nil
end
end
local function c9(da, db, dc)
local dd
if type(getcallbackvalue) == 'function' and type(debug) == 'table' and type(debug.getupvalue) == 'function' then
    local de = bF:FindFirstChild('Packages') and bF.Packages:FindFirstChild('Signal')
    if de then
        local df, dg = pcall(require, de)
        if df and type(dg) == 'table' and type(dg.Invoked) == 'function' then
            local dh, di = pcall(dg.Invoked, cb)
            if dh and di then
                local dj, dk = pcall(getcallbackvalue, di, 'OnInvoke')
                if dj and type(dk) == 'function' then
                    local dl, dm = pcall(debug.getinfo, dk)
                    if dl then
                        local function dn(dp, dq, dr)
                        if dd then
                            return
                            elseif
                            type(dp) ~= 'table' then
                                return
                                elseif
                                dq > 3 then
                                    return
                                    elseif
                                    dr[dp] then
                                        return
                                    end
                                    dr[dp] = true
                                    if rawget(dp, 'Player') == da and(rawget(dp, 'Character') == da.Character and(rawget(dp, 'Humanoid') == db and(rawget(dp, 'RootPart') == dc and(type(rawget(dp,
                                    'SampleHistory')) == 'table' and type(rawget(dp, 'Evidence')) == 'table')))) then
                                        dd = dp
                                        return
                                    end
                                    local ds = 0
                                    for dt, du in pairs(dp) do
                                        ds += 1
                                        if ds > 128 then
                                        break
                                    end
                                    if type(du) == 'table' then
                                        dn(du, dq + 1, dr)
                                    end
                                end
                            end
                            for dp = 1, dm.nups or 0, 1 do
                                local dq, dr = pcall(debug.getupvalue, dk, dp)
                                if dq and type(dr) == 'table' then
                                    dn(dr, 0,{})
                                    if dd then
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if not dd and type(getgc) == 'function' then
        local de, df = pcall(getgc, true)
        if de and type(df) == 'table' then
            for dg, dh in ipairs(df) do
                if type(dh) == 'table' and rawget(dh, 'Player') == da and rawget(dh, 'Character') == da.Character and rawget(dh, 'Humanoid') == db and rawget(dh, 'RootPart') == dc and type(rawget(dh,
                'SampleHistory')) == 'table' and type(rawget(dh, 'Evidence')) == 'table' then
                    dd = dh
                    break
                end
            end
        end
    end
    return dd
end
local da ={busy = false, nextAt = 0, misses = 0, found = nil}
local function db(dc, dd, de)
local df = da.found
if type(df) == 'table' and(rawget(df, 'Player') == dc and(rawget(df, 'Character') == dc.Character and(rawget(df, 'Humanoid') == dd and rawget(df, 'RootPart') == de))) then
    return df
end
if da.busy then
    return nil
    elseif
    os.clock() < da.nextAt then
        return nil
    end
    da.busy = true task.spawn(
    function() task.wait()
    local dg, dh = pcall(c9, dc, dd, de)
    local di = dg and dh or nil da.found = di da.misses = di and 0 or da.misses + 1 da.nextAt = os.clock() +(di and 0.2 or(da.misses >= 5 and 10 or 1)) da.busy = false
end
)
return nil
end
local function dc(dd, de, df)
if type(dd) ~= 'table' then
    return false
end
local dg = rawget(dd, 'RootPart')
local dh = dg and dg.Parent and dg.CFrame or nil
local di = dh and dh.Position or nil
local dj = typeof(df) == 'Vector3' and df or Vector3.new(0, 0, 0)
local function dk(dl)
if type(dl) == 'table' then
    rawset(dl, 'WalkSpeed', de)
    if dh then
        rawset(dl, 'CFrame', dh) rawset(dl, 'Position', di) rawset(dl, 'LinearVelocity', dj) rawset(dl, 'AngularVelocity',(Vector3.new(0, 0, 0)))
    end
end
end
for dl, dm in ipairs(cc) do
    dk(rawget(dd, dm))
end
for dn, dp in pairs(rawget(dd, 'SampleHistory') or{}) do
    dk(dp)
end
for dq, dr in pairs(rawget(dd, 'SafeGroundCheckpoints') or{}) do
    dk(dr)
end
local ds = rawget(dd, 'Evidence')
if type(ds) == 'table' then
    ds.Speed = 0 ds.Teleport = 0 ds.Flight = 0
end
local dt = rawget(dd, 'ImpulseContext')
if type(dt) == 'table' then
    local du = math.max(tonumber(dt.MaxHorizontalSpeed) or 0, de)
    local dv = math.max((tonumber(dt.ExpiresAt) or 0) -(tonumber(dt.StartedAt) or 0), cM) dt.MaxHorizontalSpeed = du
    if di then
        dt.OriginPosition = di
    end
    dt.MaxHorizontalDistance = math.max(tonumber(dt.MaxHorizontalDistance) or 0, du * dv + cN * 2) dk(dt.PreMovementSafeSample)
end
if rawget(dd, 'CorrectionContext') == nil then
    rawset(dd, 'FirstSuspiciousAt', nil)
    if rawget(dd, 'ThreatLevel') == 'Observing' then
        rawset(dd, 'ThreatLevel', 'Trusted')
    end
end
return true
end
local function dd()
local de = c4()
local df = de[b9]
if type(df) ~= 'table' then
    df ={} de[b9] = df
end
return df
end
local function de(df, dg, dh)
return type(df) == 'table' and rawget(df, 'Player') == bH and rawget(df, 'Character') == bH.Character and rawget(df, 'Humanoid') == dg and rawget(df, 'RootPart') == dh
end
local function df(dg, dh, di)
return de(dg, dh, di)
end
local function dg(dh, di, dj)
local dk = dd()
local dl = dk.State
if de(dl, dh, di) then
    else
    local dq = os.clock()
    if dq <(dk.NextSearchAt or 0) then
        return false
    end
    dk.NextSearchAt = dq + 0.2 dl = db(bH, dh, di)
end
if not dl then
    return false
end
if not df(dl, dh, di) then
    dk.Enabled = false dk.Humanoid = dh dk.RootPart = di dk.State = dl
    return false
end
dk.NextSearchAt = 0 dk.Enabled = true dk.Humanoid = dh dk.RootPart = di dk.State = dl dk.WalkSpeed = math.clamp(dj * cL, b2, b3 * cL) dk.TravelVelocity = Vector3.new(0,
0, 0) dc(dl, dk.WalkSpeed, dk.TravelVelocity)
return true
end
local function dh(di, dj, dk, dl)
local dq = c4()[b9]
if type(dq) ~= 'table' then
    return false
    elseif
    dq.Enabled then
        if dq.Humanoid ~= di then
            return false
            elseif
            dq.RootPart ~= dj then
                return false
                elseif
                not df(dq.State, di, dj) then
                    return false
                end
                else
                return false
            end
            dq.WalkSpeed = math.clamp(dk * cL, b2, b3 * cL)
            if typeof(dl) == 'Vector3' then
                dq.TravelVelocity = dl
                elseif
                typeof(dq.TravelVelocity) ~= 'Vector3' then
                    dq.TravelVelocity = Vector3.new(0, 0, 0)
                end
                return dc(dq.State, dq.WalkSpeed, dq.TravelVelocity)
            end
            local function di(dj)
            local dk = c4()[b9]
            if type(dk) ~= 'table' then
                return
            end
            if dj == nil or dk.Humanoid == dj then
                dk.Enabled = false dk.Humanoid = nil dk.RootPart = nil dk.State = nil dk.TravelVelocity = nil dk.NextSearchAt = 0
            end
        end
        local function dj(dk, dl)
        if # dl == 0 then
            return true
        end
        for dq, dr in ipairs(dk.Mutations or{}) do
            if cZ(dl, dr) then
                return true
            end
        end
        return dk.BaseMutation ~= nil and cZ(dl, dk.BaseMutation)
    end
    local function dk()
    local dl = bT.SpeedPowerToWalkSpeed(bS.ReadProjected())
    local dq = bH.Character
    local dr = dq and dq:FindFirstChildOfClass('Humanoid')
    local ds = dr and dr.WalkSpeed or dl
    return math.clamp(math.min(dl, ds), b2, b3)
end
cU.new =
function(dl, dq, dr)
local ds = setmetatable({}, cU) ds.catalog = dl ds.limitsModule = dq ds.coordinator = dr ds.operationToken = nil ds.connections ={} ds.listeners ={} ds.records ={} ds.enabled = false ds.userStealEnabled = false ds.skippedEggs ={} ds.riftWants ={} ds.riftOnly = false ds.indexObjectiveEnabled = false ds.wispObjective = nil ds.manualObjectiveEnabled = false ds.manualQueue ={} ds.manualOrder ={} ds.indexCache ={at = 0,
set ={}} ds.running = false ds.safeStarting = false ds.movementRetryPending = false ds.destroyed = false ds.resetBlocked = bR.IsSealed() ds.gateOpenAt = ds.resetBlocked and 1 / 0 or os.clock() ds.activeTween = nil ds.activeTarget = nil ds.claimPresentationNode = nil ds.claimPresentationOriginal = nil ds.claimPresentationSuppression = nil ds.carry ={active = false,
uid = nil, generation = 0} ds.carryWorker = nil ds.tweenRecoveryUid = nil ds.planGeneration = 0 ds.treadmillDecoy = nil ds.treadmillDecoyCamera = nil ds.treadmillDecoyCameraConnection = nil ds.treadmillDecoyCharacterConnection = nil ds.treadmillPopupConnection = nil ds.treadmillDecoyRealTransparency = nil ds.hoverPadOwnerId = string.format('%s:%0.6f',
tostring(ds), os.clock()) ds.instantPhase = nil ds.primerUid = nil ds.primerUids ={} ds.targetUid = nil ds.hitTimer = nil ds.guardHitBoostInstalled = false ds.stats ={status = ds.resetBlocked and 'Reset wall closed' or 'Ready',
available = 0, matching = 0, lastTarget = 'None', lastResult = 'Idle'} ds.config ={stealMode = 'Instant', flyAerial = false, flyZigzag = false, speed = b4,
antiTrap = true, heaviestFirst = false, highestValueFirst = false, minWeightKg = 0, espEnabled = false, espRarity = true, espName = true, espKg = true,
espMutation = true, espValue = true, espPlaced = false, espIcon = true, espMinRank = 0, espMinValue = 0, minValuePerSec = 0, rarityEnabled = false, rarities ={},
nameEnabled = false, names ={}, areaEnabled = false, areas ={}, mutationEnabled = false, mutations ={}} ds.gameAntiAfkDisabled = c5()
if bH.Character then
    c0(bH.Character)
    local dt = bH.Character:FindFirstChildOfClass('Humanoid')
    if dt then
        pcall(
        function() dt.BreakJointsOnDeath = false dt.RequiresNeck = false dt:SetStateEnabled(Enum.HumanoidStateType.Dead, false) dt:SetStateEnabled(Enum.HumanoidStateType.FallingDown,
        false) dt:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end
    )
end
c2(ds, bH.Character)
end
dl, dq = pcall(
function()
return require(bF.Shared.Util.EggRecords)
end
) ds.weightUtil = dl and type(dq.WeightKgForScale) == 'function' and dq or nil
local function dt(du)
if not du then
    return
end
cX(du.DescendantAdded,
function(dv)
if ds.config.antiTrap then
    ds:_purgeTrap(dv)
end
end
, ds.connections)
end
dt(workspace:FindFirstChild('Transient')) dt(workspace:FindFirstChild('__DEBRIS'))
if ds.config.antiTrap then
    ds:_purgeTraps()
end
cX(workspace.ChildAdded,
function(du)
if du.Name == 'Transient' or du.Name == '__DEBRIS' then
    dt(du)
    if ds.config.antiTrap then
        ds:_purgeTraps()
    end
end
end
, ds.connections) ds:_replaceSnapshot(bI.ReadFieldEggs()) cX(bI.FieldRefreshed,
function(du) ds:_replaceSnapshot(du)
end
, ds.connections) cX(bI.FieldShifted,
function(du) ds.records[du.Uid] = du ds:_refreshCounts()
if ds.enabled and not ds.destroyed and not ds.running and not ds.carry.active and(du.State == bP.States.Slot or du.State == bP.States.Dropped) and not ds._shiftWakePending then
    ds._shiftWakePending = true task.delay(0.25,
    function() ds._shiftWakePending = nil
    if not ds.destroyed and(ds.enabled and not ds.running) then
        ds:_schedule()
    end
end
)
end
end
, ds.connections) cX(bI.FieldGone,
function(du) ds.records[du] = nil
if ds.activeTarget and ds.activeTarget.Uid == du then
    if ds.carry.active and ds.carry.uid == du then
        ds:_refreshCounts()
        return
    end
    ds.carryAttemptToken = nil ds:_clearArrivalHold(du)
    if ds.activeTween and ds.activeTween.Cancel then
        pcall(ds.activeTween.Cancel, ds.activeTween)
    end
    local dv = ds.activeTarget task.delay(cI,
    function()
    if ds.destroyed then
        return
        elseif
        not ds.enabled then
            return
        end
        if ds.carry.active and ds.carry.uid == du then
            return
        end
        if ds.activeTarget == dv and dv.Uid == du then
            ds:_finish('Target removed \226\128\148 continuing')
        end
    end
    )
end
ds:_refreshCounts()
end
, ds.connections) cX(bI.ResetCountdown,
function() ds:_closeGate('Egg reset countdown')
end
, ds.connections) cX(bI.ResetFade,
function() ds:_closeGate('Egg reset teleport')
end
, ds.connections) cX(bR.Changed,
function(du)
if du then
    ds:_closeGate('Reset wall closed')
    else
    ds.resetBlocked = false ds.gateOpenAt = os.clock() ds.safeStarting = false ds.running = false ds:_setStatus(ds.enabled and 'Searching' or 'Ready') ds:_schedule()
end
end
, ds.connections) cX(bH.CharacterRemoving,
function() ds._recalling = nil ds:_cleanupInstantSteal() ds:_hideTreadmillDecoy() ds._forestDropInProgress = nil ds._instantReturnToken = nil ds.carry.generation += 1 ds:_invalidateCarryWorker() ds.carry.active = false ds.carry.uid = nil ds.safeStarting = false ds.planGeneration = ds.planGeneration + 1 ds:_cancelTween('Character resetting') ds:_stopMovementProtection()
end
, ds.connections) cX(bG.Heartbeat,
function()
if ds.destroyed then
    return
end
local du = bH.Character
local dv = du and du:FindFirstChild('HumanoidRootPart')
if not dv then
    return
end
local dw = dv.AssemblyLinearVelocity
local dx = du:FindFirstChildOfClass('Humanoid')
local dy = dx and dx.WalkSpeed or 0
local dz = Vector3.new(dw.X, 0, dw.Z)
if dz.Magnitude > math.max(400, dy * 1.5) or math.abs(dw.Y) > 400 then
    local dA = math.max(100, dy)
    local dB =
    if dz.Magnitude > dA then
        dz.Unit * dA
        else
        dz dv.AssemblyLinearVelocity = Vector3.new(dB.X, math.clamp(dw.Y, - 100, 100), dB.Z)
    end
end
, ds.connections) cX(bH.CharacterAdded,
function(du) ds:_hideTreadmillDecoy() c0(du)
local dv = du:FindFirstChildOfClass('Humanoid')
if dv then
    pcall(
    function() dv.BreakJointsOnDeath = false dv.RequiresNeck = false dv:SetStateEnabled(Enum.HumanoidStateType.Dead, false) dv:SetStateEnabled(Enum.HumanoidStateType.FallingDown,
    false) dv:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end
)
end
c2(ds, du) task.delay(0.25,
function()
if not ds.destroyed and ds.enabled then
    ds:_startMovementProtection()
end
end
) task.delay(1,
function()
if not ds.destroyed and(ds.enabled and ds:_wallOpen()) then
    ds:_schedule()
end
end
)
end
, ds.connections) ds:_installClaimPresentationFilter() cX(bI.CarryChanged,
function(du)
if du.IsCarrying then
    if ds.running and(ds.activeTarget and du.Uid == ds.activeTarget.Uid) then
        if ds.carry.active and ds.carry.uid == du.Uid then
            return
        end
        if ds.instantPhase == 'priming' and du.Uid == ds.primerUid then
            ds.carry.active = true ds.carry.uid = du.Uid ds:_clearArrivalHold(du.Uid) ds:_enterBaitWait()
            return
        end
        ds.carry.generation += 1 ds:_invalidateCarryWorker() ds:_clearArrivalHold(du.Uid) ds.claimPresentationSuppression ={assetCategory = ds.activeTarget.AssetCategory,
        expiresAt = os.clock() + 8} ds.carry.active = true ds.carry.uid = du.Uid ds.carryStartTime = os.clock() ds.carryStartPos = ds.activeTarget and ds.activeTarget.BottomCFrame and ds.activeTarget.BottomCFrame.Position or bH.Character and bH.Character:FindFirstChild('HumanoidRootPart') and bH.Character.HumanoidRootPart.Position
        if ds.tweenRecoveryUid == du.Uid then
            ds.tweenRecoveryUid = nil
        end
        if ds.carryTimeouts then
            ds.carryTimeouts[du.Uid] = nil
        end
        ds.stats.lastResult = 'Carry confirmed' ds:_notify() ds.carryAttemptToken = nil
        if ds.activeTween and ds.activeTween.Cancel then
            pcall(ds.activeTween.Cancel, ds.activeTween)
        end
        task.defer(
        function()
        if not ds.destroyed and(ds.enabled and(ds.carry.uid == du.Uid and ds:_hasConfirmedCarry(du.Uid))) then
            if l.__SenaV4GodMode then
                l.__SenaV4GodMode:stopDefend()
            end
            ds:_returnToSafe()
        end
    end
    )
end
return
end
if ds.carry.uid ~= nil and(du.Uid ~= nil and du.Uid ~= ds.carry.uid) then
    return
end
local dv = du.Uid or ds.carry.uid or ds.activeTarget and ds.activeTarget.Uid
local dw = ds.carry.active ds.carry.generation += 1
local dx = ds.carry.generation ds:_invalidateCarryWorker()
if ds.activeTween and ds.activeTween.Cancel then
    pcall(ds.activeTween.Cancel, ds.activeTween)
end
ds.carry.active = false ds.carry.uid = nil
if l.__SenaV4GodMode then
    l.__SenaV4GodMode:startDefend(dv)
end
if ds._captureHoldUid ~= nil and dv == ds._captureHoldUid then
    return
    elseif
    ds._adminBusyUid ~= nil then
        if dv == ds._adminBusyUid then
            return
        end
    end
    if ds.instantPhase == 'priming' then
        if du.Uid == ds.primerUid then
            ds:_startPrimerTargetHunt()
            return
            elseif
            dv == ds.primerUid then
                ds:_startPrimerTargetHunt()
                return
            end
        end
        if ds._forestDropInProgress ~= nil and dv == ds._forestDropInProgress then
            return
        end
        if not dw then
            return
        end
        if ds.running then
            if not ds.activeTarget then
                return
            end
            else
            return
        end
        local dy = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
        if dy and ds:_isInSafeArea(dy) then
            ds:_reportStolen() ds:_finish('Safe return complete')
            return
        end
        task.delay(cH,
        function()
        if ds.destroyed then
            return
            elseif
            ds.enabled then
                if ds.carry.active then
                    return
                    elseif
                    ds.carry.generation ~= dx then
                        return
                    end
                    else
                    return
                end
                local dz = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
                if dz and ds:_isInSafeArea(dz) then
                    ds:_reportStolen() ds:_finish('Safe return complete')
                    return
                end
                ds:_reStealDroppedEgg(dv)
            end
            )
        end
        , ds.connections) cX(bH:GetAttributeChangedSignal('RagdollEndTime'),
        function()
        local du = bH:GetAttribute('RagdollEndTime') or 0
        if ds.instantPhase == 'priming' and du > workspace:GetServerTimeNow() then
            ds:_startPrimerTargetHunt()
        end
    end
    , ds.connections) cX(bG.Heartbeat,
    function()
    if ds.destroyed then
        return
    end
    local du = os.clock()
    if du -(ds._espLastTick or 0) < 0.4 then
        return
    end
    ds._espLastTick = du
    local dv, dw = pcall(
    function() ds:_updateEsp()
end
)
if not dv and du -(ds._espErrLast or 0) > 5 then
    ds._espErrLast = du warn('[SAE][esp] update error: '..tostring(dw))
end
end
, ds.connections)
local du = ds.stats.status ds.stats.status = du
return ds
end
cU._installClaimPresentationFilter =
function(dl)
return false
end
cU._restoreClaimPresentationFilter =
function(dl)
local dq = dl.claimPresentationNode
local dr = dl.claimPresentationOriginal
if type(dq) == 'table' and(type(dr) == 'function' and rawget(dq, '_fn') == dl.claimPresentationWrapper) then
    dq._fn = dr
end
dl.claimPresentationNode = nil dl.claimPresentationOriginal = nil dl.claimPresentationWrapper = nil dl.claimPresentationSuppression = nil
end
cU._setStatus =
function(dl, dq)
if dl.stats.status == dq then
    return
end
if type(dq) == 'string' and string.find(dq, 'not currently trusted', 1, true) then
    dl._untrustedSeen = true
end
dl.stats.status = dq dl:_notify()
end
cU._notify =
function(dl)
local dq = dl:getSnapshot()
for dr in pairs(dl.listeners) do
    local ds, dt = pcall(dr, dq)
    if not ds then
        warn('[StealAnEgg] UI listener failed:', dt)
    end
end
end
cU.onChanged =
function(dl, dq) dl.listeners[dq] = true
local dr, ds = pcall(dq, dl:getSnapshot())
if not dr then
    warn('[StealAnEgg] UI listener failed:', ds)
end
return
function() dl.listeners[dq] = nil
end
end
cU.getSnapshot =
function(dl)
return{status = dl.stats.status, available = dl.stats.available, matching = dl.stats.matching, lastTarget = dl.stats.lastTarget, lastResult = dl.stats.lastResult,
wallClosed = dl.resetBlocked or bR.IsSealed() or os.clock() < dl.gateOpenAt, enabled = dl.enabled, running = dl.running}
end
cU._replaceSnapshot =
function(dl, dq) table.clear(dl.records)
for dr, ds in pairs(dq and(dq.Records or dq) or{}) do
    if type(ds) == 'table' and type(ds.Uid) == 'string' then
        dl.records[ds.Uid] = ds
        elseif
        type(dr) == 'string' then
            if type(ds) == 'table' then
                dl.records[dr] = ds
            end
        end
    end
    dl:_refreshCounts() dl:_schedule()
end
cU._indexWants =
function(dl)
local dq = os.clock()
local dr = dl.indexCache
if dr and dq -(dr.at or 0) < 2 then
    return dr.set
end
local ds ={} pcall(
function()
local dt = dl.areasDirectory
if dt then
    else
    dt = require(bF.Data.Areas).Directory dl.areasDirectory = dt
end
local du =(bW.Peek or bW.Get)()
if dt then
    if not du then
        return
    end
    else
    return
end
local dv = du.Index or{}
local dw ={}
for dx, dy in pairs(du.EggInventory or{}) do
    local dz = type(dy) == 'table' and(dy.AssetCategory or dy.Category)
    if dz then
        dw[tostring(dz)] = true
    end
end
du = dl.carry and dl.carry.uid
if du then
    local dz = dl.records[du]
    if dz and dz.AssetCategory then
        dw[tostring(dz.AssetCategory)] = true
    end
end
for dz, dA in pairs(dt) do
    if type(dA) == 'table' and type(dA.DropTable) == 'table' then
        for dB, dC in ipairs(dA.DropTable) do
            du = dC[1]
            if du then
                local dD = tostring(du)
                if not dv[dD] and not dw[dD] then
                    ds[dD] = true
                end
            end
        end
    end
end
end
) dl.indexCache ={at = dq, set = ds}
return ds
end
cU._isIndexObjective =
function(dl, dq)
if not dl.indexObjectiveEnabled then
    return false
end
if type(dq) ~= 'table' then
    return false
end
local dr = dq.AssetCategory
if dr then
    if dr == '' then
        return false
    end
    else
    return false
end
return dl:_indexWants()[tostring(dr)] == true
end
cU.setIndexObjective =
function(dl, dq)
local dr = dq == true
if dl.indexObjectiveEnabled == dr then
    return
end
dl.indexObjectiveEnabled = dr dl.indexCache ={at = 0, set ={}} dl:_reconcileRunningState()
end
cU._isWispObjective =
function(dl, dq)
local dr = dl.wispObjective
if type(dr) ~= 'table' then
    return false
    elseif
    type(dq) ~= 'table' then
        return false
    end
    if dr.area and dq.AreaId ~= dr.area then
        return false
    end
    if dr.rarity then
        local ds = dl.catalog.resolve(dq)
        if ds then
            if ds.rarity ~= dr.rarity then
                return false
            end
            else
            return false
        end
    end
    return true
end
cU.setWispObjective =
function(dl, dq)
local dr = type(dq) == 'table' and(dq.area or '')..'|'..(dq.rarity or '') or nil
if dl.wispObjectiveKey == dr then
    return
end
dl.wispObjectiveKey = dr dl.wispObjective = dr and dq or nil dl:_reconcileRunningState()
end
cU.indexMissingCount =
function(dl)
local dq = 0
for dr in pairs(dl:_indexWants()) do
    dq += 1
end
return dq
end
cU._matchesNormalFilter =
function(dl, dq)
local dr = dl.catalog.resolve(dq)
local ds = dl.config
if ds.rarityEnabled then
    if # ds.rarities == 0 then
        return false
        elseif
        not cZ(ds.rarities, dr.rarity) then
            return false
        end
    end
    if ds.nameEnabled then
        if # ds.names == 0 then
            return false
            elseif
            not cZ(ds.names, dr.name) then
                if not cZ(ds.names, dr.category) then
                    return false
                end
            end
        end
        if ds.areaEnabled then
            if # ds.areas == 0 then
                return false
                elseif
                not cZ(ds.areas, dq.AreaId) then
                    return false
                end
            end
            if ds.mutationEnabled and not dj(dq, ds.mutations) then
                return false
            end
            dr = ds.minWeightKg
            if dr and dr > 0 then
                local dt = dl:_resolveWeightKg(dq)
                if dt then
                    if dt < ds.minWeightKg then
                        return false
                    end
                    else
                    return false
                end
            end
            local dt = ds.minValuePerSec
            if dt and dt > 0 then
                local du = c_(dq)
                if du then
                    if du < ds.minValuePerSec then
                        return false
                    end
                    else
                    return false
                end
            end
            return true
        end
        cU._matches =
        function(dl, dq)
        if dq.State ~= bP.States.Slot and dq.State ~= bP.States.Dropped then
            return false
        end
        if dl.riftWants[dq.AssetCategory] then
            return true
        end
        if dl.indexObjectiveEnabled and dl:_isIndexObjective(dq) then
            return true
        end
        if dl.wispObjective and dl:_isWispObjective(dq) then
            return true
        end
        if dl.userStealEnabled and(not dl.riftOnly and dl:_matchesNormalFilter(dq)) then
            return true
        end
        return false
    end
    cU.setScrambleWants =
    function(dl, dq, dr)
    local ds ={}
    for dt, du in ipairs(type(dq) == 'table' and dq or{}) do
        if type(du) == 'string' and du ~= '' then
            ds[du] = true
        end
    end
    local dv = dr == true dr = dv ~= dl.riftOnly
    for dw in pairs(ds) do
        dr =
        if dl.riftWants[dw] then
            dr
            else
            true
        end
        for dz in pairs(dl.riftWants) do
            dr =
            if ds[dz] then
                dr
                else
                true
            end
            if not dr then
                return
            end
            dl.riftWants = ds dl.riftOnly = dv dl:_reconcileRunningState()
        end
        cU._refreshCounts =
        function(dl)
        local dq = 0
        local dr = 0
        for ds, dt in pairs(dl.records) do
            if dt.State == bP.States.Slot then
                dq, dr = dq + 1,
                if dl:_matches(dt) then
                    dr + 1
                    else
                    dr
                end
            end
            dl.stats.available = dq dl.stats.matching = dr dl:_notify()
        end
        cU.hasPriorityRareEgg =
        function(dl)
        local dq, dr, ds, dt = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
        for du, dv in pairs(dl.records or{}) do
            if(dv.State == bP.States.Slot or dv.State == bP.States.Dropped) and dv.BottomCFrame then
                if dl:isSkippedEgg(dv.Uid) then
                    else
                    if dl:_matchesNormalFilter(dv) then
                        local dz = dl.catalog.resolve(dv)
                        if ca[dz.rarity] then
                            local dA = dq and(dv.BottomCFrame.Position - dq.Position).Magnitude or 0
                            local dB = dz.rarityRank or 0
                            if dr then
                                if dB > ds then
                                    dr = dv ds = dB dt = dA
                                    else
                                    if dB == ds and dA < dt then
                                        dr = dv ds = dB dt = dA
                                    end
                                end
                                else
                                dr = dv ds = dB dt = dA
                            end
                        end
                    end
                end
            end
        end
        return dr ~= nil, dr
    end
    local dl = 'Event_CaptureTheEggUid'
    local dq = 110 cU.isSkippedEgg =
    function(dr, ds)
    if ds ~= nil and(ds == workspace:GetAttribute(dl) and not dr.captureObjectiveEnabled) then
        return true
    end
    local dt = ds and dr.skippedEggs[ds]
    if not dt then
        return false
    end
    if os.clock() < dt then
        return true
    end
    dr.skippedEggs[ds] = nil
    return false
end
cU._isCaptureEgg =
function(dr, ds)
return ds ~= nil and ds == workspace:GetAttribute(dl)
end
cU.setCaptureObjective =
function(dr, ds)
local dt = ds == true
if dr.captureObjectiveEnabled == dt then
    return
end
if dt then
    dr._modeBeforeCapture ={dr.config.stealMode, dr.config.flyAerial, dr.config.flyZigzag} dr:setStealMode('Instant', false, false) dr.captureObjectiveEnabled = true
    else
    dr.captureObjectiveEnabled = false
    local du = dr._modeBeforeCapture dr._modeBeforeCapture = nil
    if du then
        dr:setStealMode(du[1], du[2], du[3])
    end
end
dr:_reconcileRunningState()
end
cU._captureHold =
function(dr, ds)
if dr._captureHoldUid == ds then
    return
end
dr._captureHoldUid = ds
local function dt()
local du = bI.ReadFieldEgg(ds)
return du ~= nil and du.State == bP.States.Carried and du.CarrierUserId == bH.UserId
end
local function du()
local dv = dr.destroyed
return(
if dv then
    not dv
    else
    dr.enabled) and dr.captureObjectiveEnabled and dt()
end
task.spawn(
function() dr:_clearArrivalHold(ds) dr:_hideTreadmillDecoy() pcall(
function() dr:_stopHoverPad()
end
) dr.stats.lastResult = 'Holding capture egg' dr:_setStatus('Holding capture egg')
local dv = bH.Character
local dz = dv and dv:FindFirstChild('HumanoidRootPart')
local dA = dz and CFrame.new(dz.Position.X, dq, dz.Position.Z) * dz.CFrame.Rotation
if dA then
    dr:_glideRoot(dA,
    function()
    return not du()
end
)
end
while du() do
    local dB = bH.Character
    local dC = dB and dB:FindFirstChild('HumanoidRootPart')
    local dD = dB and dB:FindFirstChildOfClass('Humanoid')
    if dC and dD and dA then
        pcall(
        function() dC.CFrame = dA dC.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dC.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    ) dr:_syncHoverPad(dA.Position)
    local dE = math.clamp(dr.config.speed or b4, b2, b6()) pcall(
    function() c7(dB, dE * cL) dh(dD, dC, dE,(Vector3.new(0, 0, 0)))
end
)
end
task.wait(0.1)
end
pcall(
function() dr:_stopHoverPad()
end
)
if dr._captureHoldUid == ds then
    dr._captureHoldUid = nil
end
if dr.destroyed then
    return
    elseif
    not dr.enabled then
        return
    end
    dr:_finish(dr.captureObjectiveEnabled and 'Capture egg lost \226\128\148 re-grabbing' or 'Capture stopped')
end
)
end
cU._chooseTarget =
function(dr)
local ds = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
if not ds then
    return nil
end
if dr.captureObjectiveEnabled then
    local dt = workspace:GetAttribute(dl)
    local du = dt and(bI.ReadFieldEgg(dt) or dr.records[dt])
    if type(du) == 'table' and du.BottomCFrame then
        if du.State == bP.States.Slot then
            return du
            elseif
            du.State == bP.States.Dropped then
                return du
            end
        end
    end
    if dr.manualObjectiveEnabled then
        local dt = dr:_takeManualTarget()
        if dt then
            return dt
        end
    end
    if dr.userStealEnabled and not dr.riftOnly then
        local dt, du = dr:hasPriorityRareEgg()
        if dt and du then
            return du
        end
    end
    local dt, du, dv, dz, dA, dB
    for dC, dD in pairs(dr.records) do
        if(dD.State == bP.States.Slot or dD.State == bP.States.Dropped) and dD.BottomCFrame then
            if dr:isSkippedEgg(dD.Uid) then
                else
                local dE =(dD.BottomCFrame.Position - ds.Position).Magnitude
                if dr.riftWants[dD.AssetCategory] then
                    if dt then
                        if dE < du then
                            dt = dD du = dE
                        end
                        else
                        dt = dD du = dE
                    end
                    else
                    if dr.wispObjective and dr:_isWispObjective(dD) then
                        if dv then
                            if dE < dz then
                                dv = dD dz = dE
                            end
                            else
                            dv = dD dz = dE
                        end
                        else
                        if dr.indexObjectiveEnabled and dr:_isIndexObjective(dD) then
                            if dA then
                                if dE < dB then
                                    dA = dD dB = dE
                                end
                                else
                                dA = dD dB = dE
                            end
                        end
                    end
                end
            end
        end
    end
    if dt or dv or dA then
        return dt or dv or dA
    end
    if dr.userStealEnabled and not dr.riftOnly then
        local dE, dF, dG
        for dH, dI in pairs(dr.records) do
            if dI.State == bP.States.Slot or dI.State == bP.States.Dropped then
                local dJ = dr:isSkippedEgg(dI.Uid)
                if
                if dJ then
                    not dJ
                    else
                    dr:_matchesNormalFilter(dI) then
                        local dK =(dI.BottomCFrame.Position - ds.Position).Magnitude
                        local dL = dr.catalog.resolve(dI)
                        local dM =
                        if dr.config.highestValueFirst then
                            c_(dI) or - 1 / 0
                            else
                            if dr.config.heaviestFirst then
                                dr:_resolveWeightKg(dI) or - 1 / 0
                                else
                                dL.rarityRank or 0
                                if dE then
                                    if dM > dF then
                                        dE = dI dF = dM dG = dK
                                        else
                                        if dM == dF and dK < dG then
                                        dE = dI dF = dM dG = dK
                                    end
                                end
                                else
                                dE = dI dF = dM dG = dK
                            end
                        end
                    end
                end
                if dE then
                    return dE
                end
            end
            return nil
        end
        cU._takeManualTarget =
        function(dr)
        local ds ={}
        local dt ={}
        for du, dv in ipairs(dr.manualOrder) do
            local dz = dr.records[dv]
            if dz then
                if dz.State == bP.States.Slot then
                    dt[# dt + 1] = dv ds[dv] = true
                    elseif
                    dz.State == bP.States.Dropped then
                        dt[# dt + 1] = dv ds[dv] = true
                    end
                end
            end
            dr.manualOrder = dt
            for dz in pairs(dr.manualQueue) do
                if not ds[dz] then
                    dr.manualQueue[dz] = nil
                end
            end
            if # dt == 0 then
                if dr.manualObjectiveEnabled then
                    dr.manualObjectiveEnabled = false task.defer(
                    function()
                    if not dr.destroyed then
                        dr:_reconcileRunningState()
                    end
                end
                )
            end
            return nil
        end
        return dr.records[dt[1]]
    end
    cU.queueManual =
    function(dr, ds)
    if type(ds) ~= 'table' then
        return 0
    end
    for dt, du in ipairs(ds) do
        if du ~= nil and not dr.manualQueue[du] then
            dr.manualQueue[du] = true dr.manualOrder[# dr.manualOrder + 1] = du
        end
    end
    local dv = # dr.manualOrder
    if dv > 0 then
        dr.manualObjectiveEnabled = true
    end
    dr:_reconcileRunningState()
    return dv
end
cU.clearManual =
function(dr) dr.manualQueue ={} dr.manualOrder ={} dr.manualObjectiveEnabled = false dr:_reconcileRunningState()
end
cU.manualPending =
function(dr)
return # dr.manualOrder
end
cU.setTreadmillManager =
function(dr, ds) dr.treadmillManager = ds
end
cU.getStealMode =
function(dr)
return dr.config.stealMode == 'Fly' and 'Fly' or 'Instant'
end
cU.setStealMode =
function(dr, ds, dt, du)
local dv = ds == 'Fly' and 'Fly' or 'Instant'
local dz = dv == 'Fly' and dt == true
local dA = dv == 'Fly' and du == true and not dz
if dr.config.stealMode ~= dv or dr.config.flyAerial ~= dz or dr.config.flyZigzag ~= dA then
    dr.config.stealMode = dv dr.config.flyAerial = dz dr.config.flyZigzag = dA
    if dr.enabled then
        dr:_installGuardHitDistanceBoost() dr:_finish('Mode changed')
    end
end
return dv
end
local dr
local ds = 25 cU._installGuardHitDistanceBoost =
function(dt)
if dt.guardHitBoostInstalled then
    return
end
local function du()
local dv = require(bF.Shared.Modules.GuardAreas.GuardChasePolicy)
if dv and type(dv.ResolveHitDistance) == 'function' then
    dr = dr or dv.ResolveHitDistance
    local dz = dt dv.ResolveHitDistance =
    function(dA)
    if dz.enabled and dz.instantPhase == 'priming' then
        return ds
    end
    if dz.enabled then
        return - 1 / 0
        elseif
        dz._recalling then
            return - 1 / 0
        end
        return dr and dr(dA) or(dA or 10)
    end
    dt.guardHitBoostInstalled = true
end
end
pcall(du)
end
cU._removeGuardHitDistanceBoost =
function(dt)
if not dt.guardHitBoostInstalled then
    return
end
pcall(
function()
local du = require(bF.Shared.Modules.GuardAreas.GuardChasePolicy)
if du and dr then
    du.ResolveHitDistance = dr dt.guardHitBoostInstalled = false
end
end
)
end
cU._setInstantAnchored =
function(dt, du) pcall(
function()
local dv = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
if dv and dv.Anchored ~= du then
    dv.Anchored = du
end
end
)
end
cU._kbCancelTimer =
function(dt)
if dt.hitTimer then
    pcall(task.cancel, dt.hitTimer) dt.hitTimer = nil
end
end
cU._isPrimerEgg =
function(dt, du)
if du == nil then
    return false
end
if du == dt.primerUid then
    return true
end
local dv = dt.primerUids and dt.primerUids[du]
if dv and dv > os.clock() then
    return true
end
if dv then
    dt.primerUids[du] = nil
end
return false
end
cU._cleanupInstantSteal =
function(dt) dt.instantPhase = nil dt.primerUid = nil dt.targetUid = nil dt._flyDeparting = false dt:_stopGuardStick() dt:_kbCancelTimer() dt:_setInstantAnchored(false) dt:_hideTreadmillDecoy()
end
cU._choosePrimerEgg =
function(dt, du)
local dv = k()
local dz = dv and dv:FindFirstChild('Areas')
local dA = dz and dz:FindFirstChild('GuardAreas')
local dB = dA and dA:FindFirstChild('Forest') dv = dB and dB:FindFirstChild('Guard') dz = dv and dv:FindFirstChild('HumanoidRootPart')
local dC, dD, dE = dz and dz.Position
for dF, dG in pairs(dt.records) do
    if dG.State == bP.States.Slot and(dG.AreaId == 'Forest' and dG.Uid ~= du) then
        if dt:_isCaptureEgg(dG.Uid) then
            else
            local dH = dC and(dG.BottomCFrame.Position - dC).Magnitude or(bH.Character and bH.Character:FindFirstChild('HumanoidRootPart') and(dG.BottomCFrame.Position - bH.Character.HumanoidRootPart.Position).Magnitude or 1 / 0)
            local dI = dt.catalog.resolve(dG).rarityRank or 0
            local dJ = - dH - dI * 100
            if dD then
                if dJ > dE then
                    dD = dG dE = dJ
                end
                else
                dD = dG dE = dJ
            end
        end
    end
end
return dD
end
local dt = 2.5
local du = 0.05
local dv = 1.5
local dz = 18
local dA = 0.35 cU._stopGuardStick =
function(dB)
if dB.guardStickConnection then
    pcall(dB.guardStickConnection.Disconnect, dB.guardStickConnection) dB.guardStickConnection = nil
end
end
cU._startGuardStick =
function(dB) dB:_stopGuardStick()
local function dC()
local dD = k()
local dE = dD and dD:FindFirstChild('Areas')
local dF = dE and dE:FindFirstChild('GuardAreas')
local dG = dF and dF:FindFirstChild('Forest')
local dH = dG and dG:FindFirstChild('Guard')
return dH and dH:FindFirstChild('HumanoidRootPart')
end
dB.guardStickConnection = bG.PreSimulation:Connect(
function()
if dB.destroyed then
    dB:_stopGuardStick()
    return
    elseif
    dB.enabled then
        if dB.instantPhase ~= 'priming' then
            dB:_stopGuardStick()
            return
        end
        else
        dB:_stopGuardStick()
        return
    end
    local dD = dC()
    local dE = bH.Character
    local dF = dE and dE:FindFirstChild('HumanoidRootPart')
    if dD then
        if not dF then
            return
        end
        else
        return
    end
    local dG = dD.Position
    local dH = dD.CFrame.LookVector * dt dD = Vector3.new(dG.X + dH.X, dF.Position.Y, dG.Z + dH.Z) - dF.Position
    local dI =
    if dD.Magnitude > 40 then
        dD.Unit * 40
        else
        dD
        local dJ = dF.Position + dI dF.CFrame = CFrame.lookAt(dJ, Vector3.new(dG.X, dJ.Y, dG.Z)) dF.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dF.AssemblyAngularVelocity = Vector3.new(0,
        0, 0) dB:_syncHoverPad(dJ)
    end
    )
end
cU._forestGuardModel =
function(dB)
local dC = k()
local dD = dC and dC:FindFirstChild('Areas')
local dE = dD and dD:FindFirstChild('GuardAreas')
local dF = dE and dE:FindFirstChild('Forest')
return dF and dF:FindFirstChild('Guard')
end
cU._triggerGuardHit =
function(dB)
local dC = dB:_forestGuardModel()
local dD = dC and dC:FindFirstChild('HumanoidRootPart')
if not dD then
    return
end
local dE = bH.Character
local dF = dE and dE:FindFirstChild('HumanoidRootPart')
if not dF then
    return
end
local dG = dD.Position
local dH = dD.CFrame.LookVector * dt
local dI = Vector3.new(dG.X + dH.X, dF.Position.Y, dG.Z + dH.Z) dB.guardStrikeAnchor = dI dF.CFrame = CFrame.lookAt(dI, Vector3.new(dG.X, dI.Y, dG.Z)) dF.AssemblyLinearVelocity = Vector3.new(0,
0, 0)
local dJ = dC:FindFirstChild('Collider') or dD
if dJ and firetouchinterest then
    pcall(
    function() firetouchinterest(dF, dJ, 0) firetouchinterest(dF, dJ, 1)
end
)
end
pcall(
function()
local dK = bN.GuardPatrol and bN.GuardPatrol.ForestStrike
if dK then
    dK:FireServer({EggUid = dB.primerUid, GuardCFrame = dD.CFrame})
end
end
)
end
cU._stopGuardStrike =
function(dB) dB.guardStrikeGeneration =(dB.guardStrikeGeneration or 0) + 1
end
cU._knockbackLanded =
function(dB)
local dC = bH.Character
local dD = dC and dC:FindFirstChild('HumanoidRootPart')
local dE = dC and dC:FindFirstChildOfClass('Humanoid')
if dD then
    if not dE then
        return false
    end
    else
    return false
end
if dE.PlatformStand then
    return true
    elseif
    dE.Sit then
        return true
    end
    local dF = dE:GetState()
    if dF == Enum.HumanoidStateType.Ragdoll then
        return true
        elseif
        dF == Enum.HumanoidStateType.FallingDown then
            return true
            elseif
            dF == Enum.HumanoidStateType.PlatformStanding then
                return true
            end
            return dD.AssemblyLinearVelocity.Magnitude > dz
        end
        cU._settleAfterKnockback =
        function(dB)
        local dC = dB.guardStrikeAnchor
        local dD = os.clock() + dA
        while os.clock() < dD and not dB.destroyed do
            local dE = bH.Character
            local dF = dE and dE:FindFirstChild('HumanoidRootPart')
            if not dF then
                return
            end
            local dG = dE:FindFirstChildOfClass('Humanoid')
            if dG then
                pcall(
                function() dG.PlatformStand = false dG.Sit = false dG:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            )
        end
        if dC then
            dF.CFrame = CFrame.new(dC)
        end
        dF.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dF.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dB:_syncHoverPad(dC or dF.Position) bG.Heartbeat:Wait()
    end
end
cU._startGuardStrike =
function(dB) dB:_stopGuardStrike()
local dC = dB.guardStrikeGeneration task.spawn(
function()
local dD = os.clock() + dv
while true do
    local dE = dB.destroyed
    if not((
    if dE then
        not dE
        else
        dB.enabled) and dB.instantPhase == 'priming' and dB.guardStrikeGeneration == dC and os.clock() < dD) then
            break
        end
        dB:_triggerGuardHit()
        local dF = os.clock() + du
        local dG = false
        while os.clock() < dF do
            if dB:_knockbackLanded() then
                dG = true
                break
            end
            bG.Heartbeat:Wait()
        end
        if dG then
            break
        end
    end
    if dB.guardStrikeGeneration == dC then
        dB:_stopGuardStick() dB:_settleAfterKnockback()
    end
end
)
end
cU._enterBaitWait =
function(dB) dB:_setInstantAnchored(false) dB:_setStatus('Preparing steal') dB:_startGuardStick() dB:_startGuardStrike()
if dB.hitTimer then
    return
end
dB.hitTimer = task.delay(dv + 0.3,
function() dB.hitTimer = nil
if dB.destroyed then
    return
    elseif
    not dB.enabled then
        return
    end
    if dB.instantPhase ~= 'priming' then
        return
    end
    dB:_stopGuardStick() dB:_stopGuardStrike()
    if dB.carry.active and dB:_isPrimerEgg(dB.carry.uid) then
        pcall(bI.DropFieldEgg, 'PlayerRequest')
    end
    dB:_finish('Steal timed out \226\128\148 retrying')
end
)
end
local function dB(dC, dD)
local dE = tostring(dC or ''):lower()
local dF = 8
local dG = 3.5
if dE:find('enchanted') then
    dF = 18 dG = 12
    else
    if dE:find('light') then
        local dH = 16
        local dI = 10 dF = dH dG = dI
        else
        if dE:find('dark') then
            local dH = 16
            local dI = 10 dF = dH dG = dI
            else
            if dE:find('titan') then
                local dH = 10
                local dI = 8 dF = dH dG = dI
                else
                if dE:find('cosmic') then
                    local dH = 10
                    local dI = 8 dF = dH dG = dI
                    else
                    if dE:find('cherry') then
                        local dH = 10
                        local dI = 8 dF = dH dG = dI
                    end
                end
            end
        end
    end
end
return math.max(dG, dF *((11 - math.clamp(dD, 1, 10)) / 6))
end
cU._resolveSettleSeconds =
function(dC, dD)
local dE = math.clamp(tonumber(aB.StealHoldSeconds) or 5, 1, 10)
local dF = dC.settleBonus and type(dD) == 'table' and dC.settleBonus[dD.Uid]
local dG = dF and dF.untilAt > os.clock() and dF.seconds or 0
local dH = I() dG =
if dH > 0 then
    if dH < 12 then
        dG + 2
        else
        dG
        else
        dG
        local dI =
        if l.__SenaV4NetPing() > 300 then
            dG + 1
            else
            dG
            return dB(type(dD) == 'table' and dD.AreaId, dE) + dI
        end
        cU._startPrimerTargetHunt =
        function(dC)
        if dC.instantPhase ~= 'priming' then
            return
        end
        dC:_stopGuardStick() dC:_stopGuardStrike() pcall(
        function()
        local dD = bH.Character
        local dE = dD and dD:FindFirstChild('HumanoidRootPart')
        local dF = dD and dD:FindFirstChildOfClass('Humanoid')
        if dF then
            dF.PlatformStand = false dF.Sit = false
        end
        if dE then
            if dC.guardStrikeAnchor then
                dE.CFrame = CFrame.new(dC.guardStrikeAnchor)
            end
            dE.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dE.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end
    ) dC:_kbCancelTimer() dC:_setInstantAnchored(false) dC.instantPhase = 'hunting' dC:_clearArrivalHold() dC.carry.generation += 1 dC:_invalidateCarryWorker() dC.carry.active = false dC.carry.uid = nil
    local dD = dC.targetUid dC.targetUid = nil
    if not dD then
        dC:_finish('No target egg')
        return
    end
    local dE = bI.ReadFieldEgg(dD) or dC.records[dD]
    if not dE or dE.State ~= bP.States.Slot and dE.State ~= bP.States.Dropped then
        dC:_finish('Target egg no longer available')
        return
    end
    local dF = bH.Character
    local dG = dF and dF:FindFirstChild('HumanoidRootPart')
    local dH = dF and dF:FindFirstChildOfClass('Humanoid')
    if dG then
        if not dH then
            dC:_finish('Character unavailable')
            return
        end
        else
        dC:_finish('Character unavailable')
        return
    end
    dC.activeTarget = dE
    local dI = dC:_resolveEggDestination(dE, dG, dH)
    if not dI then
        dC:_finish('Target destination unavailable')
        return
    end
    if dC.config.stealMode == 'Fly' then
        local dJ = dE.Uid
        local function dK()
        return dC.destroyed or not dC.enabled or dC.instantPhase ~= 'hunting' or not dC.activeTarget or dC.activeTarget.Uid ~= dJ
    end
    if dC.config.flyAerial then
        dC:_setStatus('Heading to target egg') dC:_startFlyGrounding()
        local dL = dC:_flyWalkTo(dI, dK, 8, 110) dC:_stopFlyGrounding()
        if not dL then
            if not dK() then
                dC:_finish('Could not reach the egg \226\128\148 retrying')
            end
            return
        end
        elseif
        dC.config.flyZigzag then
            dC:_setStatus('Heading to target egg')
            if not dC:_walkToZigzag(dI, dK) then
                if not dK() then
                    dC:_finish('Zig-zag walk to target failed')
                end
                return
            end
            else
            dC:_setStatus('Heading to target egg')
            if not dC:_walkTo(dI, dK) then
                if not dK() then
                    dC:_finish('Walk to target failed')
                end
                return
            end
        end
        if dK() then
            return
        end
        dC:_glideRoot(dI, dK, dC:_legitWalkSpeed())
        if dK() then
            return
        end
        dC:_setArrivalHold(dI, dJ) dC:_setStatus('Securing target egg') dC:_requestCarry(dE, true)
        return
    end
    if dC.config.stealMode == 'Instant' then
        local dJ = dE.Uid
        local function dK()
        return dC.destroyed or not dC.enabled or dC.instantPhase ~= 'hunting' or not dC.activeTarget or dC.activeTarget.Uid ~= dJ
    end
    local dL = dI + Vector3.new(0, cq, 0) dC:_setStatus('Heading to target egg')
    if not dC:_glideRoot(dL, dK) then
        if not dK() then
            dC:_finish('Could not reach the egg \226\128\148 retrying')
        end
        return
    end
    task.spawn(dC._hoverSettleCarry, dC, dE, dI, dL, dK)
    return
end
dC:_setStatus('Heading to target egg') dC:_tweenRoot(dI,
function()
if dC.instantPhase == 'hunting' and(dC.activeTarget and dC.activeTarget.Uid == dE.Uid) then
    dC:_requestCarry(dE, false)
end
end
, nil,{holdAfterArrival = true, holdUid = dE.Uid, flightProfile = true, carryTarget = dE})
end
cU._hoverSettleCarry =
function(dC, dD, dE, dF, dG) dC:_startHoverPad()
local dH = dC:_resolveSettleSeconds(dD)
local dI = os.clock() + dH
while os.clock() < dI do
    if dG() then
        return
    end
    dC:_setStatus(string.format('Securing target egg (%.1fs)', math.max(0, dI - os.clock())))
    local dJ = bH.Character
    local dK = dJ and dJ:FindFirstChild('HumanoidRootPart')
    local dL = dJ and dJ:FindFirstChildOfClass('Humanoid')
    if dK and dL then
        pcall(
        function() dK.CFrame = dF dK.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dK.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    ) dC:_syncHoverPad(dF.Position)
    local dM = math.clamp(dC.config.speed or b4, b2, b6()) pcall(
    function() c7(dJ, dM * cL) dh(dL, dK, dM,(Vector3.new(0, 0, 0)))
end
)
end
task.wait(0.1)
end
if dG() then
    return
end
dC:_glideRoot(dE, dG)
if dG() then
    return
end
dC:_setArrivalHold(dE, dD.Uid) dC:_setStatus('Securing target egg') dC:_requestCarry(dD, true)
end
cU._wallOpen =
function(dC)
if dC.resetBlocked then
    return false
    elseif
    bR.IsSealed() then
        return false
        elseif
        os.clock() < dC.gateOpenAt then
            return false
        end
        local dD = k()
        local dE = dD and dD:FindFirstChild('Areas')
        local dF = dE and dE:FindFirstChild('WallStartCollision')
        if dF and(dF:IsA('BasePart') and dF.CanCollide) then
            return false
        end
        return true
    end
    cU._closeGate =
    function(dC, dD) dC.resetBlocked = true dC.gateOpenAt = 1 / 0 dC.safeStarting = false
    if dC.activeTween then
        if not dC.activeTween.sharedTravel then
            dC:_cancelTween(dD)
        end
        else
        dC:_cancelTween(dD)
    end
    dC:_setStatus(dD)
end
cU._releaseOperation =
function(dC)
local dD = dC.operationToken dC.operationToken = nil
if dD and dC.coordinator then
    dC.coordinator:release(dD)
end
end
cU._acquireOperation =
function(dC)
if dC.operationToken then
    return true
    elseif
    not dC.coordinator then
        return true
    end
    local dD, dE = dC.coordinator:tryAcquire('auto_steal',{})
    if not dD then
        return false, dE
    end
    dC.operationToken = dD
    return true
end
cU._cancelTween =
function(dC, dD, dE) dC:_cleanupInstantSteal() dC.carryAttemptToken = nil dC:_clearArrivalHold() dC.safeStarting = false
if dC.activeTween then
    pcall(dC.activeTween.Cancel, dC.activeTween) dC.activeTween = nil
end
if not dC.activeTween and not dC.arrivalHold then
    dC:_stopHoverPad()
end
if dC.running then
    dC.running = false dC.activeTarget = nil dC.stats.lastResult = dD dC:_notify()
end
if not dE then
    dC:_releaseOperation()
end
end
cU._groundYAt =
function(dC, dD, dE, dF)
local dG = dF or bH.Character
local dH = Vector3.new(dD,(dG and dG:FindFirstChild('HumanoidRootPart') and dG.HumanoidRootPart.Position.Y or ci.Y) + 60, dE)
local dI ={}
if dG then
    table.insert(dI, dG)
end
if dC.hoverPad then
    table.insert(dI, dC.hoverPad)
end
if dC.treadmillDecoy then
    table.insert(dI, dC.treadmillDecoy)
end
for dJ, dK in ipairs(workspace:GetChildren()) do
    if dK.Name == cg then
        table.insert(dI, dK)
        elseif
        dK.Name == cA then
            table.insert(dI, dK)
        end
    end
    for dL = 1, 10, 1 do
        local dM = RaycastParams.new() dM.FilterType = Enum.RaycastFilterType.Exclude dM.FilterDescendantsInstances = dI dM.IgnoreWater = true
        local dN = workspace:Raycast(dH, Vector3.new(0, - 300, 0), dM)
        if not dN then
            return nil
        end
        if dN.Instance.CanCollide then
            return dN.Position.Y
        end
        table.insert(dI, dN.Instance)
    end
    return nil
end
cU._resolveSafeCFrame =
function(dC, dD)
if not dD then
    return nil
end
local dE = ci.X
local dF = ci.Z
local dG = ci.Y
local dH = dC:_groundYAt(dE, dF, dD.Parent)
local dI =
if dH then
    dH + 3.2
    else
    dG
    return CFrame.new(dE, dI, dF) * dD.CFrame.Rotation
end
cU._groundSnap =
function(dC)
local dD = bH.Character
local dE = dD and dD:FindFirstChild('HumanoidRootPart')
local dF = dD and dD:FindFirstChildOfClass('Humanoid')
if not dE or not dF then
    return false
end
local dG = dE.Position
local dH = dC:_groundYAt(dG.X, dG.Z, dD)
if not dH then
    return false
end
local dI = dH + dC:_feetOffset(dE, dF)
if dG.Y < dI - 0.25 or dG.Y > dI + 8 then
    pcall(
    function() dC:_syncHoverPad(Vector3.new(dG.X, dI, dG.Z)) dE.CFrame = CFrame.new(dG.X, dI, dG.Z) * dE.CFrame.Rotation dE.AssemblyLinearVelocity = Vector3.new(0,
    0, 0) dE.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
)
return true
end
return false
end
local function dC(dD)
if typeof(dD) == 'Instance' and dD:IsA('Trail') then
    pcall(dD.Destroy, dD)
end
end
local function dD(dE)
if typeof(dE) == 'Instance' then
    if dE.Name == 'SpeedGainPopup' then
        pcall(dE.Destroy, dE)
        elseif
        dE.Name == 'PlusOne' then
            pcall(dE.Destroy, dE)
        end
    end
end
cU._showTreadmillDecoy =
function(dE)
if dE.treadmillDecoy and dE.treadmillDecoy.Parent then
    return true
end
dE:_hideTreadmillDecoy()
local dF = bH.Character
if not dF then
    return false
end
local dG = dF.Archivable dF.Archivable = true
local dH, dI = pcall(dF.Clone, dF) dF.Archivable = dG
if dH then
    if not dI then
        return false
        elseif
        typeof(dI) ~= 'Instance' then
            return false
        end
        else
        return false
    end
    dI.Name = cA
    for dJ, dK in ipairs(dI:GetDescendants()) do
        if cB[dK.ClassName] then
            pcall(dK.Destroy, dK)
            elseif
            dK:IsA('Trail') then
                pcall(dK.Destroy, dK)
                elseif
                dK:IsA('BasePart') then
                    dK.LocalTransparencyModifier = 0 dK.Anchored = true dK.CanCollide = false dK.CanQuery = false dK.CanTouch = false
                end
            end
            local dL = dI:FindFirstChild('HumanoidRootPart')
            local dM = dI:FindFirstChildOfClass('Humanoid')
            if dL then
                if not dM then
                    dI:Destroy()
                    return false
                end
                else
                dI:Destroy()
                return false
            end
            pcall(
            function() dM.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None dM.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
        end
        ) dI.Parent = workspace dI:PivotTo(CFrame.new(ci)) dE.treadmillDecoy = dI
        local dN = bH:FindFirstChildOfClass('PlayerGui')
        if dN then
            for dO, dP in ipairs(dN:GetDescendants()) do
                if dP.Name == 'SpeedGainPopup' then
                    dD(dP)
                    elseif
                    dP.Name == 'PlusOne' then
                        dD(dP)
                    end
                end
                dE.treadmillPopupConnection = dN.DescendantAdded:Connect(
                function(dQ)
                if dE.treadmillDecoy == dI then
                    dD(dQ)
                end
            end
            )
        end
        local dO = setmetatable({},{__mode = 'k'})
        local function dP(dQ)
        if dQ then
            if dQ:IsA('BasePart') then
                if not dQ:IsDescendantOf(dF) then
                    return
                end
                else
                return
            end
            else
            return
        end
        if dO[dQ] == nil then
            dO[dQ] = dQ.LocalTransparencyModifier
        end
        dQ.LocalTransparencyModifier = 1
    end
    for dQ, dR in ipairs(dF:GetDescendants()) do
        dP(dR) dC(dR)
    end
    dE.treadmillDecoyRealTransparency = dO dE.treadmillDecoyCharacterConnection = dF.DescendantAdded:Connect(
    function(dS)
    if dE.treadmillDecoy == dI then
        pcall(dP, dS) dC(dS)
    end
end
)
local dS = workspace.CurrentCamera
if dS then
    dE.treadmillDecoyCamera = dS.CameraSubject dS.CameraSubject = dM
end
dE.treadmillDecoyCameraConnection = bG.RenderStepped:Connect(
function()
if dE.treadmillDecoy ~= dI then
    return
    elseif
    dI.Parent then
        if not dM.Parent then
            return
        end
        else
        return
    end
    for dT in pairs(dO) do
        if dT.Parent and dT.LocalTransparencyModifier ~= 1 then
            dT.LocalTransparencyModifier = 1
        end
    end
    local dU = workspace.CurrentCamera
    if dU and dU.CameraSubject ~= dM then
        dU.CameraSubject = dM
    end
end
)
return true
end
cU._hideTreadmillDecoy =
function(dE, dF)
if dE._recalling and not dF then
    return
end
if dE.treadmillDecoyCameraConnection then
    pcall(dE.treadmillDecoyCameraConnection.Disconnect, dE.treadmillDecoyCameraConnection) dE.treadmillDecoyCameraConnection = nil
end
if dE.treadmillDecoyCharacterConnection then
    pcall(dE.treadmillDecoyCharacterConnection.Disconnect, dE.treadmillDecoyCharacterConnection) dE.treadmillDecoyCharacterConnection = nil
end
if dE.treadmillPopupConnection then
    pcall(dE.treadmillPopupConnection.Disconnect, dE.treadmillPopupConnection) dE.treadmillPopupConnection = nil
end
for dG, dH in pairs(dE.treadmillDecoyRealTransparency or{}) do
    if typeof(dG) == 'Instance' and dG.Parent then
        pcall(
        function() dG.LocalTransparencyModifier = dH
    end
    )
end
end
dE.treadmillDecoyRealTransparency = nil
local dI = bH.Character
local dL = dI and dI:FindFirstChildOfClass('Humanoid')
local dM = workspace.CurrentCamera
if dM then
    pcall(
    function() dM.CameraSubject = dL or dE.treadmillDecoyCamera
end
)
end
dE.treadmillDecoyCamera = nil
if dE.treadmillDecoy then
    pcall(dE.treadmillDecoy.Destroy, dE.treadmillDecoy)
end
dE.treadmillDecoy = nil
end
cU._restoreTreadmillVisualAtSafe =
function(dE)
if not dE.treadmillDecoy then
    dE:_hideTreadmillDecoy()
    return true
end
local dF = bH.Character
local dG = dF and dF:FindFirstChild('HumanoidRootPart')
local dH = dF and dF:FindFirstChildOfClass('Humanoid')
local dI = dE:_resolveSafeCFrame(dG)
if dG then
    if dH then
        if not dI then
            dE:_hideTreadmillDecoy()
            return false
        end
        else
        dE:_hideTreadmillDecoy()
        return false
    end
    else
    dE:_hideTreadmillDecoy()
    return false
end
local dL, dM = os.clock() + cy
local dN = 0
while true do
    local dO = dE.destroyed
    if not(
    if dO then
        not dO
        else
        os.clock() < dL) then
            break
        end
        local dP = os.clock()
        if dE:_isInSafeArea(dG) then
            dM = dM or dP
            if dP - dM >= cx then
                dE:_hideTreadmillDecoy()
                return true
            end
            else
            dM = nil
            if dP >= dN then
                dN = dP + cz dE:_teleportRoot(dG, dH, dI)
            end
        end
        task.wait(0.03)
    end
    dE:_hideTreadmillDecoy()
    return false
end
cU._prepareTreadmillLaunch =
function(dE, dF, dG)
local dH = dE.treadmillManager
if dH then
    if type(dH.pulseForCarry) ~= 'function' then
        return false, 'Preparation unavailable'
    end
    else
    return false, 'Preparation unavailable'
end
local dI = dF and dF.Uid
local function dL()
return dI and(bI.ReadFieldEgg(dI) or dE.records[dI]) or nil
end
local function dM()
local dN = dL()
return dE.destroyed or not dE.enabled or dE.planGeneration ~= dG or not dE:_wallOpen() or type(dN) ~= 'table' or not dE:_matches(dN)
end
local function dN(dO)
local dP = bH.Character
return dE:_teleportRoot(dP and dP:FindFirstChild('HumanoidRootPart'), dP and dP:FindFirstChildOfClass('Humanoid'), dO)
end
dE:_setStatus('Preparing carry')
if not dE:_showTreadmillDecoy() then
    return false, 'Safe-zone visual unavailable'
end
local dO, dP = dH:pulseForCarry(dN, dM)
if not dO then
    dE:_restoreTreadmillVisualAtSafe()
    return false, dP
end
dE:_setStatus('Positioning at safe area')
if not dE:_restoreTreadmillVisualAtSafe() then
    return false, 'Safe teleport failed'
end
if dM() then
    return false, 'Target changed before travel'
end
return true,(dL())
end
cU._resolveEggDestination =
function(dE, dF, dG, dH)
if type(dF) ~= 'table' then
    return nil
    elseif
    typeof(dF.BottomCFrame) ~= 'CFrame' then
        return nil
    end
    local dI = bH.Character dG, dH = dG or dI and dI:FindFirstChild('HumanoidRootPart'), dH or dI and dI:FindFirstChildOfClass('Humanoid')
    if dG then
        if not dH then
            return nil
        end
        else
        return nil
    end
    local dL = dE:_feetOffset(dG, dH) + cd
    return CFrame.new(dF.BottomCFrame.Position + Vector3.new(0, dL, 0))
end
local dE = 110
local dF = 30
local dG = 900
local dH = 120
local dI = 18
local dL = - 426
local dM = - 308
local function dN()
local dO, dP = pcall(
function()
local dO = k()
return dO and dO:FindFirstChild('Areas') and dO.Areas:FindFirstChild('EggCarryBounds')
end
)
if dO and dP then
    local dQ = dP:FindFirstChild('Gameplay1')
    if dQ and dQ:IsA('BasePart') then
        local dR = dQ.Size.Z * 0.5 - dI
        if dR > 5 then
            return dQ.Position.Z - dR, dQ.Position.Z + dR
        end
    end
end
return dL, dM
end
cU._resolveRouteCruiseY =
function(dO, dP, dQ)
if dO.config.stealMode ~= 'Fly' then
    return nil
end
if dP then
    if typeof(dQ) ~= 'CFrame' then
        return nil
    end
    else
    return nil
end
if dQ.Position.Y >= dE - 6 then
    return nil
end
return dE
end
cU._resolveElevatedDestination =
function(dO, dP, dQ)
if dP then
    if typeof(dQ) ~= 'CFrame' then
        return nil
    end
    else
    return nil
end
return dQ
end
cU._teleportRoot =
function(dO, dP, dQ, dR)
if not dP or not dQ then
    return false
    elseif
    typeof(dR) ~= 'CFrame' then
        return false
    end
    if not pcall(
    function() dP.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dP.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dP.CFrame = dR dP.AssemblyLinearVelocity = Vector3.new(0,
    0, 0) dP.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
) then
    return false
end
local dS = math.clamp(dO.config.speed or b4, b2, b6()) c7(bH.Character, dS * cL)
if not dh(dQ, dP, dS,(Vector3.new(0, 0, 0))) then
    dg(dQ, dP, dS) dh(dQ, dP, dS,(Vector3.new(0, 0, 0)))
end
return true
end
cU._legitWalkSpeed =
function(dO)
local dP pcall(
function()
local dQ = bH.Character and bH.Character:FindFirstChildOfClass('Humanoid') dP = dQ and dQ.WalkSpeed
end
)
if type(dP) == 'number' and(dP >= 1 and dP <= 400) then
    dO._legitWsCache = dP
end
return dO._legitWsCache or type(dP) == 'number' and math.clamp(dP, 1, 400) or 16
end
cU._activeGlideSpeed =
function(dO)
if dO.config.stealMode == 'Fly' and dO._flyDeparting then
    return dO:_legitWalkSpeed()
end
return co
end
cU._glideRoot =
function(dO, dP, dQ, dR)
if typeof(dP) ~= 'CFrame' then
    return false
end
local dS = dR or dO:_activeGlideSpeed()
local dT = bH.Character
local dU = dT and dT:FindFirstChildOfClass('Humanoid')
local dV = dT and dT:FindFirstChild('HumanoidRootPart')
if not dV or not dU then
    return false
end
pcall(c0, dT) pcall(
function() dU.AutoRotate = false
end
) dO:_startHoverPad()
local dW = dP.Position
local function dX(dY, dZ, d_)
local d0 = math.clamp(dO.config.speed or b4, b2, b6()) pcall(
function() c7(dY, d0 * cL) dh(dZ, d_, d0,(Vector3.new(0, 0, 0)))
end
)
end
local dY = os.clock() + math.clamp((dW - dV.Position).Magnitude / math.max(dS, 1) * 1.6 + 6, 15, 120)
while os.clock() < dY do
    if dQ and dQ() then
        return false
    end
    if dO.destroyed then
        return false
        elseif
        not dO.enabled then
            if not dO._externalDeliver then
                return false
            end
        end
        local dZ = bH.Character dV = dZ and dZ:FindFirstChild('HumanoidRootPart') dU = dZ and dZ:FindFirstChildOfClass('Humanoid')
        if not dV or not dU then
            return false
        end
        local d_ = dV.Position
        local d0 = dW - d_
        local d1 = d0.Magnitude
        if d1 <= 1 then
            pcall(
            function() dV.CFrame = dP dV.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dV.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
        ) dO:_syncHoverPad(dW) dX(dZ, dU, dV)
        return true
    end
    local d2 = bG.Heartbeat:Wait()
    local d3 = math.max(math.min(d2, cM), 0.004166666666666667)
    local d4 = math.min(dS * d3, d1)
    local d5 = d_ + d0.Unit * d4
    if d3 >= 0.03333333333333333 then
        local d6 = dO:_groundYAt(d5.X, d5.Z, dZ)
        if d6 then
            local d7 = d6 + dO:_feetOffset(dV, dU)
            if d5.Y < d7 then
                d5 = Vector3.new(d5.X, d7, d5.Z)
            end
        end
    end
    pcall(
    function() dV.CFrame = CFrame.new(d5, d5 + d0.Unit) dV.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dV.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
) dO:_syncHoverPad(d5) dX(dZ, dU, dV)
end
return false
end
cU.HOP ={studs = 500, gap = 0.15, height = 40, safeWait = 0.6} cU.RELAY_LAND_OK = 200 cU.RELAY_ROUNDS = 3 cU.EGG_FREE_SLOTS = 5 cU._relaySettle =
function(dO)
if not dO._relaySettle_s then
    local dP = 0.05 pcall(
    function() dP = bH:GetNetworkPing() or 0.05
end
) dO._relaySettle_s = math.clamp(0.5 + dP * 4, cU.HOP.safeWait, 2) dO._relayGood = 0
end
return dO._relaySettle_s
end
cU._noteRelayLanding =
function(dO, dP)
local dQ = dO:_relaySettle()
if dP > cU.RELAY_LAND_OK then
    dO._relaySettle_s = math.min(dQ + 0.2, 2) dO._relayGood = 0
    else
    dO._relayGood =(dO._relayGood or 0) + 1
    if dO._relayGood >= 5 then
        dO._relayGood = 0 dO._relaySettle_s = math.max(dQ - 0.05, cU.HOP.safeWait)
    end
end
end
cU._hopRoot =
function(dO, dP, dQ)
if typeof(dP) ~= 'CFrame' then
    return false
end
local dR = cU.HOP
local dS = bH.Character
local dT = dS and dS:FindFirstChildOfClass('Humanoid')
local dU = dS and dS:FindFirstChild('HumanoidRootPart')
if not dU or not dT then
    return false
end
pcall(c0, dS) pcall(
function() dT.AutoRotate = false
end
) dO:_startHoverPad()
local dV = dP.Position
local dW = dV.Y + dR.height
local function dX()
if dQ and dQ() then
    return false
end
if dO.destroyed then
    return false
    elseif
    not dO.enabled then
        if not dO._externalDeliver then
            return false
        end
    end
    dS = bH.Character dU = dS and dS:FindFirstChild('HumanoidRootPart') dT = dS and dS:FindFirstChildOfClass('Humanoid')
    return dU ~= nil and dT ~= nil and dT.Health > 0
end
local function dY(dZ) pcall(
function() dU.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dU.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dU.CFrame = dZ dU.AssemblyLinearVelocity = Vector3.new(0,
0, 0) dU.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
) dO:_syncHoverPad(dZ.Position)
local d_ = math.clamp(dO.config.speed or b4, b2, b6()) pcall(
function() c7(dS, d_ * cL) dh(dT, dU, d_,(Vector3.new(0, 0, 0)))
end
)
end
local dZ = os.clock() + 20
while os.clock() < dZ do
    if not dX() then
        return false
    end
    local d_ = dU.Position
    local d0 = Vector3.new(dV.X - d_.X, 0, dV.Z - d_.Z)
    if d0.Magnitude <= dR.studs then
        dY(dP)
        return true
    end
    local d1 = Vector3.new(d_.X, dW, d_.Z) + d0.Unit * dR.studs
    local d2 = CFrame.new(d1, d1 + d0.Unit) dY(d2)
    local d3 = os.clock() + dR.gap
    while os.clock() < d3 do
        bG.Heartbeat:Wait()
        if not dX() then
            return false
        end
        dY(d2)
    end
end
return false
end
local dO = 420
local dP = 20
local dQ = 0.5 cU._walkBrakeDecel =
function(dR)
if dR._brakeDecel then
    return dR._brakeDecel
end
local dS = l.__SenaV4BrakeDecel
local dT = bH.Character and bH.Character:FindFirstChildOfClass('Humanoid')
if type(dS) == 'table' and(dT and math.abs((dS.ws or 0) - dT.WalkSpeed) < 15) then
    dR._brakeDecel = dS.decel
    return dS.decel
end
return dO
end
cU._walkLeg =
function(dR, dS, dT, dU, dV, dW, dX)
local function dY(dZ, d_)
if dZ and d_ then
    pcall(
    function() dZ:MoveTo(d_.Position)
end
)
end
return false
end
local dZ, d_, d0
while os.clock() < dW do
    local d1 = bH.Character
    local d2 = d1 and d1:FindFirstChild('HumanoidRootPart')
    local d3 = d1 and d1:FindFirstChildOfClass('Humanoid')
    if d2 then
        if not d3 then
            return false
        end
        else
        return false
    end
    if dT and dT() then
        return(dY(d3, d2))
    end
    if dR.destroyed then
        return(dY(d3, d2))
        elseif
        not dR.enabled then
            if not dR._externalDeliver then
                return(dY(d3, d2))
            end
        end
        local d4 = d2.Position
        local d5 = Vector3.new(dS.X - d4.X, 0, dS.Z - d4.Z)
        local d6 = d5.Magnitude
        local d7 = d2.AssemblyLinearVelocity
        local d8 = Vector3.new(d7.X, 0, d7.Z).Magnitude
        if dV then
            if d6 <= dU and d8 <= dP then
                pcall(
                function() d3:MoveTo(d4)
            end
            )
            return true
        end
        else
        dZ = dZ or(d6 > 0.001 and d5.Unit or Vector3.new(0, 0, 0))
        if d6 <= dU then
            return true
            elseif
            d5:Dot(dZ) <= 0 then
                return true
            end
        end
        local d9
        local ea = d6 > 0.001 and math.max(d7.X * d5.X + d7.Z * d5.Z, 0) / d6 or d8
        if dV and d6 <= ea * ea /(2 * dR:_walkBrakeDecel()) + ea * 0.06 then
            d9 = d4
            local eb = os.clock()
            if d_ and(eb > d0 and d8 > dP) then
                local ec =(d_ - d8) /(eb - d0)
                if ec > 20 and ec < 5000 then
                    dR._brakeDecel = dR:_walkBrakeDecel() * 0.8 + ec * 0.93 * 0.2 l.__SenaV4BrakeDecel ={ws = d3.WalkSpeed, decel = dR._brakeDecel}
                end
            end
            d_ = d8 d0 = eb
            else
            d_ = nil
            local eb = math.max(d3.WalkSpeed * dQ, 12)
            if dV and d6 <= eb then
                d9 = Vector3.new(dS.X, d4.Y, dS.Z)
                else
                d9 = d4 + d5.Unit * eb
            end
        end
        pcall(
        function() d3:MoveTo(d9)
    end
    )
    if dX then
        dX()
    end
    bG.Heartbeat:Wait()
end
local d1 = bH.Character
return(dY(d1 and d1:FindFirstChildOfClass('Humanoid'), d1 and d1:FindFirstChild('HumanoidRootPart')))
end
cU._walkTo =
function(dR, dS, dT, dU)
if typeof(dS) ~= 'CFrame' then
    return false
end
local dV = dU or 8
local dW = bH.Character
local dX = dW and dW:FindFirstChild('HumanoidRootPart')
local dY = dW and dW:FindFirstChildOfClass('Humanoid')
if dX then
    if not dY then
        return false
    end
    else
    return false
end
pcall(
function() dY.AutoRotate = true
end
)
local dZ = dS.Position
local d_ = dY.WalkSpeed
local d0 =
if d_ then
    if d_ < 1 then
        16
        else
        d_
        else
        16
        local d1 = Vector3.new(dZ.X - dX.Position.X, 0, dZ.Z - dX.Position.Z).Magnitude
        return dR:_walkLeg(dZ, dT, dV, true, os.clock() + math.clamp(d1 / d0 * 2 + 8, 12, 90))
    end
    cU._walkToZigzag =
    function(dR, dS, dT, dU)
    if typeof(dS) ~= 'CFrame' then
        return false
    end
    local dV = dU or 8
    local dW = 60
    local dX = 38
    local dY = 10
    local dZ = bH.Character
    local d_ = dZ and dZ:FindFirstChild('HumanoidRootPart')
    local d0 = dZ and dZ:FindFirstChildOfClass('Humanoid')
    if d_ then
        if not d0 then
            return false
        end
        else
        return false
    end
    pcall(
    function() d0.AutoRotate = true
end
)
local d1 = dS.Position
local d2 = d0.WalkSpeed
local d3 =
if d2 then
    if d2 < 1 then
        16
        else
        d2
        else
        16
        local d4 = Vector3.new(d1.X - d_.Position.X, 0, d1.Z - d_.Position.Z).Magnitude
        local d5 = math.max(45, d3 * d3 /(2 * dR:_walkBrakeDecel()) * 1.25)
        local d6, d7, d8 = os.clock() + math.clamp(d4 / d3 * 3 + 10, 14, 120)
        local d9, ea, eb = pcall(
        function()
        return dN()
    end
    )
    if d9 and(type(ea) == 'number' and type(eb) == 'number') then
        local ec = math.min(ea, eb)
        local ed = math.max(ea, eb) d7 = ec d8 = ed
    end
    eb = math.random() < 0.5 and - 1 or 1
    while os.clock() < d6 do
        if dT and dT() then
            return false
        end
        if dR.destroyed then
            return false
            elseif
            not dR.enabled then
                return false
            end
            local ec = bH.Character d_, d0 = ec and ec:FindFirstChild('HumanoidRootPart'), ec and ec:FindFirstChildOfClass('Humanoid')
            if d_ then
                if not d0 then
                    return false
                end
                else
                return false
            end
            local ed = d_.Position
            local ee = Vector3.new(d1.X - ed.X, 0, d1.Z - ed.Z)
            local ef = ee.Magnitude
            if ef <= d5 then
                return dR:_walkLeg(d1, dT, dV, true, d6)
            end
            local eg = ee.Unit
            local eh = Vector3.new(- eg.Z, 0, eg.X)
            local ei = math.max(ef - d5 * 0.5, 4)
            local ej = math.min(dW + math.random() * 40, ei)
            local ek = eb * math.min(dX, ej * 0.4) *(0.6 + math.random() * 0.4) eb = - eb
            local el = ed + eg * ej + eh * ek ej = el.Z
            local em =
            if d7 then
                if d8 then
                    math.clamp(ej, d7 + 2, d8 - 2)
                    else
                    ej
                    else
                    ej
                    if not dR:_walkLeg(Vector3.new(el.X, ed.Y, em), dT, dY, false, d6) then
                        return false
                    end
                end
                return false
            end
            cU._flyWalkTo =
            function(dR, dS, dT, dU, dV)
            if typeof(dS) ~= 'CFrame' then
                return false
            end
            local dW = dU or 8
            local dX = tonumber(dV) or 110
            local dY = bH.Character
            local dZ = dY and dY:FindFirstChild('HumanoidRootPart')
            local d_ = dY and dY:FindFirstChildOfClass('Humanoid')
            if not dZ or not d_ then
                return false
            end
            pcall(
            function() d_.AutoRotate = true
        end
        )
        local function d0() pcall(
        function()
        local d1 = bH.Character and bH.Character:FindFirstChildOfClass('Humanoid')
        local d2 = d1 and d1:FindFirstChildWhichIsA('Animator')
        if d2 then
            for d3, d4 in ipairs(d2:GetPlayingAnimationTracks()) do
                d4:Stop(0)
            end
        end
    end
    )
end
local function d1(d2)
local d3 = bH.Character
local d4 = d3 and d3:FindFirstChild('Animate')
if d4 then
    pcall(
    function() d4.Disabled = d2
end
)
end
end
d1(true) d0()
local d2 = dS.Position dR.hoverPadHeightOverride = dX dR:_startHoverPad() pcall(
function() dZ.CFrame = CFrame.new(dZ.Position.X, dX, dZ.Position.Z) * dZ.CFrame.Rotation dZ.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dZ.AssemblyAngularVelocity = Vector3.new(0,
0, 0)
end
) dR:_syncHoverPad()
local d3 = d_.WalkSpeed
local d4 =
if d3 then
    if d3 < 1 then
        16
        else
        d3
        else
        16
        local d5 = Vector3.new(d2.X - dZ.Position.X, 0, d2.Z - dZ.Position.Z).Magnitude
        local d6 = dR:_walkLeg(d2, dT, dW, true, os.clock() + math.clamp(d5 / d4 * 2 + 10, 12, 120), d0) d1(false) dR.hoverPadHeightOverride = nil
        if not d6 then
            return false
        end
        if dT and dT() then
            return false
        end
        dR:_glideRoot(dS, dT, dR:_legitWalkSpeed())
        return not(dT and dT())
    end
    cU._isInSafeArea =
    function(dR, dS)
    if not dS then
        return false
    end
    local dT = dS.Position - ci
    return Vector2.new(dT.X, dT.Z).Magnitude <= cv and math.abs(dT.Y) <= cw
end
cU._isInField =
function(dR, dS)
local dT = k()
local dU = dT and dT:FindFirstChild('Areas')
local dV = dU and dU:FindFirstChild('WallStartCollision')
if dV then
    if not dV:IsA('BasePart') then
        return true
    end
    else
    return true
end
return dS.Position.X >= dV.Position.X + 3
end
cU._needsSafeZoneHop =
function(dR, dS)
if dR:_isInField(dS) then
    return false, nil
    elseif
    dR:_isInSafeArea(dS) then
        return false, nil
    end
    return true, dR:_resolveSafeCFrame(dS)
end
cU._invalidateCarryWorker =
function(dR) dR.carryWorker = nil
end
cU._claimCarryWorker =
function(dR, dS, dT)
local dU = dR.carry.generation
local dV = dR.carryWorker
if dV and dV.generation == dU then
    return nil
end
local dW ={kind = dS, uid = dT, generation = dU, token ={}} dR.carryWorker = dW
return dW
end
cU._isCarryWorkerCurrent =
function(dR, dS)
return type(dS) == 'table' and dR.carryWorker == dS and dR.carry.generation == dS.generation and not dR.destroyed and(dR.enabled or dR._externalDeliver)
end
cU._releaseCarryWorker =
function(dR, dS)
if dR.carryWorker == dS then
    dR.carryWorker = nil
end
end
cU.ownsCarryRecovery =
function(dR, dS)
if dR.destroyed then
    return false
    elseif
    not dR.enabled then
        return false
    end
    if dR.carry.uid == dS then
        return true
    end
    return dR.running and dR.activeTarget ~= nil and(dS == nil or dR.activeTarget.Uid == dS)
end
cU.requestCarryRecovery =
function(dR, dS)
if dR.destroyed then
    return false
    elseif
    dR.enabled then
        if type(dS) ~= 'string' then
            return false
            elseif
            dS == '' then
                return false
            end
            else
            return false
        end
        if dR:isSkippedEgg(dS) then
            return true
        end
        if dR.tweenRecoveryUid == dS then
            dR:_scheduleMovementRetry()
            return true
        end
        if dR.carry.active and dR.carry.uid == dS then
            return true
        end
        local dT = bI.ReadFieldEgg(dS) or dR.records[dS]
        if type(dT) ~= 'table' then
            return false
            elseif
            dT.State ~= bP.States.Dropped then
                if dT.State ~= bP.States.Slot then
                    return false
                end
            end
            local dU = dR.carryWorker
            if dU and dU.kind == 're-steal' and dU.uid == dS or dR.activeTween and dR.activeTarget and dR.activeTarget.Uid == dS then
                return true
                elseif
                dR.carryAttemptToken then
                    if dR.activeTarget and dR.activeTarget.Uid == dS then
                        return true
                    end
                end
                dR.carry.generation += 1 dR:_invalidateCarryWorker() dR.carryAttemptToken = nil dR.running = true dR.activeTarget = dT task.defer(
                function()
                if not dR.destroyed and(dR.enabled and not dR.carry.active) then
                    dR:_reStealDroppedEgg(dS)
                end
            end
            )
            return true
        end
        cU._hasConfirmedCarry =
        function(dR, dS)
        if not dR.carry.active then
            return false
        end
        if dS == nil then
            return true
            elseif
            dR.carry.uid == nil then
                return true
            end
            return dR.carry.uid == dS
        end
        cU._adoptCarryFromRecord =
        function(dR, dS)
        if dR.carry.active and dR.carry.uid == dS then
            return
        end
        if dR.carryTimeouts then
            dR.carryTimeouts[dS] = nil
        end
        if dR.instantPhase == 'priming' and dS == dR.primerUid then
            dR.carry.active = true dR.carry.uid = dS
            return
        end
        dR.carry.generation += 1 dR:_invalidateCarryWorker() dR:_clearArrivalHold(dS)
        local dT = dR.activeTarget dR.claimPresentationSuppression ={assetCategory = dT and dT.AssetCategory, expiresAt = os.clock() + 8} dR.carry.active = true dR.carry.uid = dS dR.carryStartTime = os.clock()
        local dU = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart') dR.carryStartPos = dT and dT.BottomCFrame and dT.BottomCFrame.Position or dU and dU.Position
        if dR.tweenRecoveryUid == dS then
            dR.tweenRecoveryUid = nil
        end
        dR.stats.lastResult = 'Carry confirmed' dR:_notify()
    end
    cU._recordShowsCarried =
    function(dR, dS)
    if type(dS) ~= 'string' then
        return false
        elseif
        dS == '' then
            return false
        end
        local dT = bI.ReadFieldEgg(dS) or dR.records[dS]
        return type(dT) == 'table' and dT.State == bP.States.Carried and dT.CarrierUserId == bH.UserId
    end
    cU._recordShowsForeignCarry =
    function(dR, dS)
    if type(dS) ~= 'string' then
        return false
        elseif
        dS == '' then
            return false
        end
        local dT = bI.ReadFieldEgg(dS) or dR.records[dS]
        return type(dT) == 'table' and dT.State == bP.States.Carried and dT.CarrierUserId ~= nil and dT.CarrierUserId ~= bH.UserId
    end
    cU._resolveMovementSpeed =
    function(dR, dS)
    if dS.Parent then
        if dS.Health <= 0 then
            return nil
        end
        else
        return nil
    end
    return math.clamp(dR.config.speed, b2, b6())
end
cU._isAreaSafe =
function(dR, dS)
return true
end
cU._feetOffset =
function(dR, dS, dT)
if dT.RigType == Enum.HumanoidRigType.R15 then
    return dS.Size.Y * 0.5 + math.max(dT.HipHeight, 0.5)
end
return dS.Size.Y * 0.5 + 2
end
cU.setAntiTrap =
function(dR, dS) dR.config.antiTrap = dS == true
if dR.config.antiTrap then
    dR:_purgeTraps()
end
end
cU._isForeignTrap =
function(dR, dS)
if dS.Name == cS and dS:IsA('BasePart') then
    local dT = dS:GetAttribute('Owner')
    return type(dT) ~= 'string' or dT ~= bH.Name
end
return dS:IsA('Model') and dS.Name == cT and dS:FindFirstChild('Hitbox') ~= nil
end
cU._purgeTrap =
function(dR, dS)
if dR.config.antiTrap then
    if dS then
        if not dS.Parent then
            return
        end
        else
        return
    end
    else
    return
end
if dR:_isForeignTrap(dS) then
    pcall(dS.Destroy, dS)
end
end
cU._purgeTraps =
function(dR)
for dS, dT in ipairs({'Transient', '__DEBRIS'}) do
    local dU = workspace:FindFirstChild(dT)
    if dU then
        for dV, dW in ipairs(dU:GetDescendants()) do
            dR:_purgeTrap(dW)
        end
    end
end
end
cU._syncHoverPad =
function(dR, dS)
local dT = dR.hoverPad
if dT then
    if dT.Parent then
        if dT:GetAttribute(ch) ~= dR.hoverPadOwnerId then
            return false
        end
        else
        return false
    end
    else
    return false
end
local dU = bH.Character
local dV = dU and dU:FindFirstChild('HumanoidRootPart')
local dW = dU and dU:FindFirstChildOfClass('Humanoid')
if dV then
    if not dW then
        return false
    end
    else
    return false
end
local dX = typeof(dS) == 'Vector3' and dS or dV.Position
local dY = dX.Y
local dZ =
if dR.hoverPadHeightOverride ~= nil then
    if typeof(dS) ~= 'Vector3' then
        dR.hoverPadHeightOverride
        else
        dY
        else
        dY
        local d_ =
        if dR.hoverPadHeightOverride ~= nil then
            math.max(ce, dW.WalkSpeed * 2 / 15)
            else
            ce
            if math.abs(dT.Size.X - d_) > 0.5 then
                dT.Size = Vector3.new(d_, cf, d_)
            end
            dT.CFrame = CFrame.new(dX.X, dZ - dR:_feetOffset(dV, dW) - cf * 0.5 - 0.05, dX.Z)
            return true
        end
        cU._setArrivalHold =
        function(dR, dS, dT)
        if typeof(dS) ~= 'CFrame' then
            return
        end
        local dU = bH.Character
        local dV = dU and dU:FindFirstChild('HumanoidRootPart')
        if dU then
            if not dV then
                return
            end
            else
            return
        end
        dR.arrivalHold ={Character = dU, RootPart = dV, CFrame = dS, Uid = dT}
    end
    cU._clearArrivalHold =
    function(dR, dS)
    local dT = dR.arrivalHold
    if dT then
        if dS == nil then
            dR.arrivalHold = nil
            elseif
            dT.Uid == nil then
                dR.arrivalHold = nil
                elseif
                dT.Uid == dS then
                    dR.arrivalHold = nil
                end
                else
                dR.arrivalHold = nil
            end
        end
        cU._enforceArrivalHold =
        function(dR)
        local dS = dR.arrivalHold
        if type(dS) ~= 'table' then
            return false
            elseif
            typeof(dS.CFrame) ~= 'CFrame' then
                return false
            end
            if bH.Character ~= dS.Character then
                dR.arrivalHold = nil
                return false
                elseif
                dS.RootPart then
                    if not dS.RootPart.Parent then
                        dR.arrivalHold = nil
                        return false
                    end
                    else
                    dR.arrivalHold = nil
                    return false
                end
                dR:_startHoverPad() pcall(
                function() dS.RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dS.RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(dS.CFrame.Position) dS.RootPart.CFrame = dS.CFrame
            end
            ) dR:_syncHoverPad(dS.CFrame.Position)
            return true
        end
        cU._purgeOrphanHoverPads =
        function(dR)
        for dS, dT in ipairs(workspace:GetChildren()) do
            if dT.Name == cg and dT ~= dR.hoverPad then
                pcall(dT.Destroy, dT)
            end
        end
    end
    cU._startHoverPad =
    function(dR)
    local dS = dR.hoverPad
    if(
    if dS then
        not dS.Parent
        else
        not dS) or dS:GetAttribute(ch) ~= dR.hoverPadOwnerId then
            dR:_purgeOrphanHoverPads()
            if dS and dS.Parent then
                pcall(dS.Destroy, dS)
            end
            local dT = Instance.new('Part') dT.Name = cg dT:SetAttribute(ch, dR.hoverPadOwnerId) dT.Anchored = true dT.CanCollide = true dT.CanQuery = true dT.CanTouch = false dT.CastShadow = false dT.Transparency = 1 dT.Material = Enum.Material.SmoothPlastic dT.Size = Vector3.new(ce,
            cf, ce) dR.hoverPad = dT dT.Parent = workspace
        end
        dR:_syncHoverPad()
        if not dR.hoverPadConnection then
            dR.hoverPadConnection = bG.PreSimulation:Connect(
            function()
            if not dR:_syncHoverPad() then
                dR:_startHoverPad()
            end
        end
        )
    end
    if not dR.hoverPadPostConnection then
        dR.hoverPadPostConnection = bG.PostSimulation:Connect(
        function()
        if dR.activeTween then
            dR:_syncHoverPad()
            elseif
            dR.arrivalHold then
                dR:_syncHoverPad()
            end
        end
        )
    end
end
cU._stopHoverPad =
function(dR) dR.hoverPadHeightOverride = nil
if dR.hoverPadConnection then
    pcall(dR.hoverPadConnection.Disconnect, dR.hoverPadConnection) dR.hoverPadConnection = nil
end
if dR.hoverPadPostConnection then
    pcall(dR.hoverPadPostConnection.Disconnect, dR.hoverPadPostConnection) dR.hoverPadPostConnection = nil
end
if dR.hoverPad then
    pcall(dR.hoverPad.Destroy, dR.hoverPad) dR.hoverPad = nil
end
dR:_purgeOrphanHoverPads()
end
cU._startMovementProtection =
function(dR)
local dS = bH.Character
local dT = dS and dS:FindFirstChild('HumanoidRootPart')
local dU = dS and dS:FindFirstChildOfClass('Humanoid')
if dS then
    if dT then
        if not dU then
            return false
        end
        else
        return false
    end
    else
    return false
end
local dV = math.clamp(dR.config.speed or b4, b2, b6()) dR.protectionCharacter = dS dR.protectionHumanoid = dU dR.protectionRoot = dT c7(dS, dV * cL) dg(dU,
dT, dV)
if not dR.integritySpoofConnection then
    dR.integritySpoofConnection = bG.PreSimulation:Connect(
    function()
    local dW = bH.Character
    local dX = dW and dW:FindFirstChild('HumanoidRootPart')
    local dY = dW and dW:FindFirstChildOfClass('Humanoid')
    if dW then
        if dX then
            if not dY then
                return
            end
            else
            return
        end
        else
        return
    end
    local dZ = math.clamp(dR.config.speed or b4, b2, b6()) dR.protectionCharacter = dW dR.protectionHumanoid = dY dR.protectionRoot = dX c7(dW, dZ * cL)
    if not dh(dY, dX, dZ) then
        dg(dY, dX, dZ)
    end
    dR:_enforceArrivalHold()
end
)
end
if not dR.arrivalHoldConnection then
    dR.arrivalHoldConnection = bG.Heartbeat:Connect(
    function() dR:_enforceArrivalHold()
end
)
end
return true
end
cU._startFlyGrounding =
function(dR) dR:_stopFlyGrounding()
local dS = dd() dR._flyGroundConn = bG.PreSimulation:Connect(
function()
if dR.destroyed then
    return
end
local dT = dS and dS.State
if type(dT) ~= 'table' then
    return
    elseif
    rawget(dT, 'CorrectionContext') ~= nil then
        return
    end
    rawset(dT, 'IsSupportedNow', true) rawset(dT, 'UnsupportedStartedAt', nil)
    if rawget(dT, 'MovementMode') ~= 'Correcting' then
        rawset(dT, 'MovementMode', 'Grounded')
    end
    local dU = rawget(dT, 'Evidence')
    if type(dU) == 'table' then
        dU.Flight = 0 dU.Teleport = 0 dU.Speed = 0
    end
end
)
end
cU._stopFlyGrounding =
function(dR)
if dR._flyGroundConn then
    pcall(dR._flyGroundConn.Disconnect, dR._flyGroundConn) dR._flyGroundConn = nil
end
end
cU._stopMovementProtection =
function(dR) dR:_stopFlyGrounding()
if dR.integritySpoofConnection then
    pcall(dR.integritySpoofConnection.Disconnect, dR.integritySpoofConnection) dR.integritySpoofConnection = nil
end
if dR.arrivalHoldConnection then
    pcall(dR.arrivalHoldConnection.Disconnect, dR.arrivalHoldConnection) dR.arrivalHoldConnection = nil
end
dR:_clearArrivalHold() dR:_stopHoverPad() c8() di(dR.protectionHumanoid) dR.protectionCharacter = nil dR.protectionHumanoid = nil dR.protectionRoot = nil
end
cU.travelAndWait =
function(dR, dS, dT)
local dU = dT or{}
if dR.destroyed then
    return false
end
if dR.travelBusy and os.clock() <(dR.travelBusyUntil or 0) then
    return false
end
local dV, dW = dR.activeTween and not dR.running
if dV then
    local dX = dR.activeTween.sharedTravel dW =
    if dX then
        dU.preempt == true
        else
        not dX
        else
        dW = dV
    end
    if dW then
        pcall(dR.activeTween.Cancel, dR.activeTween) dV = os.clock() + 0.5
        while dR.activeTween and os.clock() < dV do
            task.wait(0.05)
        end
    end
    if dR.activeTween then
        return false
    end
    local dX = bH.Character
    local dY = dX and dX:FindFirstChild('HumanoidRootPart')
    if not dY then
        return false
    end
    dR.travelBusy = true dR.travelBusyUntil = os.clock() + 45 dW, dV = pcall(
    function()
    local dZ
    local d_ = os.clock()
    local d0 =(dS.Position - dY.Position).Magnitude
    local d1 = d_ + d0 / math.max(tonumber(dU.speed) or dR.config.speed or b4, b2) + 6 dR.travelBusyUntil = d1 + 2
    local d2 = dU.speed
    local d3 ={silent = true, sharedTravel = true, abort =
    function()
    return dR.destroyed or dU.abort ~= nil and dU.abort()
end
} d3.onDone =
function(d4) dZ = d4 == true
end
dR:_tweenRoot(dS, nil, d2, d3) d2 = d_
while true do
    if not(dZ == nil) then
        break
    end
    local d4 = os.clock()
    local d5 = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
    local d6 = d5 and(dS.Position - d5.Position).Magnitude or 1 / 0
    if d6 < d0 - 0.5 then
        d0 = d6 d2 = d4
    end
    if dR.destroyed or dU.abort ~= nil and dU.abort() or d4 - d2 >= 1.5 or d4 >= d1 then
        if dR.activeTween and dR.activeTween.Cancel then
            pcall(dR.activeTween.Cancel)
        end
        dZ = false
        break
    end
    task.wait(0.05)
end
return dZ
end
) dR.travelBusy = false
if not dW then
    if dR.activeTween and(dR.activeTween.sharedTravel and dR.activeTween.Cancel) then
        pcall(dR.activeTween.Cancel)
    end
    return false
end
return dV == true
end
cU._tweenRoot =
function(dR, dS, dT, dU, dV) dR:_clearArrivalHold()
local dW = bH.Character
local dX = dW and dW:FindFirstChild('HumanoidRootPart')
local dY = dW and dW:FindFirstChildOfClass('Humanoid')
local dZ = dV or{}
if not dX or not dY then
    dR.safeStarting = false
    if dZ.silent then
        if dZ.onDone then
            pcall(dZ.onDone, false)
        end
        return
    end
    dR:_finish('Character unavailable')
    return
end
local d_ = dU or dR:_resolveMovementSpeed(dY)
if not d_ then
    dR.safeStarting = false
    if dZ.silent then
        if dZ.onDone then
            pcall(dZ.onDone, false)
        end
        return
    end
    dR:_finish('Movement unavailable')
    return
end
local d0 = math.clamp(d_, b2, b6()) dR:_startMovementProtection() pcall(c0, dW)
local d1 = workspace.CurrentCamera
if d1 and d1.CameraSubject ~= dY then
    pcall(
    function() d1.CameraSubject = dY
end
)
end
local d2 = dY.AutoRotate dY.AutoRotate = false
local d3 = dZ.flightProfile == true and dR:_resolveRouteCruiseY(dX, dS) or nil
local d4 ={sharedTravel = dZ.sharedTravel == true, routeCruiseY = d3, travelPhase = d3 and 'takeoff' or nil, zigzag = dR.config.stealMode == 'Zig-Zag',
zigT = 0, zigLast = 0} dR.activeTween = d4 dR:_startHoverPad()
local d5, d6, d7, d8 = false
local d9 = 0
local function ea(eb)
if d5 then
    return
end
d5, d7 = true, nil
if dY.Parent ~= nil then
    dY.AutoRotate = d2
end
if eb and dZ.holdAfterArrival then
    dR:_setArrivalHold(dS, dZ.holdUid)
end
if dZ.onDone then
    pcall(dZ.onDone, eb == true)
end
if d6 then
    d6:Disconnect() d6 = nil
end
if dR.activeTween == d4 then
    dR.activeTween = nil
end
if not dR.arrivalHold then
    dR:_stopHoverPad()
end
if not dR.enabled then
    dR:_stopMovementProtection()
end
pcall(
function()
if bH.Character == dW and dX.Parent then
    dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
end
end
)
if eb and(bH.Character == dW and(dY.Parent ~= nil and dT)) then
    dT()
end
end
d4.Cancel =
function() ea(false)
end
d6 = bG.Heartbeat:Connect(
function(eb)
if dZ.abort and dZ.abort() then
    ea(false)
    return
end
if dR.destroyed then
    ea(false)
    return
    elseif
    dR.activeTween ~= d4 then
        ea(false)
        return
    end
    if dZ.carryTarget and os.clock() >=(d4.nextTargetCheck or 0) then
        d4.nextTargetCheck = os.clock() + 0.1
        local ec = dZ.carryTarget.Uid
        local ed = bI.ReadFieldEgg(ec)
        local ee = ed and ed.State
        if ee ~= bP.States.Slot and(ee ~= bP.States.Dropped and(ee ~= 'GuardCarried' and(not(ed and ed.CarrierUserId == bH.UserId) and not dR:_hasConfirmedCarry(ec)))) then
            ea(false)
            local ef = l.__SenaV4PlayerSteal dR:_finish(ee == 'Carried' and ef ~= nil and ef:intercept(ec) and 'Target taken - chasing the carrier' or 'Target taken by someone else')
            return
        end
    end
    pcall(
    function()
    local ec = math.clamp(dU or dR.config.speed or d0, b2, b6()) c7(dW, ec * cL)
    local ed = c4()[b9]
    local ee = type(ed) == 'table' and ed.State or nil
    if not df(ee, dY, dX) then
        d8, d7 = nil, nil dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dX.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(dX.Position)
        if de(ee, dY, dX) then
            dc(ee, ec * cL,(Vector3.new(0, 0, 0)))
            else
            dg(dY, dX, ec)
        end
        return
    end
    local ef = dX.Position
    local eg = dS.Position - ef
    local eh = eg.Magnitude
    local ei = Vector3.new(eg.X, 0, eg.Z)
    local ej = ei.Magnitude
    local ek = dS.Position
    if d4.routeCruiseY then
        if d4.travelPhase == 'takeoff' then
            if ef.Y >= d4.routeCruiseY - 0.5 then
                d4.travelPhase = 'cruise'
                else
                ek = Vector3.new(ef.X, d4.routeCruiseY, ef.Z)
            end
        end
        if d4.travelPhase == 'cruise' then
            if ej <= 4 then
                d4.travelPhase = 'descend'
                else
                ek = Vector3.new(dS.Position.X, d4.routeCruiseY, dS.Position.Z)
            end
        end
        ek =
        if d4.travelPhase == 'descend' then
            dS.Position
            else
            ek
        end
        local el = ek - ef
        local em = el.Magnitude
        local en = d4.routeCruiseY and ej or eh
        local eo
        if d8 and en > d8 + cO then
            d9 = os.clock() + cP
        end
        d8 = en en = os.clock() < d9 and math.max(b2, ec * cQ) or ec
        if dZ.carryTarget and not d4.__earlyCarrySpam and eh <= 30 then
            d4.__earlyCarrySpam = true eo = dZ.carryTarget
            local ep = eo.Uid
            local eq = bQ.LooksLikeFirstAreaUid(ep) and bQ.SlotKey(eo.AreaId, eo.NestId) or nil task.spawn(
            function()
            while true do
                local er = dR.destroyed
                if not((
                if er then
                    not er
                    else
                    dR.enabled) and dR.activeTween == d4 and not dR:_hasConfirmedCarry(ep)) then
                        break
                    end
                    pcall(cW, ep, eq) task.wait(0.08)
                end
            end
            )
        end
        local ep = math.max(math.min(eb, cM), 0.004166666666666667)
        local eq = en * ep
        local er = Vector3.new(dX.CFrame.LookVector.X, 0, dX.CFrame.LookVector.Z)
        local es = ei.Magnitude > 0.001 and ei.Unit or(er.Magnitude > 0.001 and er.Unit or Vector3.new(0, 0, - 1))
        local et = d4.routeCruiseY
        if(
        if et then
            d4.travelPhase == 'descend'
            else
            not et) and eh <= math.max(eq, 0.05) then
                if eh > 0.5 then
                    d7 = nil
                end
                dR:_syncHoverPad(dS.Position) dX.CFrame = CFrame.lookAt(dS.Position, dS.Position + es) dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(dS.Position) dh(dY,
                dX, ec,(Vector3.new(0, 0, 0))) d7 = d7 or os.clock()
                if os.clock() - d7 >= cR then
                    ea(true)
                end
                return
            end
            d7 = nil
            if em <= 0.001 then
                dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dX.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(ef)
                return
            end
            if dR.hoverPad then
                if not dR.hoverPad.Parent then
                    dR:_startHoverPad()
                end
                else
                dR:_startHoverPad()
            end
            local eu = math.min(eq, em) ei, et, en = ef + el.Unit * eu, ep >= 0.03333333333333333
            if et then
                local ev = d4.routeCruiseY en =
                if ev then
                    d4.travelPhase ~= 'cruise'
                    else
                    not ev
                    else
                    en = et
                end
                if en then
                    local ev = dR:_groundYAt(ei.X, ei.Z, dW)
                    if ev then
                        local ew = ev + dR:_feetOffset(dX, dY) ei =
                        if ei.Y < ew then
                            Vector3.new(ei.X, ew, ei.Z)
                            else
                            ei
                        end
                    end
                    eh, eq = d4.zigzag
                    if eh then
                        local ev = d4.routeCruiseY eq =
                        if ev then
                            d4.travelPhase == 'cruise'
                            else
                            not ev
                            else
                            eq = eh
                        end
                        if eq then
                            local ev = Vector3.new(el.X, 0, el.Z)
                            if ev.Magnitude > 1 then
                                if ej > 12 then
                                    local ew = ev.Unit
                                    local ex = Vector3.new(- ew.Z, 0, ew.X) em = math.min(dF, ej * 0.3)
                                    local ey =
                                    if ej < dH then
                                        em *(ej / dH)
                                        else
                                        em d4.zigT =(d4.zigT or 0) + eu
                                        local ez = ey * math.sin(d4.zigT / dG * 3.141592653589793 * 2)
                                        local eA = ez -(d4.zigLast or 0) d4.zigLast = ez
                                        local eB = ei + ex * eA
                                        if not d4.zigLaneMin then
                                        d4.zigLaneMin, d4.zigLaneMax = dN()
                                    end
                                    local eC = math.clamp(eB.Z, d4.zigLaneMin, d4.zigLaneMax) ei =
                                    if eC ~= eB.Z then
                                        Vector3.new(eB.X, eB.Y, eC)
                                        else
                                        eB
                                        else
                                        d4.zigLast = 0
                                    end
                                    else
                                    d4.zigLast = 0
                                end
                            end
                            local ev =(ei - ef) / ep dR:_syncHoverPad(ei) dX.CFrame = CFrame.lookAt(ei, ei + es) dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(ei)
                            if not dh(dY, dX, ec, ev) then
                                dg(dY, dX, ec) dh(dY, dX, ec, ev)
                            end
                        end
                        )
                    end
                    )
                end
                cU._reStealDroppedEgg =
                function(dR, dS)
                if type(dS) ~= 'string' then
                    dR:_finish('Egg lost \226\128\148 retrying')
                    return
                    elseif
                    dS == '' then
                        dR:_finish('Egg lost \226\128\148 retrying')
                        return
                    end
                    if dR:isSkippedEgg(dS) then
                        return
                    end
                    if dR.tweenRecoveryUid == dS then
                        dR.running = false dR.activeTarget = nil dR:_releaseOperation() dR:_scheduleMovementRetry()
                        return
                    end
                    local dT = dR:_claimCarryWorker('re-steal', dS)
                    if not dT then
                        return
                    end
                    if l.__SenaV4GodMode then
                        l.__SenaV4GodMode:startDefend(dS)
                    end
                    local dU = os.clock() + 5 dR:_setStatus('Re-stealing dropped egg')
                    local dV
                    while dR:_isCarryWorkerCurrent(dT) and os.clock() < dU do
                        local dW = bI.ReadFieldEgg(dS) or dR.records[dS]
                        if dW then
                            if dW.State == bP.States.Dropped then
                                dV = dW
                                break
                                elseif
                                dW.State == bP.States.Slot then
                                    dV = dW
                                    break
                                end
                            end
                            task.wait(0.03)
                        end
                        if not dR:_isCarryWorkerCurrent(dT) then
                            return
                        end
                        if
                        if dV then
                            not dR:_wallOpen()
                            else
                            not dV then
                                dR:_releaseCarryWorker(dT) dR:_finish('Egg lost \226\128\148 retrying')
                                return
                            end
                            dR:_cancelTween('Re-stealing dropped egg', true)
                            local dW = bH.Character
                            local dX = dW and dW:FindFirstChild('HumanoidRootPart')
                            local dY = dW and dW:FindFirstChildOfClass('Humanoid') dU = dR:_resolveEggDestination(dV, dX, dY)
                            local dZ = dU and dR:_resolveElevatedDestination(dX, dU) or nil
                            if not dZ then
                                dR:_releaseCarryWorker(dT) dR:_finish('Character unavailable')
                                return
                            end
                            dR.running = true dR.activeTarget = dV dR:_setStatus('Bringing egg home')
                            if dR:_regrabBurst(dT, dV.Uid, 3.5) then
                                return
                                elseif
                                not dR:_isCarryWorkerCurrent(dT) then
                                    return
                                end
                                dR:_setStatus('Re-stealing egg')
                                if not dR:_teleportRoot(dX, dY, dZ) then
                                    dR:_releaseCarryWorker(dT) dR:_finish('Re-steal failed \226\128\148 retrying')
                                    return
                                end
                                dR:_setArrivalHold(dZ, dV.Uid) dR:_setStatus('Re-stealing egg')
                                if dR:_isCarryWorkerCurrent(dT) then
                                    dR:_requestCarry(dV, true)
                                end
                            end
                            cU._regrabBurst =
                            function(dR, dS, dT, dU)
                            local function dV()
                            local dW = bI.ReadFieldEgg(dT)
                            return dW ~= nil and dW.State == bP.States.Carried and dW.CarrierUserId == bH.UserId
                        end
                        local dW pcall(
                        function() dW = require(bF.Shared.Modules.RagdollJoints)
                    end
                    )
                    local dX = false
                    local dY = false
                    local dZ = os.clock() + dU
                    while os.clock() < dZ and not dR.destroyed and(dR.enabled or dR._externalDeliver) do
                        if dV() then
                            return true
                        end
                        if not dR:_isCarryWorkerCurrent(dS) then
                            return(dV())
                        end
                        local d_ = bI.ReadFieldEgg(dT)
                        if d_ then
                            if d_.State ~= bP.States.Dropped and d_.State ~= bP.States.Slot then
                                return false
                            end
                            else
                            return false
                        end
                        local d0 = bH.Character
                        local d1 = d0 and d0:FindFirstChild('HumanoidRootPart')
                        local d2 = d0 and d0:FindFirstChildOfClass('Humanoid')
                        if d1 then
                            if not d2 then
                                return false
                            end
                            else
                            return false
                        end
                        pcall(
                        function()
                        if dW and dW.Release then
                            dW.Release(d0)
                        end
                        d2.PlatformStand = false d2.Sit = false
                        if d2:GetState() ~= Enum.HumanoidStateType.Running then
                            d2:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end
                    )
                    local d3 = dR:_resolveEggDestination(d_, d1, d2)
                    if d3 then
                        d1.CFrame = d3 d1.AssemblyLinearVelocity = Vector3.new(0, 0, 0) d1.AssemblyAngularVelocity = Vector3.new(0, 0, 0) dR:_syncHoverPad(d3.Position)
                    end
                    if not dX then
                        dX = true task.spawn(
                        function() pcall(
                        function() bO.AskFieldEggCarry:InvokeServer({Uid = dT})
                    end
                    ) dX = false
                end
                )
            end
            if not dY then
                dY = true task.spawn(
                function() pcall(bI.CarryFieldEgg, dT) dY = false
            end
            )
        end
        pcall(
        function()
        local d4 = workspace:FindFirstChild('AreaEggSlotsClient')
        local d5 = d4 and d4:FindFirstChild(tostring(dT))
        local d6 = d5 and(d5:FindFirstChild('CarryAreaEgg', true) or d5:FindFirstChildWhichIsA('ProximityPrompt', true))
        if d6 and(d6.Enabled and type(fireproximityprompt) == 'function') then
            d6.HoldDuration = 0 d6.RequiresLineOfSight = false fireproximityprompt(d6, 0)
        end
    end
    ) task.wait(0.06)
end
return(dV())
end
cU._recoverCarryConfirmationTimeout =
function(dR, dS, dT)
if dR.destroyed then
    return false
    elseif
    dR.enabled then
        if dR.carryAttemptToken ~= dS then
            return false
            elseif
            dR:_hasConfirmedCarry(dT) then
                return false
            end
            else
            return false
        end
        local dU = bH.Character
        local dV = dU and dU:FindFirstChild('HumanoidRootPart') dS = dV and dR:_resolveSafeCFrame(dV)
        local dW = dS and dR:_resolveElevatedDestination(dV, dS) or nil dR.carryTimeouts = dR.carryTimeouts or{}
        local dX =(dR.carryTimeouts[dT] or 0) + 1
        local dY = dX >= cE
        if dY then
            dR.carryTimeouts[dT] = nil dR.skippedEggs[dT] = os.clock() + cF dR.tweenRecoveryUid = nil
            else
            dR.carryTimeouts[dT] = dX
            local dZ = dR:_isPrimerEgg(dT) dR.tweenRecoveryUid =(
            if dZ then
                not dZ
                else
                dT) or nil
            end
            local dZ = dR.stats.lastCarryReject
            if type(dZ) == 'string' and dZ:lower():find('inventory is full', 1, true) then
                dR.eggFullCount = dR:_eggCount() or 1 / 0
            end
            local d_ = dR.records[dT] or bI.ReadFieldEgg(dT)
            local d0 = dR.config.stealMode == 'Instant' and(dT == dR.primerUid or type(d_) == 'table' and d_.AreaId == 'Forest') dR.carry.generation += 1 dR:_invalidateCarryWorker() dR.carryAttemptToken = nil dR:_clearArrivalHold(dT)
            if dR.activeTween and dR.activeTween.Cancel then
                pcall(dR.activeTween.Cancel, dR.activeTween)
            end
            dR.activeTween = nil dR.running = true dR.activeTarget = nil dR.stats.lastResult = 'Carry confirmation timeout'
            if dV and dW then
                pcall(
                function() dV.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dV.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
            ) dR:_setStatus('Carry timeout - returning to safe area') pcall(dR._glideRoot, dR, dW,
            function()
            return dR.destroyed or not dR.enabled
        end
        )
        if dY then
            dR:_setStatus(dZ and 'Carry refused ('..dZ..') \226\128\148 skipping egg' or 'Carry timed out twice \226\128\148 skipping egg')
            else
            dR:_setStatus('Carry timeout \226\128\148 retrying')
        end
        else
        dR:_setStatus('Carry timeout \226\128\148 safe area unavailable')
    end
    dR.running = false dR:_releaseOperation()
    if d0 then
        dR.running = true
    end
    task.delay(0.35,
    function()
    if d0 then
        if not dR.destroyed and dR.enabled then
            dR:_setStatus('Retrying steal') pcall(dR._treadmillReset, dR,
            function()
            return dR.destroyed or not dR.enabled
        end
        )
    end
    dR.running = false
end
if not dR.destroyed and(dR.enabled and dR.carryAttemptToken == nil) then
    dR:_schedule()
end
end
)
return true
end
cU._requestCarry =
function(dR, dS, dT)
if not dR:_wallOpen() then
    dR:_finish('Wall closed before carry')
    return
end
local dU, dV, dW = dS.Uid,{} dR.stats.lastCarryReject = nil
local dX = dR.instantPhase == 'priming' and dU == dR.primerUid and cD or math.max(cD, dR:_resolveSettleSeconds(dS) + 3) dR.carryAttemptToken = dV dR.stats.lastResult = 'Carry requested' dR:_setStatus('Securing egg') dS = bH.Character
local dY = dS and dS:FindFirstChildOfClass('Humanoid')
if dY then
    pcall(dY.UnequipTools, dY)
end
if dR.coordinator then
    local dZ = os.clock() + 0.35
    while dR.coordinator:isBackgroundBusy() and not dR.destroyed and dR.enabled and dR.carryAttemptToken == dV and os.clock() < dZ do
        task.wait(0.02)
    end
    if dY and dY.Parent then
        pcall(dY.UnequipTools, dY)
    end
end
task.spawn(
function()
while true do
    local dZ = dR.destroyed
    if not((
    if dZ then
        not dZ
        else
        dR.enabled) and dR.running and dR.carryAttemptToken == dV and dR.activeTarget and dR.activeTarget.Uid == dU) then
            break
        end
        if not dR:_hasConfirmedCarry(dU) and dR:_recordShowsCarried(dU) then
            dR:_adoptCarryFromRecord(dU)
        end
        if dR:_hasConfirmedCarry(dU) then
            if dR:_recordShowsCarried(dU) then
                dR:_clearArrivalHold(dU) dR.carryAttemptToken = nil
                if dR.activeTween then
                    pcall(dR.activeTween.Cancel, dR.activeTween) dR.activeTween = nil
                end
                if dR.instantPhase == 'priming' and dU == dR.primerUid then
                    dR.carry.active = true dR.carry.uid = dU dR.stats.lastResult = 'Preparing steal' dR:_enterBaitWait()
                    return
                end
                dR.carry.active = true dR.carry.uid = dU dR.stats.lastResult = 'Carry confirmed' dR:_setStatus('Carry confirmed') task.defer(
                function()
                if not dR.destroyed and(dR.enabled and dR:_hasConfirmedCarry(dU)) then
                    dR:_returnToSafe()
                end
            end
            )
            return
        end
        dR:_setStatus('Confirming carry record') task.wait(cC)
        continue
    end
    if dW and os.clock() >= dW then
        dR:_recoverCarryConfirmationTimeout(dV, dU)
        return
    end
    if not dR:_wallOpen() then
        dR:_finish('Wall closed before carry')
        return
    end
    local d_ = bI.ReadFieldEgg(dU) or dR.records[dU]
    if not d_ then
        dR:_finish('Target unavailable')
        return
    end
    if d_.State == bP.States.Carried then
        if d_.CarrierUserId == bH.UserId then
            dR:_setStatus('Confirming carry state') task.wait(cC)
            continue
        end
        dR:_finish('Egg carried by another player')
        return
    end
    if d_.State ~= bP.States.Slot and d_.State ~= bP.States.Dropped then
        dR:_finish('Target changed')
        return
    end
    local d0 = bH.Character
    local d1 = d0 and d0:FindFirstChild('HumanoidRootPart')
    if not d1 then
        dR:_finish('Character unavailable')
        return
    end
    local d2 = d0 and d0:FindFirstChildOfClass('Humanoid')
    if not d2 then
        dR:_finish('Character unavailable')
        return
    end
    local d3 = dR:_resolveEggDestination(d_, d1, d2)
    local d4 = d3 and dR:_resolveElevatedDestination(d1, d3) or nil
    if not d4 then
        dR:_finish('Character unavailable')
        return
    end
    local d5 = d4.Position
    if(d1.Position - d5).Magnitude > cG then
        if dT then
            dR:_setStatus('Re-stealing egg')
            if not dR:_teleportRoot(d1, d2, d4) then
                dR:_finish('Re-steal failed \226\128\148 retrying')
                return
            end
            dR:_setArrivalHold(d4, dU) dR:_setStatus('Re-stealing egg')
            else
            dR:_setStatus('Re-approaching egg')
            local d6 = false dR:_tweenRoot(d3,
            function() d6 = true
            if dR.carryAttemptToken == dV and not dR:_hasConfirmedCarry(dU) then
                dR:_setStatus('Securing egg')
            end
        end
        , nil,{holdAfterArrival = true, holdUid = dU, flightProfile = true})
        while true do
            local d7 = dR.destroyed
            if not((
            if d7 then
                not d7
                else
                dR.enabled) and dR.carryAttemptToken == dV and not dR:_hasConfirmedCarry(dU) and not d6) then
                    break
                end
                task.wait(cC)
            end
            continue
        end
    end
    local d6 = bQ.LooksLikeFirstAreaUid(d_.Uid) and bQ.SlotKey(d_.AreaId, d_.NestId) or nil d1, d0, d5 = pcall(cW, d_.Uid, d6)
    local d7 =
    if d1 then
        if d0 == true then
            nil
            else
            d5
            else
            tostring(d0)
            if d7 then
                dR.stats.lastCarryReject = d7
                if d7 ~= dR._lastCarryRejectLogged then
                    dR._lastCarryRejectLogged = d7 warn('[Sena Steal] carry refused: '..d7)
                end
            end
            dW = dW or os.clock() + dX dR.stats.lastResult = 'Carry requested' dR:_setStatus(d7 and 'Waiting for carry \194\183 '..d7 or 'Waiting for carry confirmation') task.wait(cC)
        end
    end
    )
end
cU._burstHold =
function(dR, dS, dT)
if typeof(dS) ~= 'CFrame' then
    return false
end
local dU = dS.Position
local function dV()
local dW = bH.Character
return dW and dW:FindFirstChild('HumanoidRootPart')
end
local function dW(dX) dX.CFrame = dS dX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dX.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
local dX = os.clock() + cr
while os.clock() < dX do
    if dT and dT() then
        return false
    end
    local dY = dV()
    if dY then
        if not dY.Parent then
            return false
        end
        else
        return false
    end
    pcall(dW, dY) bG.Heartbeat:Wait()
end
local dY, dZ = os.clock() + cs
while os.clock() < dY do
    if dT and dT() then
        return false
    end
    dX = dV()
    if dX then
        if not dX.Parent then
            return false
        end
        else
        return false
    end
    if(dX.Position - dU).Magnitude > ct then
        dZ = nil
        else
        if dZ then
            if os.clock() - dZ >= cu then
                return true
            end
            else
            dZ = os.clock()
        end
    end
    pcall(dW, dX) bG.Heartbeat:Wait()
end
local d_ = dV()
return d_ ~= nil and(d_.Position - dU).Magnitude <= ct
end
local dR ={['Titan Temple'] = true,['Light Dark'] = true,['Enchanted Forest'] = true,['Cherry Blossom'] = true, Cosmic = true, Prehistoric = true,['Abyss Ocean'] = true,
Volcano = true, Snow = true, Jungle = true, Desert = true, Lake = true}
local dS = 200
local dT = 5000 cU._usesPortalBoost =
function(dU, dV)
return aB.LowSpeedBoost == true and dU.config.stealMode == 'Instant' and type(dV) == 'table' and dR[dV.AreaId] ~= nil and not(dU.portalBoostFailed and(dU.portalBoostFailed[dV.Uid] or 0) > os.clock())
end
local function dU(dV, dW)
local dX = k()
local dY = dX and dX:FindFirstChild('Build')
local dZ = dY and dY:FindFirstChild(dV)
if not dZ then
    return nil
end
local d_ = dW and dZ:FindFirstChild(dW) or dZ:FindFirstChildWhichIsA('BasePart', true)
return d_ and d_:IsA('BasePart') and d_ or nil
end
local function dV()
local dW = bH:GetAttribute('RagdollEndTime')
if type(dW) ~= 'number' then
    return 0
end
return math.max(dW + 0.15 - workspace:GetServerTimeNow(), 0)
end
local function dW(dX)
local dY
if type(dX) == 'string' then
    local dZ, d_ = pcall(
    function()
    return game:GetService('HttpService'):JSONDecode(dX)
end
) dY = dZ and d_ or nil
else
dY = dX
end
if type(dY) ~= 'table' then
    return nil
end
local dZ = dY.Arguments
local d_ = type(dZ) == 'table' and type(dZ[3]) == 'number' and Vector3.new(dZ[1], dZ[2], dZ[3]) or nil
return dY.Action, d_
end
cU._watchRelocates =
function(dX)
if dX._relocateConn then
    return
end
local dY = bN.RigSync and bN.RigSync.Refresh
if not dY then
    return
end
dX._relocateCount = 0 dX._relocateConn = dY.OnClientEvent:Connect(
function(dZ)
if dW(dZ) == 'Relocate' then
    dX._relocateCount =(dX._relocateCount or 0) + 1 dX._relocateAt = os.clock()
end
end
)
end
cU._guardLagback =
function(dX, dY)
local dZ = bN.RigSync and bN.RigSync.Refresh
if not dZ then
    return
end
if not dY then
    for d_, d0 in ipairs(dX._lagbackHooks or{}) do
        pcall(d0.forward.Disconnect, d0.forward) pcall(d0.connection.Enable, d0.connection)
    end
    dX._lagbackHooks = nil
    return
end
if dX._lagbackHooks then
    return
    elseif
    type(getconnections) ~= 'function' then
        return
    end
    local d_ ={} dX._lagbackHooks = d_
    local d0, d1 = pcall(getconnections, dZ.OnClientEvent)
    for d2, d3 in ipairs(d0 and type(d1) == 'table' and d1 or{}) do
        local d4 = d3.Function
        if type(d4) == 'function' then
            d2, dX = pcall(debug.info, d4, 's')
            if d2 and(tostring(dX):find('ContentCatalog', 1, true) and(type(d3.Disable) == 'function' and pcall(d3.Disable, d3))) then
                local function d5(d6,...)
                local d7, d8 = dW(d6)
                if d7 == 'Relocate' and(d8 and d8.Y < dT) then
                    return
                end
                d4(d6,...)
            end
            local d6 = dZ.OnClientEvent:Connect(d5) table.insert(d_,{connection = d3, forward = d6})
        end
    end
end
end
cU._crossPortal =
function(dX, dY, dZ, d_) dX = bH.Character
local d0 = dX and dX:FindFirstChild('HumanoidRootPart')
if not dY or not d0 then
    return false
    elseif
    type(firetouchinterest) ~= 'function' then
        return false
    end
    local d1 = d0.Position
    local d2 = os.clock() +(d_ or 8)
    local d3 = d2 + 6
    local d4 = 0
    while os.clock() < d2 do
        if dZ and dZ() then
            return false
        end
        local d5 = bH.Character d0 = d5 and d5:FindFirstChild('HumanoidRootPart')
        if not d0 then
            return false
        end
        if(d0.Position - d1).Magnitude >= dS then
            if d1.Y > dT ~=(d0.Position.Y > dT) then
                return true
            end
            d1 = d0.Position
        end
        local d6 = dV()
        if d6 > 0 then
            d2 = math.min(math.max(d2, os.clock() + d6 + 1), d3)
            else
            if os.clock() - d4 >= 0.1 then
                d4 = os.clock() pcall(
                function() firetouchinterest(d0, dY, 0) task.wait() firetouchinterest(d0, dY, 1)
            end
            )
        end
    end
    task.wait(0.05)
end
return false
end
cU._mutePortalFx =
function(dX, dY, dZ)
local d_ = bN.FuseBiome and bN.FuseBiome.PortalTransition
if not d_ then
    return
end
if dY then
    dX._portalFxMuteCount =(dX._portalFxMuteCount or 0) + 1
    if dX._portalFxMuted then
        return
        elseif
        type(getconnections) ~= 'function' then
            return
        end
        dX._portalFxMuted ={}
        local d0, d1 = pcall(getconnections, d_.OnClientEvent)
        for d2, d3 in ipairs(d0 and type(d1) == 'table' and d1 or{}) do
            local d4 = d3.Function
            if type(d4) == 'function' then
                local d5, d6 = pcall(debug.info, d4, 's')
                if d5 and(tostring(d6):find('FuseBiomePortalController', 1, true) and(type(d3.Disable) == 'function' and pcall(d3.Disable, d3))) then
                    table.insert(dX._portalFxMuted, d3)
                end
            end
        end
        if # dX._portalFxMuted > 0 then
            dX._portalFxHandshake = d_.OnClientEvent:Connect(
            function(d4, d5, d6)
            if d5 ~= nil and not d6 then
                pcall(
                function() d_:FireServer(d5)
            end
            )
        end
    end
    )
end
dX:_filterPortalToasts(true)
else
dX._portalFxMuteCount = dZ and 0 or math.max((dX._portalFxMuteCount or 0) - 1, 0)
if dX._portalFxMuteCount > 0 then
    return
end
dX:_filterPortalToasts(false, dZ)
for d0, d1 in ipairs(dX._portalFxMuted or{}) do
    pcall(d1.Enable, d1)
end
dX._portalFxMuted = nil
if dX._portalFxHandshake then
    pcall(dX._portalFxHandshake.Disconnect, dX._portalFxHandshake) dX._portalFxHandshake = nil
end
end
end
local dX ={{'Toasts', 'Line'},{'Alerts', 'Raise'}} cU._filterPortalToasts =
function(dY, dZ, d_)
if dZ then
    dY._portalToastUntil = 1 / 0
    if dY._portalToastHooks then
        return
        elseif
        type(getconnections) ~= 'function' then
            return
        end
        local d0 ={} dY._portalToastHooks = d0
        for d1, d2 in ipairs(dX) do
            local d3, d4 = pcall(
            function()
            return bN[d2[1]][d2[2]]
        end
        )
        local d5 =
        if d3 then
            d4
            else
            nil d1, d3 = false
            if d5 then
                d1, d3 = pcall(getconnections, d5.OnClientEvent)
            end
            for d6, d7 in ipairs(d1 and type(d3) == 'table' and d3 or{}) do
                local d8 = d7.Function
                if type(d8) == 'function' and(type(d7.Disable) == 'function' and pcall(d7.Disable, d7)) then
                    local function d9(ea,...)
                    local eb = type(ea) == 'table' and(ea.Body or ea.Text)
                    if type(eb) == 'string' and(eb:lower():find('portal', 1, true) and os.clock() <(dY._portalToastUntil or 0)) then
                        return
                    end
                    d8(ea,...)
                end
                local ea = d5.OnClientEvent:Connect(d9) table.insert(d0,{connection = d7, forward = ea})
            end
        end
    end
    return
end
local function d0()
local d1 = dY._portalToastHooks dY._portalToastHooks = nil
for d2, d3 in ipairs(d1 or{}) do
    pcall(d3.forward.Disconnect, d3.forward) pcall(d3.connection.Enable, d3.connection)
end
end
if d_ then
    d0()
    return
end
local d1 = os.clock() + 2 dY._portalToastUntil = d1 task.delay(2.1,
function()
if dY._portalToastUntil == d1 then
    local d2 = dY._portalFxMuteCount
    if d2 then
        if d2 == 0 then
            d0()
        end
        else
        d0()
    end
end
end
)
end
cU._portalBoostSteal =
function(dY, dZ) dY:_mutePortalFx(true) dY._boostHopUid = dZ.Uid
local d_, d0 = pcall(dY._portalBoostHop, dY, dZ) dY:_guardLagback(false)
if dY._boostHopUid == dZ.Uid then
    dY._boostHopUid = nil
end
if dY._treeHopUid == dZ.Uid then
    dY._treeHopUid = nil
end
dY:_mutePortalFx(false) dY:_muteTreeFx(false)
if not d_ then
    warn('[Sena Steal] steal error: '..tostring(d0))
    if not dY.destroyed and dY.enabled then
        dY:_finish('Steal error \226\128\148 retrying')
    end
end
end
cU._muteTreeFx =
function(dY, dZ)
if type(getconnections) ~= 'function' then
    return
end
if dZ then
    dY._treeFxToken =(dY._treeFxToken or 0) + 1
    if dY._treeFxMuted then
        return
    end
    dY._treeFxMuted ={}
    local d_ = bN.EnchantedTree and bN.EnchantedTree.Transition
    for d0, d1 in ipairs({{d_ and d_.OnClientEvent, 'EnchantedTreeController'},{bH:GetAttributeChangedSignal('InEnchantedTree'), 'EnchantedTreeController'}}) do
        d0, d_ = false
        if d1[1] then
            d0, d_ = pcall(getconnections, d1[1])
        end
        for d2, d3 in ipairs(d0 and type(d_) == 'table' and d_ or{}) do
            local d4 = d3.Function
            if type(d4) == 'function' then
                local d5, d6 = pcall(debug.info, d4, 's')
                if d5 and(tostring(d6):find(d1[2], 1, true) and(type(d3.Disable) == 'function' and pcall(d3.Disable, d3))) then
                    table.insert(dY._treeFxMuted, d3)
                end
            end
        end
    end
    else
    if not dY._treeFxMuted then
        return
    end
    local d_ = dY._treeFxToken task.spawn(
    function()
    local d0 = os.clock() + 12
    while os.clock() < d0 and(bH:GetAttribute('InEnchantedTree') == true or dY._treePromptAt and os.clock() - dY._treePromptAt < 2.5) do
        task.wait(0.1)
    end
    task.wait(1.5)
    if dY._treeFxToken ~= d_ then
        return
    end
    for d1, d2 in ipairs(dY._treeFxMuted or{}) do
        pcall(d2.Enable, d2)
    end
    dY._treeFxMuted = nil
end
)
end
end
cU._isStealPrompt =
function(dY, dZ)
if typeof(dZ) ~= 'Instance' then
    return false
end
if dZ.Name == 'EnchantedTreePrompt' then
    return true
end
local d_ = workspace:FindFirstChild('AreaEggSlotsClient')
if d_ and dZ:IsDescendantOf(d_) then
    return true
end
if dZ:FindFirstAncestor('FuseBiomeLanePortals') then
    return true
    elseif
    dZ:FindFirstAncestor('FuseBiomeZone') then
        return true
    end
    return false
end
cU._installPromptFilter =
function(dY)
if dY._promptFilter then
    return
    elseif
    type(getconnections) ~= 'function' then
        return
    end
    local dZ ={muted ={}, forwarders ={}} dY._promptFilter = dZ
    local function d_()
    local d0 = dY.destroyed
    return
    if d0 then
        not d0
        else
        dY.enabled or dY._externalDeliver or dY._recalling or dY._treeFxMuted ~= nil
    end
    for d0, d1 in ipairs({f.PromptShown, f.PromptHidden}) do
        local d2, d3 = pcall(getconnections, d1)
        for d4, d5 in ipairs(d2 and type(d3) == 'table' and d3 or{}) do
            local d6 = d5.Function
            if type(d6) == 'function' then
                d0, d4 = pcall(debug.info, d6, 's')
                if d0 and(tostring(d4):find('ProximityPromptScriptController', 1, true) and(type(d5.Disable) == 'function' and pcall(d5.Disable, d5))) then
                    table.insert(dZ.muted, d5) table.insert(dZ.forwarders, d1:Connect(
                    function(d7,...)
                    if d_() and dY:_isStealPrompt(d7) then
                        return
                    end
                    d6(d7,...)
                end
                ))
            end
        end
    end
end
pcall(
function()
local d2 = workspace:FindFirstChild('World') and workspace.World:FindFirstChild('Machines')
local d3 = d2 and d2:FindFirstChild('FuseMachine')
local d4 = d3 and d3:FindFirstChildWhichIsA('ProximityPrompt', true)
if not d4 then
    return
end
local d5, d6 = pcall(getconnections, d4.Triggered)
for d7, d8 in ipairs(d5 and type(d6) == 'table' and d6 or{}) do
    local d9 = d8.Function
    if type(d9) == 'function' and(type(d8.Disable) == 'function' and pcall(d8.Disable, d8)) then
        table.insert(dZ.muted, d8) table.insert(dZ.forwarders, d4.Triggered:Connect(
        function(...)
        if d_() then
            return
        end
        d9(...)
    end
    ))
end
end
end
)
end
cU._removePromptFilter =
function(dY)
local dZ = dY._promptFilter
if not dZ then
    return
end
dY._promptFilter = nil
for d_, d0 in ipairs(dZ.forwarders) do
    pcall(d0.Disconnect, d0)
end
for d1, d2 in ipairs(dZ.muted) do
    pcall(d2.Enable, d2)
end
end
cU._leaveTreeHidden =
function(dY, dZ)
local d0 = k()
local d1 = d0 and d0:FindFirstChild('Build') d0 = d1 and d1:FindFirstChild('EnchantedTreeInterior')
local d2 = d0 and d0:FindFirstChild('Markers')
local d3 = d2 and d2:FindFirstChild('ExitTrigger')
local d4 = os.clock() + 2.5
while bH:GetAttribute('InEnchantedTree') ~= true and dY._treePromptAt and os.clock() - dY._treePromptAt < 2.5 and os.clock() < d4 do
    task.wait(0.05)
end
local d5 = os.clock() + 10
while bH:GetAttribute('InEnchantedTree') == true and os.clock() < d5 do
    if dZ and dZ() then
        break
    end
    local d6 = bH.Character
    local d7 = d6 and d6:FindFirstChild('HumanoidRootPart')
    if d7 and d3 then
        pcall(firetouchinterest, d7, d3, 0) task.wait() pcall(firetouchinterest, d7, d3, 1)
    end
    task.wait(0.2)
end
return bH:GetAttribute('InEnchantedTree') ~= true
end
cU._usesTreeBoost =
function(dY, dZ)
return false
end
cU._treeBoostHop =
function(dY, dZ)
local d0 = dZ.Uid
local d1 = k()
local d2 = d1 and d1:FindFirstChild('Build')
local d3 = d2 and d2:FindFirstChild('EnchantedTreeInterior')
local d4 = d3 and d3:FindFirstChild('Markers')
local d5 = d4 and d4:FindFirstChild('EnterTrigger')
local d6 = d5 and d5:FindFirstChild('EnchantedTreePrompt', true)
local d7 = d4 and d4:FindFirstChild('ExitTrigger')
local function d8()
return dY.destroyed or not dY.enabled or dY.instantPhase ~= 'hunting' or not dY.activeTarget or dY.activeTarget.Uid ~= d0
end
local function d9()
local ea = bH.Character
return ea and ea:FindFirstChild('HumanoidRootPart'), ea and ea:FindFirstChildOfClass('Humanoid')
end
local function ea()
return bH:GetAttribute('InEnchantedTree') == true
end
local function eb()
local ec = os.clock() + 8
while ea() and os.clock() < ec do
    local ed = d9()
    if ed and d7 then
        pcall(firetouchinterest, ed, d7, 0) task.wait() pcall(firetouchinterest, ed, d7, 1)
    end
    task.wait(0.2)
end
return not ea()
end
local function ec(ed) eb()
if d8() then
    return
end
dY.treeBoostFailed = dY.treeBoostFailed or{} dY.treeBoostFailed[d0] = os.clock() + 60 dY:_finish(ed)
end
d2, dZ = d9()
if d6 and d7 then
    if d2 then
        if not dZ then
            ec('Steal unavailable \226\128\148 retrying')
            return
        end
        else
        ec('Steal unavailable \226\128\148 retrying')
        return
    end
    else
    ec('Steal unavailable \226\128\148 retrying')
    return
end
local ed = d6.Parent
local ee = ed and(ed:IsA('Attachment') and ed.WorldPosition or ed:IsA('BasePart') and ed.Position)
if not ee then
    ec('Steal unavailable \226\128\148 retrying')
    return
end
ed = os.clock() + 4
while dV() > 0 and os.clock() < ed do
    if d8() then
        return
    end
    task.wait(0.05)
end
dY:_clearArrivalHold(d0) dY:_stopHoverPad() dY:_setStatus('Heading to target egg') dY._treeHopUid = d0 dY:_muteTreeFx(true) dY:_teleportRoot(d2, dZ, CFrame.new(ee + Vector3.new(0,
1, 4)))
local ef =(tonumber(d6.HoldDuration) or 0) + 0.05
local eg = os.clock() + 6
while true do
    local eh = ea()
    if not(
    if eh then
        not eh
        else
        os.clock() < eg) then
            break
        end
        if d8() then
            return
        end
        pcall(
        function() d6.Enabled = true
    end
    ) dY._treePromptAt = os.clock() pcall(
    function() d6:InputHoldBegin() task.wait(ef) d6:InputHoldEnd()
end
)
if type(fireproximityprompt) == 'function' then
    pcall(fireproximityprompt, d6, ef)
end
task.wait(0.1)
end
if not ea() then
    ec('Could not reach the egg \226\128\148 retrying')
    return
end
dY:_setStatus('Securing target egg') task.wait(0.3)
if not eb() then
    ec('Could not reach the egg \226\128\148 retrying')
    return
end
if d8() then
    return
end
ed, dZ = d9()
if ed then
    if not dZ then
        ec('Character unavailable')
        return
    end
    else
    ec('Character unavailable')
    return
end
local eh = bI.ReadFieldEgg(d0) or dY.records[d0]
if eh then
    if eh.State ~= bP.States.Slot and eh.State ~= bP.States.Dropped then
        dY:_finish('Target egg no longer available')
        return
    end
    else
    dY:_finish('Target egg no longer available')
    return
end
local ei = dY:_resolveEggDestination(eh, ed, dZ)
if not ei then
    ec('Target destination unavailable')
    return
end
dY:_walkTo(ei, d8, 4)
if d8() then
    return
end
ed, dZ = d9()
local ej = not ed
if
if ed then
    not dZ
    else
    ej then
        ec('Could not reach the egg \226\128\148 retrying')
        return
        elseif
        (ed.Position - ei.Position).Magnitude > 25 then
            ec('Could not reach the egg \226\128\148 retrying')
            return
        end
        dY:_setArrivalHold(ei, d0) dY.boostedUid = d0 dY.treeBoostedUid = d0 task.spawn(
        function() pcall(
        function() bO.AskFieldEggCarry:InvokeServer({Uid = d0})
    end
    )
end
) dY:_setStatus('Securing target egg') dY:_requestCarry(eh, true)
end
cU._portalBoostHop =
function(dY, dZ)
local d0 = dZ.Uid
if dY:_usesTreeBoost(dZ) then
    return dY:_treeBoostHop(dZ)
end
local d1 = dU('FuseBiomeLanePortals')
local d2 = dU('FuseBiomeZone', 'ExitPart')
local function d3()
return dY.destroyed or not dY.enabled or dY.instantPhase ~= 'hunting' or not dY.activeTarget or dY.activeTarget.Uid ~= d0
end
local function d4()
local d5 = bH.Character
return d5 and d5:FindFirstChild('HumanoidRootPart'), d5 and d5:FindFirstChildOfClass('Humanoid')
end
local function d5()
local d6 = d4()
if d6 and d6.Position.Y > dT then
    dY:_crossPortal(d2, nil, 8)
end
end
local function d6(d7) d5()
if d3() then
    return
end
dY.portalBoostMisses = dY.portalBoostMisses or{}
local d8 =(dY.portalBoostMisses[d0] or 0) + 1 dY.portalBoostMisses[d0] = d8
if d8 >= 2 then
    dY.portalBoostMisses[d0] = nil dY.portalBoostFailed = dY.portalBoostFailed or{} dY.portalBoostFailed[d0] = os.clock() + 60
end
dY:_finish(d7)
end
local d7, d8 = d4()
if d1 then
    if not d2 then
        d6('Steal unavailable \226\128\148 retrying')
        return
        elseif
        d7 then
            if not d8 then
                d6('Steal unavailable \226\128\148 retrying')
                return
            end
            else
            d6('Steal unavailable \226\128\148 retrying')
            return
        end
        else
        d6('Steal unavailable \226\128\148 retrying')
        return
    end
    local d9 = dY:_resolveEggDestination(dZ, d7, d8)
    if not d9 then
        d6('Target destination unavailable')
        return
    end
    dY:_setStatus('Heading to target egg') dY:_guardLagback(true) bG.PreSimulation:Wait() d8.PlatformStand = true dY:_teleportRoot(d7, d8, d9) bG.PreSimulation:Wait() d8.PlatformStand = false
    local ea = 0.1 pcall(
    function() ea = bH:GetNetworkPing() or 0.1
end
) task.wait(math.clamp(0.15 + ea * 2.5, 0.3, 1))
if d3() then
    return
end
dY:_stopHoverPad() dY:_setStatus('Securing target egg')
local eb = dY:_crossPortal(d1, d3, 6) dY:_guardLagback(false)
if not eb then
    d6('Could not reach the egg \226\128\148 retrying')
    return
end
dY:_setStatus('Securing target egg')
if not dY:_crossPortal(d2, d3, 8) then
    d6('Could not reach the egg \226\128\148 retrying')
    return
end
if d3() then
    return
end
d8, d1 = d4()
if d8 then
    if not d1 then
        d6('Character unavailable')
        return
    end
    else
    d6('Character unavailable')
    return
end
if(d8.Position - d9.Position).Magnitude > 25 then
    d6('Could not reach the egg \226\128\148 retrying')
    return
end
local ec = bI.ReadFieldEgg(d0) or dY.records[d0]
if ec then
    if ec.State ~= bP.States.Slot and ec.State ~= bP.States.Dropped then
        dY:_finish('Target egg no longer available')
        return
    end
    else
    dY:_finish('Target egg no longer available')
    return
end
local ed = dY:_resolveEggDestination(ec, d8, d1) or d9 dY:_teleportRoot(d8, d1, ed) dY:_setArrivalHold(ed, d0) dY.boostedUid = d0 dY:_setStatus('Securing target egg') task.wait(0.35)
if d3() then
    return
end
task.spawn(
function() pcall(
function() bO.AskFieldEggCarry:InvokeServer({Uid = d0})
end
)
end
) dY:_requestCarry(ec, true)
end
cU._needsHiddenRecall =
function(dY)
if dY.destroyed then
    return false
end
local dZ = bH.Character
local d0 = dZ and dZ:FindFirstChild('HumanoidRootPart')
if not d0 then
    return false
end
if d0.Position.Y > dT then
    return true
end
if bH:GetAttribute('InEnchantedTree') == true then
    return true
end
if dY._treePromptAt and os.clock() - dY._treePromptAt < 2.5 then
    return true
end
if dY._treeHopUid ~= nil then
    return true
end
return dY.treadmillDecoy ~= nil and dY.treadmillDecoy.Parent ~= nil and not dY:_isInSafeArea(d0)
end
cU._finishBoostedEgg =
function(dY, dZ)
local d0 = bI.ReadFieldEgg(dZ) or dY.records[dZ]
if d0 then
    if d0.State ~= bP.States.Slot and d0.State ~= bP.States.Dropped then
        return false
    end
    else
    return false
end
local d1 = bH.Character
local d2 = d1 and d1:FindFirstChild('HumanoidRootPart')
local d3 = d1 and d1:FindFirstChildOfClass('Humanoid')
local d4 = d2 and d3 and dY:_resolveEggDestination(d0, d2, d3)
if d4 then
    if(d2.Position - d4.Position).Magnitude > 25 then
        return false
    end
    else
    return false
end
dY:_setArrivalHold(d4, dZ) dY:_setStatus('Finishing target egg')
local function d5()
local d6 = bI.ReadFieldEgg(dZ)
return d6 ~= nil and d6.State == bP.States.Carried and d6.CarrierUserId == bH.UserId
end
local d6 = os.clock() + 3 d4 = false
while(
if d4 then
    not d4
    else
    os.clock() < d6) and not dY.destroyed and not dY.enabled do
        task.spawn(
        function() pcall(
        function() bO.AskFieldEggCarry:InvokeServer({Uid = dZ})
    end
    )
end
)
local d7 = os.clock() + 0.25
while os.clock() < d7 do
    if d5() then
        d4 = true
        break
    end
    task.wait(0.03)
end
end
dY:_clearArrivalHold(dZ)
if d4 then
    if dY.destroyed then
        return false
        elseif
        dY.enabled then
            return false
        end
        else
        return false
    end
    dY.boostedUid = nil
    if not dY:deliverCarriedEgg(dZ, d0) then
        return false
    end
    local d7 = os.clock() + 30
    while dY._instantReturnToken ~= nil and os.clock() < d7 and not dY.destroyed do
        task.wait(0.1)
    end
    dY.boostedUid = nil
    local d8 = bI.ReadFieldEgg(dZ)
    local d9 = d8 == nil or d8.State == bP.States.Claimed or aB.HelpFriend and d8.State == bP.States.Dropped
    local ea = bH.Character
    local eb = ea and ea:FindFirstChild('HumanoidRootPart')
    return d9 and eb ~= nil and dY:_isInSafeArea(eb)
end
cU._finishTreeEgg =
function(dY, dZ)
local d0 = bI.ReadFieldEgg(dZ) or dY.records[dZ]
if d0 then
    if d0.State ~= bP.States.Slot and d0.State ~= bP.States.Dropped then
        return false
    end
    else
    return false
end
local d1 = bH.Character
local d2 = d1 and d1:FindFirstChild('HumanoidRootPart')
local d3 = d1 and d1:FindFirstChildOfClass('Humanoid')
local d4 = d2 and d3 and dY:_resolveEggDestination(d0, d2, d3)
if d4 then
    if(d2.Position - d4.Position).Magnitude > 400 then
        return false
    end
    else
    return false
end
dY:_setStatus('Finishing target egg')
local d5 = dY._externalDeliver dY._externalDeliver = true dY:_walkTo(d4,
function()
return dY.destroyed or dY.enabled
end
, 4) dY._externalDeliver = d5
if dY.destroyed then
    return false
    elseif
    dY.enabled then
        return false
    end
    dY.treeBoostedUid = dZ
    return dY:_finishBoostedEgg(dZ)
end
cU._recallHidden =
function(dY) dY._recalling = true
local dZ = dY._boostHopUid
local d0 = dY._treeHopUid task.spawn(
function()
local function d1()
return dY.destroyed or dY.enabled
end
local d2, d3 = pcall(
function() dY:_startMovementProtection() dY:_mutePortalFx(true)
local d2 = bH:GetAttribute('InEnchantedTree') == true or dY._treePromptAt ~= nil and os.clock() - dY._treePromptAt < 2.5
if d2 or d0 then
    dY:_muteTreeFx(true) dY:_setStatus('Finishing target egg')
    local d3 = dY:_leaveTreeHidden(d1) and not d1() and d0 ~= nil and dY:_finishTreeEgg(d0) dY:_muteTreeFx(false)
    if d3 then
        return
        elseif
        d1() then
            return
        end
    end
    local d3 = bH.Character
    local d4 = d3 and d3:FindFirstChild('HumanoidRootPart')
    local d5 =(
    if d2 then
        not d2
        else
        d4 ~= nil) and d4.Position.Y > dT
        if d5 then
            dY:_setStatus('Returning to safe area') dY:_crossPortal(dU('FuseBiomeZone', 'ExitPart'), d1, 8)
        end
        if d1() then
            return
        end
        if d5 and(dZ and dY:_finishBoostedEgg(dZ)) then
            return
        end
        local d6 = false
        local function d7()
        for d8, d9 in ipairs(bI.ReadFieldEggs().Records or{}) do
            if d9.State == bP.States.Carried and d9.CarrierUserId == bH.UserId then
                d6 = true
                break
            end
        end
    end
    pcall(d7)
    if d6 then
        pcall(bI.DropFieldEgg, 'PlayerRequest') task.wait(0.3)
    end
    local d8 = bH.Character
    local d9 = d8 and d8:FindFirstChild('HumanoidRootPart')
    if d9 and(not dY:_isInSafeArea(d9) and not d1()) then
        dY:_setStatus('Returning to safe area')
        local ea = dY:_resolveSafeCFrame(d9)
        local eb = dY._externalDeliver dY._externalDeliver = true
        if ea then
            dY:_glideRoot(ea, d1)
        end
        dY._externalDeliver = eb
        if not d1() then
            dY:_groundSnap()
        end
    end
end
)
if not d2 then
    warn('[Sena Steal] hidden recall error: '..tostring(d3))
end
dY:_mutePortalFx(false) dY._recalling = nil
if not dY.destroyed and not dY.enabled then
    dY:_hideTreadmillDecoy() dY:_removeGuardHitDistanceBoost() dY:_stopMovementProtection() c1(dY) dY:_setStatus('Idle')
end
end
)
end
cU._treadmillReset =
function(dY, dZ) dY._treadmillResetting = true
local d0, d1 = pcall(dY._treadmillResetInner, dY, dZ) dY._treadmillResetting = false
return d0 and d1
end
cU._treadmillResetInner =
function(dY, dZ)
local function d0()
return dZ ~= nil and dZ()
end
local d1 = bN and bN.Treadmill
if not d1 or d0() then
    return false
end
local function d2()
local d3, d4 = pcall(
function()
return d1.AskRenderSnapshot:InvokeServer()
end
)
if d3 then
    if type(d4) ~= 'table' then
        return nil
    end
    else
    return nil
end
return table.find(d4, bH.UserId) ~= nil
end
local d3 =(
function()
local d3, d4 = pcall(
function()
local d3 = type(bX.ResolveLocalSlot) == 'function' and bX.ResolveLocalSlot() or bX.GetMySlot()
local d4 = type(bX.ResolveFolder) == 'function' and bX.ResolveFolder() or bX.GetPlotsFolder()
local d5 = d4 and d3 and d4:FindFirstChild(tostring(d3))
local d6 = d5 and d5:FindFirstChild('TreadmillBottom')
if d6 then
    if not d6:IsA('BasePart') then
        return nil
    end
    else
    return nil
end
local d7 = bH.Character
local d8 = d7 and d7:FindFirstChild('HumanoidRootPart')
local d9 = d7 and d7:FindFirstChildOfClass('Humanoid')
if d8 then
    if not d9 then
        return nil
    end
    else
    return nil
end
local ea = d9.RigType == Enum.HumanoidRigType.R15 and d8.Size.Y * 0.5 + math.max(d9.HipHeight, 0.5) or d8.Size.Y * 0.5 + 2
return d6.CFrame * CFrame.new(0, d6.Size.Y * 0.5 + ea + 0.05, 0)
end
)
return d3 and d4 or nil
end
)()
if d3 then
    if d0() then
        return false
    end
    else
    return false
end
dY:_glideRoot(d3,
function()
return d0()
end
)
if d0() then
    return false
end
dY = os.clock() + 0.7 d3 = false
while true do
    local d4 = d0()
    if not(
    if d4 then
        not d4
        else
        os.clock() < dY) then
            break
        end
        pcall(
        function() d1.AskWearStill:InvokeServer()
    end
    ) task.wait(0.08)
    if d2() == true then
        d3 = true
        break
    end
end
if d3 then
    local d4 = os.clock() + 0.25
    while true do
        local d5 = d0()
        if not(
        if d5 then
            not d5
            else
            os.clock() < d4) then
                break
            end
            task.wait(0.05)
        end
    end
    local d4 = os.clock() + 0.7
    local d5 = false
    while true do
        local d6 = d0()
        if not(
        if d6 then
            not d6
            else
            os.clock() < d4) then
                break
            end
            pcall(
            function() d1.AskDoff:InvokeServer()
        end
        ) task.wait(0.08)
        if d2() == false then
            d5 = true
            break
        end
    end
    return d3 and d5
end
cU._instantReturn =
function(dY, dZ)
if dY._instantReturnToken ~= nil then
    return
end
local d0 ={} dY._instantReturnToken = d0 dY._flyDeparting = false
if dY.config.stealMode == 'Fly' then
    dY:_showTreadmillDecoy()
end
task.spawn(
function()
local function d1()
local d2 = dY.destroyed
return(
if d2 then
    not d2
    else
    dY.enabled or dY._externalDeliver) and dY._instantReturnToken == d0
end
local function d2()
local d3 = bH.Character
return d3 and d3:FindFirstChild('HumanoidRootPart'), d3 and d3:FindFirstChildOfClass('Humanoid')
end
local function d3()
return bI.ReadFieldEgg(dZ)
end
local function d4()
local d5 = d3()
return d5 ~= nil and d5.State == bP.States.Carried and d5.CarrierUserId == bH.UserId
end
local function d5()
local d6 = d3()
if not d6 then
    return true
end
return d6.State == bP.States.Claimed
end
local function d6()
local d7 = d2()
return d7 and dY:_resolveSafeCFrame(d7) or nil
end
local function d7(d8) dY.settleBonus = dY.settleBonus or{}
if d8 then
    dY.settleBonus[dZ] = nil
    elseif
    dY.config.stealMode == 'Instant' then
        if dY.boostedUid ~= dZ then
            local d9 = dY.settleBonus
            local ea ={seconds = cn} ea.untilAt, d9[dZ] = os.clock() + 300, ea
        end
    end
end
local function d8(d9)
if dY._instantReturnToken ~= d0 then
    return
end
d7(d9 == nil or d9 == 'Safe return complete') dY._instantReturnToken = nil dY._forestDropInProgress = nil
local ea = dY._externalDeliver dY._externalDeliver = nil
if dY.destroyed then
    return
end
if dY.enabled then
    dY:_reportStolen() dY:_finish(d9 or 'Safe return complete')
    elseif
    ea then
        dY:_reportStolen() dY.carry.active = false dY.carry.uid = nil dY.activeTarget = nil dY:_hideTreadmillDecoy()
    end
end
dY:_clearArrivalHold(dZ)
local d9 = dY.treeBoostedUid == dZ and(dY.treeRegrabMode or 'walk') or 'glide'
local function ea()
local eb = d2()
return eb ~= nil and dY:_isInSafeArea(eb)
end
local function eb(ec, ed, ee)
return dY:_walkTo(ec, ed, ee or 4)
end
local function ec(ed, ee, ef, eg)
local eh = d9 == 'walk' or eg == 'egg' and(d9 == 'glideSafe' or d9 == 'skipSafe') or eg == 'safe' and d9 == 'glideEgg'
if eh and eg == 'safe' then
    local function ei()
    return ee() or ea()
end
return dY:_walkTo(ed, ei, ef or 4)
end
if eh then
    return dY:_walkTo(ed, ee, ef or 4)
end
return dY:_glideRoot(ed, ee)
end
local ed = dY.config.stealMode == 'Fly' or dY.boostedUid == dZ and not aB.HelpFriend
local ee = dY.boostedUid == dZ and not aB.HelpFriend and 0.25 or ed and 0.15 or 0.3
local ef = ed and 0.45 or cm
local eg = d4()
if eg then
    else
    dY:_setStatus('Confirming carry record')
    local eh = os.clock() + 2.5
    while d1() and os.clock() < eh do
        eg = d4()
        if eg then
            break
        end
        local ei = d3()
        if ei and ei.State == bP.States.Claimed then
            break
        end
        bG.Heartbeat:Wait()
    end
    if not d1() then
        return
    end
end
if eg then
    dY._forestDropInProgress = dZ
    for eh = 1, cU.RELAY_ROUNDS, 1 do
        dY._forestDropInProgress = dZ dY:_setStatus('Bringing egg home') dY:_hopRoot(cp,
        function()
        local ei = d1()
        return
        if ei then
            not d4()
            else
            not ei
        end
        )
        if not d1() then
            return
        end
        ed = false
        for ei = 1, cl, 1 do
            if d1() then
                if not d4() then
                    break
                end
                else
                break
            end
            dY:_setStatus('Bringing egg home') dY:_hopRoot(cp,
            function()
            local ej = d1()
            return
            if ej then
                not d4()
                else
                not ej
            end
            )
            if not d1() then
                return
            end
            if d4() then
                task.wait(math.max(ee, dY:_relaySettle()))
                if not d1() then
                    return
                end
                if d4() then
                    pcall(bI.DropFieldEgg, 'PlayerRequest')
                end
                local ej = os.clock() + ef
                while d1() and d4() and os.clock() < ej do
                    bG.Heartbeat:Wait()
                end
            end
            local ej = d3()
            local ek = ed
            if ej and ej.State == bP.States.Dropped then
                ed = true
                break
            end
            if not d4() then
                ed = ek
                break
            end
        end
        if not d1() then
            return
        end
        if not ed then
            if dY._instantReturnToken == d0 then
                dY._instantReturnToken = nil
            end
            dY._forestDropInProgress = nil d7(false) dY:_finish('Drop failed \226\128\148 retrying')
            return
        end
        if aB.HelpFriend then
            dY.skippedEggs[dZ] = os.clock() + 1800 dY._forestDropInProgress = nil dY.carry.active = false dY.carry.uid = nil dY.stats.lastResult = 'Dropped for a friend' dY:_setStatus('Egg dropped for a friend, heading back')
            local ei = d6()
            if ei then
                dY:_glideRoot(ei,
                function()
                return not d1()
            end
            )
        end
        if not d1() then
            return
        end
        local ej = dY._externalDeliver dY._instantReturnToken = nil dY._externalDeliver = nil
        if dY.enabled then
            dY:_finish('Dropped for a friend')
            elseif
            ej then
                dY.activeTarget = nil dY:_hideTreadmillDecoy()
            end
            return
        end
        local ei, ej = os.clock() + 3
        while d1() and os.clock() < ei do
            local ek = d3()
            if ek and ek.State == bP.States.Dropped then
                local el = ek.BottomCFrame or ek.BoundsCFrame ej = el and el.Position
                if ej then
                    break
                end
                else
                if ek and ek.State ~= bP.States.Carried then
                    break
                end
            end
            task.wait(0.1)
        end
        if not d1() then
            return
        end
        dY._forestDropInProgress = nil
        if ej then
            dY:_noteRelayLanding((ej - cp.Position).Magnitude)
        end
        dY:_setStatus('Bringing egg home')
        local ek = d9 ~= 'skipSafe' and d6()
        if ek then
            ec(ek,
            function()
            return not d1()
        end
        , nil, 'safe')
    end
    if not d1() then
        return
    end
    local el = dY:_claimCarryWorker('instant-regrab', dZ)
    local em = ej and CFrame.new(ej + Vector3.new(0, 3.2, 0)) or cp
    local function en() ec(em,
    function()
    local eo = d1()
    return
    if eo then
        d4()
        else
        not eo
    end
    , 3, 'egg')
end
ei = false
if el then
    dY:_setStatus('Bringing egg home') en()
    if not d1() then
        return
    end
    ei = dY:_regrabBurst(el, dZ, 0.5)
    if not d1() then
        return
    end
    ei =
    if d4() then
        true
        else
        ei
        if ei then
            else
            if d4() then
                else
                if dY:_isCarryWorkerCurrent(el) then
                    dY:_setStatus('Bringing egg home')
                    local eo = d6()
                    if eo then
                        dY:_glideRoot(eo,
                        function()
                        return not d1()
                    end
                    )
                end
                if not d1() then
                    return
                end
                dY:_setStatus('Bringing egg home') dY:_treadmillReset(
                function()
                return not d1()
            end
            )
            if not d1() then
                return
            end
            dY:_setStatus('Bringing egg home') eo = d6()
            if eo then
                dY:_glideRoot(eo,
                function()
                return not d1()
            end
            )
        end
        if not d1() then
            return
        end
        if dY:_isCarryWorkerCurrent(el) then
            dY:_setStatus('Bringing egg home') en()
            if not d1() then
                return
            end
            local ep = dY:_regrabBurst(el, dZ, 0.6)
            if not d1() then
                return
            end
            ei = ep
        end
    end
end
end
end
if not ei and not d4() then
    d8(d5() and 'Safe return complete' or 'Re-grab failed \226\128\148 retrying')
    return
end
if ej ~= nil then
    if(ej - cp.Position).Magnitude > cU.RELAY_LAND_OK then
        if d4() then
            if eh >= cU.RELAY_ROUNDS then
                break
            end
            else
            break
        end
        else
        break
    end
    else
    break
end
dY:_setStatus('Bringing egg home')
end
end
local eh = 80
local function ei(ej, ek)
local el, em = d2()
if el and(em and(el.Position - ej.Position).Magnitude <= eh) then
    return dY:_teleportRoot(el, em, ej)
end
return eb(ej, ek)
end
if d4() then
    dY:_setStatus('Bringing egg home')
    local ej = d6()
    if ej then
        ei(ej,
        function()
        local ek = d1()
        return
        if ek then
            not d4()
            else
            not ek
        end
        )
    end
end
dY:_setStatus('Waiting for deposit')
local ej = os.clock() + 8
while d1() and not d5() and os.clock() < ej do
    ee, d6 = d2()
    if ee and(d6 and not dY:_isInSafeArea(ee)) then
        local ek = dY:_resolveSafeCFrame(ee)
        if ek then
            ei(ek,
            function()
            local el = d1()
            return
            if el then
                d5()
                else
                not el
            end
            )
        end
    end
    task.wait(0.1)
end
d8(d5() and 'Safe return complete' or 'Bank not confirmed \226\128\148 retrying')
end
)
end
cU.deliverCarriedEgg =
function(dY, dZ, d0)
if type(dZ) ~= 'string' then
    return false
    elseif
    dZ == '' then
        return false
        elseif
        dY.destroyed then
            return false
        end
        if dY._instantReturnToken ~= nil then
            return false
        end
        dY._externalDeliver = true
        if type(d0) == 'table' then
            dY.activeTarget = d0
        end
        dY.carry.active = true dY.carry.uid = dZ dY.reportedUid = nil dY:_instantReturn(dZ)
        if dY._instantReturnToken == nil then
            dY._externalDeliver = nil dY.carry.active = false dY.carry.uid = nil
            return false
        end
        task.spawn(
        function()
        local d1 = os.clock() + 30
        while dY._instantReturnToken ~= nil and os.clock() < d1 do
            task.wait(0.25)
        end
        if dY._externalDeliver then
            dY._externalDeliver = nil dY._instantReturnToken = nil dY.carry.active = false dY.carry.uid = nil
        end
    end
    )
    return true
end
cU._adminSteal =
function(dY, dZ)
local d0 = dZ.Uid dY._adminBusyUid = d0
local function d1()
local d2 = bI.ReadFieldEgg(d0)
return d2 ~= nil and d2.State == bP.States.Carried and d2.CarrierUserId == bH.UserId
end
local function d2()
local d3 = dY.destroyed
return(
if d3 then
    not d3
    else
    dY.enabled) and l.__SenaV4AdminBoost == true and dY._adminBusyUid == d0
end
local d3, d4 = pcall(
function() dY.instantPhase = nil dY.primerUid = nil dY.targetUid = nil dY.activeTarget = dZ dY.stats.lastResult = 'Admin Abuse' dY:_setStatus('Heading to target egg')
local d3 = os.clock() + 3
local d4 = 0
while d2() and not d1() do
    if os.clock() >= d3 then
        dY.skippedEggs[d0] = os.clock() + 10
        return dY:_finish('Carry refused \226\128\148 next egg')
    end
    local d5 = bI.ReadFieldEgg(d0)
    if
    if d5 then
        d5.State ~= bP.States.Slot and d5.State ~= bP.States.Dropped
        else
        not d5 then
            return dY:_finish('Target egg no longer available')
        end
        local d6 = bH.Character
        local d7 = d6 and d6:FindFirstChild('HumanoidRootPart')
        local d8 = d6 and d6:FindFirstChildOfClass('Humanoid')
        if
        if d7 then
            not d8
            else
            not d7 then
                return dY:_finish('Character unavailable')
            end
            local d9 = dY:_resolveEggDestination(d5, d7, d8)
            if d9 and(d7.Position - d9.Position).Magnitude > 4 then
                dY:_teleportRoot(d7, d8, d9)
            end
            if os.clock() >= d4 then
                d4 = os.clock() + 0.1 dY:_setStatus('Securing egg') task.spawn(
                function() pcall(
                function() bO.AskFieldEggCarry:InvokeServer({Uid = d0})
            end
            )
        end
        )
    end
    bG.Heartbeat:Wait()
end
if not d2() then
    return
end
dY.carry.active = true dY.carry.uid = d0 dY:_adminDeliver(d0)
end
)
if dY._adminBusyUid == d0 then
    dY._adminBusyUid = nil
end
if not d3 then
    warn('[Sena Steal] admin steal error: '..tostring(d4))
    if not dY.destroyed and dY.enabled then
        dY:_finish('Steal error \226\128\148 retrying')
    end
end
end
cU._adminDeliver =
function(dY, dZ)
if dY._adminDeliverUid == dZ then
    return
end
dY._adminDeliverUid = dZ dY._adminBusyUid = dZ
local function d0()
return bI.ReadFieldEgg(dZ)
end
local function d1()
local d2 = d0()
return d2 ~= nil and d2.State == bP.States.Carried and d2.CarrierUserId == bH.UserId
end
local function d2()
local d3 = d0()
return d3 == nil or d3.State == bP.States.Claimed
end
dY:_clearArrivalHold(dZ) dY:_setStatus('Bringing egg home')
local d3 = os.clock() + 4
while true do
    local d4 = dY.destroyed
    if not((
    if d4 then
        not d4
        else
        dY.enabled) and not d2() and d1() and os.clock() < d3) then
            break
        end
        local d5 = bH.Character
        local d6 = d5 and d5:FindFirstChild('HumanoidRootPart')
        local d7 = d5 and d5:FindFirstChildOfClass('Humanoid')
        local d8 = d6 and dY:_resolveSafeCFrame(d6)
        if d8 and(d7 and(d6.Position - d8.Position).Magnitude > 4) then
            dY:_teleportRoot(d6, d7, d8) dY:_setStatus('Waiting for deposit')
        end
        bG.Heartbeat:Wait()
    end
    dY._adminDeliverUid = nil
    if dY._adminBusyUid == dZ then
        dY._adminBusyUid = nil
    end
    if dY.destroyed then
        return
        elseif
        not dY.enabled then
            return
        end
        if d2() then
            dY:_reportStolen() dY:_finish('Safe return complete')
            else
            dY:_finish(d1() and 'Bank not confirmed \226\128\148 retrying' or 'Egg lost \226\128\148 retrying')
        end
    end
    cU._returnToSafe =
    function(dY)
    local dZ
    if dY:_isPrimerEgg(dY.carry.uid) then
        local d0 = dY.carry.uid dY.stats.lastResult = 'Steal not banked \226\128\148 retrying' dY.carry.active = false dY.carry.uid = nil dY.carry.generation += 1 dY:_invalidateCarryWorker() dY.skippedEggs[d0] = os.clock() + 30 pcall(bI.DropFieldEgg,
        'PlayerRequest')
        if dY.instantPhase == 'priming' then
            dY:_startPrimerTargetHunt()
            else
            task.delay(0.5,
            function()
            if not dY.destroyed and(dY.enabled and not dY.running) then
                dY:_schedule()
            end
        end
        )
    end
    dY:_notify()
    return
end
if dY.captureObjectiveEnabled and dY:_isCaptureEgg(dY.carry.uid) then
    dY:_captureHold(dY.carry.uid)
    return
end
if l.__SenaV4AdminBoost == true then
    dZ = dY.carry.uid or dY.activeTarget and dY.activeTarget.Uid
    if dZ and dY._adminBusyUid ~= dZ then
        task.spawn(dY._adminDeliver, dY, dZ)
    end
    return
end
if dY.config.stealMode == 'Instant' or dY.config.stealMode == 'Fly' then
    dZ = dY.carry.uid or dY.activeTarget and dY.activeTarget.Uid
    if dZ then
        dY:_instantReturn(dZ)
        return
    end
    dY:_finish('Carry lost \226\128\148 retrying')
    return
end
local d0 = dY.carry.uid
local d1 = dY:_claimCarryWorker('return', d0)
if not d1 then
    return
end
dY:_clearArrivalHold(d0)
if not dY:_wallOpen() then
    dY:_releaseCarryWorker(d1) dY:_finish('Reset interrupted carry')
    return
end
local d2 = bH.Character
local d3 = d2 and d2:FindFirstChild('HumanoidRootPart')
if not d3 then
    dY:_releaseCarryWorker(d1) dY:_finish('Character unavailable')
    return
end
local d4 = dY:_hasConfirmedCarry(d0)
if
if d4 then
    dY:_recordShowsForeignCarry(d0)
    else
    not d4 then
        dY:_releaseCarryWorker(d1) dY:_finish('Carry not confirmed \226\128\148 retrying')
        return
    end
    if dY:_isInSafeArea(d3) then
        dY:_finalizeReturn(d1)
        return
    end
    if aB.HelpFriend then
        dY.handoffLane =(dY.handoffLane or 0) % # ck + 1
        local d5 = CFrame.new(cj, ci.Y, ck[dY.handoffLane]) * d3.CFrame.Rotation dY:_setStatus('Taking the egg to the friend drop') dY:_tweenRoot(d5,
        function()
        if dY:_isCarryWorkerCurrent(d1) then
            task.spawn(dY._handOffEgg, dY, d1, d0, d5)
        end
    end
    , nil,{flightProfile = true})
    return
end
local d5 = dY:_resolveSafeCFrame(d3)
if not d5 then
    dY:_releaseCarryWorker(d1) dY:_finish('Safe destination unavailable')
    return
end
dY:_setStatus('Returning to safe area') dY:_tweenRoot(d5,
function()
if dY:_isCarryWorkerCurrent(d1) then
    dY:_finalizeReturn(d1)
end
end
, nil,{flightProfile = true})
end
cU._handOffEgg =
function(dY, dZ, d0, d1)
local function d2()
local d3 = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
if not d3 then
    return false
end
d3.CFrame = d1 d3.AssemblyLinearVelocity = Vector3.new(0, 0, 0) d3.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
return true
end
local function d3()
local d4 = bI.ReadFieldEgg(d0)
return d4 ~= nil and d4.State == bP.States.Carried and d4.CarrierUserId == bH.UserId
end
dY:_setStatus('Dropping the egg for a friend')
local d4 = 0.1 pcall(
function() d4 = bH:GetNetworkPing() or 0.1
end
)
local d5 = os.clock() + math.max(0.3, 0.2 + 2 * d4)
while os.clock() < d5 do
    if not d2() then
        break
    end
    bG.Heartbeat:Wait()
end
dY.skippedEggs[d0] = os.clock() + 1800 dY:_reportStolen() d5 = false
for d6 = 1, 4, 1 do
    d2()
    local d7 = d5
    if not d3() then
        d5 = true
        break
    end
    pcall(bI.DropFieldEgg, 'PlayerRequest')
    local d8 = os.clock() + 0.6 d5 = d7
    repeat
        bG.Heartbeat:Wait() d5 = not d3()
    until
    d5 or os.clock() >= d8
    if d5 then
        break
    end
end
if not d5 then
    dY.skippedEggs[d0] = nil
    if dY:_isCarryWorkerCurrent(dZ) then
        dY:_releaseCarryWorker(dZ) dY:_finish('Friend drop failed \226\128\148 retrying')
    end
    return
end
local d6 = os.clock() + 1
while dY.carry.active and os.clock() < d6 do
    bG.Heartbeat:Wait()
end
dY.carry.active = false dY.carry.uid = nil dY.stats.lastResult = 'Dropped for a friend'
local d7 = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
local d8 = d7 and dY:_resolveSafeCFrame(d7)
if not d8 then
    dY:_finish('Dropped for a friend')
    return
end
dY:_setStatus('Egg dropped for a friend, heading back') dY:_tweenRoot(d8, nil, nil,{flightProfile = true, onDone =
function() dY:_finish('Dropped for a friend')
end
})
end
cU._reportStolen =
function(dY)
local dZ = dY.activeTarget
if type(dZ) ~= 'table' then
    return
    elseif
    not dZ.Uid then
        return
    end
    if dY.reportedUid == dZ.Uid then
        return
    end
    dY.reportedUid = dZ.Uid task.delay(1.5,
    function()
    if dY.destroyed then
        return
    end
    local d0 pcall(
    function() d0 = bI.ReadFieldEgg(dZ.Uid)
end
)
if type(d0) == 'table' and(d0.State == bP.States.Slot or d0.State == bP.States.Dropped or d0.State == bP.States.Carried and d0.CarrierUserId ~= bH.UserId) then
    dY.reportedUid = nil dY.stats.deliveryFailed =(dY.stats.deliveryFailed or 0) + 1 dY.stats.lastResult = 'Delivery failed \226\128\148 retrying' dY:_notify()
    if dY.enabled and not dY.running then
        dY:_schedule()
    end
    return
end
dY.stats.delivered =(dY.stats.delivered or 0) + 1
local d1 = l.__SenaV4Webhook
if not d1 then
    return
end
local d2, d3 = pcall(dY.catalog.resolve, dZ) pcall(d1.stolen, dZ, d2 and d3 or nil, nil)
end
)
end
cU._startWatchdog =
function(dY)
if dY.watchdogRunning then
    return
end
dY.watchdogRunning = true task.spawn(
function()
local dZ
local d0
local d1
local d2
local d3
local d4 = os.clock()
while n() and not dY.destroyed and dY.userStealEnabled do
    task.wait(2)
    local d5 = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
    local d6 = tostring(dY.stats.status)
    if dY.enabled then
        if d5 then
            if d5.Position.Y > dT then
                if dY._boostHopUid == nil then
                    if dY._recalling then
                        dY._biomeStrandedSince = nil
                        elseif
                        dY._biomeStrandedSince and os.clock() - dY._biomeStrandedSince >= 2 then
                            dY._biomeStrandedSince = nil dY.stats.watchdogResets =(dY.stats.watchdogResets or 0) + 1 dY:_setStatus('Leaving the portal biome') dY:_mutePortalFx(true) pcall(dY._crossPortal,
                            dY, dU('FuseBiomeZone', 'ExitPart'), nil, 8) dY:_mutePortalFx(false)
                            if dY.running then
                                dY:_finish('Left the portal biome')
                            end
                            else
                            dY._biomeStrandedSince = dY._biomeStrandedSince or os.clock()
                        end
                        else
                        dY._biomeStrandedSince = nil
                    end
                    else
                    dY._biomeStrandedSince = nil
                end
                else
                dY._biomeStrandedSince = nil
            end
            else
            dY._biomeStrandedSince = nil
        end
        if dY.enabled and dY.running and not dY.carry.active and dY.carryAttemptToken == nil and dY._instantReturnToken == nil and not dY._captureHoldUid and d5 and d6 == dZ and d0 and(d5.Position - d0).Magnitude < 3 then
            if os.clock() - d1 > 12 then
                dY.stats.watchdogResets =(dY.stats.watchdogResets or 0) + 1 pcall(
                function() dY:_invalidateCarryWorker()
            end
            ) dY:_finish('Stuck - retrying') dY:_releaseOperation() dZ = nil d0 = nil d1 = nil d2 = nil
        end
        else
        dZ = d6 d0 = d5 and d5.Position d1 = os.clock()
    end
    if dY.enabled then
        d6, d5 = nil
        if dY._captureHoldUid then
            local d7
            local d8 d2 = d7 d3 = d8
            else
            if dY.running then
                local d7
                local d8 = tostring(dY.activeTarget and dY.activeTarget.Uid)..'|'..tostring(dY.carry.active)
                if d8 ~= d2 then
                    local d9 = os.clock() d2 = d8 d4 = d9
                    else
                    if os.clock() - d4 > 60 then
                        dY.stats.watchdogResets =(dY.stats.watchdogResets or 0) + 1
                        local d9 = dY.activeTarget and dY.activeTarget.Uid
                        if d9 and not dY.carry.active then
                            dY.skippedEggs[d9] = os.clock() + cF
                            if dY.tweenRecoveryUid == d9 then
                                dY.tweenRecoveryUid = nil
                            end
                        end
                        pcall(
                        function() dY:_invalidateCarryWorker()
                    end
                    ) dY:_finish('Stuck \226\128\148 retrying') d2 = nil
                end
            end
            d3 = d7
            else
            local d7
            local d8, d9 = pcall(dY._chooseTarget, dY)
            if dY:_wallOpen() then
                if d8 then
                    if d9 ~= nil then
                        local ea = d3 or os.clock()
                        if os.clock() - ea > 6 then
                            dY.stats.watchdogResets =(dY.stats.watchdogResets or 0) + 1 dY:_releaseOperation() dY:_schedule() d3 = nil
                            else
                            d3 = ea
                        end
                        else
                        d3 = nil
                    end
                    else
                    d3 = nil
                end
                else
                d3 = nil
            end
            d2 = d7
        end
    end
    else
    local d7, d8 d2 = d7 d3 = d8
end
end
dY.watchdogRunning = false
end
)
end
cU._finalizeReturn =
function(dY, dZ)
if not dY:_isCarryWorkerCurrent(dZ) then
    return
end
if not dY.carry.active then
    dY:_releaseCarryWorker(dZ) dY:_reportStolen() dY:_finish('Safe return complete')
    return
end
dY:_setStatus('Validating safe arrival')
local d0 = os.clock()
local d1 = os.clock() + 6
while dY:_isCarryWorkerCurrent(dZ) and dY.carry.active and os.clock() < d1 do
    local d2 = bH.Character and bH.Character:FindFirstChild('HumanoidRootPart')
    if not d2 then
        dY:_releaseCarryWorker(dZ) dY:_finish('Character unavailable')
        return
    end
    if not dY:_isInSafeArea(d2) then
        dY:_setStatus('Rollback detected \226\128\148 returning again') dY:_releaseCarryWorker(dZ) task.defer(
        function()
        if not dY.destroyed and(dY.enabled and dY.carry.active) then
            dY:_returnToSafe()
        end
    end
    )
    return
end
if os.clock() - d0 >= cJ then
    dY:_setStatus('Waiting for deposit')
end
task.wait(cK)
end
if not dY:_isCarryWorkerCurrent(dZ) then
    return
end
if not dY.carry.active then
    dY:_releaseCarryWorker(dZ) dY:_reportStolen() dY:_finish('Safe return complete')
    return
end
dY:_setStatus('Deposit pending \226\128\148 validating again') task.defer(
function()
if dY:_isCarryWorkerCurrent(dZ) and dY.carry.active then
    dY:_finalizeReturn(dZ)
end
end
)
end
cU._finish =
function(dY, dZ) dY:_noteLowSpeedOutcome(dZ) dY:_hideTreadmillDecoy() dY._forestDropInProgress = nil dY._instantReturnToken = nil dY.boostedUid = nil dY:_invalidateCarryWorker() dY.planGeneration = dY.planGeneration + 1 dY:_cancelTween(dZ,
dY.enabled) dY:_setStatus(dY.enabled and 'Searching' or 'Idle')
if dY.enabled then
    task.delay(b1,
    function()
    if dY.destroyed then
        dY:_releaseOperation()
        return
        elseif
        not dY.enabled then
            dY:_releaseOperation()
            return
        end
        dY:_schedule()
    end
    )
end
end
cU._scheduleMovementRetry =
function(dY)
if dY.movementRetryPending then
    return
    elseif
    dY.destroyed then
        return
        elseif
        not dY.enabled then
            return
        end
        dY.movementRetryPending = true task.delay(0.2,
        function() dY.movementRetryPending = false
        if not dY.destroyed and dY.enabled then
            dY:_schedule()
        end
    end
    )
end
cU._eggCount =
function(dY)
local dZ, d0 = pcall(
function()
local dZ = 0
for d0 in pairs(require(bF.Shared.Save).Peek().EggInventory or{}) do
    dZ += 1
end
return dZ
end
)
return dZ and d0 or nil
end
cU._eggInventoryFull =
function(dY)
local dZ = dY.eggFullCount
if not dZ then
    return false
end
local d0 = dY:_eggCount()
if not d0 then
    return true
end
if d0 > dZ then
    dY.eggFullCount = nil dY._eggFullHold = false
    return false
end
if d0 >= dZ then
    dY._eggFullHold = true
    local d1 = l.__SenaV4IsAutoSellEggBusy and l.__SenaV4IsAutoSellEggBusy() dY._eggFullAt = dY._eggFullAt or os.clock()
    if not d1 and os.clock() - dY._eggFullAt > 60 then
        dY.eggFullCount = nil dY._eggFullHold = false dY._eggFullAt = nil
        return false
    end
    return true
end
dY._eggFullAt = nil
if dY._eggFullHold then
    if l.__SenaV4IsAutoSellEggBusy and(l.__SenaV4IsAutoSellEggBusy() and d0 > dZ - cU.EGG_FREE_SLOTS) then
        return true
    end
    dY._eggFullHold = false dY.eggFullNotified = nil
end
return false
end
cU._schedule =
function(dY)
if not dY.running then
    dY.safeStarting = false
end
if dY.destroyed then
    return
    elseif
    dY.enabled then
        if dY.running then
            return
        end
        else
        return
    end
    if not dY.carry.active and dY:_eggInventoryFull() then
        dY:_releaseOperation() dY:_setStatus('Egg inventory full - place, hatch or sell eggs')
        if not dY.eggFullNotified then
            dY.eggFullNotified = true pcall(
            function() game:GetService('StarterGui'):SetCore('SendNotification',{Title = 'Auto Steal', Text = [[Egg inventory full. Place, hatch or sell eggs and it continues by itself.]],
            Duration = 6})
        end
        )
    end
    task.delay(3,
    function()
    if not dY.destroyed and(dY.enabled and not dY.running) then
        dY:_schedule()
    end
end
)
return
end
local dZ = bH.Character
local d0 = dZ and dZ:FindFirstChild('HumanoidRootPart')
local d1 = dZ and dZ:FindFirstChildOfClass('Humanoid')
if
if d0 then
    not d1
    else
    not d0 then
        dY:_releaseOperation() dY:_setStatus('Character unavailable')
        return
    end
    dY:_startMovementProtection()
    if dY.carry.active and dY.carry.uid ~= nil then
        if dY.instantPhase == 'priming' and dY.carry.uid == dY.primerUid then
            return
        end
        if dY:_isPrimerEgg(dY.carry.uid) then
            dY:_setStatus('Dropping primer egg') dY.skippedEggs[dY.carry.uid] = os.clock() + 30 pcall(bI.DropFieldEgg, 'PlayerRequest') task.delay(0.5,
            function()
            if not dY.destroyed and dY.enabled then
                dY:_schedule()
            end
        end
        )
        return
    end
    local d2 = dY.records[dY.carry.uid] or bI.ReadFieldEgg(dY.carry.uid)
    local d3 = type(d2) == 'table' and(dY.riftWants[d2.AssetCategory] or dY.captureObjectiveEnabled and dY:_isCaptureEgg(d2.Uid) or dY.indexObjectiveEnabled and dY:_isIndexObjective(d2) or dY.wispObjective and dY:_isWispObjective(d2) or dY.userStealEnabled and not dY.riftOnly and dY:_matchesNormalFilter(d2))
    if type(d2) == 'table' and not d3 then
        dY:_setStatus('Dropping unwanted egg') dY.skippedEggs[dY.carry.uid] = os.clock() + 30 pcall(bI.DropFieldEgg, 'PlayerRequest') task.delay(0.5,
        function()
        if not dY.destroyed and dY.enabled then
            dY:_schedule()
        end
    end
    )
    return
end
dY:_returnToSafe()
return
end
if not dY:_wallOpen() then
    dY:_releaseOperation() dY:_setStatus('Waiting for reset wall')
    return
end
local d2 = l.__SenaV4PlayerSteal
local d3 = aI.blocker('auto_steal')
local d4 =(
if d3 then
    not d3
    else
    aI.holder('auto_steal')) or nil
    if d3 or d4 or d2 and d2.running then
        dY:_releaseOperation() dY:_setStatus(d3 and 'Yielding to '..aI.TITLES[d3] or d4 and 'Waiting for '..aI.TITLES[d4]..' to hand over' or 'Yielding to Steal Players')
        if dY._yieldRetryPending then
            return
        end
        dY._yieldRetryPending = true task.delay((d3 or d4) and 1 or 0.5,
        function() dY._yieldRetryPending = nil
        if not dY.destroyed and dY.enabled then
            dY:_schedule()
        end
    end
    )
    return
end
dZ = dY.tweenRecoveryUid
local d5 = dZ and(bI.ReadFieldEgg(dZ) or dY.records[dZ]) or nil
if dZ and(type(d5) ~= 'table' or d5.State ~= bP.States.Slot and d5.State ~= bP.States.Dropped) then
    dY.tweenRecoveryUid = nil d5 = nil dZ = nil
end
local d6
if d5 then
    d6 = d5
    else
    d6 = dY:_chooseTarget()
end
if not d6 then
    if dY.stats.matching == 0 then
        if dY.stats.available > 0 then
            local d7 = dY.config.minWeightKg
            if d7 then
                if d7 > 0 then
                    dY:_setStatus(string.format('No eggs \226\137\165 %dKg', dY.config.minWeightKg))
                    else
                    dY:_setStatus('No matching eggs')
                end
                else
                dY:_setStatus('No matching eggs')
            end
            else
            dY:_setStatus('No matching eggs')
        end
        else
        dY:_setStatus('No matching eggs')
    end
    dY:_releaseOperation()
    if not dY.activeTween and(dY:_isInField(d0) and not dY:_isInSafeArea(d0)) then
        local d7 = dY:_resolveSafeCFrame(d0)
        if d7 then
            dY:_tweenRoot(d7, nil, nil,{silent = true, flightProfile = true, abort =
            function()
            local d8 = dY.enabled
            return
            if d8 then
                dY.running
                else
                not d8
            end
            })
        end
    end
    return
end
if dY.treadmillManager and dY.treadmillManager:isEngaged() then
    dY.treadmillManager:_cancelIdle(true)
end
local d7 = dY.planGeneration d2, d3 = dY:_acquireOperation()
if not d2 then
    dY:_setStatus('Waiting \194\183 '..tostring(d3 or 'another operation')) task.delay(0.5,
    function()
    if not dY.destroyed and(dY.enabled and dY.planGeneration == d7) then
        dY:_schedule()
    end
end
)
return
end
dY.safeStarting = true dY.running = true dY.activeTarget = d6
local d8 = dY.catalog.resolve(d6) dY.stats.lastTarget = string.format('%s \194\183 %s \194\183 %s', d8.rarity, d8.name, d6.AreaId)
if dZ then
    dY.safeStarting = false dY.stats.lastResult = 'Recovering with tween'
    local d9 = dY:_resolveEggDestination(d6, d0, d1)
    if not d9 then
        dY.tweenRecoveryUid = nil dY:_finish('Recovery destination unavailable')
        return
    end
    dY:_setStatus('Returning to egg') dY:_tweenRoot(d9,
    function()
    if dY.tweenRecoveryUid == d6.Uid then
        dY:_requestCarry(d6, false)
    end
end
, nil,{holdAfterArrival = true, holdUid = d6.Uid, flightProfile = true, carryTarget = d6})
return
end
if not dY:_leftTreadmill(d0) then
    dY.running = false dY.safeStarting = false dY.activeTarget = nil dY:_releaseOperation() dY:_setStatus('Preparing steal') task.delay(0.3,
    function()
    if not dY.destroyed and(dY.enabled and dY.planGeneration == d7) then
        dY:_schedule()
    end
end
)
return
end
if l.__SenaV4AdminBoost == true and not(dY.captureObjectiveEnabled and dY:_isCaptureEgg(d6.Uid)) then
    dY.safeStarting = false task.spawn(dY._adminSteal, dY, d6)
    return
end
d3 = d0.Position - ci
local d9 = Vector2.new(d3.X, d3.Z).Magnitude dZ =
if dY:_usesPortalBoost(d6) then
    true
    else
    false
    if dY.config.stealMode == 'Fly' then
        local ea = d6.BottomCFrame or d6.BoundsCFrame
        if ea then
            local eb = ea.Position - d0.Position dZ =
            if Vector2.new(eb.X, eb.Z).Magnitude < d9 then
                true
                else
                dZ
            end
        end
        if not dZ and(d9 > 3 and os.clock() -(dY.lastSafeRepositionAt or 0) > 5) then
            local ea = dY:_resolveSafeCFrame(d0)
            if ea then
                dY.safeStarting = true dY.running = true dY.lastSafeRepositionAt = os.clock() dY:_setStatus('Repositioning to safe area') dY:_tweenRoot(ea,
                function() dY:_groundSnap() dY.safeStarting = false dY.running = false task.delay(0.15,
                function()
                if not dY.destroyed and(dY.enabled and dY.planGeneration == d7) then
                    dY:_schedule()
                end
            end
            )
        end
        , nil,{flightProfile = true})
        return
    end
end
dY.safeStarting = false
if dY:_usesPortalBoost(d6) then
    dY.instantPhase = 'hunting' dY.primerUid = nil dY.targetUid = nil dY.activeTarget = d6 dY._flyDeparting = false dY:_installGuardHitDistanceBoost() dY:_startMovementProtection() dY:_showTreadmillDecoy() dY.stats.lastResult = 'Low Speed Boost' task.spawn(dY._portalBoostSteal,
    dY, d6)
    return
end
if dY.config.stealMode == 'Fly' then
    dY.instantPhase = 'priming' dY.primerUid = nil dY.targetUid = d6.Uid dY.activeTarget = d6 dY._flyDeparting = false dY.lowFpsPrime = false dY:_installGuardHitDistanceBoost() dY:_startMovementProtection() dY.stats.lastResult = 'High Speed departing' dY:_startPrimerTargetHunt()
    return
end
local ea = dY:_choosePrimerEgg(d6.Uid)
if not ea then
    dY.running = false dY.activeTarget = nil dY:_releaseOperation() dY:_setStatus('Preparing steal') task.delay(0.25,
    function()
    if not dY.destroyed and(dY.enabled and dY.planGeneration == d7) then
        dY:_schedule()
    end
end
)
return
end
dY.instantPhase = 'priming' dY.primerUid = ea.Uid dY.primerUids[ea.Uid] = os.clock() + 120 dY.skippedEggs[ea.Uid] = os.clock() + 30 dY.targetUid = d6.Uid dY.activeTarget = ea dY._flyDeparting = dY.config.stealMode == 'Fly'
if dY.config.stealMode == 'Instant' then
    dY:_showTreadmillDecoy()
end
dY:_installGuardHitDistanceBoost() dY.stats.lastResult = dY.config.stealMode..' priming' dY.lowFpsPrime = I() < 30
local eb = dY:_resolveEggDestination(ea, d0, d1)
if not eb then
    dY:_finish('Steal unavailable \226\128\148 retrying')
    return
end
if dY.lowFpsPrime then
    dY:_setStatus('Preparing steal') dY:_tweenRoot(eb,
    function()
    if dY.instantPhase == 'priming' and dY.primerUid == ea.Uid then
        dY:_requestCarry(ea, false)
    end
end
, nil,{holdAfterArrival = true, holdUid = ea.Uid, flightProfile = true, carryTarget = ea})
return
end
if dY.config.stealMode == 'Fly' then
    dY:_setStatus('Preparing steal')
    local function ec()
    return dY.destroyed or not dY.enabled or dY.instantPhase ~= 'priming' or dY.primerUid ~= ea.Uid
end
if not dY:_glideRoot(eb, ec) then
    if dY.instantPhase == 'priming' and dY.primerUid == ea.Uid then
        dY:_finish('Steal unavailable \226\128\148 retrying')
    end
    return
end
dY:_setArrivalHold(eb, ea.Uid) dY:_requestCarry(ea, true)
return
end
dY:_setStatus('Preparing steal')
if not dY:_teleportRoot(d0, d1, eb) then
    dY:_finish('Steal unavailable \226\128\148 retrying')
    return
end
dY:_setArrivalHold(eb, ea.Uid) dY:_requestCarry(ea, true)
end
cU._leftTreadmill =
function(dY, dZ)
local d0 = dY.treadmillManager
if not d0 or d0.destroyed then
    return true
end
if not(d0.activeTreadmill ~= nil) and(not(d0.treadmillEquipPending == true) and not(d0.travelingToTreadmill == true)) then
    if dZ ~= nil then
        if not dZ.Anchored then
            dY.treadmillLeaveAt = nil
            return true
        end
        else
        dY.treadmillLeaveAt = nil
        return true
    end
end
local d1 = os.clock() dY.treadmillLeaveAt = dY.treadmillLeaveAt or d1 d0.idleGeneration = d0.idleGeneration + 1
if not dY.treadmillDoffBusy and d1 -(dY.treadmillDoffAt or 0) > 0.6 then
    dY.treadmillDoffBusy = true dY.treadmillDoffAt = d1 task.spawn(
    function() pcall(d0._requestUnequip, d0) pcall(d0._syncActiveTreadmillSnapshot, d0) dY.treadmillDoffBusy = false
end
)
end
if dZ and dZ.Anchored and d1 - dY.treadmillLeaveAt > 1 then
    pcall(
    function() dZ.Anchored = false
end
)
end
if d1 - dY.treadmillLeaveAt > 8 then
    dY.treadmillLeaveAt = nil
    return true
end
return false
end
cU._reconcileRunningState =
function(dY)
local dZ = dY.userStealEnabled == true or next(dY.riftWants) ~= nil or dY.indexObjectiveEnabled == true or dY.wispObjective ~= nil or dY.manualObjectiveEnabled == true or dY.captureObjectiveEnabled == true
if dY.enabled == dZ then
    if dY.enabled then
        dY:_refreshCounts() dY:_schedule()
    end
    return
end
dY.enabled = dZ
if dY.enabled then
    if bH.Character then
        c0(bH.Character) c2(dY, bH.Character)
    end
    dY:_installGuardHitDistanceBoost() dY:_startMovementProtection() pcall(dY._installPromptFilter, dY) dY:_setStatus('Searching') dY:_schedule()
    else
    if dY._instantReturnToken ~= nil and(dY.carry.uid ~= nil and not dY._externalDeliver) then
        dY._externalDeliver = true dY.planGeneration = dY.planGeneration + 1 dY.running = false dY:_setStatus('Finishing target egg') task.spawn(
        function()
        local d0 = os.clock() + 45
        while dY._instantReturnToken ~= nil and os.clock() < d0 and not dY.destroyed do
            task.wait(0.2)
        end
        if dY.destroyed then
            return
            elseif
            dY.enabled then
                return
            end
            dY._externalDeliver = nil dY._instantReturnToken = nil dY.carry.active = false dY.carry.uid = nil dY.activeTarget = nil dY:_cleanupInstantSteal() dY:_removeGuardHitDistanceBoost() dY:_restoreTreadmillVisualAtSafe() dY:_stopMovementProtection() c1(dY) dY:_setStatus('Idle')
        end
        ) dY:_refreshCounts()
        return
    end
    local d0 = dY:_needsHiddenRecall()
    if d0 then
        dY._recalling = true
    end
    dY.planGeneration = dY.planGeneration + 1 dY.carry.generation += 1 dY:_cleanupInstantSteal()
    if not d0 then
        dY:_removeGuardHitDistanceBoost()
    end
    dY:_invalidateCarryWorker() dY._forestDropInProgress = nil dY._instantReturnToken = nil dY.carry.active = false dY.carry.uid = nil dY.tweenRecoveryUid = nil dY.claimPresentationSuppression = nil dY.safeStarting = false dY.movementRetryPending = false dY:_cancelTween('Disabled') dY:_releaseOperation()
    if d0 then
        dY:_recallHidden()
        else
        dY:_restoreTreadmillVisualAtSafe() dY:_stopMovementProtection() c1(dY)
    end
    dY.activeTarget = nil dY.running = false dY:_setStatus('Idle')
end
dY:_refreshCounts()
end
cU.setEnabled =
function(dY, dZ) dY.userStealEnabled = dZ == true dY:_reconcileRunningState()
if dY.userStealEnabled then
    dY:_startWatchdog()
end
dY:_reconcileScramblePortal()
end
local dY = 'ScrambleArenaPortal' cU._neutralizeScramblePortal =
function(dZ, d0)
if typeof(d0) ~= 'Instance' then
    return
    elseif
    d0.Name ~= dY then
        return
    end
    dZ.scramblePortalOriginals = dZ.scramblePortalOriginals or{}
    for d1, d2 in ipairs(d0:GetDescendants()) do
        if d2:IsA('BasePart') then
            if dZ.scramblePortalOriginals[d2] == nil then
                local d3 = d2:GetAttribute('SenaV4PortalOrig')
                if type(d3) == 'string' then
                    dZ.scramblePortalOriginals[d2] ={CanCollide = d3:sub(1, 1) == '1', CanTouch = d3:sub(2, 2) == '1'}
                    else
                    dZ.scramblePortalOriginals[d2] ={CanCollide = d2.CanCollide, CanTouch = d2.CanTouch} pcall(d2.SetAttribute, d2, 'SenaV4PortalOrig',(d2.CanCollide and '1' or '0')..(d2.CanTouch and '1' or '0'))
                end
            end
            pcall(
            function() d2.CanCollide = false d2.CanTouch = false
        end
        )
    end
end
end
cU._startScramblePortalBypass =
function(dZ)
local d0 = workspace:FindFirstChild(dY)
if d0 then
    dZ:_neutralizeScramblePortal(d0)
end
if not dZ.scramblePortalConn then
    dZ.scramblePortalConn = workspace.ChildAdded:Connect(
    function(d1)
    if dZ.destroyed then
        return
        elseif
        dZ.userStealEnabled then
            if dZ._scramblePortalHold then
                return
            end
            else
            return
        end
        if d1.Name ~= dY then
            return
        end
        for d2, d3 in ipairs({0, 0.15, 0.4, 0.8}) do
            task.delay(d3,
            function()
            if not dZ.destroyed and(dZ.userStealEnabled and(not dZ._scramblePortalHold and d1.Parent)) then
                dZ:_neutralizeScramblePortal(d1)
            end
        end
        )
    end
end
)
end
end
cU._stopScramblePortalBypass =
function(dZ)
if dZ.scramblePortalConn then
    pcall(dZ.scramblePortalConn.Disconnect, dZ.scramblePortalConn) dZ.scramblePortalConn = nil
end
if dZ.scramblePortalOriginals then
    for d0, d1 in pairs(dZ.scramblePortalOriginals) do
        if typeof(d0) == 'Instance' and d0.Parent then
            pcall(
            function() d0.CanCollide = d1.CanCollide d0.CanTouch = d1.CanTouch d0:SetAttribute('SenaV4PortalOrig', nil)
        end
        )
    end
end
dZ.scramblePortalOriginals = nil
end
end
cU._setScramblePortalHold =
function(dZ, d0)
local d1 = d0 == true
if dZ._scramblePortalHold == d1 then
    return
end
dZ._scramblePortalHold = d1 dZ:_reconcileScramblePortal()
end
cU._reconcileScramblePortal =
function(dZ)
if dZ.userStealEnabled then
    if dZ._scramblePortalHold then
        dZ:_stopScramblePortalBypass()
        else
        dZ:_startScramblePortalBypass()
    end
    else
    dZ:_stopScramblePortalBypass()
end
end
cU._resolveWeightKg =
function(dZ, d0)
local d1 = dZ.weightUtil
if d1 then
    if d0 then
        if d0.AssetScale then
            if not d0.AssetCategory then
                return nil
            end
            else
            return nil
        end
        else
        return nil
    end
    else
    return nil
end
local d2, d3 = pcall(d1.WeightKgForScale, d0.AssetCategory, d0.AssetScale)
if d2 and type(d3) == 'number' then
    return d3
end
return nil
end
cU.setHeaviestFirst =
function(dZ, d0) dZ.config.heaviestFirst = d0 == true
if dZ.config.heaviestFirst then
    dZ.config.highestValueFirst = false
end
dZ:_schedule()
end
cU.setHighestValueFirst =
function(dZ, d0) dZ.config.highestValueFirst = d0 == true
if dZ.config.highestValueFirst then
    dZ.config.heaviestFirst = false
end
dZ:_schedule()
end
local dZ = '__SenaV4EggEsp'
local d0 = '__SenaV4EggHighlight'
local d1 ={rarity = true, name = true, kg = true, mutation = true, value = true, placed = true, icon = true} c_ =
function(d2)
if type(d2) ~= 'table' then
    return nil
end
local d3 = d2.Category or d2.AssetCategory
local d4 = tonumber(d2.Scale or d2.AssetScale)
if type(d3) ~= 'string' then
    return nil
    elseif
    d4 then
        if d4 <= 0 then
            return nil
        end
        else
        return nil
    end
    local d5 ={Category = d3, Scale = d4, Mutations = type(d2.Mutations) == 'table' and table.clone(d2.Mutations) or{}, BaseMutation = type(d2.BaseMutation) == 'string' and d2.BaseMutation or nil} d3,
    d2 = pcall(bV.MutationOnlyRatePerSecond, d5)
    return d3 and type(d2) == 'number' and d2 or nil
end
local d2
local function d3(d4)
if type(d2) ~= 'table' then
    local d5, d6 = pcall(require, bF.Packages.FormatNumber.Simple)
    if d5 and type(d6.FormatCompact) == 'function' then
        d2 = d6
    end
end
if d2 then
    local d5, d6 = pcall(d2.FormatCompact, d4, '.#')
    if d5 and type(d6) == 'string' then
        return d6
    end
end
local d5 = math.abs(d4)
if d5 >= 1000000000000 then
    return string.format('%.2fT', d4 / 1000000000000)
    elseif
    d5 >= 1000000000 then
        return string.format('%.2fB', d4 / 1000000000)
        elseif
        d5 >= 1000000 then
            return string.format('%.1fM', d4 / 1000000)
            elseif
            d5 >= 1000 then
                return string.format('%.1fK', d4 / 1000)
            end
            return string.format('%d', math.floor(d4 + 0.5))
        end
        local d4 = 2
        local d5 = 3.2
        local d6 = 1.25
        local d7 = 597
        local d8 ={['Carry not confirmed \226\128\148 retrying'] = true,['Carry refused \226\128\148 next egg'] = true,['Carry lost \226\128\148 retrying'] = true,
        ['Drop failed \226\128\148 retrying'] = true,['Egg lost \226\128\148 retrying'] = true,['Re-steal failed \226\128\148 retrying'] = true,['Steal timed out \226\128\148 retrying'] = true}
        local d9 = 8
        local ea = 600
        local eb ={}
        local function ec()
        if next(eb) then
            return eb
        end
        local ed = k()
        local ee = ed and ed:FindFirstChild('Areas')
        local ef = ee and ee:FindFirstChild('GuardAreas')
        for eg, eh in ipairs(ef and ef:GetChildren() or{}) do
            local ei = eh:FindFirstChild('ClosestExitPoint')
            if ei and ei:IsA('BasePart') then
                eb[eh.Name] = ei.Position.X
            end
        end
        return eb
    end
    cU.settleNeed =
    function(ed, ee, ef)
    local eg = ec()[ee]
    return d4 + math.max(0,(eg or d7) - d7) /(d5 * math.max(ef, 16))
end
cU.recommendLowSpeedLevel =
function(ed, ee)
local ef = ee or dk()
local eg ={}
if ed.config.areaEnabled and # ed.config.areas > 0 then
    eg = ed.config.areas
    else
    for eh in pairs(ec()) do
        eg[# eg + 1] = eh
    end
end
local eh, ei = 10 ee = 10
for ej, ek in ipairs(eg) do
    if aB.LowSpeedBoost == true and dR[ek] ~= nil then
        else
        local el = ed:settleNeed(ek, ef)
        local em = 1
        for en = 10, 1, - 1 do
            if dB(ek, en) >= el then
                em = en
                break
            end
        end
        ej = 1
        for en = 10, 1, - 1 do
            if dB(ek, en) >= el * d6 then
                ej = en
                break
            end
        end
        if em < eh then
            eh = em ei = ek
        end
        ee = math.min(ee, ej)
    end
end
local el = ed.lowSpeedFailCap
if el then
    eh = math.min(eh, el) ee = math.min(ee, el)
end
return math.min(ee, eh), eh, ef, ei
end
cU._noteLowSpeedOutcome =
function(ed, ee)
local ef = ed._untrustedSeen == true ed._untrustedSeen = nil
if ed.config.stealMode ~= 'Instant' then
    return
end
if ed.boostedUid ~= nil then
    return
    elseif
    ed._boostHopUid ~= nil then
        return
    end
    local eg = d8[tostring(ee)] == true or ef
    if not eg and ee ~= 'Safe return complete' then
        return
    end
    local eh = math.clamp(tonumber(aB.StealHoldSeconds) or 5, 1, 10) ed.lowSpeedOutcomes = ed.lowSpeedOutcomes or{} ef = ed.lowSpeedOutcomes[eh] or{} ed.lowSpeedOutcomes[eh] = ef
    local ei = # ef + 1
    local ej ={} ej.at, ej.failed, ef[ei] = os.clock(), eg, ej
    while # ef > d9 do
        table.remove(ef, 1)
    end
    ej = 0 ei = 0
    for ek, el in ipairs(ef) do
        if os.clock() - el.at <= ea then
            ej, ei = ej + 1,
            if el.failed then
                ei + 1
                else
                ei
            end
        end
        if eh > 1 and(ei >= 3 and ei / ej >= 0.4) then
            local em = eh - 1
            local en = ed.lowSpeedFailCap
            if
            if en then
                em < ed.lowSpeedFailCap
                else
                not en then
                    ed.lowSpeedFailCap = em ed.lowSpeedAdvice ={from = eh, to = em, fails = ei, total = ej, fresh = true}
                end
            end
        end
        cU.lowSpeedStatus =
        function(ed)
        local ee pcall(
        function() ee = bS.ReadProjected()
    end
    )
    local ef, eg, eh = ed:recommendLowSpeedLevel()
    local ei = math.clamp(tonumber(aB.StealHoldSeconds) or 5, 1, 10)
    local ej = ed.lowSpeedAdvice
    local ek = ej and(
    if ei <= ej.to then
        nil
        else
        ej)
        return{speedText = type(ee) == 'number' and d3(ee) or '?', walkSpeed = math.floor((eh or 0) + 0.5), safe = ef, fast = eg, level = ei, advice = ek}
    end
    cU.setEggEsp =
    function(ed, ee) ed.config.espEnabled = ee == true
    if not ed.config.espEnabled then
        pcall(
        function() ed:_clearEsp()
    end
    )
end
end
cU.setEspMinRank =
function(ed, ee) ed.config.espMinRank = math.max(tonumber(ee) or 0, 0)
end
cU.setEspMinValue =
function(ed, ee) ed.config.espMinValue = math.max(tonumber(ee) or 0, 0)
end
cU._espPasses =
function(ed, ee, ef)
local eg = ed.config
local eh = eg.espMinRank
if eh and(eh > 0 and(tonumber(ee and ee.rarityRank) or 0) < eg.espMinRank) then
    return false
end
local ei = eg.espMinValue
if ei and(ei > 0 and(tonumber(ef) or 0) < eg.espMinValue) then
    return false
end
return true
end
cU.setEspOption =
function(ed, ee, ef)
if d1[ee] then
    ed.config['esp'..ee:sub(1, 1):upper()..ee:sub(2)] = ef == true
end
end
cU._clearEsp =
function(ed)
local ee = workspace:FindFirstChild('AreaEggSlotsClient')
if not ee then
    return
end
for ef, eg in ipairs(ee:GetChildren()) do
    local eh = eg:FindFirstChild(dZ)
    if eh then
        eh:Destroy()
    end
    local ei = eg:FindFirstChild(d0)
    if ei then
        ei:Destroy()
    end
end
end
cU._updateEsp =
function(ed)
local ee = workspace:FindFirstChild('AreaEggSlotsClient')
if not ee then
    return
end
local ef = ed.config
for eg, eh in ipairs(ee:GetChildren()) do
    local ei = ed.records[eh.Name]
    local ej = ef.espEnabled and ei ~= nil and(ei.State == bP.States.Slot or ei.State == bP.States.Dropped)
    local ek = ej and(
    if ed:_espPasses(ed.catalog.resolve(ei), c_(ei)) then
        ej
        else
        false)
        local el = ek and(eh:FindFirstChild('Hitbox') or eh:FindFirstChildWhichIsA('BasePart', true))
        local em = eh:FindFirstChild(dZ)
        local en = eh:FindFirstChild(d0)
        if
        if ek then
            not el
            else
            not ek then
                if em then
                    em:Destroy()
                end
                if en then
                    en:Destroy()
                end
                else
                if em then
                    if em:FindFirstChild('Icon') then
                        else
                        em:Destroy() em = nil
                    end
                end
                if em then
                    else
                    em = Instance.new('BillboardGui') em.Name = dZ em.AlwaysOnTop = true em.Size = UDim2.fromOffset(220, 72) em.StudsOffset = Vector3.new(0, 4.4, 0) em.MaxDistance = 1000 em.Adornee = el
                    local eo = Instance.new('ImageLabel') eo.Name = 'Icon' eo.AnchorPoint = Vector2.new(0.5, 1) eo.Position = UDim2.fromScale(0.5, 0.42) eo.Size = UDim2.fromOffset(30,
                    30) eo.BackgroundTransparency = 1 eo.ScaleType = Enum.ScaleType.Fit eo.Visible = false eo.Parent = em
                    local ep = Instance.new('TextLabel') ep.Name = 'Text' ep.AnchorPoint = Vector2.new(0.5, 0) ep.Position = UDim2.fromScale(0.5, 0.45) ep.Size = UDim2.new(1,
                    0, 0.55, 0) ep.BackgroundTransparency = 1 ep.Font = Enum.Font.GothamBold ep.TextSize = 13 ep.TextStrokeTransparency = 0.35 ep.TextXAlignment = Enum.TextXAlignment.Center ep.TextYAlignment = Enum.TextYAlignment.Top ep.Parent = em em.Parent = eh
                end
                em.Adornee = el
                local eo = ed.catalog.resolve(ei)
                local ep = em:FindFirstChild('Icon')
                local eq = ef.espIcon and type(eo.icon) == 'string' and eo.icon ~= '' and eo.icon or nil ep.Image = eq or '' ep.Visible = eq ~= nil
                local er = typeof(eo.rarityColor) == 'Color3' and eo.rarityColor or Color3.fromRGB(255, 255, 255)
                local es ={}
                if ef.espRarity then
                    es[# es + 1] = string.upper(eo.rarity or '?')
                end
                if ef.espName then
                    es[# es + 1] = tostring(eo.name)
                end
                if ef.espKg then
                    eo = ed:_resolveWeightKg(ei)
                    if eo then
                        es[# es + 1] = string.format('%d Kg', math.floor(eo))
                    end
                end
                if ef.espMutation and type(ei.Mutations) == 'table' and next(ei.Mutations) then
                    eo ={}
                    for et, eu in pairs(ei.Mutations) do
                        eo[# eo + 1] = tostring(eu)
                    end
                    if # eo > 0 then
                        table.sort(eo) es[# es + 1] = table.concat(eo, ', ')
                    end
                end
                if ef.espValue then
                    eo = c_(ei)
                    if eo then
                        es[# es + 1] = '$'..d3(eo)..'/s'
                    end
                end
                local et = em:FindFirstChild('Text') et.Text = table.concat(es, ' | ') et.TextColor3 = er
                if en then
                    if en:IsA('Highlight') then
                        else
                        en:Destroy() en = nil
                    end
                end
                if en then
                    else
                    en = Instance.new('Highlight') en.Name = d0 en.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop en.Parent = eh
                end
                en.Adornee = eh en.FillColor = er en.FillTransparency = 0.72 en.OutlineColor = er en.OutlineTransparency = 0
            end
        end
        ed._placedEspAnchors = ed._placedEspAnchors or{} os.clock()
        if ef.espPlaced then
            local ei =(bW.Peek or bW.Get)()
            local ej = type(ei) == 'table' and ei.EggInventory or nil
            local ek = bX.ResolveLocalSlot()
            local el = bX.ResolveFolder()
            local em = el and ek and el:FindFirstChild(tostring(ek)) ek = em and em:FindFirstChild('CenterPoint')
            local en = ek and(
            if ek:IsA('BasePart') then
                ek
                else
                nil)
                local eo ={}
                if type(ej) == 'table' and en then
                    el = workspace:FindFirstChild('SenaV4PlacedEggAnchors')
                    if el then
                        else
                        el = Instance.new('Folder') el.Name = 'SenaV4PlacedEggAnchors' el.Parent = workspace
                    end
                    for ep, eq in ipairs(el:GetChildren()) do
                        if eq:IsA('Highlight') then
                            eq:Destroy()
                            elseif
                            eq:IsA('BillboardGui') then
                                eq:Destroy()
                            end
                        end
                        for er, es in pairs(ej) do
                            if type(er) == 'string' and(type(es) == 'table' and type(es.Placement) == 'table') then
                                eo[er] = true
                                local et = es.Placement.LocalCFrame
                                if typeof(et) ~= 'CFrame' then
                                    local eu, ev = pcall(bU.Decode, es)
                                    local ew = eu and type(ev) == 'table' and ev.Placement or nil et = type(ew) == 'table' and ew.LocalCFrame or nil
                                end
                                if typeof(et) == 'CFrame' then
                                    local eu, ev = pcall(bU.Decode, es)
                                    local ew = eu and type(ev) == 'table' and ev or es ev = tonumber(ew.AssetScale) or 1
                                    local ex = en.CFrame * et + Vector3.new(0, 3 + ev * 2, 0) ed._placedEspAnchors[er] = ed._placedEspAnchors[er] or{}
                                    local ey = ed._placedEspAnchors[er]
                                    if typeof(ey.anchor) ~= 'Instance' then
                                        local ez = Instance.new('Part') ez.Name = 'SenaV4PE_'..er ez.Size = Vector3.new(1.5, 1.5, 1.5) ez.Transparency = 1 ez.Anchored = true ez.CanCollide = false ez.CanQuery = false ez.CanTouch = false ez.Parent = el ey.anchor = ez
                                    end
                                    ey.anchor.CFrame = ex
                                    local ez = ed.catalog.resolve({AssetCategory = ew.AssetCategory})
                                    local eA = typeof(ez.rarityColor) == 'Color3' and ez.rarityColor or Color3.fromRGB(255, 255, 255)
                                    local eB = c_({Category = ew.AssetCategory, Mutations = type(ew.Mutations) == 'table' and ew.Mutations or{}, Scale = ev, BaseMutation = type(ew.BaseMutation) == 'string' and ew.BaseMutation or nil})
                                    if not ed:_espPasses(ez, eB) then
                                        eo[er] = nil
                                        continue
                                    end
                                    local eC ={}
                                    if ef.espRarity then
                                        eC[# eC + 1] = string.upper(ez.rarity or '?')
                                    end
                                    if ef.espName then
                                        eC[# eC + 1] = tostring(ez.name)
                                    end
                                    if ef.espKg then
                                        local eD, eE = pcall(bU.WeightKgForScale, ew.AssetCategory, ev)
                                        if eD and type(eE) == 'number' then
                                        eC[# eC + 1] = string.format('%d Kg', math.floor(eE))
                                    end
                                end
                                if ef.espValue and eB then
                                    eC[# eC + 1] = '$'..d3(eB)..'/s'
                                end
                                if type(es.Placement.ReadyAt) == 'number' then
                                    eC[# eC + 1] = 'READY'
                                    elseif
                                    type(ew.Placement) == 'table' then
                                        if ew.Placement.ReadyAt ~= nil then
                                        eC[# eC + 1] = 'READY'
                                    end
                                end
                                eB = ey.anchor:FindFirstChild(dZ)
                                if eB then
                                    else
                                    eB = Instance.new('BillboardGui') eB.Name = dZ eB.AlwaysOnTop = true eB.Size = UDim2.fromOffset(220, 72) eB.StudsOffset = Vector3.new(0, 1.4, 0) eB.MaxDistance = 1000
                                    local eD = Instance.new('ImageLabel') eD.Name = 'Icon' eD.AnchorPoint = Vector2.new(0.5, 1) eD.Position = UDim2.fromScale(0.5, 0.42) eD.Size = UDim2.fromOffset(34,
                                    34) eD.BackgroundTransparency = 1 eD.ScaleType = Enum.ScaleType.Fit eD.Visible = false eD.Parent = eB
                                    local eE = Instance.new('TextLabel') eE.Name = 'Text' eE.AnchorPoint = Vector2.new(0.5, 0) eE.Position = UDim2.fromScale(0.5, 0.45) eE.Size = UDim2.new(1,
                                    0, 0.55, 0) eE.BackgroundTransparency = 1 eE.Font = Enum.Font.GothamBold eE.TextSize = 13 eE.TextStrokeTransparency = 0.35 eE.TextXAlignment = Enum.TextXAlignment.Center eE.TextYAlignment = Enum.TextYAlignment.Top eE.Parent = eB eB.Parent = ey.anchor
                                end
                                local eD = eB:FindFirstChild('Icon')
                                if eD then
                                    local eE = ef.espIcon and type(ez.icon) == 'string' and ez.icon ~= '' and ez.icon or nil eD.Image = eE or '' eD.Visible = eE ~= nil
                                end
                                local eE = eB:FindFirstChild('Text') eE.Text = table.concat(eC, ' | ') eE.TextColor3 = eA
                                local eF = ey.anchor:FindFirstChild(d0)
                                if eF then
                                    eF:Destroy()
                                end
                            end
                        end
                    end
                end
                for ep, eq in pairs(ed._placedEspAnchors) do
                    if not eo[ep] then
                        if typeof(eq.anchor) == 'Instance' then
                            eq.anchor:Destroy()
                        end
                        if typeof(eq.highlight) == 'Instance' then
                            eq.highlight:Destroy()
                        end
                        ed._placedEspAnchors[ep] = nil
                    end
                end
                else
                for ei, ej in pairs(ed._placedEspAnchors or{}) do
                    if typeof(ej.anchor) == 'Instance' then
                        ej.anchor:Destroy()
                    end
                    if typeof(ej.highlight) == 'Instance' then
                        ej.highlight:Destroy()
                    end
                    ed._placedEspAnchors[ei] = nil
                end
            end
        end
        cU.setMinWeightKg =
        function(ed, ee)
        local ef = tonumber(ee) or 0 ed.config.minWeightKg = math.max(ef, 0)
    end
    cU.setMinValuePerSec =
    function(ed, ee)
    local ef = tonumber(ee) or 0 ed.config.minValuePerSec = math.max(ef, 0) ed:_refreshCounts() ed:_schedule()
end
cU.setSpeed =
function(ed, ee)
local ef = math.clamp(math.floor((tonumber(ee) or b0) + 0.5), bZ, b_) ed.config.speed = ef * bY
if l.__SenaV4AdminBoost == true then
    ed.config.speed = b5
end
if ed.enabled then
    ed:_startMovementProtection()
    elseif
    ed.activeTween then
        ed:_startMovementProtection()
    end
    return ef
end
cU.getDefaultSpeed =
function(ed)
return b0
end
cU.setFilterEnabled =
function(ed, ee, ef) ed.config[ee..'Enabled'] = ef == true ed:_refreshCounts() ed:_schedule()
end
cU.setFilter =
function(ed, ee, ef)
local eg = type(ef) == 'table' and table.clone(ef) or{}
if ee == 'mutations' and type(ed.catalog.resolveMutationId) == 'function' then
    local eh ={}
    for ei, ej in ipairs(eg) do
        local ek = ed.catalog.resolveMutationId(ej)
        if ek then
            table.insert(eh, ek)
        end
    end
    eg = eh
end
ed.config[ee] = eg ed:_refreshCounts() ed:_schedule()
end
cU.destroy =
function(ed)
if ed.destroyed then
    return
end
ed.destroyed = true ed.enabled = false ed:_mutePortalFx(false, true) pcall(ed._guardLagback, ed, false) pcall(ed._stopScramblePortalBypass, ed) pcall(ed._removePromptFilter,
ed)
if ed._relocateConn then
    pcall(ed._relocateConn.Disconnect, ed._relocateConn) ed._relocateConn = nil
end
ed._recalling = nil ed:_hideTreadmillDecoy() ed.planGeneration = ed.planGeneration + 1 ed.carry.generation += 1 ed:_invalidateCarryWorker() ed.carry.active = false ed.carry.uid = nil ed.tweenRecoveryUid = nil ed.safeStarting = false ed:_cancelTween('Destroyed') ed:_cleanupInstantSteal() ed:_removeGuardHitDistanceBoost() ed:_releaseOperation() ed:_stopMovementProtection()
if ed._healthPinner then
    pcall(ed._healthPinner.Disconnect, ed._healthPinner) ed._healthPinner = nil
end
if ed._healthChangedConnection then
    pcall(ed._healthChangedConnection.Disconnect, ed._healthChangedConnection) ed._healthChangedConnection = nil
end
ed:_restoreClaimPresentationFilter() c3(bH.Character) pcall(
function() ed:_clearEsp()
end
) pcall(
function()
for ee, ef in pairs(ed._placedEspAnchors or{}) do
    if typeof(ef.anchor) == 'Instance' then
        ef.anchor:Destroy()
    end
end
local eg = workspace:FindFirstChild('SenaV4PlacedEggAnchors')
if eg then
    eg:Destroy()
end
end
) cY(ed.connections) table.clear(ed.listeners) table.clear(ed.records)
end
return cU
end
)()
local bF ={k = 1000, m = 1000000, b = 1000000000, t = 1000000000000, q = 1000000000000000}
local function bG(bH)
local bI, bN = tostring(bH or ''):lower():gsub('%s+', ''):gsub('%$', ''):gsub('/s$', ''):match('^([%d%.]+)([kmbtq]?)$')
local bO = tonumber(bI)
if not bO then
    return nil
end
return math.max(0, math.floor(bO *(bF[bN] or 1) + 0.5))
end
local bH =(
function()
local bH = game:GetService('Players')
local bI = game:GetService('RunService')
local bN = game:GetService('ReplicatedStorage')
local bO = bH.LocalPlayer
local bP = require(bN.Shared.Remotes)
local bQ = require(bN.Client.EggState)
local bR = require(bN.Shared.Modules.Ragdoll)
local bS = require(bN.Shared.Modules.RagdollJoints)
local bT = bP.EggWorld
local bU = 340
local bV = 240
local bW = 0.05
local bX = 5
local bY ={} bY.__index = bY
local function bZ(b_)
if b_ then
    pcall(b_.Disconnect, b_)
end
end
bY.new =
function(b_)
local b0 = setmetatable({}, bY) b0.eggRuntime = b_ b0.enabled = true b0.destroyed = false b0.connections ={} b0.originalRagdoll ={} b0.originalHumanoidStates = setmetatable({},
{__mode = 'k'}) b0.stats ={blockedHits = 0, blockedDrops = 0, recarriedEggs = 0} b0.lastHeldEggUid = nil b0.lastHeldSlotKey = nil b0._installed = false b0._stickyToken = 0 b0._nextBodyRecoveryAt = 0 b0._nextJointSweepAt = 0 b0._forestStrikeOldFire = nil
return b0
end
bY._liveBody =
function(b_)
local b0 = bO.Character
return b0, b0 and b0:FindFirstChildOfClass('Humanoid'), b0 and b0:FindFirstChild('HumanoidRootPart')
end
bY._recoverBody =
function(b_, b0)
if b_.enabled then
    if b_.destroyed then
        return
    end
    else
    return
end
local b1, b2, b3 = b_:_liveBody()
if b1 then
    if not b2 then
        return
        elseif
        b3 then
            else
            return
        end
        else
        return
    end
    local b4 = os.clock()
    if not b0 and b4 < b_._nextBodyRecoveryAt then
        return
    end
    b_._nextBodyRecoveryAt = b4 + 0.03
    if not b_.originalHumanoidStates[b2] then
        local b5 = b_.originalHumanoidStates
        local b6 ={} b6.Physics = b2:GetStateEnabled(Enum.HumanoidStateType.Physics) b6.FallingDown = b2:GetStateEnabled(Enum.HumanoidStateType.FallingDown) b6.Ragdoll = b2:GetStateEnabled(Enum.HumanoidStateType.Ragdoll) b5[b2] = b6
    end
    local b5 = b2:GetState()
    local b6 = b5 == Enum.HumanoidStateType.Physics or b5 == Enum.HumanoidStateType.FallingDown or b5 == Enum.HumanoidStateType.Ragdoll or b5 == Enum.HumanoidStateType.PlatformStanding or b5 == Enum.HumanoidStateType.Seated pcall(
    function() b2.BreakJointsOnDeath = false b2.RequiresNeck = false b2:SetStateEnabled(Enum.HumanoidStateType.Dead, false) b2:SetStateEnabled(Enum.HumanoidStateType.Physics,
    false) b2:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) b2:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) b2.PlatformStand = false b2.Sit = false
    local b7 = b2:GetState()
    if b7 == Enum.HumanoidStateType.Physics or b7 == Enum.HumanoidStateType.FallingDown or b7 == Enum.HumanoidStateType.Ragdoll or b7 == Enum.HumanoidStateType.PlatformStanding or b7 == Enum.HumanoidStateType.Seated then
        b2:ChangeState(Enum.HumanoidStateType.GettingUp) b2:ChangeState(Enum.HumanoidStateType.Running)
    end
end
)
for b7, b8 in ipairs(b1:GetDescendants()) do
    if b8:IsA('Motor6D') then
        if not b8.Enabled then
            b8.Enabled = true
        end
        elseif
        b8:IsA('BallSocketConstraint') or b8:IsA('HingeConstraint') then
            if b8.Name:find('Ragdoll', 1, true) then
                pcall(b8.Destroy, b8)
                elseif
                b8:GetAttribute('RagdollConstraint') then
                    pcall(b8.Destroy, b8)
                end
            end
        end
        local b9 = b3.AssemblyLinearVelocity
        if b6 or Vector3.new(b9.X, 0, b9.Z).Magnitude > math.max(bU,(tonumber(b2.WalkSpeed) or 0) * 1.5) or math.abs(b9.Y) > bV then
            b3.AssemblyLinearVelocity = Vector3.new(0, 0, 0) b3.AssemblyAngularVelocity = Vector3.new(0, 0, 0) b_.stats.blockedHits = b_.stats.blockedHits + 1
        end
    end
    bY._watchCharacter =
    function(b_, b0)
    if not b0 then
        return
    end
    local function b1(b2)
    if b_.enabled then
        if b_.destroyed then
            return
        end
        else
        return
    end
    if b2:IsA('BallSocketConstraint') or b2:IsA('HingeConstraint') then
        if b2.Name:find('Ragdoll', 1, true) or b2:GetAttribute('RagdollConstraint') then
            pcall(b2.Destroy, b2) b_:_recoverBody(true)
        end
        elseif
        b2:IsA('Motor6D') then
            if not b2.Enabled then
                b2.Enabled = true
            end
        end
    end
    local b2 = b0.DescendantAdded:Connect(b1) table.insert(b_.connections, b2)
end
bY._installRagdollHooks =
function(b_)
if b_._installed then
    return
end
b_._installed = true task.spawn(
function() task.wait()
local b0 = l.__SenaV4ForestGate
if type(b0) == 'table' and(b0.comp and b0.orig) then
    pcall(rawset, b0.comp, '_attackHandler', b0.orig) l.__SenaV4ForestGate = nil
end
if type(getgc) ~= 'function' then
    return
end
local b1, b2 = pcall(getgc, true)
if b1 then
    if type(b2) ~= 'table' then
        return
    end
    else
    return
end
for b3, b4 in ipairs(b2) do
    if b3 % 20000 == 0 then
        bI.Heartbeat:Wait()
    end
    if b_.destroyed then
        return
    end
    if type(b4) == 'table' and rawget(b4, '_areaId') == 'Forest' and type(rawget(b4, '_attackHandler')) == 'function' then
        local b5 = rawget(b4, '_attackHandler') b_._forestGate ={comp = b4, orig = b5} l.__SenaV4ForestGate = b_._forestGate rawset(b4, '_attackHandler',
        function(...)
        if b_.enabled and(not b_.destroyed and(not(b_.eggRuntime and b_.eggRuntime.instantPhase == 'priming') and not(l.__SenaV4PlayerSteal and l.__SenaV4PlayerSteal.running))) then
            b_.stats.blockedHits = b_.stats.blockedHits + 1 b_:_recoverBody(true)
            if l.__SenaV4GodMode then
                l.__SenaV4GodMode:startDefend()
            end
            return
        end
        return b5(...)
    end
    )
    break
end
end
end
)
for b0, b1 in ipairs({'ApplyClientRagdoll', 'Ragdoll', 'TimedRagdoll', 'TimedRagdollAsync'}) do
    if type(bR[b1]) == 'function' then
        b_.originalRagdoll[b1] = bR[b1] bR[b1] =
        function(...)
        if b_.enabled and not b_.destroyed then
            b_.stats.blockedHits = b_.stats.blockedHits + 1 b_:_recoverBody(true)
            return
        end
        return b_.originalRagdoll[b1](...)
    end
end
end
if type(bR.IsRagdolled) == 'function' then
    b_.originalRagdoll.IsRagdolled = bR.IsRagdolled
    function bR.IsRagdolled(b2)
    if b_.enabled and b2 == bO.Character then
        return false
    end
    return b_.originalRagdoll.IsRagdolled(b2)
end
end
end
bY._restoreLocalState =
function(b_)
for b0, b1 in pairs(b_.originalHumanoidStates) do
    if b0.Parent then
        pcall(
        function() b0:SetStateEnabled(Enum.HumanoidStateType.Physics, b1.Physics) b0:SetStateEnabled(Enum.HumanoidStateType.FallingDown, b1.FallingDown) b0:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,
        b1.Ragdoll)
    end
    )
end
end
b_.originalHumanoidStates = setmetatable({},{__mode = 'k'}) pcall(bS.Release, bO.Character)
end
bY._slotKey =
function(b_, b0)
if type(b0) ~= 'table' then
    return nil
    elseif
    type(b0.AreaId) ~= 'string' then
        return nil
        elseif
        type(b0.NestId) ~= 'string' then
            return nil
        end
        return string.format('%s:%s', b0.AreaId, b0.NestId)
    end
    bY._requestCarry =
    function(b_, b0, b1)
    local b2 ={Uid = b0}
    if b1 ~= nil then
        b2.FirstAreaSlotKey = b1
    end
    return bT.AskFieldEggCarry:InvokeServer(b2)
end
bY._startSticky =
function(b_, b0, b1)
if type(b0) ~= 'string' then
    return
    elseif
    b0 == '' then
        return
    end
    b_._stickyToken = b_._stickyToken + 1
    local b2 = b_._stickyToken b_.stats.recarriedEggs = b_.stats.recarriedEggs + 1 task.spawn(
    function()
    local b3 = os.clock() + bX
    while true do
        local b4 = b_.destroyed
        if not((
        if b4 then
            not b4
            else
            b_.enabled) and b2 == b_._stickyToken and os.clock() < b3) then
                break
            end
            local b5 = bQ.ReadFieldEgg(b0)
            if b5 and(b5.State == 'Carried' and b5.CarrierUserId == bO.UserId) then
                b_.lastHeldEggUid = b0 b_.lastHeldSlotKey = b1 or b_:_slotKey(b5)
                return
            end
            if b5 and(b5.State == 'Dropped' or b5.State == 'Slot') then
                if b_.eggRuntime and b_.eggRuntime:requestCarryRecovery(b0) then
                    return
                end
                local b6, b7, b8 = b_:_liveBody()
                if b8 and(b5.BottomCFrame and(b8.Position - b5.BottomCFrame.Position).Magnitude <= 10) then
                    pcall(b_._requestCarry, b_, b0, b1 or b_:_slotKey(b5))
                end
            end
            task.wait(bW)
        end
    end
    )
end
bY._bindSignals =
function(b_) table.insert(b_.connections, bQ.CarryChanged:Connect(
function(b0)
if not b_.enabled then
    return
end
if b0.IsCarrying and type(b0.Uid) == 'string' then
    b_._stickyToken = b_._stickyToken + 1 b_.lastHeldEggUid = b0.Uid b_.lastHeldSlotKey = b_:_slotKey((bQ.ReadFieldEgg(b0.Uid)))
    return
end
local b1 = l.__SenaV4PlayerSteal
if b1 and b1.running then
    return
end
local b2 = b0.Uid or b_.lastHeldEggUid
local b3 = b_.lastHeldSlotKey
if b_.eggRuntime and b_.eggRuntime:isSkippedEgg(b2) then
    return
end
if b2 then
    b_.stats.blockedDrops = b_.stats.blockedDrops + 1 b_:_startSticky(b2, b3)
    if l.__SenaV4GodMode then
        l.__SenaV4GodMode:startDefend(b2)
    end
end
end
)) table.insert(b_.connections, bO.CharacterAdded:Connect(
function(b0) b_:_watchCharacter(b0) task.defer(
function() b_:_recoverBody(true)
end
)
end
))
if bO.Character then
    b_:_watchCharacter(bO.Character)
end
table.insert(b_.connections, bI.Stepped:Connect(
function() b_:_recoverBody()
end
))
end
bY.setEnabled =
function(b_, b0)
local b1 = b0 == true
if b_.enabled == b1 then
    return
end
b_.enabled = b1
if b_.enabled then
    b_:_recoverBody()
    else
    b_._stickyToken = b_._stickyToken + 1 b_:_restoreLocalState()
end
end
bY.install =
function(b_)
if b_.destroyed then
    return false
end
getgenv().__SenaV4AntiGuard = b_ b_:_installRagdollHooks() b_:_bindSignals() b_:_recoverBody()
return true
end
bY.destroy =
function(b_)
if b_.destroyed then
    return
end
b_.enabled = false b_:_restoreLocalState() b_.destroyed = true b_._stickyToken = b_._stickyToken + 1
for b0, b1 in ipairs(b_.connections) do
    bZ(b1)
end
table.clear(b_.connections)
for b2, b3 in pairs(b_.originalRagdoll) do
    if type(b3) == 'function' then
        bR[b2] = b3
    end
end
if b_._forestGate then
    pcall(rawset, b_._forestGate.comp, '_attackHandler', b_._forestGate.orig)
    if l.__SenaV4ForestGate == b_._forestGate then
        l.__SenaV4ForestGate = nil
    end
    b_._forestGate = nil
end
b_.eggRuntime = nil
if getgenv().__SenaV4AntiGuard == b_ then
    getgenv().__SenaV4AntiGuard = nil
end
end
bY.getStats =
function(b_)
return b_.stats
end
return bY
end
)()
local bI =(
function()
local bI = game:GetService('Players') game:GetService('RunService')
local bN = game:GetService('ReplicatedStorage')
local bO = bI.LocalPlayer
local bP ={} bP.__index = bP bP.new =
function(bQ)
local bR = setmetatable({}, bP) bR.eggRuntime = bQ bR.enabled = aB.GodMode == nil and true or aB.GodMode == true bR.active = false bR.activeDroppedUid = nil bR.swingSequence = 0 bR.lastSwingAt = 0 bR.defendThread = nil bR.connections ={} bR.targetRange = 35 bR:_bindSignals()
return bR
end
bP._isBat =
function(bQ, bR)
if bR then
    if not bR:IsA('Tool') then
        return false
    end
    else
    return false
end
local bS = l.__SenaV4IsBatTool
if bS and bS(bR) then
    return true
end
if not bS then
    if bR:GetAttribute('IsBat') == true then
        return true
        elseif
        bR:GetAttribute('GearName') == 'Bat' then
            return true
        end
    end
    local bT = bR:GetAttribute('ItemType')
    if bT ~= nil and bT ~= 'Gear' then
        return false
    end
    return string.find(string.lower(bR.Name), 'slap', 1, true) ~= nil
end
bP._findBat =
function(bQ)
local bR = bO.Character
local bS = bO:FindFirstChildOfClass('Backpack')
if bR then
    for bT, bU in ipairs(bR:GetChildren()) do
        if bQ:_isBat(bU) then
            return bU, true
        end
    end
end
if bS then
    for bT, bU in ipairs(bS:GetChildren()) do
        if bQ:_isBat(bU) then
            return bU, false
        end
    end
end
pcall(
function()
local bT = bN:FindFirstChild('Packages') and bN.Packages:FindFirstChild('Networking')
local bU = bT and bT:FindFirstChild('RF/Codex/AskWearFieldBat')
if bU then
    bU:InvokeServer()
end
end
)
return nil, false
end
bP._equipBat =
function(bQ)
local bR = bO.Character
local bS = bR and bR:FindFirstChildOfClass('Humanoid')
if bS then
    if bS.Health <= 0 then
        return nil
    end
    else
    return nil
end
local bT, bU = bQ:_findBat()
if not bT then
    return nil
end
if bU and bT.Parent == bR then
    return bT
end
pcall(bS.EquipTool, bS, bT)
local bV = os.clock() + 0.35
while os.clock() < bV do
    if bT.Parent == bR then
        return bT
    end
    task.wait(0.05)
end
return bT.Parent == bR and bT or nil
end
bP._getNearbyEnemies =
function(bQ)
local bR = bO.Character
local bS = bR and bR:FindFirstChild('HumanoidRootPart')
if not bS then
    return{}
end
local bT ={}
for bU, bV in ipairs(bI:GetPlayers()) do
    if bV ~= bO and bV.Character then
        local bW = bV.Character:FindFirstChild('HumanoidRootPart')
        local bX = bV.Character:FindFirstChildOfClass('Humanoid')
        if bW and(bX and bX.Health > 0) then
            local bY =(bW.Position - bS.Position).Magnitude
            if bY <= bQ.targetRange then
                table.insert(bT,{player = bV, root = bW, humanoid = bX, distance = bY})
            end
        end
    end
end
table.sort(bT,
function(bW, bX)
return bW.distance < bX.distance
end
)
return bT
end
bP._swing =
function(bQ, bR, bS)
if bR then
    if bR.Parent ~= bO.Character then
        return false
    end
    else
    return false
end
local bT = workspace:GetServerTimeNow()
if bT - bQ.lastSwingAt < 0.22 then
    return false
end
bQ.lastSwingAt = bT pcall(bR.Activate, bR)
local bU = bR:FindFirstChild('Handle') or bR:FindFirstChildWhichIsA('BasePart', true)
if bU and bS and type(firetouchinterest) == 'function' then
    pcall(
    function() firetouchinterest(bU, bS, 0) task.wait(0.01) firetouchinterest(bU, bS, 1)
end
)
end
pcall(
function()
local bV = require(bN.Shared.Remotes).BatSwing
if bV and bV.Trigger then
    bQ.swingSequence = bQ.swingSequence + 1
    local bW = string.format('%d:%d:%d', bO.UserId, bQ.swingSequence, math.floor(bT * 1000)) bV.Trigger:FireServer(nil, bW)
end
end
)
return true
end
bP.startDefend =
function(bQ, bR)
if not bQ.enabled then
    return
end
if bQ.eggRuntime and bQ.eggRuntime.instantPhase == 'priming' then
    return
end
if bR and(bQ.eggRuntime and bQ.eggRuntime:isSkippedEgg(bR)) then
    return
end
local bS = l.__SenaV4PlayerSteal
if bS and bS.running then
    return
end
bQ.active = true bQ.activeDroppedUid = bR or bQ.activeDroppedUid
if bQ.defendThread then
    return
end
bQ.defendThread = task.spawn(
function()
local bT = false
while bQ.active and bQ.enabled do
    if bQ.eggRuntime and(bQ.eggRuntime.carry and bQ.eggRuntime.carry.active) then
        break
    end
    local bU = l.__SenaV4PlayerSteal
    if bU and bU.running then
        bT = true
        break
    end
    local bV = bQ:_getNearbyEnemies()
    if # bV > 0 then
        local bW = bQ:_equipBat()
        if bW then
            for bX, bY in ipairs(bV) do
                if bY.root and bY.root.Parent then
                    bQ:_swing(bW, bY.root)
                end
            end
        end
    end
    task.wait(0.1)
end
bQ.active = false bQ.defendThread = nil
if bT then
    return
end
pcall(
function()
local bU = bO.Character
local bV = bU and bU:FindFirstChildOfClass('Humanoid')
if bV then
    bV:UnequipTools()
end
end
)
end
)
end
bP.stopDefend =
function(bQ) bQ.active = false bQ.activeDroppedUid = nil
end
bP.setEnabled =
function(bQ, bR) bQ.enabled = bR == true
if not bQ.enabled then
    bQ:stopDefend()
end
end
bP._bindSignals =
function(bQ) pcall(
function()
local bR = require(bN.Client.EggState) table.insert(bQ.connections, bR.CarryChanged:Connect(
function(bS)
if bS.IsCarrying then
    bQ:stopDefend()
    elseif
    bQ.enabled then
        bQ:startDefend(bS.Uid)
    end
end
))
end
) pcall(
function()
local bR = require(bN.Shared.Remotes)
local bS = bR.GuardPatrol and bR.GuardPatrol.ForestStrike
if bS then
    table.insert(bQ.connections, bS.OnClientEvent:Connect(
    function()
    if bQ.enabled then
        bQ:startDefend()
    end
end
))
end
end
)
end
bP.destroy =
function(bQ) bQ:stopDefend()
for bR, bS in ipairs(bQ.connections) do
    pcall(bS.Disconnect, bS)
end
table.clear(bQ.connections)
end
return bP
end
)()
local bN =(
function()
local bN = game:GetService('Players')
local bO = game:GetService('ReplicatedStorage')
local bP = bN.LocalPlayer
local bQ = require(bO.Shared.Remotes)
local bR = require(bO.Client.PlotState)
local bS = require(bO.Client.Hud)
local bT = require(bO.Shared.Save)
local bU = require(bO.Data.Treadmills)
local bV = 8
local function bW()
local bX = aI.blocker('treadmill')
if bX then
    return 'Yielding to '..aI.TITLES[bX]
end
local bY = aI.holder('treadmill')
if bY then
    return 'Waiting for '..aI.TITLES[bY]
end
return nil
end
local function bX()
return bW() ~= nil
end
local function bY()
return aI.blocker('treadmill') == 'auto_steal'
end
local function bZ()
return bW() or 'Yielding'
end
local b_ = 1
local b0 = 0.15
local b1 = 0.75
local b2 = 0.35
local b3 = 0.1
local b4 = 1.5
local b5 = 0.03
local b6 = 0.2
local b7 = 0.25
local b8 = 0.35
local b9 = 2.5
local ca = 3
local cb ={} cb.__index = cb cb.new =
function(cc, cd)
local ce = setmetatable({}, cb) ce.coordinator = cc ce.travel = cd ce.destroyed = false ce.listeners ={} ce.resources ={} ce.config ={disableDuringAutomation = true,
idleFarm = false, autoUpgrade = false} ce.stats ={mode = 'Idle', boost = 'Waiting'} ce.busy = cc and cc:getSnapshot().busy == true or false ce.idleGeneration = 0 ce.lastEquipAt = 0 ce.activeTreadmill = nil ce.travelingToTreadmill = false ce.treadmillEquipPending = false ce.unequipGuardRunning = false ce.backgroundYieldRunning = false ce.lastBackgroundYieldAt = 0 ce.carryPulseRunning = false ce.treadmillStateRevision = 0 ce:_listenActiveTreadmill() task.spawn(
function() pcall(
function() ce:_syncActiveTreadmillSnapshot()
end
)
end
) ce:_listenCoordinator() ce:_listenSpeedGain()
return ce
end
cb._snapshot =
function(cc)
return{mode = cc.stats.mode, boost = cc.stats.boost, disableDuringAutomation = cc.config.disableDuringAutomation, idleFarm = cc.config.idleFarm}
end
cb._emit =
function(cc)
local cd = cc:_snapshot()
for ce, cf in ipairs(cc.listeners) do
    pcall(cf, cd)
end
end
cb._setStatus =
function(cc, cd, ce)
if cd ~= nil then
    cc.stats.mode = cd
end
if ce ~= nil then
    cc.stats.boost = ce
end
cc:_emit()
end
cb.subscribe =
function(cc, cd) table.insert(cc.listeners, cd) pcall(cd, cc:_snapshot())
return
function()
local ce = table.find(cc.listeners, cd)
if ce then
    table.remove(cc.listeners, ce)
end
end
end
cb._requestUnequip =
function(cc)
local cd, ce, cf = pcall(
function()
return bQ.Treadmill.AskDoff:InvokeServer()
end
)
if not cd then
    return false, tostring(ce)
end
if ce == false then
    return false, tostring(cf or 'Server rejected')
end
return true
end
cb._shouldBlockTreadmill =
function(cc)
if cc.destroyed then
    return false
    elseif
    cc.carryPulseRunning then
        return false
    end
    if cc.busy and cc.config.disableDuringAutomation then
        return true
    end
    local cd = l.__SenaV4EggRuntime
    if cd and cd._treadmillResetting then
        return false
    end
    local ce, cf = pcall(aI.holder, 'treadmill')
    return ce and cf ~= nil
end
cb._startUnequipGuard =
function(cc)
if cc.unequipGuardRunning then
    return
    elseif
    cc:_shouldBlockTreadmill() then
        if cc.activeTreadmill == nil then
            return
        end
        else
        return
    end
    cc.unequipGuardRunning = true task.spawn(
    function()
    local cd = b0
    while cc:_shouldBlockTreadmill() and cc.activeTreadmill ~= nil do
        local ce, cf = cc:_requestUnequip() cc:_setStatus('Automation active', ce and 'Blocked' or 'Release retry: '..tostring(cf)) task.wait(cd) cd = math.min(cd * 2,
        b1)
    end
    cc.unequipGuardRunning = false
    if cc:_shouldBlockTreadmill() and cc.activeTreadmill ~= nil then
        cc:_startUnequipGuard()
    end
end
)
end
cb._cancelIdle =
function(cc, cd) cc.idleGeneration = cc.idleGeneration + 1
if cd then
    cc:_requestUnequip()
end
end
cb.setDisableDuringAutomation =
function(cc, cd) cc.config.disableDuringAutomation = true
if cc.busy and cc.config.disableDuringAutomation then
    cc:_cancelIdle(true) cc:_startUnequipGuard() cc:_setStatus('Automation active', 'Blocked')
    elseif
    not cc.busy then
        if cc.config.idleFarm then
            cc:_startIdle()
        end
    end
end
cb.setIdleFarm =
function(cc, cd) cc.config.idleFarm = cd == true
if not cc.config.idleFarm then
    cc:_cancelIdle(true) cc:_setStatus(cc.busy and 'Automation active' or 'Idle', 'Disabled')
    return
end
if not cc.busy then
    cc:_startIdle()
end
if cc.idleWatchdog then
    return
end
cc.idleWatchdog = task.spawn(
function()
while true do
    local ce = cc.destroyed
    if not(
    if ce then
        not ce
        else
        cc.config.idleFarm) then
            break
        end
        task.wait(2)
        if cc.idleRunning == nil and(not cc.busy and(cc.config.idleFarm and not cc.destroyed)) then
            cc:_startIdle()
        end
    end
    cc.idleWatchdog = nil
end
)
end
cb._readUpgradeState =
function(cc)
local cd, ce, cf, cg = pcall(
function()
local cd =(bT.Peek or bT.Get)()
if not cd then
    return nil
end
local ce = tonumber(cd.TreadmillUpgradeLevel) or 0
return ce, cd.Money, bU.GetByUpgradeLevel(ce + 1)
end
)
if cd then
    if ce == nil then
        return nil
    end
    else
    return nil
end
return ce, cf, cg
end
cb._raiseTier =
function(cc)
local cd, ce, cf = cc:_readUpgradeState()
if not cf then
    return false, 'Max tier'
end
if(tonumber(ce) or 0) <(tonumber(cf.Price) or 0) then
    return false, 'Not enough money'
end
local cg, ch, ci = pcall(
function()
return bQ.Treadmill.AskTierRaise:InvokeServer(cf._id)
end
)
if not cg then
    return false, tostring(ch)
end
if ch ~= true then
    return false, tostring(ci or 'Server rejected')
end
return true, cf.DisplayName or cf._id
end
cb.setAutoUpgrade =
function(cc, cd) cc.config.autoUpgrade = cd == true
if cc.config.autoUpgrade then
    if cc.autoUpgradeRunning then
        return
    end
    else
    return
end
cc.autoUpgradeRunning = true task.spawn(
function()
while true do
    local ce = cc.destroyed
    if not(
    if ce then
        not ce
        else
        cc.config.autoUpgrade) then
            break
        end
        local cf, cg = cc:_raiseTier()
        if cf then
            cc:_setStatus(cc.busy and 'Automation active' or 'Idle', 'Upgraded to '..tostring(cg)) task.wait(1)
            elseif
            cg == 'Max tier' then
                cc:_setStatus(cc.busy and 'Automation active' or 'Idle', 'Treadmill maxed') task.wait(30)
                else
                task.wait(5)
            end
        end
        cc.autoUpgradeRunning = false
    end
    )
end
cb._resolveStandCFrame =
function(cc)
local cd = bR.ResolveLocalSlot()
local ce = bR.ResolveFolder()
local cf = ce and cd and ce:FindFirstChild(tostring(cd))
local cg = cf and cf:FindFirstChild('TreadmillBottom')
if cg then
    if not cg:IsA('BasePart') then
        return nil
    end
    else
    return nil
end
local ch = bP.Character
local ci = ch and ch:FindFirstChild('HumanoidRootPart')
local cj = ch and ch:FindFirstChildOfClass('Humanoid')
if ci then
    if not cj then
        return nil
    end
    else
    return nil
end
local ck =
if cj.RigType == Enum.HumanoidRigType.R15 then
    ci.Size.Y * 0.5 + math.max(cj.HipHeight, 0.5)
    else
    ci.Size.Y * 0.5 + 2
    return cg.CFrame * CFrame.new(0, cg.Size.Y * 0.5 + ck + 0.05, 0)
end
cb.isEngaged =
function(cc)
return cc.activeTreadmill ~= nil or cc.travelingToTreadmill or cc.treadmillEquipPending or cc.carryPulseRunning
end
cb._isTreadmillHudActive =
function(cc)
local cd, ce = pcall(
function()
local cd = bS.Frame('Game')
local ce = bS.Frame('Treadmill')
return cd.Visible == false and ce.Visible == true
end
)
return cd and ce == true
end
cb._isGameHudRestored =
function(cc)
local cd, ce = pcall(
function()
local cd = bS.Frame('Game')
local ce = bS.Frame('Treadmill')
return cd.Visible == true and ce.Visible == false
end
)
return cd and ce == true
end
cb.pulseForCarry =
function(cc, cd, ce)
if cc.destroyed then
    return false, 'Preparation unavailable'
    elseif
    cc.carryPulseRunning then
        return false, 'Preparation unavailable'
        elseif
        type(cd) ~= 'function' then
            return false, 'Preparation unavailable'
        end
        cc:_cancelIdle(false) cc.carryPulseRunning = true
        local function cf()
        return cc.destroyed or ce ~= nil and ce()
    end
    local function cg(ch)
    local ci, cj, ck, cl = os.clock() + ch, 0, cc.treadmillStateRevision
    while true do
        local cm = cc.destroyed
        if not(
        if cm then
            not cm
            else
            os.clock() < ci) then
                break
            end
            local cn = os.clock()
            if cn >= cj then
                cc:_requestUnequip() cj = cn + b0
            end
            local co = cc:_syncActiveTreadmillSnapshot()
            local cp = cc:_isGameHudRestored()
            if cc.treadmillStateRevision ~= ck then
                ck = cc.treadmillStateRevision cl = nil
            end
            if co then
                cl = nil
                else
                if cc.activeTreadmill == nil then
                    if cp then
                        local cq = cl or cn
                        if cn - cq >= b8 then
                            return true
                        end
                        cl = cq
                        else
                        cl = nil
                    end
                    else
                    cl = nil
                end
            end
            task.wait(b5)
        end
        return false
    end
    local function ch(ci, cj)
    if not ci then
        cg(b4 + b8)
    end
    cc.treadmillEquipPending = false cc.carryPulseRunning = false
    if ci then
        cc:_setStatus('Automation active', 'Preparation complete')
        elseif
        not cc.destroyed then
            cc:_setStatus('Automation active', tostring(cj or 'Preparation failed'))
        end
        if cc:_shouldBlockTreadmill() and cc.activeTreadmill ~= nil then
            cc:_startUnequipGuard()
        end
        return ci, cj
    end
    cc:_syncActiveTreadmillSnapshot()
    local ci
    local cj = false
    for ck = 1, ca, 1 do
        if cf() then
            local cl, cm = ch(false, 'Cancelled')
            return cl, cm
        end
        local cl = cc:_resolveStandCFrame()
        if cl then
            cc:_setStatus('Preparing carry', ck == 1 and 'Positioning' or 'Repositioning')
            local cm, cn = pcall(cd, cl)
            if cm then
                local co
                if cn == true then
                    task.wait(b2) cc.treadmillEquipPending = true cc:_setStatus('Preparing carry', 'Activating')
                    local cp = os.clock() + b9
                    local cq = 0
                    local cr = cj
                    local cs = 0 co = ci
                    while true do
                        local ct = cf()
                        if not(
                        if ct then
                            not ct
                            else
                            os.clock() < cp) then
                                break
                            end
                            local cu = os.clock()
                            if cu >= cq then
                                cq = cu + b7 cc:_syncActiveTreadmillSnapshot()
                            end
                            if cc.activeTreadmill ~= nil and cc:_isTreadmillHudActive() then
                                cr = true
                                break
                            end
                            if cc.activeTreadmill == nil and cu >= cs then
                                local cv, cw, cx, cy = cu + b6, pcall(
                                function()
                                return bQ.Treadmill.AskWearStill:InvokeServer()
                            end
                            )
                            if
                            if cw then
                                cx == false
                                else
                                not cw then
                                    local cz = tostring(cy or cx) cc:_setStatus('Preparing carry', 'Activation retry') co = cz
                                end
                                cs = cv
                            end
                            task.wait(b5)
                        end
                        ci = co cj = cr
                        else
                        ci = 'Positioning failed'
                    end
                    else
                    ci = 'Positioning failed'
                end
                else
                ci = 'Position unavailable'
            end
            if cj then
                break
            end
            if cf() then
                cl, ck = ch(false, 'Cancelled')
                return cl, ck
            end
            cc:_setStatus('Preparing carry', 'Resetting position') cg(b4 + b8)
        end
        if not cj then
            local ck, cl = ch(false, 'Activation not confirmed: '..tostring(ci or 'Unknown'))
            return ck, cl
        end
        cc.treadmillEquipPending = false cc:_setStatus('Preparing carry', 'Active')
        local ck = os.clock() + b3
        while true do
            local cl = cf()
            if not(
            if cl then
                not cl
                else
                os.clock() < ck) then
                    break
                end
                task.wait(b5)
            end
            if cf() then
                local cl, cm = ch(false, 'Cancelled')
                return cl, cm
            end
            cc:_setStatus('Preparing carry', 'Releasing')
            if cg(b4 + b8) then
                local cl, cm = ch(true)
                return cl, cm
            end
            local cl, cm = ch(false, cf() and 'Cancelled' or 'Release not confirmed')
            return cl, cm
        end
        cb.yieldForBackground =
        function(cc)
        if cc.destroyed then
            return
        end
        cc:_cancelIdle(false)
        if cc.backgroundYieldRunning then
            return
        end
        cc.backgroundYieldRunning = true task.spawn(
        function()
        local cd = b0
        while not cc.destroyed do
            if cc.coordinator then
                if not cc.coordinator:isBackgroundBusy() then
                    break
                end
                else
                break
            end
            cc.lastBackgroundYieldAt = os.clock() cc:_setStatus('Idle', 'Yielding to background inventory') cc:_requestUnequip() task.wait(cd)
            if not cc:_syncActiveTreadmillSnapshot() then
                break
            end
            cd = math.min(cd * 2, b1)
        end
        cc.backgroundYieldRunning = false
        if not cc.destroyed and not cc:isEngaged() then
            cc:_setStatus('Idle', 'Background inventory ready')
        end
    end
    )
end
cb._startIdle =
function(cc)
if cc.destroyed then
    return
    elseif
    cc.busy then
        return
        elseif
        not cc.config.idleFarm then
            return
        end
        cc:_cancelIdle(false)
        local cd = cc.idleGeneration
        local ce = os.clock() cc.idleRunning = cd task.spawn(
        function()
        local cf, cg = xpcall(
        function()
        while true do
            local cf = cc.destroyed
            if not((
            if cf then
                not cf
                else
                not cc.busy) and cc.config.idleFarm and cd == cc.idleGeneration) then
                    break
                end
                if cc.coordinator and cc.coordinator:isBackgroundBusy() then
                    ce = os.clock() cc:_setStatus('Idle', 'Waiting for background inventory') task.wait(0.25)
                    continue
                end
                if bY() then
                    ce = os.clock() cc:_setStatus('Idle', 'Yielding to Auto Steal') task.wait(0.25)
                    continue
                end
                if l.__SenaV4IsAutoSellEggBusy and l.__SenaV4IsAutoSellEggBusy() then
                    ce = os.clock() cc:_setStatus('Idle', 'Waiting for Auto Sell Egg') task.wait(0.25)
                    continue
                end
                if bX() then
                    ce = os.clock() cc:_setStatus('Idle', bZ()) task.wait(0.25)
                    continue
                end
                local cg = b_ -(os.clock() - ce)
                if cg > 0 then
                    cc:_setStatus('Idle', string.format('Starting in %.0fs', math.ceil(cg))) task.wait(math.min(cg, 0.25))
                    continue
                end
                local ch = cc:_resolveStandCFrame()
                if not ch then
                    cc:_setStatus('Idle', 'Position unavailable') task.wait(2)
                    continue
                end
                cc.travelingToTreadmill = true cc:_setStatus('Moving', 'Waiting')
                local ci = false
                local cj = cc.travel
                local ck = bP.Character
                local cl = ck and ck:FindFirstChild('HumanoidRootPart')
                local cm = ck and ck:FindFirstChildOfClass('Humanoid')
                if cj and(cl and(cm and(type(cj._teleportRoot) == 'function' and(type(cj._isInSafeArea) == 'function' and(cj:_isInSafeArea(cl) and(cl.Position - ch.Position).Magnitude < 250))))) then
                    local cn, co = pcall(cj._teleportRoot, cj, cl, cm, ch) ci = cn and co == true
                end
                local cn = ci or cc.travel and cc.travel:travelAndWait(ch,{abort =
                function()
                return cc.destroyed or cc.busy or not cc.config.idleFarm or cd ~= cc.idleGeneration or cc.coordinator and cc.coordinator:isBackgroundBusy() or l.__SenaV4IsAutoSellEggBusy and l.__SenaV4IsAutoSellEggBusy() or bX()
            end
            }) cc.travelingToTreadmill = false
            if not cn then
                if not cc.busy and cc.config.idleFarm then
                    cc:_setStatus('Idle', 'Travel failed') task.wait(1)
                end
                continue
            end
            if cc.busy or not cc.config.idleFarm or cd ~= cc.idleGeneration or cc.coordinator and cc.coordinator:isBackgroundBusy() then
                continue
                elseif
                l.__SenaV4IsAutoSellEggBusy then
                    if l.__SenaV4IsAutoSellEggBusy() then
                        continue
                        elseif
                        bX() then
                            continue
                        end
                        elseif
                        bX() then
                            continue
                        end
                        task.wait(b2)
                        if cc.busy or not cc.config.idleFarm or cd ~= cc.idleGeneration or cc.coordinator and cc.coordinator:isBackgroundBusy() then
                            continue
                            elseif
                            l.__SenaV4IsAutoSellEggBusy then
                                if l.__SenaV4IsAutoSellEggBusy() then
                                    continue
                                    elseif
                                    bX() then
                                        continue
                                    end
                                    elseif
                                    bX() then
                                        continue
                                    end
                                    cc.treadmillEquipPending = true ck, cf, cj = pcall(
                                    function()
                                    return bQ.Treadmill.AskWearStill:InvokeServer()
                                end
                                )
                                if
                                if ck then
                                    cf == false
                                    else
                                    not ck then
                                        cc.treadmillEquipPending = false cc:_setStatus('Preparing carry', 'Activation failed: '..tostring(cj or cf))
                                        else
                                        cc.lastEquipAt = os.clock() cc:_setStatus('Active', 'Waiting for gain') task.delay(2,
                                        function()
                                        if not cc.destroyed and cc.activeTreadmill == nil then
                                        cc.treadmillEquipPending = false
                                    end
                                end
                                )
                            end
                            local co = os.clock() + bV
                            while(cc.activeTreadmill ~= nil or os.clock() < co) and not cc.destroyed and not cc.busy and cc.config.idleFarm and cd == cc.idleGeneration and not(cc.coordinator and cc.coordinator:isBackgroundBusy()) do
                                if bY() then
                                    cc:_cancelIdle(true) cc:_setStatus('Idle', 'Yielding to Auto Steal')
                                    break
                                end
                                if l.__SenaV4IsAutoSellEggBusy and l.__SenaV4IsAutoSellEggBusy() then
                                    cc:_cancelIdle(true) cc:_setStatus('Idle', 'Yielding to Auto Sell Egg')
                                    break
                                end
                                if bX() then
                                    cc:_requestUnequip() cc:_setStatus('Idle', bZ())
                                    break
                                end
                                task.wait(0.25)
                            end
                        end
                    end
                    , debug.traceback)
                    if not cf then
                        warn('[SAE][treadmill] idle error:\n'..tostring(cg))
                    end
                    if cc.idleRunning == cd then
                        cc.idleRunning = nil
                    end
                end
                )
            end
            cb._onCoordinator =
            function(cc, cd)
            local ce = cc.busy cc.busy = cd.busy == true
            if cc.busy then
                cc:_cancelIdle(cc.config.disableDuringAutomation) cc:_startUnequipGuard() cc:_setStatus('Automation active', cc.config.disableDuringAutomation and 'Blocked' or 'Unchanged')
                elseif
                ce or cc.config.idleFarm then
                    if cc.config.idleFarm then
                        cc:_startIdle()
                        else
                        cc:_setStatus('Idle', 'Disabled')
                    end
                end
            end
            cb._listenCoordinator =
            function(cc)
            if not cc.coordinator then
                return
            end
            table.insert(cc.resources, cc.coordinator:subscribe(
            function(cd) cc:_onCoordinator(cd)
        end
        )) table.insert(cc.resources, cc.coordinator:subscribeBackground(
        function(cd)
        if cd.busy then
            cc:_cancelIdle(false) cc:_setStatus('Idle', 'Waiting for background inventory')
            elseif
            not cc.destroyed then
                if not cc.busy and cc.config.idleFarm then
                    cc:_startIdle()
                end
            end
        end
        ))
    end
    cb._syncActiveTreadmillSnapshot =
    function(cc)
    local cd, ce = pcall(
    function()
    return bQ.Treadmill.AskRenderSnapshot:InvokeServer()
end
)
if cd then
    if type(ce) ~= 'table' then
        return cc.activeTreadmill ~= nil
    end
    else
    return cc.activeTreadmill ~= nil
end
local cf = table.find(ce, bP.UserId) ~= nil cc.activeTreadmill = cf and 'snapshot' or nil
if not cf then
    cc.treadmillEquipPending = false
end
return cf
end
cb._listenActiveTreadmill =
function(cc)
local function cd(ce) cc.treadmillStateRevision = cc.treadmillStateRevision + 1 cc.activeTreadmill = ce cc.treadmillEquipPending = false
if ce ~= nil and cc:_shouldBlockTreadmill() then
    cc:_startUnequipGuard()
    elseif
    ce == nil and cc:_shouldBlockTreadmill() then
        cc:_setStatus('Automation active', 'Blocked')
        elseif
        ce == nil then
            cc:_setStatus('Idle', cc.config.idleFarm and 'Released' or 'Disabled')
            elseif
            not cc.busy then
                cc:_setStatus('Active', 'Waiting for gain')
            end
        end
        local ce, cf pcall(
        function() ce = bQ.Treadmill.AssignedBeltShifted
    end
    ) pcall(
    function() cf = bQ.Treadmill.RenderStateShifted
end
)
if ce then
    table.insert(cc.resources, ce.OnClientEvent:Connect(
    function(cg) cd(cg)
end
))
return
end
if cf then
    table.insert(cc.resources, cf.OnClientEvent:Connect(
    function(cg, ch)
    if cg ~= bP.Name then
        return
    end
    cd(ch and cg or nil)
end
))
end
end
cb._listenSpeedGain =
function(cc)
local cd = bQ.Treadmill.SpeedGained
if cd then
    table.insert(cc.resources, cd.OnClientEvent:Connect(
    function() cc.activeTreadmill = cc.activeTreadmill or true cc.treadmillEquipPending = false
    if cc:_shouldBlockTreadmill() then
        cc:_startUnequipGuard()
        return
    end
    cc:_setStatus('Active', 'Gain ticking')
end
))
end
end
cb.destroy =
function(cc)
if cc.destroyed then
    return
end
cc.destroyed = true cc:_cancelIdle(true)
for cd, ce in ipairs(cc.resources) do
    pcall(
    function()
    if typeof(ce) == 'RBXScriptConnection' then
        ce:Disconnect()
        elseif
        type(ce) == 'function' then
            ce()
            elseif
            type(ce) == 'table' then
                if type(ce.Disconnect) == 'function' then
                    ce:Disconnect()
                end
            end
        end
        )
    end
    table.clear(cc.resources) table.clear(cc.listeners)
end
cb.Destroy = cb.destroy
return cb
end
)()
local bO = bA.new()
local bP = bE.new(bB, bD, bO) l.__SenaV4EggRuntime = bP
local bQ = bN.new(bO, bP) l.__SenaV4TreadmillManager = bQ aI.register('treadmill',{wants =
function()
return bQ.config.idleFarm == true and not bQ.destroyed
end
, active =
function()
local bR = bQ.destroyed
return
if bR then
    not bR
    else
    bQ:isEngaged() == true
end
, enabled =
function()
return bQ.config.idleFarm == true
end
, status =
function()
local bR = bQ.stats or{}
local bS = tostring(bR.mode or '')
local bT = tostring(bR.boost or '')
if bT ~= '' and bT ~= 'Waiting' then
    return bS..'  \194\183  '..bT
end
return bS
end
}) bP:setTreadmillManager(bQ) bQ:setDisableDuringAutomation(true)
if aB.AutoTreadmillIdle then
    bQ:setIdleFarm(true)
end
if aB.AutoIndex then
    bP:setIndexObjective(true)
end
if aB.AutoTreadmillUpgrade then
    bQ:setAutoUpgrade(true)
end
l.__SenaV4Webhook =(
function()
local bR = game:GetService('HttpService')
local bS = game:GetService('ReplicatedStorage')
local bT = game:GetService('Players').LocalPlayer
local bU, bV, bW, bX, bY, bZ, b_, b0, b1 = http_request or request or http and http.request or syn and syn.request or fluxus and fluxus.request,{},{}, false,
{}, '96240498384290' pcall(
function() b0 = require(bS.Shared.Util.AssetEarnings)
end
) pcall(
function() b1 = require(bS.Shared.Util.EggRecords)
end
)
local function b2(b3)
local b4 = tostring(b3 or ''):match('%d+')
if not b4 then
    return nil
end
b3 = bY[b4]
if b3 ~= nil then
    if b3 == '' then
        return nil
    end
    return b3
end
local b5, b6 ={'512x512', '150x150'}
for b7, b8 in ipairs(b5) do
    local b9 pcall(
    function()
    local ca, cb = 'https://thumbnails.roblox.com/v1/assets?assetIds='..b4..'&size='..b8..'&format=Png&isCircular=false'
    if bU then
        local cc = bU({Url = ca, Method = 'GET'}) cb = type(cc) == 'table' and(cc.Body or cc.body) or nil
        else
        cb = bR:GetAsync(ca)
    end
    if type(cb) == 'string' and cb ~= '' then
        local cc = bR:JSONDecode(cb)
        local cd = cc and cc.data and cc.data[1]
        if cd and(cd.state == 'Completed' and(type(cd.imageUrl) == 'string' and cd.imageUrl ~= '')) then
            b9 = cd.imageUrl
        end
    end
end
)
if b9 then
    b6 = b6 or b9
    local ca = b9:find('/Png/', 1, true)
    local cb = b6
    if ca then
        b6 = b9
        break
    end
    b6 = cb
end
end
bY[b4] = b6 or ''
return b6
end
local function b3()
if b_ == nil then
    b_ = b2(bZ) or false
end
return b_ or nil
end
local b4 b4 ={cache ={}, crc = nil, size = 96, crc32 =
function(b5)
if not b4.crc then
    b4.crc ={}
    for b6 = 0, 255, 1 do
        local b7 = b6
        for b8 = 1, 8, 1 do
            b7 = bit32.band(b7, 1) == 1 and bit32.bxor(3988292384, bit32.rshift(b7, 1)) or bit32.rshift(b7, 1)
        end
        b4.crc[b6] = b7
    end
end
local b6 = 4294967295
for b7 = 1, # b5, 1 do
    b6 = bit32.bxor(b4.crc[bit32.band(bit32.bxor(b6, b5:byte(b7)), 255)], bit32.rshift(b6, 8))
end
return bit32.bxor(b6, 4294967295)
end
, chunk =
function(b5, b6)
return string.pack('>I4', # b6)..b5..b6..string.pack('>I4', b4.crc32(b5..b6))
end
, encode =
function(b5, b6, b7)
local b8 = 1
local b9 = 0
for ca = 1, # b7, 1 do
    b8 =(b8 + b7:byte(ca)) % 65521 b9 =(b9 + b8) % 65521
end
local ca ={'x\1'}
local cb = 1
while cb <= # b7 do
    local cc = b7:sub(cb, cb + 65534) cb += # cc ca[# ca + 1] = string.char(cb > # b7 and 1 or 0)..string.pack('<I2<I2', # cc, bit32.bxor(# cc, 65535))..cc
end
ca[# ca + 1] = string.pack('>I4', b9 * 65536 + b8)
return '\137PNG\r\n\26\n'..b4.chunk('IHDR', string.pack('>I4>I4', b5, b6)..'\b\6\0\0\0')..b4.chunk('IDAT', table.concat(ca))..b4.chunk('IEND', '')
end
, render =
function(b5)
local b6 = tostring(b5 or ''):match('%d+')
if not b6 then
    return nil
end
local b7 = b4.cache[b6]
if b7 ~= nil then
    return b7 or nil
end
local b8, b9 = pcall(
function()
local b8 = game:GetService('AssetService'):CreateEditableImageAsync(Content.fromUri('rbxassetid://'..b6))
local b9 = b8.Size
local ca = b8:ReadPixelsBuffer(Vector2.zero, b9)
local cb = b4.size
local cc ={}
for cd = 0, cb - 1, 1 do
    local ce = math.floor(cd * b9.Y / cb)
    local cf ={'\0'}
    for cg = 0, cb - 1, 1 do
        local ch =(ce * b9.X + math.floor(cg * b9.X / cb)) * 4 cf[# cf + 1] = string.char(buffer.readu8(ca, ch), buffer.readu8(ca, ch + 1), buffer.readu8(ca, ch + 2),
        buffer.readu8(ca, ch + 3))
    end
    cc[# cc + 1] = table.concat(cf)
end
b8:Destroy()
return b4.encode(cb, cb, table.concat(cc))
end
)
local ca = b8 and type(b9) == 'string' and b9 or false b4.cache[b6] = ca
return ca or nil
end
, post =
function(b5, b6, b7)
local b8 = 'SenaHub'..tostring(math.random(100000, 999999))..tostring(os.time())
local b9 = table.concat({'--'..b8, 'Content-Disposition: form-data; name="payload_json"', 'Content-Type: application/json', '', bR:JSONEncode(b6), '--'..b8,
[[Content-Disposition: form-data; name="files[0]"; filename="egg.png"]], 'Content-Type: image/png', '', b7, '--'..b8..'--', ''}, '\r\n')
local ca = bU({Url = b5, Method = 'POST', Headers ={['Content-Type'] = 'multipart/form-data; boundary='..b8}, Body = b9})
local cb = type(ca) == 'table' and tonumber(ca.StatusCode or ca.status) or 0
return cb >= 200 and cb < 300
end
} bV.png = b4
local function b5()
if bX then
    return
end
bX = true task.spawn(
function()
while # bW > 0 do
    local b6 = table.remove(bW, 1) pcall(
    function()
    if b6.thumbAsset then
        local b7 = b6.payload.embeds[1]
        local b8 = b2(b6.thumbAsset)
        if b8 then
            b7.thumbnail ={url = b8}
        end
    end
    if b6.imageAsset and bU then
        local b7 = b4.render(b6.imageAsset)
        if b7 then
            local b8 = b6.payload.embeds[1]
            local b9 = b8.thumbnail b8.thumbnail ={url = 'attachment://egg.png'}
            if b4.post(b6.url, b6.payload, b7) then
                return
            end
            b8.thumbnail = b9
        end
    end
    local b7 = bR:JSONEncode(b6.payload)
    if bU then
        bU({Url = b6.url, Method = 'POST', Headers ={['Content-Type'] = 'application/json'}, Body = b7})
        else
        bR:PostAsync(b6.url, b7, Enum.HttpContentType.ApplicationJson)
    end
end
) task.wait(0.6)
end
bX = false
end
)
end
local function b6(b7)
if typeof(b7) ~= 'Color3' then
    return 5814783
end
return math.floor(b7.R * 255 + 0.5) * 65536 + math.floor(b7.G * 255 + 0.5) * 256 + math.floor(b7.B * 255 + 0.5)
end
local function b7(b8)
local b9 pcall(
function() b9 = require(bS.Packages.FormatNumber.Simple)
end
)
if b9 and b9.FormatCompact then
    local ca, cb = pcall(b9.FormatCompact, b8, '.#')
    if ca and cb then
        return tostring(cb)
    end
end
return string.format('%.1f', b8 or 0)
end
bV.compact = b7 bV.rateOf =
function(b8)
if b0 then
    if type(b8) ~= 'table' then
        return 0
    end
    else
    return 0
end
local b9 = tonumber(b8.AssetScale) or 1
local ca ={Category = b8.AssetCategory, Scale = b9, AssetScale = b9, BaseMutation = b8.BaseMutation, Mutations = b8.Mutations or{}}
for cb, cc in ipairs({'LiveRatePerSecond', 'RatePerSecond', 'CatalogRatePerSecond'}) do
    if type(b0[cc]) == 'function' then
        b9, cb = pcall(b0[cc], ca)
        if b9 and(type(cb) == 'number' and cb > 0) then
            return cb
        end
    end
end
return 0
end
bV.weightOf =
function(b8)
if b1 then
    if type(b8) ~= 'table' then
        return 0
    end
    else
    return 0
end
local b9, ca = pcall(b1.WeightKgForScale, b8.AssetCategory, tonumber(b8.AssetScale) or 1)
if b9 and type(ca) == 'number' then
    return ca
end
return 0
end
bV.sizeText =
function(b8)
local b9 = tonumber(b8 and(b8.AssetScale or b8.Scale)) or 1
if b9 >= 100 then
    return string.format('%.0fx', b9)
end
return string.format('%.2fx', b9)
end
bV.weightText =
function(b8)
local b9 = tonumber(b8) or 0
if b9 >= 1000 then
    return b7(b9)..' kg'
end
return string.format('%.1fkg', b9)
end
bV.rateText =
function(b8)
local b9 = tonumber(b8) or 0
if b9 >= 1000 then
    return '$'..b7(b9)..'/s'
end
return string.format('$%d/s', math.floor(b9))
end
bV.passes =
function(b8, b9, ca)
local cb ={}
local cc = false
for cd, ce in ipairs(aB.WebhookRarities or{}) do
    if ce ~= 'None' and ce ~= '' then
        cb[ce] = true cc = true
    end
end
if cc and not cb[b9.rarity] then
    return false
end
local cf = tonumber(aB.WebhookMinValue) or 0
if cf > 0 and ca < cf then
    return false
end
return true
end
local b8 ={'Image', 'Icon', 'Thumbnail', 'ImageId', 'IconId', 'Texture', 'Asset', 'DisplayImage'} bV.eggAsset =
function(b9)
local ca pcall(
function() ca = require(bS.Data.Assets).Directory
end
)
local cb = ca and ca[b9]
if type(cb) ~= 'table' then
    return nil
end
for cc, cd in ipairs({cb, cb.Egg, cb.Pet}) do
    if type(cd) == 'table' then
        for ce, cf in ipairs(b8) do
            local cg = cd[cf]
            local ch =(type(cg) == 'string' or type(cg) == 'number') and tostring(cg):match('%d+')
            if ch and tonumber(ch) > 0 then
                return ch
            end
        end
    end
end
return nil
end
bV.stolen =
function(b9, ca, cb)
if aB.WebhookEnabled ~= true then
    return
end
local cc = aB.WebhookURL
if type(cc) ~= 'string' then
    return
    elseif
    cc == '' then
        return
    end
    if type(b9) ~= 'table' then
        return
        elseif
        not b9.AssetCategory then
            return
        end
        local cd = ca or{name = b9.AssetCategory, rarity = 'Unknown', rarityColor = nil}
        local ce = bV.rateOf(b9)
        if not bV.passes(b9, cd, ce) then
            return
        end
        local cf ={{name = 'User', value = bT.Name, inline = true},{name = 'Rarity', value = tostring(cd.rarity), inline = true},{name = 'Size', value = bV.sizeText(b9),
        inline = true},{name = 'Weight', value = bV.weightText(bV.weightOf(b9)), inline = true},{name = 'Cash/s', value = bV.rateText(ce), inline = true},{name = 'Area',
        value = tostring(b9.AreaId or '?'), inline = true}}
        local cg = b9.Mutations or{}
        if # cg > 0 then
            local ch ={}
            for ci, cj in ipairs(cg) do
                ch[# ch + 1] = tostring(cj)
            end
            local ck = # cf + 1
            local cl ={name = 'Mutations'} cl.value, cl.inline, cf[ck] = table.concat(ch, ', '), false, cl
        end
        if cb and cb ~= '' then
            local ch = # cf + 1
            local ci ={name = 'Taken From'} ci.value, ci.inline, cf[ch] = tostring(cb), false, ci
        end
        local ch = b3()
        local ci ={title = 'Egg Stolen', description = string.format("You've stolen a **%s** %s", tostring(cd.rarity), tostring(cd.name)), color = b6(cd.rarityColor),
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'), author ={name = 'LUKZ', icon_url = ch}, footer ={text = 'LUKZ', icon_url = ch}, fields = cf}
        if # bW > 40 then
            table.remove(bW, 1)
        end
        table.insert(bW,{url = cc, payload ={embeds ={ci}}, imageAsset = bV.eggIcon(b9.AssetCategory)}) b5()
    end
    bV.eggIcon =
    function(b9)
    local ca pcall(
    function() ca = require(bS.Data.Assets).Directory[b9]
end
)
local cb = type(ca) == 'table' and type(ca.Egg) == 'table' and ca.Egg.Icon
return cb and tostring(cb):match('%d+') or bV.eggAsset(b9)
end
bV.test =
function()
local b9 = aB.WebhookURL
if type(b9) ~= 'string' then
    return false
    elseif
    b9 == '' then
        return false
    end
    local ca = b3()
    local cb ={title = 'Webhook Test', description = string.format('Connection test for **%s**', bT.Name), color = 5814783, timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
    author ={name = 'LUKZ', icon_url = ca}, footer ={text = 'LUKZ', icon_url = ca}, fields ={{name = 'User', value = bT.Name, inline = true},{name = 'User ID',
    value = tostring(bT.UserId), inline = true},{name = 'Place ID', value = tostring(game.PlaceId), inline = true},{name = 'Status', value = 'Connected', inline = true}}}
    local cc = b2(bZ)
    if cc then
        cb.thumbnail ={url = cc}
    end
    table.insert(bW,{url = b9, payload ={embeds ={cb}}, imageAsset = bV.eggIcon('Dog')}) b5()
    return true
end
local b9 = os.clock()
local ca
local function cb()
local cc = math.floor(os.clock() - b9)
local cd = math.floor(cc / 3600)
local ce = math.floor(cc % 3600 / 60)
if cd > 0 then
    return string.format('%dh %dm', cd, ce)
end
return string.format('%dm %ds', ce, cc % 60)
end
bV.disconnected =
function(cc)
if aB.WebhookDisconnect ~= true then
    return
end
local cd = aB.WebhookURL
if type(cd) ~= 'string' then
    return
    elseif
    cd == '' then
        return
    end
    if type(cc) ~= 'string' then
        return
        else
        if cc == '' then
            return
            else
            if cc == ca then
                return
            end
        end
    end
    ca = cc
    local ce = b3()
    local cf ={title = 'Account Disconnected', description = string.format('**%s** was disconnected from Steal an Egg.', bT.Name), color = 15548997, timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
    author ={name = 'LUKZ', icon_url = ce}, footer ={text = 'LUKZ', icon_url = ce}} cf.fields ={{name = 'User', value = bT.Name, inline = true},{name = 'User ID',
    value = tostring(bT.UserId), inline = true},{name = 'Session', value = cb(), inline = true},{name = 'Reason', value = cc:sub(1, 1000), inline = false},
    {name = 'Server', value = '`'..tostring(game.JobId ~= '' and game.JobId or 'unknown')..'`', inline = false}}
    local cg = bR:JSONEncode({embeds ={cf}}) task.spawn(
    function() pcall(
    function()
    if bU then
        bU({Url = cd, Method = 'POST', Headers ={['Content-Type'] = 'application/json'}, Body = cg})
        else
        bR:PostAsync(cd, cg, Enum.HttpContentType.ApplicationJson)
    end
end
)
end
)
end
pcall(
function()
local cc = l.__SenaV4DisconnectConn
if typeof(cc) == 'RBXScriptConnection' then
    cc:Disconnect()
end
l.__SenaV4DisconnectConn = game:GetService('GuiService').ErrorMessageChanged:Connect(
function(cd) pcall(bV.disconnected, cd)
end
)
end
)
return bV
end
)()
local bR =(
function()
local bR = game:GetService('Players')
local bS = game:GetService('ReplicatedStorage')
local bT = bR.LocalPlayer
local bU = require(bS.Client.EggState)
local bV = require(bS.Shared.Types.AreaEggs)
local bW ={} bW.__index = bW
local bX = 16
local bY = 8
local bZ = 80
local b_ = 552.2
local b0 = 120
local b1 = 1245
local b2 ={1.1, 0.2, 0.7, 1.4, 0.45}
local b3 = 60
local b4 = 7 bW.new =
function(b5, b6, b7)
local b8 = setmetatable({}, bW) b8.eggRuntime = b5 b8.godMode = b6 b8.catalog = b7 b8.enabled = false b8.running = false b8.status = 'idle' b8.taken = 0 b8.attempts = 0 b8.history ={} b8.blacklist ={} b8.forced = false b8.listeners ={} b8.swingSeq = 0 b8.leadIdx = 1 b8.hitIdx = nil b8.missStreak = 0 b8.lastCarrier ={}
return b8
end
bW.onChanged =
function(b5, b6) table.insert(b5.listeners, b6)
end
bW._notify =
function(b5)
for b6, b7 in ipairs(b5.listeners) do
    pcall(b7, b5)
end
end
bW._setStatus =
function(b5, b6)
if b5.status == b6 then
    return
end
b5.status = b6 b5:_notify()
end
bW._log =
function(b5, b6, b7, b8) table.insert(b5.history, 1,{at = os.time(), player = b6 or '?', egg = b7 or '?', outcome = b8 or '?'})
while # b5.history > 20 do
    table.remove(b5.history)
end
b5:_notify()
end
bW.setEnabled =
function(b5, b6) b5.enabled = b6 == true
if b5.enabled then
    b5:_setStatus('looking for a carrier') b5:_start()
    else
    b5:_setStatus('idle')
end
end
bW._passes =
function(b5, b6)
if type(b6) ~= 'table' then
    return false
    elseif
    not b6.AssetCategory then
        return false
    end
    local b7 = b5.catalog.resolve(b6)
    local b8 ={}
    local b9 = false
    for ca, cb in ipairs(aB.StealPlayerRarities or{}) do
        if cb ~= 'None' and cb ~= '' then
            b8[cb] = true b9 = true
        end
    end
    if b9 then
        if not b8[b7.rarity] then
            return false
        end
        else
        for cc, cd in ipairs(aB.StealRarities or{}) do
            if cd ~= 'None' and cd ~= '' then
                b8[cd] = true b9 = true
            end
        end
        if b9 and not b8[b7.rarity] then
            return false
        end
    end
    local cc = tonumber(aB.StealPlayerMinValue) or 0
    if cc > 0 and(l.__SenaV4Webhook and l.__SenaV4Webhook.rateOf(b6) or 0) < cc then
        return false
    end
    return true
end
bW.carriers =
function(b5)
local b6, b7, b8 ={}, pcall(
function()
return bU.ReadFieldEggs()
end
)
if b7 then
    if not b8 then
        return b6
    end
    else
    return b6
end
for b9, ca in ipairs(b8.Records or{}) do
    if(ca.State == 'Carried' or bV and bV.States and ca.State == bV.States.Carried) and not b5.blacklist[ca.Uid] then
        local cb pcall(
        function() cb = bU.ReadFieldEgg(ca.Uid)
    end
    ) cb = cb or ca
    local cc = cb.CarrierUserId
    if cc and cc ~= bT.UserId then
        local cd = bR:GetPlayerByUserId(cc)
        local ce = cd and cd.Character and cd.Character:FindFirstChild('HumanoidRootPart')
        if cd and ce then
            table.insert(b6,{record = cb, player = cd, root = ce})
        end
    end
end
end
return b6
end
bW.clearHistory =
function(b5) table.clear(b5.history) b5:_notify()
end
local function b5(b6)
if typeof(b6) ~= 'Color3' then
    return 'ffffff'
end
return string.format('%02x%02x%02x', math.floor(b6.R * 255 + 0.5), math.floor(b6.G * 255 + 0.5), math.floor(b6.B * 255 + 0.5))
end
bW.listEntries =
function(b6)
local b7 ={}
for b8, b9 in ipairs(b6:carriers()) do
    b7[b9.player] = b9.record
end
local ca = bT.Character and bT.Character:FindFirstChild('HumanoidRootPart')
local cb ={}
for cc, cd in ipairs(bR:GetPlayers()) do
    if cd ~= bT then
        local ce = cd.Character and cd.Character:FindFirstChild('HumanoidRootPart')
        local cf = b7[cd]
        local cg, ch, ci, cj, ck = ce and ca and math.floor((ce.Position - ca.Position).Magnitude + 0.5) or nil,
        if cf and cf.AreaId then
            tostring(cf.AreaId)
            else
            if ce then
                ce.Position.X <= 552.2 and 'Safe Zone' or 'Field'
                else
                'Offline'
                if cf then
                    ce, cc = pcall(
                    function()
                    return b6.catalog.resolve(cf)
                end
                )
                local cl = ce and cc or{rarityRank = 0, name = tostring(cf.AssetCategory or 'Egg'), rarity = 'Unknown', rarityColor = Color3.fromRGB(245, 196, 81)} ci = cl.rarityRank or 0 cj = string.format([[<font color="#%s">%s</font>  <font color="#A2A2AE">[%s]</font>]],
                b5(cl.rarityColor), tostring(cl.name or 'Egg'), tostring(cl.rarity or 'Common')) ck = string.format('Running in %s%s', ch, cg and '  -  '..cg..' studs' or '')
                else
                cj = 'No Egg Carried' ck = string.format('Idle in %s%s', ch, cg and '  -  '..cg..' studs' or '')
            end
            cb[# cb + 1] ={id = tostring(cd.UserId), name = tostring(cd.DisplayName or cd.Name), sub = string.format([[<font color="#4ADE80">@%s</font>  <font color="#A2A2AE">[%s]</font>]],
            tostring(cd.Name), ch), status = cj, statusSub = ck, button = 'Steal', buttonColor = cf and 'accent' or 'dim', player = cd, carrying = cf ~= nil, rank = ci or - 1,
            distance = cg or 1000000000, onClick =
            function(cl, cm)
            local cn = b6:strike(cl.player) cm(cn and 'Chasing' or 'No Egg', cn and 'green' or 'red') task.delay(1.6,
            function() pcall(cm, 'Steal', cl.carrying and 'accent' or 'dim')
        end
        )
    end
    }
end
end
table.sort(cb,
function(ce, cf)
if ce.carrying ~= cf.carrying then
    return ce.carrying
end
if ce.carrying and ce.rank ~= cf.rank then
    return ce.rank > cf.rank
end
return ce.distance < cf.distance
end
)
return cb
end
bW._pick =
function(b6)
local b7, b9, ca = aB.StealPlayerTarget
for cb, cc in ipairs(b6:carriers()) do
    local cd = b7 == nil or b7 == '' or b7 == 'Any Player' or cc.player.Name == b7
    local ce = cc.root.Position.X > b_ + b0 and cc.player:GetAttribute('InBossArena') ~= true
    if cd and(ce and b6:_passes(cc.record)) then
        local cf = b6.catalog.resolve(cc.record).rarityRank or 0
        if b9 then
            if cf > b9 then
                b9 = cf ca = cc
            end
            else
            b9 = cf ca = cc
        end
    end
end
return ca
end
bW.strike =
function(b6, b7)
if b7 then
    if b7 == bT then
        return false
    end
    else
    return false
end
for b9, ca in ipairs(b6:carriers()) do
    if ca.player == b7 then
        b6.forced = true task.spawn(
        function() b6:_chase(ca)
    end
    )
    return true
end
end
b6:_setStatus(b7.Name..' is not carrying an egg')
return false
end
local function b6()
local b7 = bT.Character
if not b7 then
    return
end
local b9 = b7:FindFirstChildOfClass('Humanoid')
local ca = b7:FindFirstChild('HumanoidRootPart')
for cb, cc in ipairs(b7:GetDescendants()) do
    if cc:IsA('Motor6D') then
        if not cc.Enabled then
            cc.Enabled = true
        end
        elseif
        cc:IsA('BallSocketConstraint') or cc:IsA('HingeConstraint') then
            if cc.Name:find('Ragdoll') or cc:GetAttribute('RagdollConstraint') then
                pcall(
                function() cc:Destroy()
            end
            )
        end
        elseif
        cc:IsA('Attachment') and(cc.Name:find('Ragdoll') or cc:GetAttribute('RagdollAttachment')) then
            pcall(
            function() cc:Destroy()
        end
        )
    end
end
if b9 then
    b9.PlatformStand = false b9.Sit = false pcall(
    function() b9:SetStateEnabled(Enum.HumanoidStateType.Dead, false) b9:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) b9:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,
    false) b9:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false) b9:ChangeState(Enum.HumanoidStateType.GettingUp) task.wait(0.02) b9:ChangeState(Enum.HumanoidStateType.Running)
end
)
end
if ca then
    ca.AssemblyLinearVelocity = Vector3.new(0, 0, 0) ca.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
end
local function b7()
local b9 = k()
local ca = b9 and b9:FindFirstChild('Areas') b9 = ca and ca:FindFirstChild('GuardAreas')
local cb = b9 and b9:FindFirstChild('Forest')
if cb then
    local cc = cb:FindFirstChild('Guard')
    local cd = cc and(cc:FindFirstChild('HumanoidRootPart') or cc:FindFirstChild('Collider') or cc:IsA('Model') and cc.PrimaryPart)
    if cc and cd then
        return cc, cd
    end
    local ce = cb:FindFirstChild('ForestGuardAuthored')
    local cf = ce and(ce:FindFirstChild('HumanoidRootPart') or ce:IsA('Model') and ce.PrimaryPart)
    if ce and cf then
        return ce, cf
    end
end
local cc = workspace:FindFirstChild('AreaGuards')
if cc then
    for cd, ce in ipairs(cc:GetChildren()) do
        local cf = ce:FindFirstChild('HumanoidRootPart')
        if cf and cf.Position.X < 850 then
            return ce, cf
        end
    end
end
return nil, nil
end
local function b9(ca)
local cb pcall(
function() cb = bU.ReadFieldEggs()
end
)
local cc, cd = cb and cb.Records or{}
for ce, cf in ipairs(cc) do
    local cg, ch =(cf.State == 'Slot' or cf.State == 'Dropped') and cf.Uid ~= ca
    if cg then
        local ci = cf.CarrierUserId ch =
        if ci then
            cf.CarrierUserId == bT.UserId
            else
            not ci
            else
            ch = cg
        end
        if ch then
            local ci = cf.BottomCFrame and cf.BottomCFrame.Position or cf.BoundsCFrame and cf.BoundsCFrame.Position
            if cf.AreaId == 'Forest' or tostring(cf.Uid):find('Forest', 1, true) or tostring(cf.Uid):find('^FirstArea') or ci and ci.X < 680 then
                if cf.State == 'Slot' then
                    cd = cf
                    break
                    elseif
                    cd then
                        else
                        cd = cf
                    end
                end
            end
        end
        return cd
    end
    bW._primeForest =
    function(ca, cb)
    local cc = ca.eggRuntime
    local cd = bT.Character
    local ce = cd and cd:FindFirstChild('HumanoidRootPart')
    local cf = cd and cd:FindFirstChildOfClass('Humanoid')
    if ce then
        if cf then
            if not(cf.Health > 0) then
                return false
            end
            else
            return false
        end
        else
        return false
    end
    if cc and cc.carry and(cc.carry.active and cc.carry.uid) then
        pcall(
        function() cc:_returnToSafe()
    end
    ) task.wait(0.08)
end
ca:_setStatus('Preparing steal')
local cg = b9(cb)
if not cg then
    ca:_setStatus('Steal unavailable \226\128\148 retrying')
    return false
end
local ch = cg.BottomCFrame and cg.BottomCFrame.Position or cg.BoundsCFrame and cg.BoundsCFrame.Position or Vector3.new(596.6, 67.7, - 325)
local ci = Vector3.new(ch.X, ch.Y + 2.5, ch.Z)
local cj = 'Forest:'..tostring(cg.NestId or 'Slot_001') pcall(
function()
local ck = require(bS.Shared.Util.AreaEggSlotIdentity)
if ck and(cg.AreaId and cg.NestId) then
    cj = ck.SlotKey(cg.AreaId, cg.NestId)
end
end
) ca:_setStatus('Preparing steal') ce.CFrame = CFrame.new(ci) ce.AssemblyLinearVelocity = Vector3.new(0, 0, 0) ce.AssemblyAngularVelocity = Vector3.new(0,
0, 0) h.Heartbeat:Wait()
local ck = os.clock()
local cl = false cb = 0
while
if cl then
    true
    else
    os.clock() - ck < 0.8 do
        ce = cd:FindFirstChild('HumanoidRootPart') or ce
        if ce and ce.Position.Y < 65 then
            ce.CFrame = CFrame.new(ci) ce.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        end
        if os.clock() >= cb then
            cb = os.clock() + 0.1 task.spawn(
            function() pcall(
            function() bU.CarryFieldEgg(cg.Uid, cj)
        end
        )
    end
    ) task.spawn(
    function() pcall(
    function()
    local cm = require(bS.Shared.Remotes)
    if cm and(cm.EggWorld and cm.EggWorld.AskFieldEggCarry) then
        cm.EggWorld.AskFieldEggCarry:InvokeServer({Uid = cg.Uid, FirstAreaSlotKey = cj})
    end
end
)
end
)
end
local cm pcall(
function() cm = bU.ReadFieldEgg(cg.Uid)
end
)
if cm and cm.State == 'Carried' and cm.CarrierUserId == bT.UserId then
    cl = true
    break
end
h.Heartbeat:Wait()
end
if not cl then
    ca:_setStatus('Steal unavailable \226\128\148 retrying') b6()
    return false
end
ca:_setStatus('Preparing steal')
local cm, cn = b7()
if cm then
    cm:FindFirstChild('Collider')
end
local co = cn and cn.Position or Vector3.new(596.6, 69.4, - 317.1) ce.CFrame = CFrame.new(co.X, co.Y + 0.8, co.Z) ce.AssemblyLinearVelocity = Vector3.new(0,
0, 0) ce.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
local cp = false
local cq ={} pcall(
function()
local cr = bS:FindFirstChild('Packages') and bS.Packages:FindFirstChild('Networking') and bS.Packages.Networking:FindFirstChild('RE/RigSync/Refresh')
if cr then
    table.insert(cq, cr.OnClientEvent:Connect(
    function() cp = true
end
))
end
end
) pcall(
function()
local cr = require(bS.Shared.Remotes)
if cr and(cr.EggWorld and cr.EggWorld.OwnerDropped) then
    table.insert(cq, cr.EggWorld.OwnerDropped.OnClientEvent:Connect(
    function() cp = true
end
))
end
end
)
if cf then
    table.insert(cq, cf.StateChanged:Connect(
    function(cr, cs)
    if cs == Enum.HumanoidStateType.Ragdoll then
        cp = true
        else
        if cs == Enum.HumanoidStateType.FallingDown then
            cp = true
            else
            if cs == Enum.HumanoidStateType.PlatformStanding then
                cp = true
            end
        end
    end
end
)) table.insert(cq, cf:GetPropertyChangedSignal('PlatformStand'):Connect(
function()
if cf.PlatformStand then
    cp = true
end
end
))
end
local function cr() cm, cn = b7()
local cs = cn and cn.Position or co
local ct = cd:FindFirstChild('HumanoidRootPart')
if ct then
    ct.CFrame = CFrame.new(cs.X, cs.Y + 0.8, cs.Z) ct.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
end
local cu = cm and cm:FindFirstChild('Collider') or cn
if cu and type(firetouchinterest) == 'function' and ct then
    pcall(
    function() firetouchinterest(ct, cu, 0) firetouchinterest(ct, cu, 1)
end
)
end
pcall(
function()
local cv = require(bS.Shared.Remotes)
if cv and(cv.GuardPatrol and cv.GuardPatrol.ForestStrike) then
    local cw = cv.GuardPatrol.ForestStrike
    local cx ={EggUid = cg.Uid} cx.GuardCFrame = cn and cn.CFrame or CFrame.new(cs) cw:FireServer(cx)
end
end
)
end
ca:_setStatus('Preparing steal') cr() ci = os.clock() + 0.75 cb = os.clock() + 0.05
while os.clock() < ci do
    if cp then
        break
    end
    local cs = bT.Character and bT.Character:FindFirstChildOfClass('Humanoid')
    if cs and(cs.PlatformStand or cs.Sit) then
        cp = true
        break
    end
    local ct = bT.Character and bT.Character:FindFirstChild('HumanoidRootPart')
    if ct and ct.AssemblyLinearVelocity.Magnitude > 18 then
        cp = true
        break
    end
    if ct and ct.Position.Y < 65 then
        ct.CFrame = CFrame.new(co.X, 70, co.Z) ct.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end
    if os.clock() >= cb then
        cb = os.clock() + 0.05 cr()
    end
    h.Heartbeat:Wait()
end
for cs, ct in ipairs(cq) do
    pcall(ct.Disconnect, ct)
end
if not cp then
    ca:_setStatus('Steal unavailable \226\128\148 retrying') b6()
    return false, cg.Uid
end
ca:_setStatus('Preparing steal') b6()
local cu = os.clock() + 0.35
while os.clock() < cu do
    local cv = bT.Character and bT.Character:FindFirstChildOfClass('Humanoid')
    local cw = bT.Character and bT.Character:FindFirstChild('HumanoidRootPart')
    if cv and(cw and(not cv.PlatformStand and not cv.Sit)) then
        local cx = cv:GetState()
        if cx ~= Enum.HumanoidStateType.Ragdoll and(cx ~= Enum.HumanoidStateType.FallingDown and cx ~= Enum.HumanoidStateType.PlatformStanding) then
            cw.AssemblyLinearVelocity = Vector3.new(0, 0, 0) cw.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            break
        end
    end
    b6() h.Heartbeat:Wait()
end
return true, cg.Uid
end
bW._swingBatAt =
function(ca, cb, cc)
if cc then
    if cc.Parent ~= bT.Character then
        return false
    end
    else
    return false
end
ca.swingSeq = ca.swingSeq + 1
local cd = string.format('%d:%d:%d', bT.UserId, ca.swingSeq, math.floor(workspace:GetServerTimeNow() * 1000))
return pcall(
function() require(bS.Shared.Remotes).BatSwing.Trigger:FireServer(cb, cd)
end
)
end
bW._dropUnwanted =
function(ca)
local cb
local function cc()
for cd, ce in ipairs(bU.ReadFieldEggs().Records or{}) do
    if ce.State == 'Carried' and ce.CarrierUserId == bT.UserId then
        cb = bU.ReadFieldEgg(ce.Uid) or ce
        break
    end
end
end
pcall(cc)
if cb and not ca:_passes(cb) then
    pcall(bU.DropFieldEgg, 'PlayerRequest') task.wait(0.3)
    return true
end
return false
end
bW._returnSafe =
function(ca) ca:_dropUnwanted()
local cb = ca.eggRuntime
local cc = bT.Character
local cd = cc and cc:FindFirstChild('HumanoidRootPart')
local ce = cc and cc:FindFirstChildOfClass('Humanoid')
if cb then
    if cd then
        if ce then
            if cb:_isInSafeArea(cd) then
                return
            end
            else
            return
        end
        else
        return
    end
    else
    return
end
local cf = cb:_resolveSafeCFrame(cd)
if not cf then
    return
end
ca:_setStatus('Returning to safe zone') aZ(cd, ce, cf,
function()
return ce.Health <= 0 or not cd.Parent
end
, false, nil, true)
end
bW.intercept =
function(ca, cb)
if ca.running then
    return false
end
local cc = bT.Character and bT.Character:FindFirstChild('HumanoidRootPart')
if not cc then
    return false
end
for cd, ce in ipairs(ca:carriers()) do
    if ce.record.Uid == cb then
        if ce.root.Position.X <= b_ then
            return false
            elseif
            (ce.root.Position - cc.Position).Magnitude > bZ then
                return false
                elseif
                not ca:_passes(ce.record) then
                    return false
                end
                ca.forced = true task.spawn(ca._chase, ca, ce, true)
                return ca.running
            end
        end
        return false
    end
    bW._chase =
    function(ca, cb, cc)
    if ca.running then
        return
    end
    ca.running = true ca.attempts = ca.attempts + 1
    local cd = cb.record
    local ce = cd.Uid
    local cf = ca.catalog.resolve(cd)
    local cg = cb.player cb = cg.DisplayName or cg.Name ca.cardTarget ={uid = ce, record = cd, player = cb}
    if ca.godMode then
        ca.godMode:stopDefend()
    end
    if not cc then
        ca:_returnSafe() ca:_setStatus(string.format('Preparing to steal from %s', cb))
        local ch, ci, cj = pcall(ca._primeForest, ca, ce)
        local ck
        if ch then
            if ci then
                elseif
                cj then
                    pcall(
                    function() ck = bU.ReadFieldEgg(cj)
                end
                )
            end
        end
        if ck and ck.State == 'Carried' and ck.CarrierUserId == bT.UserId then
            ca:_returnSafe() ca:_log(cb, cf.name, 'could not prepare') ca:_setStatus(ca.enabled and 'looking for a carrier' or 'idle') ca.running = false ca.forced = false
            return
        end
    end
    local ch = ca.godMode and ca.godMode:_equipBat()
    local ci = os.clock() +(cc and bY or bX)
    local cj ={}
    local ck = Vector3.new(0, 0, 0)
    local cl = cg:GetAttribute('RagdollEndTime') or false
    local cm = 0.1 pcall(
    function() cm = math.clamp(bT:GetNetworkPing() or 0.1, 0.03, 0.6)
end
)
local cn = math.clamp(0.14 + cm, 0.14, 0.35) ca.leadIdx = ca.hitIdx or ca.leadIdx or 1 ca.missStreak = 0
local co
local function cp() co = h.Stepped:Connect(
function()
local cq = bT.Character
if cq then
    for cr, cs in ipairs(cq:GetDescendants()) do
        if cs:IsA('BasePart') then
            cs.CanCollide = false
        end
    end
end
end
)
end
pcall(cp) ca:_setStatus(string.format('Chasing %s', cb)) cp = 'could not catch them'
local cq, cr, cs
local ct, cu = 0
local cv = 0
while os.clock() < ci do
    local cw = h.PreSimulation:Wait()
    local cx = ca.enabled
    if
    if cx then
        not cx
        else
        not ca.forced then
            cp = 'stopped'
            break
        end
        local cy pcall(
        function() cy = bU.ReadFieldEgg(ce)
    end
    ) cx = cy and cy.State
    if not cy or cx == 'Slot' or cx == 'GuardCarried' then
        cp = 'egg reset'
        break
    end
    if cx == 'Claimed' then
        cp = 'they banked it'
        break
    end
    if cx == 'Carried' and cy.CarrierUserId == bT.UserId then
        cp = 'taken'
        break
    end
    if cx == 'Dropped' then
        local cz = os.clock()
        local cA =(cg:GetAttribute('RagdollEndTime') or false) ~= cl
        if cq ~= nil and(cr ~= nil and cz - cr <= 1 or cs ~= nil and cz - cs <= 1.5 or cA) then
            if cr and cz - cr <= 1 then
                ca.hitIdx = ca.leadIdx
            end
            ca:_setStatus(string.format('Grabbing dropped egg from %s', cb)) cp = ca:_grab(cy, cg, ch) and 'taken' or 'someone else grabbed it'
            else
            cp = ca:_grabForeignDrop(cy, cg, ch) and 'taken' or 'someone else grabbed it'
        end
        break
    end
    local cz = bT.Character
    local cA = cz and cz:FindFirstChild('HumanoidRootPart')
    local cB = cz and cz:FindFirstChildOfClass('Humanoid')
    if(
    if cA then
        not cB
        else
        not cA) or cB.Health <= 0 then
            cp = 'character died'
            break
        end
        if cy.CarrierUserId ~= cg.UserId then
            local cC = bR:GetPlayerByUserId(cy.CarrierUserId or 0)
            if not cC then
                cp = 'taken by another player'
                break
            end
            cb = cC.DisplayName or cC.Name cl = cC:GetAttribute('RagdollEndTime') or false table.clear(cj) ca:_setStatus(string.format('Chasing %s', cb)) cg = cC cq = nil cr = nil
        end
        local cC = cg.Character and cg.Character:FindFirstChild('HumanoidRootPart')
        if not cC then
            cp = 'lost sight of them'
            break
        end
        if cC.Position.X <= b_ then
            cp = 'banked'
            break
        end
        local cD = os.clock() cj[# cj + 1] ={t = cD, p = cC.Position}
        while # cj > 2 and cD - cj[1].t > 0.4 do
            table.remove(cj, 1)
        end
        local cE = cC.AssemblyLinearVelocity ck =
        if Vector3.new(cE.X, 0, cE.Z).Magnitude > 8 then
            cE
            else
            if # cj >= 2 then
                if cD - cj[1].t > 0.15 then
                    (cC.Position - cj[1].p) /(cD - cj[1].t)
                    else
                    ck
                    else
                    ck
                    local cF = Vector3.new(ck.X, 0, ck.Z)
                    local cG, cH = cF.Magnitude
                    if cG > 6 then
                        cH = cF.Unit
                        else
                        cE = cC.CFrame.LookVector cE = Vector3.new(cE.X, 0, cE.Z) cH = cE.Magnitude > 0.05 and cE.Unit or Vector3.new(- 1, 0, 0)
                    end
                    local cI = math.clamp((b2[ca.leadIdx] or 1) * cG * cn, 3, b3) cD = cC.Position + cH * cI
                    local cJ =
                    if cD.X < b_ + 5 then
                        Vector3.new(b_ + 5, cD.Y, cD.Z)
                        else
                        cD cE = Vector3.new(cC.Position.X, cJ.Y, cC.Position.Z)
                        local cK =
                        if(cE - cJ).Magnitude < 0.5 then
                            cJ - cH
                            else
                            cE
                            local cL = CFrame.lookAt(cJ, cK)
                            local cM = cJ - cA.Position cD = cM.Magnitude
                            local cN = T()
                            local cO = cN * math.min(cw, 0.05) ae(cz, cN * q.HEADROOM)
                            local cP
                            if cD > cO then
                                cA.CFrame = CFrame.new(cA.Position + cM.Unit * cO) * cL.Rotation cA.AssemblyLinearVelocity = Vector3.new(0, 0, 0) cP = cM.Unit * cN
                                else
                                cA.CFrame = cL cA.AssemblyLinearVelocity = cC.AssemblyLinearVelocity cP = cC.AssemblyLinearVelocity
                            end
                            cA.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            if not ao(cB, cA, cN, cP) then
                                an(cB, cA, cN) ao(cB, cA, cN, cP)
                            end
                            local cQ = cG * cw * 1.5
                            if cD <= 5 + cQ then
                                cq = cq or os.clock() ca:_setStatus(cC.Position.X <= b1 and string.format('Attacking %s', cb) or string.format('Chasing %s', cb))
                                else
                                if cD > 12 + cQ and cq then
                                    ca:_setStatus(string.format('Chasing %s', cb)) cq = nil
                                end
                            end
                            local cR = cg:GetAttribute('RagdollEndTime') or false
                            if cR ~= cl then
                                cs = os.clock() ca.hitIdx = ca.leadIdx ca.missStreak = 0 cl = cR cr = nil
                            end
                            if(not ch or ch.Parent ~= cz) and os.clock() >= ct then
                                local cS = os.clock() + 0.5 task.spawn(
                                function() ch = ca.godMode and ca.godMode:_equipBat() or ch
                            end
                            ) ct = cS
                        end
                        local cS = ch and tonumber(ch:GetAttribute('CooldownEndTime')) or 0
                        if cr and os.clock() - cr > 0.9 then
                            if cS ~= cu then
                                ca.missStreak = ca.missStreak + 1
                                if ca.missStreak >= 2 then
                                    ca.missStreak = 0 ca.leadIdx = ca.leadIdx % # b2 + 1 cq = nil
                                end
                            end
                            cr = nil
                        end
                        if ch and ch.Parent == cz and(cq and(os.clock() - cq >= cn + 0.05 and(cC.Position.X <= b1 and(ch:GetAttribute('CooldownActive') ~= true and(workspace:GetServerTimeNow() >= cS and os.clock() - cv >= 0.35))))) then
                            local cT = os.clock()
                            if cr then
                                else
                                cr = os.clock() cu = cS
                            end
                            task.spawn(ca._swingBatAt, ca, cg, ch) cv = cT
                        end
                    end
                    if co then
                        pcall(
                        function() co:Disconnect()
                    end
                    )
                end
                if cp == 'taken' then
                    ca.taken = ca.taken + 1 ca:_deliver(ce, cd)
                    else
                    ca.blacklist[ce] = os.clock() + 20 ca:_returnSafe()
                end
                ca:_log(cb, cf.name, cp) ca:_setStatus(ca.enabled and 'looking for a carrier' or 'idle') ca.running = false ca.forced = false
            end
            bW._grabForeignDrop =
            function(ca, cb, cc, cd)
            local ce = cb.Uid
            local function cf()
            local cg pcall(
            function() cg = bU.ReadFieldEgg(ce)
        end
        )
        return cg
    end
    local cg = bT.Character
    local ch = cg and cg:FindFirstChild('HumanoidRootPart')
    local ci = cg and cg:FindFirstChildOfClass('Humanoid')
    local cj = cb.BottomCFrame and cb.BottomCFrame.Position or cb.BoundsCFrame and cb.BoundsCFrame.Position
    if ch and ci then
        if ci.Health > 0 then
            if not cj then
                return false
            end
            else
            return false
        end
        else
        return false
    end
    if(ch.Position - cj).Magnitude > 8 then
        ca:_setStatus('Moving to dropped egg') aZ(ch, ci, CFrame.new(cj + Vector3.new(0, 3, 0)),
        function()
        local ck = cf()
        local cl = ca.enabled
        return(
        if cl then
            not cl
            else
            not ca.forced) or ci.Health <= 0 or not ch.Parent or ck == nil or ck.State ~= 'Dropped'
        end
        )
    end
    local ck = cf()
    if ck and ck.State == 'Carried' then
        return ck.CarrierUserId == bT.UserId
    end
    if ck then
        if ck.State ~= 'Dropped' then
            return false
        end
        else
        return false
    end
    return ca:_grab(ck, cc, cd, false, b4)
end
bW._deliver =
function(ca, cb, cc) pcall(
function()
local cd = bT.Character and bT.Character:FindFirstChildOfClass('Humanoid')
if cd then
    cd:UnequipTools()
end
end
)
local cd = ca.eggRuntime
if cd and type(cd.deliverCarriedEgg) == 'function' and cd:deliverCarriedEgg(cb, cc) == true then
    ca:_setStatus('Delivering stolen egg')
    local ce = os.clock() + 30
    while cd._instantReturnToken ~= nil and os.clock() < ce do
        task.wait(0.2)
    end
    return
end
local function ce()
local cf pcall(
function() cf = bU.ReadFieldEgg(cb)
end
)
return cf == nil or cf.State == 'Claimed'
end
ca:_setStatus('Carrying stolen egg home')
local cf = os.clock() + 8
while true do
    local cg = ce()
    if not(
    if cg then
        not cg
        else
        os.clock() < cf) then
            break
        end
        local ch = bT.Character
        local ci = ch and ch:FindFirstChild('HumanoidRootPart')
        if ci and(cd and not cd:_isInSafeArea(ci)) then
            ca:_returnSafe()
        end
        task.wait(0.1)
    end
end
bW._snipe =
function(ca, cb, cc)
if ca.running then
    return
end
ca.running = true ca.attempts = ca.attempts + 1
local cd = cb.Uid
local ce = ca.catalog.resolve(cb)
local cf = bR:GetPlayerByUserId(cc or 0)
local cg = cf and(cf.DisplayName or cf.Name) or '?' ca.cardTarget ={uid = cd, record = cb, player = cg}
local ch = cb.BottomCFrame and cb.BottomCFrame.Position or cb.BoundsCFrame and cb.BoundsCFrame.Position
local ci = 'someone else grabbed it'
local function cj()
local ck pcall(
function() ck = bU.ReadFieldEgg(cd)
end
)
return ck ~= nil and ck.State == 'Dropped', ck
end
local ck = bT.Character
local cl = ck and ck:FindFirstChild('HumanoidRootPart')
local cm = ck and ck:FindFirstChildOfClass('Humanoid')
if ch and(cl and(cm and cm.Health > 0)) then
    if ca.godMode then
        ca.godMode:stopDefend()
    end
    ca:_setStatus(string.format("Sniping %s's dropped egg", cg)) aZ(cl, cm, CFrame.new(ch + Vector3.new(0, 3, 0)),
    function()
    local cn = ca.enabled
    return(
    if cn then
        cm.Health <= 0
        else
        not cn) or not cj()
    end
    )
    local cn, co = cj() ci =
    if cn then
        if ca.enabled then
            ca:_grab(co, nil, nil, true) and 'taken' or ci
            else
            ci
            else
            ci
        end
        if ci == 'taken' then
            ca.taken = ca.taken + 1 ca:_deliver(cd, cb)
            else
            ca.blacklist[cd] = os.clock() + 20 ca:_returnSafe()
        end
        ca:_log(cg, ce.name, ci == 'taken' and 'sniped drop' or ci) ca:_setStatus(ca.enabled and 'looking for a carrier' or 'idle') ca.running = false
    end
    bW._watchDrops =
    function(ca)
    if ca.dropConns then
        return
    end
    local function cb()
    if l.ChloeX_Running == nil and l.__SenaV4PlayerSteal ~= ca then
        for cc, cd in ipairs(ca.dropConns or{}) do
            pcall(
            function() cd:Disconnect()
        end
        )
    end
    return false
end
return true
end
pcall(
function()
for cc, cd in ipairs(bU.ReadFieldEggs().Records or{}) do
    if cd.State == 'Carried' and cd.CarrierUserId then
        ca.lastCarrier[cd.Uid] = cd.CarrierUserId
    end
end
end
) ca.dropConns ={} table.insert(ca.dropConns, bU.FieldShifted:Connect(
function(cc)
if cb() then
    if type(cc) ~= 'table' then
        return
        elseif
        not cc.Uid then
            return
        end
        else
        return
    end
    if cc.State == 'Carried' then
        ca.lastCarrier[cc.Uid] = cc.CarrierUserId
        return
    end
    if cc.State ~= 'Dropped' then
        ca.lastCarrier[cc.Uid] = nil
        return
    end
    local cd = ca.lastCarrier[cc.Uid]
    if cd then
        if cd == bT.UserId then
            return
        end
        else
        return
    end
    if ca.enabled then
        if ca.running then
            return
            elseif
            ca.blacklist[cc.Uid] then
                return
            end
            else
            return
        end
        local ce = ca.eggRuntime
        local cf = l.__SenaV4ButterflyRuntime
        if ce then
            if ce.running then
                return
                elseif
                ce.carry then
                    if ce.carry.active then
                        return
                    end
                end
            end
            if cf ~= nil and cf.active == true then
                return
            end
            local cg = cc.BottomCFrame and cc.BottomCFrame.Position
            if cg then
                if cg.X <= b_ then
                    return
                end
                else
                return
            end
            if bT:GetAttribute('InBossArena') == true then
                return
            end
            if not ca:_passes(cc) then
                return
            end
            task.spawn(ca._snipe, ca, cc, cd)
        end
        )) table.insert(ca.dropConns, bU.FieldGone:Connect(
        function(cc)
        if cb() then
            ca.lastCarrier[cc] = nil
        end
    end
    ))
end
bW._grab =
function(ca, cb, cc, cd, ce, cf)
local cg = ca.eggRuntime
local ch, ci = cb.Uid pcall(
function() ci = require(bS.Shared.Modules.RagdollJoints)
end
)
local function cj()
local ck pcall(
function() ck = bU.ReadFieldEgg(ch)
end
)
return ck
end
local function ck(cl, cm) pcall(
function()
if ci and ci.Release then
    ci.Release(cl)
end
cm.PlatformStand = false cm.Sit = false
if cm:GetState() ~= Enum.HumanoidStateType.Running then
    cm:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end
)
end
local function cl(cm, cn, co)
local cp = cg and cg:_resolveEggDestination(cm, cn, co)
if cp then
    else
    local cq = cm.BottomCFrame and cm.BottomCFrame.Position or cm.BoundsCFrame and cm.BoundsCFrame.Position cp = cq and CFrame.new(cq.X, cq.Y + 2.5, cq.Z)
end
return cp
end
local function cm(cn, co, cp, cq) co.CFrame = cq co.AssemblyLinearVelocity = Vector3.new(0, 0, 0) co.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
local cr = math.clamp(T(), q.MIN_SPEED, q.MAX_SPEED) ae(cn, cr * q.HEADROOM)
if not ao(cp, co, cr,(Vector3.new(0, 0, 0))) then
    an(cp, co, cr)
end
end
local function cn()
if cc then
    if not cd then
        return
    end
    else
    return
end
local co = bT.Character
if co then
    if cd.Parent ~= co then
        return
    end
    else
    return
end
if workspace:GetServerTimeNow() >=(tonumber(cd:GetAttribute('CooldownEndTime')) or 0) and cd:GetAttribute('CooldownActive') ~= true then
    task.spawn(ca._swingBatAt, ca, cc, cd)
end
end
local co = 2.5 pcall(
function() co = math.clamp(cg:_resolveSettleSeconds(cb), 1.5, 4)
end
)
if cf then
    co = math.max(co, cf)
end
local cp, cq = ce and 0 or os.clock() + co
while os.clock() < cp do
    local cr = cj()
    local cs = cr and cr.State
    if cs == 'Carried' then
        if cr.CarrierUserId ~= bT.UserId then
            return false
        end
        return true
    end
    if cs ~= 'Dropped' and cs ~= 'Slot' then
        return false
    end
    local ct = bT.Character
    local cu = ct and ct:FindFirstChild('HumanoidRootPart')
    local cv = ct and ct:FindFirstChildOfClass('Humanoid')
    if cu then
        if cv then
            if cv.Health <= 0 then
                return false
            end
            else
            return false
        end
        else
        return false
    end
    ck(ct, cv) cq = cl(cr, cu, cv) or cq
    if cq then
        cm(ct, cu, cv, cq)
    end
    cn() ca:_setStatus(string.format('Securing dropped egg (%ds)', math.ceil(cp - os.clock()))) h.Heartbeat:Wait()
end
local cr = false
local cs = false
local ct = os.clock() + 3.5
while os.clock() < ct do
    local cu = cj()
    local cv = cu and cu.State
    if cv == 'Carried' then
        if cu.CarrierUserId ~= bT.UserId then
            return false
        end
        if l.__SenaV4Webhook then
            local cw, cx = pcall(ca.catalog.resolve, cu) pcall(l.__SenaV4Webhook.stolen, cu, cw and cx or nil, 'player carry')
        end
        return true
    end
    if cv ~= 'Dropped' and cv ~= 'Slot' then
        return false
    end
    local cw = bT.Character
    local cx = cw and cw:FindFirstChild('HumanoidRootPart')
    local cy = cw and cw:FindFirstChildOfClass('Humanoid')
    if cx then
        if cy then
            if cy.Health <= 0 then
                return false
            end
            else
            return false
        end
        else
        return false
    end
    ck(cw, cy)
    local cz = cl(cu, cx, cy) or cq
    if cz then
        cm(cw, cx, cy, cz)
    end
    cn()
    if not cr then
        cr = true task.spawn(
        function() pcall(
        function() require(bS.Shared.Remotes).EggWorld.AskFieldEggCarry:InvokeServer({Uid = ch})
    end
    ) cr = false
end
)
end
if not cs then
    cs = true task.spawn(
    function() pcall(
    function() bU.CarryFieldEgg(ch)
end
) cs = false
end
)
end
pcall(
function()
local cA = workspace:FindFirstChild('AreaEggSlotsClient')
local cB = cA and cA:FindFirstChild(tostring(ch))
local cC = cB and(cB:FindFirstChild('CarryAreaEgg', true) or cB:FindFirstChildWhichIsA('ProximityPrompt', true))
if cC and(cC.Enabled and type(fireproximityprompt) == 'function') then
    cC.HoldDuration = 0 cC.RequiresLineOfSight = false fireproximityprompt(cC, 0)
end
end
) task.wait(0.06)
end
return false
end
bW._start =
function(ca) ca:_watchDrops()
if ca.loop then
    return
end
ca.loop = task.spawn(
function()
while true do
    task.wait(0.4)
    if l.ChloeX_Running == nil and l.__SenaV4PlayerSteal ~= ca then
        break
    end
    for cb, cc in pairs(ca.blacklist) do
        if os.clock() > cc then
            ca.blacklist[cb] = nil
        end
    end
    local cd = ca.eggRuntime
    local ce = l.__SenaV4ButterflyRuntime
    local cf = cd and(cd.running or cd.carry and cd.carry.active)
    local cg = ce ~= nil and ce.active == true
    local ch =
    if ca.enabled then
        if ca.running then
            nil
            else
            if cf then
                nil
                else
                ca:_pick()
                else
                nil ca.wantsTarget = ch ~= nil
                if ch and not cg then
                    ca:_chase(ch)
                end
            end
            ca.loop = nil
        end
        )
    end
    return bW
end
)()
local bS = bH.new(bP) bS:install() bS:setEnabled(aB.AntiGuardKnockback == true) l.__SenaV4AntiGuard = bS
local bT = bI.new(bP) bT:setEnabled(aB.GodMode == nil and true or aB.GodMode == true) l.__SenaV4GodMode = bT
local bU = bR.new(bP, bT, bB)
local bV =(
function()
local bV = game:GetService('Players')
local bW = game:GetService('RunService')
local bX = game:GetService('UserInputService')
local bY = bV.LocalPlayer
local bZ = 110
local b_ = 0.1
local b0 = 'CarryAreaEgg'
local b1 = 55
local b2 = 0.08
local b3 = 0.28
local b4 ={} b4.__index = b4 b4.new =
function()
local b5 = setmetatable({}, b4) b5.flyEnabled = false b5.flyConnection = nil b5.flyMover = nil b5.grabEnabled = false b5.grabConnection = nil b5.grabOriginals = setmetatable({},
{__mode = 'k'}) b5.jumpEnabled = false b5.jumpConnections ={} b5.lastJumpAt = 0 b5.speedMultiplier = 1 b5.speedModules = nil b5.speedConnection = nil
return b5
end
b4._root =
function(b5)
local b6 = bY.Character
return b6 and b6:FindFirstChild('HumanoidRootPart')
end
b4._humanoid =
function(b5)
local b6 = bY.Character
return b6 and b6:FindFirstChildOfClass('Humanoid')
end
b4._ensureMover =
function(b5, b6)
if b5.flyMover and b5.flyMover.Parent == b6 then
    return
end
if b5.flyMover then
    pcall(
    function() b5.flyMover:Destroy()
end
)
end
local b7 = Instance.new('BodyVelocity') b7.Name = 'SenaFlyCaptureHover' b7.MaxForce = Vector3.new(0, 9000000000, 0) b7.Velocity = Vector3.new(0, 0, 0) b7.Parent = b6 b5.flyMover = b7
end
local function b5()
local b6 = l.__SenaV4TreadmillManager
return b6 ~= nil and not b6.destroyed and b6.config ~= nil and b6.config.idleFarm == true
end
local b6 ={at = 0, value = false}
local function b7()
local b9 = os.clock()
if b9 - b6.at < 0.25 then
    return b6.value
end
b6.at = b9
local ca = false
local function cb()
local cd = require(game:GetService('ReplicatedStorage').Client.EggState)
local ce = cd.GetAreaEggSnapshot and cd.GetAreaEggSnapshot()
local cf =
if
if ce then
    not ce.Records
    else
    not ce then
        if cd.ReadFieldEggs then
            cd.ReadFieldEggs()
            else
            ce
            else
            ce
            for cg, ch in ipairs(cf and cf.Records or{}) do
                if ch.State == 'Carried' and ch.CarrierUserId == bY.UserId then
                    ca = true
                    break
                end
            end
        end
        pcall(cb) b6.value = ca
        return ca
    end
    b4._dropMover =
    function(b9, ca)
    if b9.flyMover then
        pcall(
        function() b9.flyMover:Destroy()
    end
    ) b9.flyMover = nil
end
local cb = ca and ca:FindFirstChild('SenaFlyCaptureHover')
if cb then
    pcall(
    function() cb:Destroy()
end
)
end
end
b4.setFlyForCapture =
function(b9, ca) b9.flyEnabled = ca == true
if not b9.flyEnabled then
    if b9.flyConnection then
        pcall(
        function() b9.flyConnection:Disconnect()
    end
    ) b9.flyConnection = nil
end
if b9.flyMover then
    pcall(
    function() b9.flyMover:Destroy()
end
) b9.flyMover = nil
end
local cb = b9:_root()
if cb then
    local cd = cb:FindFirstChild('SenaFlyCaptureHover')
    if cd then
        pcall(
        function() cd:Destroy()
    end
    )
end
if b9.flyAnchored then
    pcall(
    function() cb.Anchored = false
end
)
end
end
b9.flyAnchored = false
return
end
if b9.flyConnection then
    return
end
b9.flyAnchored = false b9.flyConnection = bW.PreSimulation:Connect(
function()
if not b9.flyEnabled then
    return
end
local cb = b9:_root()
if not cb then
    return
end
local cd = b7()
local ce =(
if cd then
    b5()
    else
    not cd) or next(aY) ~= nil or bP and(bP.running or bP.activeTween)
    if ce then
        else
        local cf = l.__SenaV4PlayerSteal ce =
        if cf then
            if cf.running then
                true
                else
                ce
                else
                ce
            end
            if ce then
                if b9.flyAnchored then
                    pcall(
                    function() cb.Anchored = false
                end
                ) b9.flyAnchored = false
            end
            return
        end
        if cb.Position.Y < bZ - 1 then
            if b9.flyAnchored then
                pcall(
                function() cb.Anchored = false
            end
            ) b9.flyAnchored = false
        end
        local cf = cb.Position.Y + math.min(bZ - cb.Position.Y, 4) cb.CFrame = CFrame.new(cb.Position.X, cf, cb.Position.Z) * cb.CFrame.Rotation cb.AssemblyLinearVelocity = Vector3.new(0,
        0, 0) cb.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        elseif
        cb.Anchored then
            b9.flyAnchored = true
            else
            pcall(
            function() cb.Anchored = true
        end
        ) b9.flyAnchored = true
    end
end
)
end
b4._isGrabPrompt =
function(b9, ca)
return ca:IsA('ProximityPrompt') and ca.Name == b0
end
b4._applyGrab =
function(b9, ca)
if not b9:_isGrabPrompt(ca) then
    return
end
if b9.grabOriginals[ca] == nil then
    b9.grabOriginals[ca] = ca.HoldDuration
end
if ca.HoldDuration > b_ then
    ca.HoldDuration = b_
end
end
b4._restoreGrab =
function(b9)
local ca = workspace:GetAttribute('FastEggPickupTime') and 0.25 or 1.2
for cb, cd in pairs(b9.grabOriginals) do
    pcall(
    function()
    if cb.Parent then
        cb.HoldDuration = tonumber(cd) and cd > b_ and cd or ca
    end
end
)
end
b9.grabOriginals = setmetatable({},{__mode = 'k'})
end
b4._fireGrab =
function(b9, ca)
if b9:_isGrabPrompt(ca) then
    if not ca.Enabled then
        return
    end
    else
    return
end
local cb, cd = b9.grabFiring
if cb then
    cd = cb
    else
    cd = setmetatable({},{__mode = 'k'})
end
b9.grabFiring = cd
if b9.grabFiring[ca] then
    return
end
local ce = ca.Parent
local cf = b9:_root()
if cf then
    if ce then
        if not ce:IsA('BasePart') then
            return
        end
        else
        return
    end
    else
    return
end
local cg = tonumber(ca.MaxActivationDistance) or 10
if(ce.Position - cf.Position).Magnitude > cg + 1 then
    return
end
b9.grabFiring[ca] = true task.spawn(
function() pcall(
function()
local ch = math.max(b_, tonumber(ca.HoldDuration) or b_) ca:InputHoldBegin() task.wait(ch + 0.05) ca:InputHoldEnd()
end
) task.wait(0.4)
if b9.grabFiring then
    b9.grabFiring[ca] = nil
end
end
)
end
b4.setInstantGrab =
function(b9, ca) b9.grabEnabled = ca == true
if b9.grabEnabled then
    for cb, cd in ipairs(workspace:GetDescendants()) do
        b9:_applyGrab(cd)
    end
    if not b9.grabConnection then
        b9.grabConnection = workspace.DescendantAdded:Connect(
        function(ce)
        if b9.grabEnabled and b9:_isGrabPrompt(ce) then
            task.defer(
            function() b9:_applyGrab(ce)
        end
        )
    end
end
)
end
else
if b9.grabConnection then
    pcall(
    function() b9.grabConnection:Disconnect()
end
) b9.grabConnection = nil
end
b9.grabFireLoop = nil b9:_restoreGrab()
end
end
b4.triggerJump =
function(b9)
if not b9.jumpEnabled then
    return
end
local ca = os.clock()
if ca - b9.lastJumpAt < b2 then
    return
end
local cb = b9:_humanoid()
local cd = b9:_root()
if not cb or not cd then
    return
    elseif
    cb.Health <= 0 then
        return
    end
    b9.lastJumpAt = ca pcall(
    function() cb:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) cb:ChangeState(Enum.HumanoidStateType.Jumping) cb.Jump = true
end
)
local ce = b1
if cb.UseJumpPower and cb.JumpPower > 0 then
    ce = cb.JumpPower
    else
    if cb.JumpHeight and cb.JumpHeight > 0 then
        ce = math.sqrt(2 * workspace.Gravity * cb.JumpHeight)
    end
end
local cf
if ce < b1 then
    cf = b1
    else
    cf = ce
end
pcall(
function()
local cg = cd.AssemblyLinearVelocity cd.AssemblyLinearVelocity = Vector3.new(cg.X, cf, cg.Z)
end
)
end
b4.setInfiniteJump =
function(b9, ca) b9.jumpEnabled = ca == true
if # b9.jumpConnections > 0 then
    return
end
pcall(
function() table.insert(b9.jumpConnections, bX.InputBegan:Connect(
function(cb)
if not b9.jumpEnabled then
    return
end
if bX:GetFocusedTextBox() then
    return
end
if cb.KeyCode == Enum.KeyCode.Space then
    b9:triggerJump()
    elseif
    cb.KeyCode == Enum.KeyCode.ButtonA then
        b9:triggerJump()
    end
end
)) table.insert(b9.jumpConnections, bX.JumpRequest:Connect(
function()
if not b9.jumpEnabled then
    return
end
if bX:GetFocusedTextBox() then
    return
end
b9:triggerJump()
end
))
end
) task.spawn(
function()
while true do
    bW.Heartbeat:Wait()
    if b9.jumpEnabled and not bX:GetFocusedTextBox() then
        local cb = false pcall(
        function()
        if bX:IsKeyDown(Enum.KeyCode.Space) then
            cb = true
            else
            if bX:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA) then
                cb = true
            end
        end
    end
    )
    if cb and os.clock() - b9.lastJumpAt >= b3 then
        b9:triggerJump()
    end
end
end
end
)
end
b4._gameWalkSpeed =
function(b9)
local ca, cb = b9.speedModules
if ca then
    cb = ca
    else
    cb ={} pcall(
    function() cb.TreadmillUtil = require(e.Shared.Util.TreadmillUtil)
end
) pcall(
function() cb.Projection = require(e.Client.SpeedPowerProjection)
end
) pcall(
function() cb.Save = require(e.Shared.Save)
end
) b9.speedModules = cb
end
if cb.TreadmillUtil then
    if not cb.TreadmillUtil.SpeedPowerToWalkSpeed then
        return nil
    end
    else
    return nil
end
local cd
if cb.Projection then
    pcall(
    function() cd = cb.Projection.ReadProjected()
end
)
end
if type(cd) ~= 'number' and cb.Save then
    pcall(
    function() cd =(cb.Save.Peek or cb.Save.Get)().SpeedPower
end
)
end
if type(cd) ~= 'number' then
    return nil
end
local ce, cf = pcall(cb.TreadmillUtil.SpeedPowerToWalkSpeed, cd)
return ce and tonumber(cf) or nil
end
b4.setSpeedMultiplier =
function(b9, ca) b9.speedMultiplier = math.clamp(tonumber(ca) or 1, 1, 2.1) b9:_applySpeedMultiplier()
if b9.speedConnection then
    return
end
b9.speedConnection = bW.Heartbeat:Connect(
function()
if b9.speedMultiplier <= 1.001 then
    return
end
b9:_applySpeedMultiplier()
end
)
end
b4._applySpeedMultiplier =
function(b9)
local ca = l.__SenaV4TreadmillManager
if ca and ca.activeTreadmill ~= nil then
    return
end
local cb = b9:_humanoid()
if not cb then
    return
end
local cd = b9:_gameWalkSpeed()
if cd then
    if cd <= 0 then
        return
    end
    else
    return
end
local ce = cd * b9.speedMultiplier
if math.abs(cb.WalkSpeed - ce) > 0.05 then
    pcall(
    function() cb.WalkSpeed = ce
end
)
end
end
b4.destroy =
function(b9) b9:setFlyForCapture(false) b9:setInstantGrab(false) b9.jumpEnabled = false
for ca, cb in ipairs(b9.jumpConnections) do
    pcall(
    function() cb:Disconnect()
end
)
end
b9.jumpConnections ={}
if b9.speedConnection then
    pcall(
    function() b9.speedConnection:Disconnect()
end
) b9.speedConnection = nil
end
end
return b4
end
)().new() l.__SenaV4MovementExtras = bV
if aB.FlyForCapture then
    bV:setFlyForCapture(true)
end
if aB.InstantGrab then
    bV:setInstantGrab(true)
end
if aB.InfiniteJump then
    bV:setInfiniteJump(true)
end
bR = aB.WalkSpeedMultiplier
if bR and bR > 1 then
    bV:setSpeedMultiplier(aB.WalkSpeedMultiplier)
end
bI =(
function()
local bW = game:GetService('Players')
local bX = game:GetService('RunService')
local bY = game:GetService('ReplicatedStorage')
local bZ = bW.LocalPlayer
local b_ = CFrame.new(542.93, 71.5, - 405.58)
local b0 = 0.9
local b1 = 1.6
local b2 = 0.2
local b3 ={} b3.__index = b3 b3.new =
function()
local b4 = setmetatable({}, b3) b4.enabled = false b4.running = false b4.destroyed = false b4.connection = nil b4.wasHolding = false b4.lastResult = 'Idle'
return b4
end
b3._character =
function(b4)
return bZ.Character
end
b3._root =
function(b4)
local b5 = b4:_character()
return b5 and b5:FindFirstChild('HumanoidRootPart')
end
b3._carriedUid =
function(b4)
local b5
local function b6()
local b7 = require(bY.Client.EggState)
local b9 =
if b7.GetAreaEggSnapshot then
    b7.GetAreaEggSnapshot()
    else
    nil
    local ca =
    if
    if b9 then
        not b9.Records
        else
        not b9 then
            if b7.ReadFieldEggs then
                b7.ReadFieldEggs()
                else
                b9
                else
                b9
                if ca then
                    if not ca.Records then
                        return
                    end
                    else
                    return
                end
                local cb = bZ.UserId
                for cd, ce in ipairs(ca.Records) do
                    if ce.State == 'Carried' and ce.CarrierUserId == cb then
                        b5 = ce.Uid
                        return
                    end
                end
            end
            pcall(b6)
            return b5
        end
        b3._record =
        function(b4, b5)
        local b6 pcall(
        function()
        local b7 = require(bY.Client.EggState) b6 = b7.ReadFieldEgg and b7.ReadFieldEgg(b5)
    end
    )
    return b6
end
b3._guardFor =
function(b4, b5)
local b6 pcall(
function()
local b7 = b4:_record(b5)
local b9 = k()
local ca = b9 and b9:FindFirstChild('Areas')
local cb = ca and ca:FindFirstChild('GuardAreas')
local cd = cb and b7 and b7.AreaId and cb:FindFirstChild(b7.AreaId) b6 = cd and cd:FindFirstChild('Guard')
end
)
return b6
end
b3._skips =
function(b4, b5)
local b6 = l.__SenaV4EggRuntime
if b6 then
    if b6.instantPhase == 'priming' then
        return true
    end
    if b6.enabled then
        return true
        elseif
        b6.running then
            return true
        end
    end
    local b7 = l.__SenaV4PlayerSteal
    if b7 and b7.running then
        return true
    end
    if not b5 then
        return false
    end
    local b9 = b4:_record(b5)
    return b9 ~= nil and tostring(b9.AreaId) == 'Forest'
end
b3._freeze =
function(b4, b5)
local b6 = b4:_character()
local b7 = b6 and b6:FindFirstChildOfClass('Humanoid')
local b9 = workspace.CurrentCamera
local ca = b9 and b9.CFrame
local cb, cd = b9 and b9.CameraType
local function ce() b6.Archivable = true cd = b6:Clone()
if b5 then
    pcall(
    function() cd:PivotTo(b5)
end
)
end
cd.Name = 'SenaAntiHitGhost'
for cf, cg in ipairs(cd:GetDescendants()) do
    if cg:IsA('LuaSourceContainer') then
        cg:Destroy()
        elseif
        cg:IsA('Sound') then
            cg:Destroy()
            elseif
            cg:IsA('BasePart') then
                cg.CanCollide = false cg.Anchored = true
            end
        end
        cd.Parent = workspace
        for ch, ci in ipairs(b6:GetDescendants()) do
            if ci:IsA('BasePart') and ci.Name ~= 'HumanoidRootPart' then
                ci.LocalTransparencyModifier = 1
            end
            if ci:IsA('Trail') then
                ci.Enabled = false
            end
        end
        if b9 then
            b9.CameraType = Enum.CameraType.Scriptable b9.CFrame = ca
        end
    end
    pcall(ce)
    local ch ={} pcall(
    function()
    for ci, cj in ipairs(b6:GetDescendants()) do
        if cj:IsA('BasePart') and cj.Name ~= 'HumanoidRootPart' then
            ch[# ch + 1] = cj
        end
    end
end
)
local function ci(cj)
local function ck()
if cd then
    cd:Destroy()
end
for cl, cm in ipairs(b6:GetDescendants()) do
    if cm:IsA('BasePart') then
        cm.LocalTransparencyModifier = 0
    end
    if cm:IsA('Trail') then
        cm.Enabled = true
    end
end
if b9 then
    b9.CameraType = cb ~= Enum.CameraType.Scriptable and cb or Enum.CameraType.Custom
    if b7 then
        b9.CameraSubject = b7
    end
    if cj then
        b9.CFrame = ca
    end
end
end
pcall(ck)
end
return ci,
function()
if b9 then
    b9.CameraType = Enum.CameraType.Scriptable b9.CFrame = ca
end
for cj, ck in ipairs(ch) do
    if ck.Parent then
        ck.LocalTransparencyModifier = 1
    end
end
end
end
b3.shield =
function(b4, b5)
if b4.enabled then
    if b4.running then
        return false
    end
    else
    return false
end
if b4:_skips(b5) then
    return false
end
local b6 = b4:_root()
if not b6 then
    return false
end
b4.running = true
local b7 = b6.CFrame
local b9 = b4:_guardFor(b5)
local function ca()
local cb = b4:_root()
if not cb then
    return false
end
cb.CFrame = b_ cb.AssemblyLinearVelocity = Vector3.new(0, 0, 0) cb.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
return true
end
ca()
local cb, cd = b4:_freeze(b7)
local ce = 1
local ch = false pcall(
function()
local ci = os.clock()
local cj = false
while os.clock() - ci < b0 or cj and os.clock() - ci < b1 and b9 and(b9:GetAttribute('GuardState') == 'Waking' or b9:GetAttribute('GuardState') == 'Chasing') do
    if not ca() then
        break
    end
    cd() ce += 1
    local ck = b9 and b9:GetAttribute('GuardState')
    if ck == 'Waking' then
        cj = true
        else
        if ck == 'Chasing' then
            cj = true
            else
            if cj and(ck == 'Sleeping' and os.clock() - ci > b2) then
                ch = true
                break
            end
        end
    end
    bX.Heartbeat:Wait()
end
end
) cb(true) b4.lastResult =(ch and 'Guard slept' or 'Held')..' ('..ce..' writes)' b4.running = false
return true
end
b3._check =
function(b4, b5)
if not b4.enabled then
    b4.wasHolding = false
    return
end
local b6, b7
if type(b5) == 'table' and b5.IsCarrying and b5.Uid then
    b7 = b5.Uid
    else
    b7 = b4:_carriedUid()
end
local b9 = b7 ~= nil
if b9 and(not b4.wasHolding and(not b4.running and not b4:_skips(b7))) then
    task.spawn(
    function() pcall(
    function() b4:shield(b7)
end
)
end
)
end
b4.wasHolding = b9
end
b3.setEnabled =
function(b4, b5) b4.enabled = b5 == true
if b4.enabled then
    b4.wasHolding = b4:_carriedUid() ~= nil
end
if not b4.watcher then
    b4.watcher = true task.spawn(
    function()
    while not b4.destroyed do
        if b4.enabled then
            if b4.running then
                task.wait(0.5)
                else
                pcall(
                function() b4:_check()
            end
            ) task.wait(0.15)
        end
        else
        task.wait(0.5)
    end
end
end
)
end
if b4.connection then
    return
end
pcall(
function()
local b6 = require(bY.Client.EggState)
if b6 and b6.CarryChanged then
    b4.connection = b6.CarryChanged:Connect(
    function(b7) task.defer(
    function() b4:_check(b7)
end
)
end
)
end
end
)
end
b3.destroy =
function(b4) b4.destroyed = true b4.enabled = false
if b4.connection then
    pcall(
    function() b4.connection:Disconnect()
end
) b4.connection = nil
end
end
return b3
end
)().new() l.__SenaV4AntiHitGuard = bI
if aB.AntiHitGuard then
    bI:setEnabled(true)
end
l.__SenaV4PlayerSteal = bU do
    local bW ={at = 0, value = false} l.__SenaV4StealWantsCharacter =
    function()
    local bX = l.__SenaV4PlayerSteal
    if bX then
        if bX.running then
            return true
            elseif
            bX.wantsTarget then
                return true
            end
        end
        local bY = l.__SenaV4EggRuntime
        if bY and bY.enabled then
            if bY.destroyed then
                return false
            end
            else
            return false
        end
        local bZ = bY.activeTween and not bY.activeTween.sharedTravel
        if bY.running then
            return true
            elseif
            bZ then
                return true
                elseif
                bY.carry then
                    if bY.carry.active then
                        return true
                    end
                end
                if type(bY._eggInventoryFull) == 'function' and bY:_eggInventoryFull() then
                    return false
                end
                local b_ = os.clock()
                if b_ - bW.at < 0.5 then
                    return bW.value
                end
                bW.at = b_
                local b0, b1 = pcall(
                function()
                return bY:_wallOpen() and bY:_chooseTarget() or nil
            end
            ) bW.value = b0 and b1 ~= nil
            return bW.value
        end
        c = aI.register b ={} b.wants = l.__SenaV4StealWantsCharacter b.active =
        function()
        local bX = l.__SenaV4PlayerSteal
        if bX and bX.running then
            return true
        end
        local bY = l.__SenaV4EggRuntime
        if bY then
            if bY.destroyed then
                return false
            end
            else
            return false
        end
        local bZ = bY.activeTween and not bY.activeTween.sharedTravel
        return bY.running == true or bZ == true or bY.carry ~= nil and bY.carry.active == true
    end
    b.enabled =
    function()
    local bX = l.__SenaV4PlayerSteal
    local bY = l.__SenaV4EggRuntime
    return bY ~= nil and bY.enabled == true or bX ~= nil and bX.enabled == true
end
b.status =
function()
local bX = l.__SenaV4PlayerSteal
if bX and bX.running then
    return tostring(bX.status or 'Stealing from a player')
end
local bY = l.__SenaV4EggRuntime
return bY and bY.stats and tostring(bY.stats.status or '') or ''
end
c('auto_steal', b)
end
bP:setStealMode(aB.StealMode == 'Semi Teleport' and 'Instant' or aB.StealMode) bP:setSpeed(aB.TweenSpeedMultiplier or 60)
if aB.StealMinValue and aB.StealMinValue > 0 then
    bP:setMinValuePerSec(aB.StealMinValue)
end
if aB.StealAreas and not table.find(aB.StealAreas, 'None') and # aB.StealAreas > 0 then
    local bW ={}
    for bX, bY in ipairs(aB.StealAreas) do
        if bY ~= 'None' then
            table.insert(bW, bY)
        end
    end
    bP:setFilter('areas', bW) bP:setFilterEnabled('area', # bW > 0)
end
if aB.StealRarities and not table.find(aB.StealRarities, 'None') and # aB.StealRarities > 0 then
    local bW ={}
    for bX, bY in ipairs(aB.StealRarities) do
        if bY ~= 'None' then
            table.insert(bW, bY)
        end
    end
    bP:setFilter('rarities', bW) bP:setFilterEnabled('rarity', # bW > 0)
end
if aB.StealNamesFilter and not table.find(aB.StealNamesFilter, 'None') and # aB.StealNamesFilter > 0 then
    local bW ={}
    for bX, bY in ipairs(aB.StealNamesFilter) do
        if bY ~= 'None' then
            table.insert(bW, bY)
        end
    end
    bP:setFilter('names', bW) bP:setFilterEnabled('name', # bW > 0)
end
l.__SenaV4EggRuntimeCleanup =
function()
if bP then
    pcall(bP.destroy, bP)
end
if bQ then
    pcall(bQ.destroy, bQ)
end
if l.__SenaV4EggRuntime == bP then
    l.__SenaV4EggRuntime = nil
end
if l.__SenaV4TreadmillManager == bQ then
    l.__SenaV4TreadmillManager = nil
end
end
l.__SenaV4AntiGuardCleanup =
function()
if bS then
    pcall(bS.destroy, bS)
end
if bT then
    pcall(bT.destroy, bT)
end
if l.__SenaV4AntiGuard == bS then
    l.__SenaV4AntiGuard = nil
end
if l.__SenaV4GodMode == bT then
    l.__SenaV4GodMode = nil
end
end
do
    local bW = '__FyyStealAnEggStartupProtectionLiteV2'
    local bX = 60
    local bY ={}
    local function bZ()
    return getgenv and getgenv() or _G
end
local function b_()
if type(getconnections) == 'function' then
    return getconnections
end
if type(get_signal_cons) == 'function' then
    return get_signal_cons
end
return nil
end
local function b0(b1)
local b2 = d.LocalPlayer
if not b2 then
    b1.antiAfkStatus = 'LocalPlayer unavailable'
    return false
end
local b3 = b_()
if not b3 then
    b1.antiAfkStatus = 'Native Idled connection API unavailable'
    return false
end
local b4, b5 = pcall(b3, b2.Idled)
if b4 then
    if type(b5) ~= 'table' then
        b1.antiAfkStatus = 'Idled scan unavailable'
        return false
    end
    else
    b1.antiAfkStatus = 'Idled scan unavailable'
    return false
end
b3 = 0
for b6, b7 in ipairs(b5) do
    b3 =
    if type(b7) == 'table' or type(b7) == 'userdata' then
        if type(b7.Disable) == 'function' then
            if pcall(b7.Disable, b7) then
                b3 + 1
                else
                b3
                else
                if type(b7.Disconnect) == 'function' then
                    if pcall(b7.Disconnect, b7) then
                        b3 + 1
                        else
                        b3
                        else
                        b3
                        else
                        b3
                    end
                    b1.scanRuns = b1.scanRuns + 1 b1.lastScanAt = os.clock() b1.lastDisabledIdleConnections = b3 b1.disabledIdleConnections = b1.disabledIdleConnections + b3 b1.antiAfkStatus = b3 > 0 and 'Anti-AFK disabled '..tostring(b3)..' Idled connection(s)' or 'Anti-AFK active; Idled connections clear'
                    return true
                end
                bY.install =
                function()
                local b1 = bZ()
                local b2 = rawget(b1, bW)
                if type(b2) == 'table' and b2.installed then
                    b2.installRuns = b2.installRuns + 1 b0(b2) b2.status = b2.antiAfkStatus
                    return b2
                end
                local b3 ={installRuns = 1, scanRuns = 0, disabledIdleConnections = 0, lastDisabledIdleConnections = 0, lastScanAt = 0, installed = false, mode = 'native-idled-disabler',
                integrityPatcherInstalled = false, networkFilterInstalled = false, namecallHookInstalled = false} b1[bW] = b3
                local b4 = d.LocalPlayer
                if not b4 then
                    b3.antiAfkInstalled = false b3.antiAfkStatus = 'LocalPlayer unavailable' b3.status = b3.antiAfkStatus b3.installed = true
                    return b3
                end
                b3.antiAfkInstalled = b0(b3) b3.idledConnection = b4.Idled:Connect(
                function() b0(b3)
            end
            ) b3.characterConnection = b4.CharacterAdded:Connect(
            function() task.delay(1,
            function()
            if b3.installed then
                b0(b3)
            end
        end
        )
    end
    ) b3.installed = true b3.status = b3.antiAfkStatus task.spawn(
    function()
    while b3.installed and b1[bW] == b3 do
        task.wait(bX)
        if b3.installed and b1[bW] == b3 then
            b0(b3) b3.status = b3.antiAfkStatus
        end
    end
end
)
return b3
end
bY.uninstall =
function()
local b1 = rawget(bZ(), bW)
if type(b1) == 'table' then
    b1.installed = false
    if b1.idledConnection and typeof(b1.idledConnection.Disconnect) == 'function' then
        pcall(b1.idledConnection.Disconnect, b1.idledConnection) b1.idledConnection = nil
    end
    if b1.characterConnection and typeof(b1.characterConnection.Disconnect) == 'function' then
        pcall(b1.characterConnection.Disconnect, b1.characterConnection) b1.characterConnection = nil
    end
end
end
(
function()
local b1 = getgenv and getgenv() or _G b1.__SenaV4AntiAfkGeneration =(b1.__SenaV4AntiAfkGeneration or 0) + 1 b1.__SenaV4AntiAfkEnabled = aB.AntiAFK b1.__SenaV4StartupProtection = bY b1.__SenaV4SetAntiAfkEnabled =
function(b2) b1.__SenaV4AntiAfkEnabled = b2 == true
if b2 then
    bY.install()
    else
    bY.uninstall()
end
end
if aB.AntiAFK then
    b1.__SenaV4SetAntiAfkEnabled(true)
end
end
)()
end
local bW = aB
local bX ={} bX.TeleportService = i or game:GetService('TeleportService') bX.LP = g or d.LocalPlayer bX.Players = d
local bY = bX
local function bZ()
local b_ = [[if game:GetAttribute("SenaBootQueued") then return end
game:SetAttribute("SenaBootQueued", true)
repeat task.wait(0.5) until game:IsLoaded()
task.wait(1.5)
if getgenv then getgenv().SNE_AutoExecute = true end
loadstring(game:HttpGet("https://senahub.xyz/raw/senav6"))()
]] pcall(
function()
if writefile then
    pcall(
    function() writefile('autoexec/Sena_StealAnEgg.lua', b_)
end
) pcall(
function() writefile('autoexecute/Sena_StealAnEgg.lua', b_)
end
)
end
end
)
local b0 = queue_on_teleport or syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport
if b0 then
    pcall(
    function() b0(b_)
end
)
end
end
local function b_() pcall(
function()
if delfile then
    pcall(
    function() delfile('autoexec/Sena_StealAnEgg.lua')
end
) pcall(
function() delfile('autoexecute/Sena_StealAnEgg.lua')
end
)
elseif
writefile then
    pcall(
    function() writefile('autoexec/Sena_StealAnEgg.lua', '')
end
) pcall(
function() writefile('autoexecute/Sena_StealAnEgg.lua', '')
end
)
end
end
)
end
local b0 = false
local function b1()
if b0 then
    return
end
b0 = true
if bW.autoExecute then
    pcall(bZ)
    elseif
    getgenv then
        if getgenv().SNE_AutoExecute then
            pcall(bZ)
        end
    end
    task.wait(3)
    local b2 = bY.TeleportService or game:GetService('TeleportService')
    local b3 = game.PlaceId
    local b4 = game.JobId
    while true do
        pcall(
        function()
        if b4 and # b4 > 0 then
            b2:TeleportToPlaceInstance(b3, b4, bY.LP)
            else
            b2:Teleport(b3, bY.LP)
        end
    end
    ) task.wait(6)
end
end
pcall(
function()
local function b2(b3)
if bW.autoReconnect and(b3 and # b3 > 0) then
    b1()
end
end
game:GetService('GuiService').ErrorMessageChanged:Connect(b2)
end
) pcall(
function()
local b2 = bY.LP or g or d.LocalPlayer
if b2 and b2.OnTeleport then
    local function b3()
    if bW.autoExecute then
        pcall(bZ)
        elseif
        getgenv then
            if getgenv().SNE_AutoExecute then
                pcall(bZ)
            end
        end
    end
    b2.OnTeleport:Connect(b3)
end
end
) task.spawn(
function()
while true do
    task.wait(2)
    if bW.autoReconnect then
        pcall(
        function()
        local b2 = game:GetService('CoreGui'):FindFirstChild('RobloxPromptGui')
        local b3 = b2 and b2:FindFirstChild('promptOverlay')
        local b4 = b3 and b3:FindFirstChild('ErrorPrompt')
        if b4 and b4.Visible then
            b1()
        end
    end
    )
end
end
end
) l.__SenaV4PetBarn =(
function()
local b2 = require(e.Shared.Remotes)
local b3 ={equipBest =
function() pcall(
function() b2.Haul.WearBest:InvokeServer()
end
)
end
, claimOffline =
function()
local b3, b4 = pcall(
function()
return b2.AwayEarnings.FetchSummary:InvokeServer()
end
)
if b3 and type(b4) == 'table' then
    local b5 = b4.ClaimableAmount
    if b5 and b5 > 0 then
        pcall(
        function() b2.AwayEarnings.AskCollect:InvokeServer({Kind = 'Claim'})
    end
    )
end
end
end
, favoriteSelected =
function()
local b3 =(require(e.Shared.Save).Peek or require(e.Shared.Save).Get)()
if b3 then
    if type(b3.Inventory) ~= 'table' then
        return 0
    end
    else
    return 0
end
local b4 = require(e.Shared.Util.AssetItems)
local b5 = require(e.Data.Assets).Directory
local b6 = pairs
local b7 = b3.Inventory
local b9 = 0
for ca, cb in b6(b7) do
    local cd
    if b4 and type(b4.Decode) == 'function' then
        pcall(
        function() cd = b4.Decode(cb)
    end
    )
end
cd = cd or cb
if type(cd) == 'table' then
    if cd.IsFavorite then
        else
        if cd.Category then
            local ce = b5[cd.Category]
            local ch = ce and ce.Rarity and(ce.Rarity.DisplayName or ce.Rarity._id)
            local ci = false
            if aB.FavMode == 'Species' then
                local cj = aB.FavSpecies or{} ci =
                if table.find(cj, 'All') then
                    true
                    else
                    if table.find(cj, cd.Category) then
                        true
                        else
                        if ce then
                            if table.find(cj, ce.DisplayName) then
                                true
                                else
                                ci
                                else
                                ci
                                else
                                local cj = aB.FavRarities or{} ci =
                                if table.find(cj, 'All') then
                                    true
                                    else
                                    if ch then
                                        if table.find(cj, ch) then
                                        true
                                        else
                                        ci
                                        else
                                        ci
                                    end
                                    if ci then
                                        pcall(
                                        function() b2.PetSatchel.WriteFavourite:FireServer(ca, true)
                                    end
                                    )
                                    local cj = b9 + 1
                                    if cj % 10 == 0 then
                                        task.wait(0.05)
                                    end
                                    b9 = cj
                                end
                            end
                        end
                    end
                end
                return b9
            end
            , unfavoriteAll =
            function()
            local b3 =(require(e.Shared.Save).Peek or require(e.Shared.Save).Get)()
            if b3 then
                if type(b3.Inventory) ~= 'table' then
                    return 0
                end
                else
                return 0
            end
            local b4 = 0
            for b5, b6 in pairs(b3.Inventory) do
                if type(b6) == 'table' and b6.IsFavorite then
                    pcall(
                    function() b2.PetSatchel.WriteFavourite:FireServer(b5, false)
                end
                )
                local b7 = b4 + 1
                if b7 % 10 == 0 then
                    task.wait(0.05)
                end
                b4 = b7
            end
        end
        return b4
    end
    }
    local function b4(b5, b6, b7)
    local b9 =(require(e.Shared.Save).Peek or require(e.Shared.Save).Get)()
    if b9 then
        if type(b9.Inventory) ~= 'table' then
            return nil
        end
        else
        return nil
    end
    local ca = require(e.Shared.Util.AssetItems)
    local cb = require(e.Data.Assets).Directory
    local cd ={}
    for ce, ch in ipairs(b9.EquippedAssets or{}) do
        cd[ch] = true
    end
    local ci ={}
    for cj, ck in pairs(b9.Inventory) do
        if not cd[cj] then
            local cl
            if ca and type(ca.Decode) == 'function' then
                pcall(
                function() cl = ca.Decode(ck)
            end
            )
        end
        cl = cl or ck
        if type(cl) == 'table' and(not cl.InFuse and(not cl.IsFavorite and cl.Category)) then
            local cm = cb[cl.Category]
            local cn = cm and cm.Rarity and(cm.Rarity.DisplayName or cm.Rarity._id)
            local co =
            if b7 then
                if # b7 > 0 then
                    if table.find(b7, 'All') then
                        true
                        else
                        cn and table.find(b7, cn) ~= nil
                        else
                        true
                        else
                        true
                        local cp =
                        if b5 then
                            if b6 then
                                if # b6 > 0 then
                                    if table.find(b6, 'All') then
                                        true
                                        else
                                        table.find(b6, cl.Category) ~= nil or cm and table.find(b6, cm.DisplayName) ~= nil
                                        else
                                        true
                                        else
                                        true
                                        else
                                        true
                                        if co and cp then
                                        ci[cl.Category] = ci[cl.Category] or{} table.insert(ci[cl.Category],{uid = cj, d = cl})
                                    end
                                end
                            end
                        end
                        for cl, cm in pairs(ci) do
                            if # cm >= 3 then
                                return{cm[1].uid, cm[2].uid, cm[3].uid}
                            end
                        end
                        return nil
                    end
                    b3.fuseOnePair =
                    function()
                    local b5 =(require(e.Shared.Save).Peek or require(e.Shared.Save).Get)()
                    if not b5 then
                        return false
                    end
                    if b5.FusionLocked then
                        return false, 'Fusion locked'
                    end
                    local b6 = b4(aB.FuseSelectedOnly, aB.FuseSpecies, aB.FuseRarities)
                    if not b6 then
                        return false, 'No eligible group of 3'
                    end
                    pcall(
                    function() b2.Fusery.ConfirmBriefing:InvokeServer()
                end
                )
                for b7, b9 in ipairs(b6) do
                    local ca, cb = pcall(
                    function()
                    return b2.Fusery.LoadPet:InvokeServer(b9)
                end
                )
                if ca then
                    if not cb then
                        return false, 'Failed to load pet'
                    end
                    else
                    return false, 'Failed to load pet'
                end
                task.wait(0.02)
            end
            local ca, cb = pcall(
            function()
            return b2.Fusery.BeginFuse:InvokeServer()
        end
        )
        if ca then
            if not cb then
                return false, 'Failed to begin fuse'
            end
            else
            return false, 'Failed to begin fuse'
        end
        task.wait(0.06) pcall(
        function() b2.Fusery.FinishReveal:InvokeServer()
    end
    )
    return true
end
task.spawn(
function()
local b5 = 0
while n() do
    local b6 = os.clock()
    if aB.AutoEquipBest and b6 - b5 > 6 then
        pcall(b3.equipBest) b5 = b6
    end
    if aB.AutoClaimOffline then
        pcall(b3.claimOffline)
    end
    if aB.AutoFavorite then
        pcall(b3.favoriteSelected)
    end
    if aB.AutoFusePets then
        pcall(b3.fuseOnePair)
    end
    task.wait(2.5)
end
end
)
return b3
end
)() l.__SenaV4Upgrades =(
function()
local b2 = require(e.Shared.Remotes)
local b3 ={upgradeBase =
function()
local b3 =(require(e.Shared.Save).Peek or require(e.Shared.Save).Get)()
if not b3 then
    return false
end
local b4 = tonumber(b3.BaseUpgradeLevel or 0) or 0
local b5 = require(e.Data.Bases)
local b6 = b5 and b5.BASES and b5.BASES[b4 + 1]
if not b6 then
    return false, 'Max level'
end
if(tonumber(b3.Money or 0) or 0) <(b6.Cost or 0) then
    return false, 'Not enough money'
end
b4, b3 = pcall(
function()
return b2.Homestead.AskBaseTierRaise:InvokeServer()
end
)
return b4 and b3 == true, b3
end
, claimAlmanac =
function()
local b3, b4 = pcall(
function()
return b2.Codex.AskRedeemAll:InvokeServer()
end
)
return b3, b4
end
} task.spawn(
function()
while n() do
    if aB.AutoBaseUpgrade then
        pcall(b3.upgradeBase)
    end
    if aB.AutoClaimAlmanac then
        pcall(b3.claimAlmanac)
    end
    task.wait(3)
end
end
)
return b3
end
)() l.__SenaV4Roaming =(
function()
local b2 b2 ={noclipConn = nil, setNoclip =
function(b3) aB.Noclip = b3 == true
if b2.noclipConn then
    pcall(
    function() b2.noclipConn:Disconnect()
end
) b2.noclipConn = nil
end
if not aB.Noclip then
    local b4 = g.Character
    if b4 then
        for b5, b6 in ipairs(b4:GetDescendants()) do
            if b6:IsA('BasePart') and b6:GetAttribute('SenaNoclip') then
                b6.CanCollide = true b6:SetAttribute('SenaNoclip', nil)
            end
        end
    end
    return
end
b2.noclipConn = h.Stepped:Connect(
function()
if not aB.Noclip then
    return
end
local b4 = g.Character
if not b4 then
    return
end
for b5, b6 in ipairs(b4:GetDescendants()) do
    if b6:IsA('BasePart') and b6.CanCollide then
        b6:SetAttribute('SenaNoclip', true) b6.CanCollide = false
    end
end
end
)
end
, waypointList =
function()
local b3 ={'Respawn Point'}
local b4 = k()
local b5 = b4 and b4:FindFirstChild('Machines')
if b5 and b5:FindFirstChild('FuseMachine') then
    table.insert(b3, 'Fuse Machine')
end
local b6 = b4 and b4:FindFirstChild('Areas')
local b7 = b6 and b6:FindFirstChild('GuardAreas')
if b7 then
    for b9, ca in ipairs(b7:GetChildren()) do
        table.insert(b3, ca.Name)
    end
end
return b3
end
, teleportWaypoint =
function(b3)
local b4 = g.Character
local b5 = b4 and b4:FindFirstChild('HumanoidRootPart')
if not b5 then
    return false
end
local b6
local b7 = k()
if b3 == 'Respawn Point' then
    pcall(
    function()
    local b9 = require(e.Client.PlotState)
    local ca = b9.ResolvePlot and b9.ResolvePlot()
    if ca and ca.RespawnPointCFrame then
        b6 = ca.RespawnPointCFrame.Position
        elseif
        ca then
            if ca.Model and ca.Model:FindFirstChild('Spawn') then
                b6 = ca.Model.Spawn.Position
            end
        end
    end
    )
    else
    local b9, ca = b3 == 'Fuse Machine'
    if b9 then
        b4 = b7 and b7:FindFirstChild('Machines')
        local cb = b4 and b4:FindFirstChild('FuseMachine')
        local cd = cb and(cb:FindFirstChild('Machine') or cb.PrimaryPart)
        if cd then
            ca = cd.Position
            else
            ca = b6
        end
        else
        local cb = b7 and b7:FindFirstChild('Areas')
        local cd = cb and cb:FindFirstChild('GuardAreas') cb = cd and cd:FindFirstChild(b3)
        local ce = cb and cb:FindFirstChild('Guard')
        if ce then
            if ce:IsA('BasePart') then
                ca = ce.Position
                else
                ca = b6
            end
            else
            ca = b6
        end
    end
    b6 = ca
end
if not b6 then
    return false
end
b5.CFrame = CFrame.new(b6 + Vector3.new(0, 4, 0)) b5.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
return true
end
, setBottingMode =
function(b3) aB.BottingMode = b3 == true
local b4 = l.__SenaV4BottingOverlay
if b4 and b4.Parent then
    pcall(
    function() b4:Destroy()
end
)
end
l.__SenaV4BottingOverlay = nil
if not aB.BottingMode then
    pcall(
    function() h:Set3dRenderingEnabled(true)
end
)
return
end
pcall(
function() h:Set3dRenderingEnabled(false)
end
)
local b5 pcall(
function() b5 = game:GetService('CoreGui')
end
) b5 = b5 or g:FindFirstChildOfClass('PlayerGui')
if not b5 then
    return
end
local b6 = Instance.new('ScreenGui') b6.Name = 'SenaBottingOverlay' b6.ResetOnSpawn = false b6.IgnoreGuiInset = true b6.DisplayOrder = - 1 b6.Parent = b5
local b7 = Instance.new('Frame') b7.Name = 'Blackscreen' b7.Size = UDim2.new(1, 0, 1, 0) b7.BackgroundColor3 = Color3.fromRGB(0, 0, 0) b7.BorderSizePixel = 0 b7.Active = false b7.Parent = b6 l.__SenaV4BottingOverlay = b6
end
} task.spawn(
function()
while n() do
    if aB.AntiCutscene then
        pcall(
        function()
        local b3 = g:FindFirstChild('PlayerGui')
        if b3 then
            for b4, b5 in ipairs(b3:GetChildren()) do
                if b5:IsA('ScreenGui') then
                    if string.find(string.lower(b5.Name), 'cutscene') then
                        if b5.Enabled then
                            b5.Enabled = false
                        end
                        elseif
                        b5.Name == 'Intro' then
                            if b5.Enabled then
                                b5.Enabled = false
                            end
                        end
                    end
                end
            end
        end
        )
    end
    task.wait(0.2)
end
end
)
return b2
end
)() l.__SenaV4ScrambleRuntime =(
function()
local b2 ={snapAt = 0, snap = nil, status = 'Idle', lastBuy = 0, active = false, wantsCharacter = false}
local function b3()
return require(e.Shared.Remotes).Scramble
end
b2.snapshot =
function(b4)
local b5 = os.clock()
if not b4 and(b2.snap and b5 - b2.snapAt < 1.5) then
    return b2.snap
end
local b6, b7 = pcall(
function()
return b3().Request:InvokeServer('Snapshot')
end
)
if b6 and(type(b7) == 'table' and b7.State) then
    b2.snap = b7 b2.snapAt = b5
end
return b2.snap
end
b2.live =
function()
local b4 = b2.snapshot()
if not b4 then
    return false
end
return b4.Ready == true and b4.Enabled == true and b4.WorldReady == true and workspace:GetServerTimeNow() <(b4.EventEndsAt or 0)
end
b2.samples =
function()
local b4 = b2.snapshot()
return b4 and b4.State and b4.State.Samples or 0
end
b2.buyTick =
function()
local b4 = aB.ScrambleBuyList
if b4 then
    if # b4 == 0 then
        return
    end
    else
    return
end
if os.clock() - b2.lastBuy < 2 then
    return
end
local b5 = b2.snapshot(true)
if b5 and b5.State then
    if not b5.Shop then
        return
    end
    else
    return
end
local b6 = b5.State.Samples or 0
for b7, b9 in pairs(b5.Shop) do
    if not aB.ScrambleAutoBuy then
        return
    end
    local ca = tostring(b9.Label)
    local cb = false
    for cd, ce in ipairs(b4) do
        if tostring(ce) == ca then
            cb = true
            break
        end
    end
    if cb and(b9.Price or 0) <= b6 then
        local ci =(b5.State.ShopPurchases or{})[b9.Id]
        local cl = ci and ci.Period == b5.ShopPeriod and(ci.Count or 0) or 0
        local cm = b9.PurchaseLimit
        if
        if cm then
            cl +(b9.Quantity or 1) <= b9.PurchaseLimit
            else
            not cm then
                b2.lastBuy = os.clock() pcall(
                function()
                local cn = b3().Request
                local co = b9.Id
                local cp ={Quote = b9.Quote} cp.Sequence = b5.State.ShopSequence cn:InvokeServer('Shop', co, cp)
            end
            ) b2.status = 'Bought '..ca b2.snapshot(true)
            return
        end
    end
end
end
task.spawn(
function()
while n() do
    if aB.ScrambleAutoBuy and not pcall(
    function()
    if not b2.live() then
        b2.status = 'Event not active'
        return
    end
    b2.buyTick()
end
) then
    b2.status = 'Idle'
end
task.wait(1)
end
end
)
return b2
end
)() do
    local b2 ={status = 'Idle', lastResult = 'No race yet', active = false, dist = nil, speed = 0, stuns = 0, corrections = 0, mount = nil, path = nil, leftFor = nil,
    lastJoinTry = 0, lastClaim = 0, lastBuy = 0, startedAt = nil, JOIN_LATE_SECONDS = 10, FIELD_SETTLE_SECONDS = 10, DODGE_STUDS = 10, CATCHUP_SPEED = 200,
    FINISH_RELEASE_STUDS = 150, RIDE_SPEED = 140, INPUT_PULSE_SECONDS = 1.5, RELEASE_AT_FINISH = false, LEGIT = true, LEAD_START = 200, LEAD_RETAKE = 100, BOOST_MAX_SECONDS = 18}
    local function b3(...)
    local b4 ={...}
    local b5 = e
    for b6, b7 in ipairs(b4) do
        b5 = b5 and b5:FindFirstChild(b7)
    end
    if not b5 then
        return nil
    end
    local b9, ca = pcall(require, b5)
    return b9 and ca or nil
end
local function b4()
if b2.m then
    return b2.m
end
local b5 ={Remotes = b3('Shared', 'Remotes'), Save = b3('Shared', 'Save'), RR = b3('Data', 'RaceRally'), MR = b3('Data', 'MountRace'), Path = b3('Shared',
'Modules', 'RaceTrackPath'), Flags = b3('Shared', 'Flags', 'MountRaceFlags'), Elig = b3('Shared', 'Util', 'RaceRallyEligibility'), Power = b3('Data', 'RacePowerUps')}
if b5.Remotes then
    if b5.Save then
        if b5.RR then
            if not b5.MR then
                return nil
            end
            else
            return nil
        end
        else
        return nil
    end
    else
    return nil
end
b2.m = b5
return b5
end
local function b5(b6, b7, b9)
return g:GetAttribute(b6.MR.PlayerAttributes and b6.MR.PlayerAttributes[b7] or b9)
end
local function b6(b7)
local b9, ca = pcall(b7.Save.Peek)
return b9 and type(ca) == 'table' and ca or nil
end
b2.inRace =
function()
local b7 = b4()
return b7 ~= nil and type(b5(b7, 'RaceId', 'RaceId')) == 'string'
end
b2.joinLeft =
function()
local b7 = b4()
if not b7 then
    return 0
end
local b9 = j:GetAttribute(b7.RR.Attributes.JoinEndsAt)
if type(b9) ~= 'number' then
    return 0
end
return math.max(0, b9 - j:GetServerTimeNow())
end
b2.fieldSettling =
function()
local b7 = l.__SenaV4EggRuntime
if b7 then
    if b7.destroyed then
        return nil
    end
    else
    return nil
end
if b7.resetBlocked then
    return 1 / 0
end
local b9 = os.clock() -(tonumber(b7.gateOpenAt) or 0)
return b9 < b2.FIELD_SETTLE_SECONDS and b2.FIELD_SETTLE_SECONDS - b9 or nil
end
b2.roundId =
function()
local b7, b9 = pcall(
function()
return b3('Shared', 'Util', 'RaceRallySchedule').Window(j:GetServerTimeNow())
end
)
return b7 and b9 or nil
end
b2.racedThisRound =
function()
local b7 = b2.roundId()
return b7 ~= nil and b2.racedRound == b7
end
b2.wantsJoin =
function()
local b7 = b2.joinLeft()
if b7 <= 0 then
    return false
end
if b2.racedThisRound() then
    return false
end
if b7 > b2.JOIN_LATE_SECONDS and b2.fieldSettling() then
    return false
end
local b9 = b4()
if not b9 or type(b5(b9, 'FinishPlace', 'RaceFinishPlace')) == 'number' then
    return false
end
if b2.eligibleAt and os.clock() - b2.eligibleAt < 10 then
    return b2.eligible
end
local ca = b6(b9)
local cb, cd = pcall(
function()
return b9.Elig == nil or b9.Elig.IsEligible(tonumber(ca and ca.SpeedPower) or 0)
end
) b2.eligible, b2.eligibleAt = cb and cd == true, os.clock()
return b2.eligible
end
b2.join =
function(b7)
if os.clock() - b2.lastJoinTry < 2 then
    return
end
local b9 = l.__SenaV4TreadmillManager
local ca, cb = pcall(
function()
return b9 and not b9.destroyed and b9:isEngaged() == true
end
)
if ca and cb then
    b2.status = 'Leaving treadmill for the race'
    return
end
b2.lastJoinTry = os.clock()
local cd = b6(b7)
if b7.Elig and cd then
    local ce, ci = pcall(b7.Elig.IsEligible, tonumber(cd.SpeedPower) or 0)
    if ce and ci ~= true then
        b2.status = 'Not eligible yet (need more speed)'
        return
    end
end
local ce = j:FindFirstChild('World')
local ci = ce and ce:FindFirstChild('RaceRallyPortal')
local cl = g.Character
local cm = cl and cl:FindFirstChild('HumanoidRootPart')
local cn = cl and cl:FindFirstChildOfClass('Humanoid')
if not ci or not cm then
    return
end
local function co()
for cp, cq in ipairs(ci:GetDescendants()) do
    if cq:IsA('BasePart') and cq.CanTouch then
        pcall(firetouchinterest, cm, cq, 0) task.wait() pcall(firetouchinterest, cm, cq, 1)
    end
end
local cr = ci:FindFirstChildWhichIsA('ProximityPrompt', true)
if cr and(type(fireproximityprompt) == 'function' and(cm.Position - cr.Parent:GetPivot().Position).Magnitude < 20) then
    pcall(fireproximityprompt, cr)
end
end
ca = j:GetAttribute(b7.RR.Attributes.JoinEndsAt) b2.joinTries =(b2.joinWindow == ca and b2.joinTries or 0) + 1 b2.joinWindow = ca
if b2.joinTries > 2 and cn then
    local cp = ci:FindFirstChild('Hitbox') b7, ca = pcall(
    function()
    return cp:IsA('BasePart') and cp.Position or cp:GetPivot().Position
end
)
if b7 and(ca and(cm.Position - ca).Magnitude > 12) then
    b2.status = 'Going to the race portal'
    local function cq()
    local cr = n()
    return(
    if cr then
        not aB.RaceAuto
        else
        not cr) or b2.inRace() or b2.joinLeft() <= 0
    end
    pcall(aZ, cm, cn, CFrame.new(ca + Vector3.new(0, 3, 0)), cq, false, nil, false)
    if b2.inRace() then
        return
    end
end
end
co() b2.status = 'Joining race'
end
b2.findControls =
function()
if b2.controls then
    return b2.controls
end
if os.clock() -(b2.lastControlsSearch or 0) < 1 then
    return nil
end
b2.lastControlsSearch = os.clock()
if type(getgc) ~= 'function' then
    return nil
    elseif
    type(debug) ~= 'table' then
        return nil
        elseif
        type(debug.getupvalue) ~= 'function' then
            return nil
        end
        return pcall(
        function()
        for b7, b9 in ipairs(getgc(false)) do
            if type(b9) == 'function' then
                local ca, cb = pcall(debug.info, b9, 's')
                if ca and cb and cb:find('MountController') then
                    local cd, ce = pcall(debug.info, b9, 'n')
                    if cd and ce == 'Step' then
                        for ci = 1, 6, 1 do
                            local cl, cm = pcall(debug.getupvalue, b9, ci)
                            if cl and(type(cm) == 'table' and(rawget(cm, 'activeController') ~= nil and cm.GetMoveVector ~= nil)) then
                                b2.controls = cm
                                return
                            end
                        end
                    end
                end
            end
        end
    end
    ) and b2.controls or nil
end
b2.releaseControls =
function()
local b7 = b2.controls
if b7 and rawget(b7, 'GetMoveVector') == b2.finishMove then
    b7.GetMoveVector = nil
end
local b9 = b7 and rawget(b7, 'activeController')
if type(b9) == 'table' and b9.moveVector == b2.finishInput then
    b9.moveVector = Vector3.new(0, 0, 0)
end
b2.finishMove = nil b2.finishInput = nil
end
b2.rivalGap =
function(b7)
local b9 = b2.path
if b7 then
    if not b9 then
        return nil
    end
    else
    return nil
end
local ca = b9.Length
local cb = os.clock()
local cd = b2.rivals
if
if cd then
    cb -(b2.rivalsAt or 0) > 2.5
    else
    not cd then
        local ce ={}
        local ci = g.Character pcall(
        function()
        for cl, cm in ipairs(j:GetDescendants()) do
            if cm:IsA('Model') and(cm ~= ci and cm:FindFirstChildOfClass('Humanoid')) then
                local cn = cm:FindFirstChild('HumanoidRootPart') or cm.PrimaryPart
                if cn and cn:IsA('BasePart') then
                    local co, cp, cq = pcall(b9.Project, b9, cn.Position, 0, ca, ca)
                    if co and(type(cp) == 'number' and(type(cq) == 'number' and cq < 30)) then
                        ce[# ce + 1] = cn
                    end
                end
            end
        end
    end
    ) b2.rivals = ce b2.rivalsAt = cb
end
cb, cd = false
for ce, ci in ipairs(b2.rivals) do
    if ci.Parent then
        local cl, cm = pcall(b9.Project, b9, ci.Position, b7, 150, 150)
        if cl and type(cm) == 'number' then
            local cn =(cm % ca - b7 + ca / 2) % ca - ca / 2
            if cn > 5 then
                cb = true
                else
                if cn < 0 then
                    local co = - cn cd =
                    if cd then
                        if co < cd then
                            co
                            else
                            cd
                            else
                            co
                        end
                    end
                end
            end
        end
        if cb then
            return 0
        end
        return cd
    end
    b2.decideSpeed =
    function()
    local b7 = tonumber(g:GetAttribute('RacePlace')) or 1
    local b9 = b2.rivalGap(b2.legitProg)
    local ca = os.clock()
    if b2.boosting then
        b2.boostStartedAt = b2.boostStartedAt or ca
        if b7 == 1 and b9 ~= nil and b9 >=(b2.leadTarget or b2.LEAD_START) or ca - b2.boostStartedAt > b2.BOOST_MAX_SECONDS then
            b2.boosting = false b2.leadDone = true b2.leadTarget = b2.LEAD_RETAKE b2.boostStartedAt = nil
        end
        elseif
        b7 > 1 then
            b2.boosting = true b2.boostStartedAt = ca
        end
        return b2.boosting and b2.CATCHUP_SPEED or b2.RIDE_SPEED
    end
    b2.legitStep =
    function(b7)
    local b9 = b2.findControls()
    local ca = b2.path
    local cb = g.Character
    local cd = cb and cb:FindFirstChild('HumanoidRootPart')
    if b9 then
        if ca then
            if not cd then
                return
            end
            else
            return
        end
        else
        return
    end
    if b7 and b7.Touch ~= true then
        b7.Touch = true
    end
    local ce = b2.decideSpeed()
    if b2.flagsSet ~= ce then
        b2.flagsSet = ce pcall(
        function()
        local ci = require(e.Shared.Flags.MountRaceFlags)
        for cl, cm in pairs({TopSpeed = ce, AccelSeconds = 0.3, AirFallSeconds = 9999, WallSpeedKeep = 0.95, BrakeSeconds = 3}) do
            local cn = ci[cl]
            if type(cn) == 'table' and rawget(cn, 'Value') ~= nil then
                cn.Value = cm
            end
        end
    end
    )
end
local ci = cd.Position
local cl = os.clock()
local cm = b2.legitProg
if
if cm then
    cl -(b2.legitFull or 0) > 0.5
    else
    not cm then
        local cn, co = pcall(ca.Project, ca, ci, 0, ca.Length, ca.Length)
        if cn and type(co) == 'number' then
            b2.legitProg = co % ca.Length
        end
        b2.legitFull = cl
        else
        local cn, co = pcall(ca.Project, ca, ci, b2.legitProg, 40, 120)
        if cn and type(co) == 'number' then
            b2.legitProg = co % ca.Length
        end
    end
    local cn = b2.legitProg
    if not cn then
        return
    end
    local co = cb:FindFirstChild('RaceMount')
    local cp = co and co:FindFirstChild('Hitbox') or cd
    local cq = cp.CFrame.LookVector
    local cr = cp.CFrame.UpVector
    local cs = cd.AssemblyLinearVelocity.Magnitude
    local ct = ca.Length
    local cu = ca:FrameAt((cn + math.clamp(cs * 0.35, 25, 60)) % ct) cd = false co = 0
    for cv, cw in ipairs(b2.hazards()) do
        local cx, cy = pcall(ca.Project, ca, cw.pos, cn, 10, 110)
        if cx and type(cy) == 'number' then
            local cz =(cy % ct - cn) % ct
            if cz > 5 and cz < 110 then
                local cA = ca:FrameAt(cy % ct)
                local cB =(cw.pos - cA.Position):Dot(cA.RightVector)
                local cC =(ci - cA.Position):Dot(cA.RightVector)
                local cD = cw.radius + 9
                if math.abs(cB - cC) < cD then
                    cA = cB +(cC >= cB and cD or - cD)
                    local cE = math.clamp(cA, - 22, 22) co =
                    if cd then
                        if math.abs(cE - cC) > math.abs(co) then
                            cE
                            else
                            co
                            else
                            cE cd = true
                        end
                    end
                end
            end
            local cx = cu.Position + cu.RightVector * co - ci
            local cy = cq - cr * cq:Dot(cr)
            local cz = cx - cr * cx:Dot(cr) cq = 0 co = - 1
            if cy.Magnitude > 0.01 and cz.Magnitude > 0.01 then
                local cA = cy.Unit
                local cB = cz.Unit
                local cC = math.atan2(cA:Cross(cB):Dot(cr), cA:Dot(cB)) cq =
                if cd then
                    math.clamp(- cC * 2.2, - 1, 1)
                    else
                    if math.abs(cC) > 0.4363323129985824 then
                        math.clamp(- cC * 1.2, - 1, 1)
                        else
                        cq
                        if math.abs(cC) > 1.7453292519943295 then
                            cq = cC > 0 and - 1 or 1 co = cs > 40 and - 0.3 or - 1
                        end
                    end
                    b2.legitSteer =(b2.legitSteer or 0) +(cq -(b2.legitSteer or 0)) * 0.35
                    local cA = b2.legitSteer b2.finishInput = Vector3.new(cA, 0, co)
                    if rawget(b9, 'GetMoveVector') ~= b2.finishMove then
                        function b2.finishMove()
                        return b2.finishInput or Vector3.new(0, 0, - 1)
                    end
                    b9.GetMoveVector = b2.finishMove
                end
                local cB = rawget(b9, 'activeController')
                if type(cB) == 'table' then
                    cB.moveVector = b2.finishInput
                end
                if b7 and type(b7.Jump) == 'function' then
                    for cC, cD in ipairs(b2.jumpProgs or{}) do
                        if(cD - cn) % ct <= 10 and(cs > 40 and(b2.jumpedAt[cD] or 0) < cl - 3) then
                            b2.jumpedAt[cD] = cl pcall(b7.Jump, b7)
                        end
                    end
                end
                b2.status = string.format('Racing (legit)  \194\183  Lap %s  \194\183  Place %s', tostring(g:GetAttribute('RaceLap') or '?'), tostring(g:GetAttribute('RacePlace') or '?'))
            end
            b2.findJumps =
            function() b2.jumpProgs ={} b2.jumpedAt ={}
            local b7 = b2.path
            local b9 = j:FindFirstChild('RaceTrack')
            if b7 then
                if not b9 then
                    return
                end
                else
                return
            end
            for ca, cb in ipairs(b9:GetDescendants()) do
                if cb:IsA('Model') and cb.Name == 'Jump' then
                    local cd, ce, ci = pcall(
                    function()
                    return cb:GetBoundingBox()
                end
                )
                if cd and ce and ci then
                    local cl, cm, cn = b7:Project(ce.Position, 0, b7.Length, b7.Length) % b7.Length,{- 0.5, 0.5}
                    for co, cp in ipairs(cm) do
                        for cq, cr in ipairs({- 0.5, 0.5}) do
                            for cs, ct in ipairs({- 0.5, 0.5}) do
                                cs = ce:PointToWorldSpace(Vector3.new(ci.X * cp, ci.Y * cr, ci.Z * ct)) cq, ct = pcall(b7.Project, b7, cs, cl, 250, 250)
                                if cq and type(ct) == 'number' then
                                    local cu = ct % b7.Length
                                    local cv =(cl - cu) % b7.Length cn =
                                    if cv < 400 then
                                        if cn then
                                        if cv >(cl - cn) % b7.Length then
                                        cu
                                        else
                                        cn
                                        else
                                        cu
                                        else
                                        cn
                                    end
                                end
                            end
                        end
                        b2.jumpProgs[# b2.jumpProgs + 1] =((cn or cl) - 8) % b7.Length
                    end
                end
            end
        end
        b2.findMount =
        function()
        local b7 = b2.mount
        if b7 and(typeof(b7.Drive) == 'Instance' and b7.Drive.Parent) then
            return b7
        end
        b2.mount = nil
        if os.clock() -(b2.lastMountSearch or 0) < 0.5 then
            return nil
        end
        b2.lastMountSearch = os.clock() b7 = nil
        if type(filtergc) == 'function' then
            local b9, ca = pcall(filtergc, 'table',{Keys ={'Holds', 'Drive', 'Align', 'Push', 'Heading', 'TravelDirection'}}, false) b7 =
            if b9 then
                if type(ca) == 'table' then
                    ca
                    else
                    b7
                    else
                    b7
                end
                if b7 then
                    else
                    if type(getgc) == 'function' then
                        local b9, ca = pcall(getgc, true)
                        if b9 and type(ca) == 'table' then
                            local cb ={}
                            for cd, ce in ipairs(ca) do
                                if type(ce) == 'table' and(rawget(ce, 'Holds') ~= nil and(rawget(ce, 'Drive') ~= nil and rawget(ce, 'Align') ~= nil)) then
                                    cb[# cb + 1] = ce
                                end
                            end
                            b7 = cb
                        end
                    end
                end
                if type(b7) ~= 'table' then
                    b2.status = "Your executor can't ride the race (no filtergc/getgc)"
                    return nil
                end
                for b9, ca in ipairs(b7) do
                    if typeof(ca.Drive) == 'Instance' and ca.Drive.Parent then
                        b2.mount = ca
                        break
                    end
                end
                return b2.mount
            end
            b2.hazards =
            function()
            local b7 = os.clock()
            if b2.hazardCache and b7 - b2.hazardAt < 0.2 then
                return b2.hazardCache
            end
            local b9 ={}
            local ca = j:FindFirstChild('RacePowerUpFX')
            for cb, cd in ipairs(ca and ca:GetChildren() or{}) do
                local ce, ci = pcall(
                function()
                return cd:IsA('Model') and cd:GetPivot().Position or cd.Position
            end
            )
            if ce and typeof(ci) == 'Vector3' then
                b9[# b9 + 1] ={pos = ci, radius = 8}
            end
        end
        ca = j:FindFirstChild('RaceTrack')
        local ce = ca and ca:FindFirstChild('Map') and ca.Map:FindFirstChild('Creatures')
        for ci, cl in ipairs(ce and ce:GetChildren() or{}) do
            if cl:IsA('Model') and cl.Name:find('Arm') then
                local cm, cn, co = pcall(
                function()
                return cl:GetBoundingBox()
            end
            )
            if cm and cn then
                local cp = # b9 + 1
                local cq ={pos = cn.Position} cq.radius, b9[cp] = math.min(math.max(co.X, co.Z) / 2, 20), cq
            end
        end
    end
    b2.hazardCache = b9 b2.hazardAt = b7
    return b9
end
b2.step =
function(b7, b9)
local ca = b4()
local ce = b7.Rig and b7.Rig.Root
if ca then
    if b2.path then
        if not ce then
            return
        end
        else
        return
    end
    else
    return
end
if b7:IsHeld() then
    b2.dist = nil
    return
end
local ci = b2.path
local cl = ca.Flags and ca.Flags.TopSpeed and ca.Flags.TopSpeed:Get() or 135
if not b2.dist then
    local cm, cn = pcall(ci.Project, ci, ce.Position, 0, ci.Length, ci.Length) b2.dist = cm and type(cn) == 'number' and cn or 0 b2.speed = math.max(tonumber(b7.Speed) or 0,
    cl * 0.5)
end
if(ci:FrameAt(b2.dist).Position - ce.Position).Magnitude > 45 then
    local cm, cn = pcall(ci.Project, ci, ce.Position, b2.dist, 80, 220)
    if cm and type(cn) == 'number' then
        b2.dist = cn
    end
end
local cm = b2.scale or 1 b2.speed = b2.speed +(cl * cm - b2.speed) * math.min(1, b9 * 1.5) b2.dist = b2.dist + b2.speed * b9
local cn = ci:FrameAt(b2.dist)
local co = ci:FrameAt(b2.dist + 20)
local cp = cn.UpVector
local cq = cn.RightVector
local cr =
if cq.Magnitude < 0.001 then
    cn.LookVector:Cross(cp)
    else
    cq
    local cs, ct = ci:FrameAt(b2.dist + math.clamp(b2.speed * 0.6, 60, 200)).Position + cp * 2.5
    for cu, cv in ipairs(b2.hazards()) do
        ci = cv.pos - cs
        local cw = math.abs(ci:Dot((co.Position - cn.Position).Unit))
        local cx = ci:Dot(cr) ct =
        if cw < cv.radius + 30 then
            if math.abs(cx) < cv.radius + 10 then
                if ct then
                    if math.abs(cx) < math.abs(ct) then
                        cx
                        else
                        ct
                        else
                        cx
                        else
                        ct
                        else
                        ct
                    end
                    local cw =
                    if ct then
                        ct > 0 and - b2.DODGE_STUDS or b2.DODGE_STUDS
                        else
                        0 b2.lateral =(b2.lateral or 0) +(cw -(b2.lateral or 0)) * math.min(1, b9 * 3)
                        local cx = 2.5
                        local cy = g.Character
                        local cz = cy and cy:FindFirstChild('RaceMount')
                        local cA = cz and cz:FindFirstChild('Hitbox') or b7.Rig and b7.Rig.Mount and b7.Rig.Mount:FindFirstChild('Hitbox')
                        local function cB(cC)
                        if not b2.roadParams then
                            local cD = j:FindFirstChild('RaceTrack')
                            local cE = RaycastParams.new() cE.FilterType = Enum.RaycastFilterType.Include cE.FilterDescendantsInstances ={cD and cD:FindFirstChild('Track')} b2.roadParams = cE
                        end
                        local cD = j:Raycast(cC + cp * 60, - cp * 120, b2.roadParams)
                        return cD and cD.Position or nil
                    end
                    local cC = cB(cn.Position + cr * b2.lateral)
                    local cD = cA and(cA.Position - ce.Position):Dot(cp) or 0
                    local cE =(cA and cA.Size.Y / 2 or 2) + 0.3 - cD
                    local cF = cC and cC + cp * cE or cn.Position + cp * cx + cr * b2.lateral
                    local cG = cB(co.Position + cr * b2.lateral)
                    local cH =(cG and cG + cp * cE or co.Position + cp * cx + cr * b2.lateral) - cF
                    local cI = cH.Magnitude > 0.001 and cH.Unit or cn.LookVector ce.AssemblyLinearVelocity = cI * b2.speed +(cF - ce.Position) * 9 ce.AssemblyAngularVelocity = Vector3.new(0,
                    0, 0) b7.Drive.Enabled = false b7.Push.Force = Vector3.new(0, 1, 0) * ce.AssemblyMass * j.Gravity b7.Align.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0),
                    cI, cp) ce.CFrame = CFrame.new(ce.Position) * b7.Align.CFrame b7.Up = cp b7.Heading = cI b7.TravelDirection = cI b7.Speed = b2.speed b7.Grounded = cC ~= nil b7.AirSeconds = 0 b7.Launched = cC == nil
                end
                b2.override =
                function(b7, b9)
                if not pcall(b2.step, b7, b9) then
                    b7.Override = nil b2.dist = nil
                end
            end
            b2.drive =
            function(b7)
            if b2.active then
                return
            end
            b2.active = true b2.dist = nil b2.mount = nil b2.stuns = 0 b2.corrections = 0 b2.scale = 1 b2.startedAt = os.clock() pcall(
            function()
            local b9 = settings().Physics
            if b9.PhysicsEnvironmentalThrottle == Enum.EnviromentalPhysicsThrottle.Always then
                b2.pausedThrottle = b9.PhysicsEnvironmentalThrottle b9.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.DefaultAuto
            end
        end
        )
        local b9 ={} b2.finishing = false b2.released = false b2.legitProg = nil b2.jumpProgs = nil b2.controls = nil b2.boosting, b2.leadTarget = true, b2.LEAD_START b2.leadDone = false b2.rivals = nil b2.rivalsAt = 0 b2.boostStartedAt = nil
        local function ca()
        for ce in pairs(b9) do
            if ce.Parent then
                pcall(
                function() ce.CanCollide = true
            end
            )
        end
    end
    b9 ={}
end
local ce = game:GetService('RunService').Stepped:Connect(
function()
if b2.released then
    return
    elseif
    b2.LEGIT then
        return
    end
    local ce = g.Character
    if not ce then
        return
    end
    for ci, cl in ipairs(ce:GetDescendants()) do
        if cl:IsA('BasePart') and cl.CanCollide then
            b9[cl] = true cl.CanCollide = false
        end
    end
end
)
local ci = j:FindFirstChild(b7.RR.Track or 'RaceTrack')
if b7.Path and(ci and ci:FindFirstChild('AttachmentTrack')) then
    local cl, cm = pcall(b7.Path.new, ci.AttachmentTrack) b2.path = cl and cm or nil
end
task.spawn(
function()
while n() and aB.RaceAuto and b2.inRace() and type(b5(b7, 'FinishPlace', 'RaceFinishPlace')) ~= 'number' do
    pcall(
    function()
    local cl = settings().Physics
    if cl.PhysicsEnvironmentalThrottle == Enum.EnviromentalPhysicsThrottle.Always then
        b2.pausedThrottle = b2.pausedThrottle or cl.PhysicsEnvironmentalThrottle cl.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.DefaultAuto
    end
end
)
local cl = b2.findMount()
if b2.LEGIT then
    if not b2.jumpProgs then
        b2.findJumps()
    end
    pcall(b2.legitStep, cl) task.wait()
    continue
end
if cl and not b2.finishing then
    local cm = tonumber(ci and ci:GetAttribute('RaceLaps')) or 3
    local cn = tonumber(b5(b7, 'Lap', 'RaceLap'))
    local co = ci and ci:FindFirstChild('FinishLine')
    local cp = g.Character and g.Character:FindFirstChild('HumanoidRootPart')
    local cq = b2.path and b2.dist and b2.path.Length - b2.dist % b2.path.Length or 1 / 0
    if cn and(cn >= cm and(co and(co:IsA('BasePart') and(cp and cq < b2.FINISH_RELEASE_STUDS)))) then
        b2.finishing = true
        if b2.RELEASE_AT_FINISH then
            if cl.Override == b2.override then
                cl.Override = nil
            end
            pcall(
            function() cl.Drive.Enabled = true
        end
        ) b2.released = true ca()
    end
end
end
local cm = os.clock()
if not b2.nextPulse then
    b2.nextPulse = cm + 5
end
if cm >= b2.nextPulse then
    b2.pulseUntil = cm + b2.INPUT_PULSE_SECONDS b2.nextPulse = cm + 15 + math.random() * 8
end
local cn = cm <(b2.pulseUntil or 0)
if b2.finishing then
    elseif
    cn then
        elseif
        b2.finishMove then
            b2.releaseControls()
        end
        if b2.finishing or cn then
            local co = ci and ci:FindFirstChild('FinishLine')
            local cp = g.Character and g.Character:FindFirstChild('HumanoidRootPart')
            local cq = b2.findControls()
            if cq and cp and(co or b2.path) then
                local cr = g.Character:FindFirstChild('RaceMount') and g.Character.RaceMount:FindFirstChild('Hitbox') or cp
                local cs = cr.CFrame.LookVector
                local ct = cr.CFrame.UpVector
                local cu =(b2.finishing and co and co.Position or b2.path and b2.dist and b2.path:FrameAt((b2.dist + 40) % b2.path.Length).Position or cp.Position + cs * 40) - cp.Position
                local cw = cs - ct * cs:Dot(ct)
                local cx = cu - ct * cu:Dot(ct)
                local cy = 0
                if cw.Magnitude > 0.01 and cx.Magnitude > 0.01 then
                    local cz = cw.Unit
                    local cA = cx.Unit cy = math.clamp(- math.atan2(cz:Cross(cA):Dot(ct), cz:Dot(cA)) * 2.5, - 1, 1)
                end
                b2.finishInput = Vector3.new(cy, 0, - 1)
                if rawget(cq, 'GetMoveVector') ~= b2.finishMove then
                    function b2.finishMove()
                    return b2.finishInput or Vector3.new(0, 0, - 1)
                end
                cq.GetMoveVector = b2.finishMove
            end
        end
        if b2.finishing and(co and(cp and os.clock() -(b2.lastLineTouch or 0) > 0.25)) then
            b2.lastLineTouch = os.clock() pcall(firetouchinterest, cp, co, 0) task.wait() pcall(firetouchinterest, cp, co, 1)
        end
    end
    if cl and b2.path and not b2.released then
        tonumber(b5(b7, 'Place', 'RacePlace'))
        local co = b7.Flags and b7.Flags.TopSpeed and b7.Flags.TopSpeed:Get() or 135
        local cp = b2.RIDE_SPEED / co
        if b2.scale ~= cp and b2.corrections == 0 then
            b2.scale = cp
        end
        local cq = cl.Override
        if cq ~= nil and cq ~= b2.override then
            cl.Override = nil b2.dist = nil b2.stuns = b2.stuns + 1
            elseif
            cq == nil then
                if not cl:IsHeld() then
                    cl.Override = b2.override
                end
            end
            b2.status = string.format('Racing x%.2f  \194\183  Lap %s  \194\183  Place %s', b2.scale, tostring(b5(b7, 'Lap', 'RaceLap') or '?'), tostring(b5(b7, 'Place',
            'RacePlace') or '?'))
        end
        task.wait()
    end
    ce:Disconnect() b2.releaseControls() b2.finishing = false b2.released = false
    for cl in pairs(b9) do
        if cl.Parent then
            pcall(
            function() cl.CanCollide = true
        end
        )
    end
end
if b2.pausedThrottle then
    local cm = b2.pausedThrottle b2.pausedThrottle = nil pcall(
    function() settings().Physics.PhysicsEnvironmentalThrottle = cm
end
)
end
local cm = b2.mount
if cm and cm.Override == b2.override then
    cm.Override = nil
end
local cn = b5(b7, 'FinishPlace', 'RaceFinishPlace')
local co = b5(b7, 'FinishTime', 'RaceFinishTime')
if type(cn) == 'number' then
    b2.lastResult = string.format('Place #%d in %s', cn, type(co) == 'number' and string.format('%d:%02d', math.floor(co / 60), math.floor(co % 60)) or '?')
end
b2.active = false b2.mount = nil b2.path = nil b2.dist = nil
end
) task.spawn(
function()
local cl = b7.Power and b7.Power.Attributes or{}
while n() and b2.active do
    pcall(
    function()
    local cm = j:GetServerTimeNow()
    local cn = g:GetAttribute(cl.Item or 'RaceItem')
    local co = g:GetAttribute(cl.RollEndsAt or 'RaceRollEndsAt')
    local cp = g:GetAttribute(cl.Effect or 'RaceEffect')
    local cq = g:GetAttribute(cl.EffectEndsAt or 'RaceEffectEndsAt')
    local cr = type(co) == 'number' and cm < co
    local cs = type(cp) == 'string' and type(cq) == 'number' and cm < cq
    local ct = g.Character and g.Character:FindFirstChild('HumanoidRootPart')
    if type(cn) == 'string' then
        if cr then
            elseif
            cs then
                elseif
                ct then
                    b7.Remotes.MountRace.PowerUp:FireServer('Use', ct.Position, ct.CFrame.LookVector) b2.powerUps =(b2.powerUps or 0) + 1 task.wait(1)
                end
            end
        end
        ) task.wait(0.4)
    end
end
)
end
b2.claim =
function(b7)
if os.clock() - b2.lastClaim < 10 then
    return
end
b2.lastClaim = os.clock()
local b9 = b6(b7)
local ca = b9 and b9.RaceRally
if type(ca) ~= 'table' then
    return
end
local ce, ci, cl, cm = type(ca.Milestones) == 'table' and ca.Milestones or{}, tonumber(ca.Wins) or 0, pcall(b7.RR.OrderedMilestones)
for cn, co in ipairs(cl and cm or{}) do
    local cp = co.Config and tonumber(co.Config.Wins)
    if ce[co.Id] then
        elseif
        cp then
            if ci >= cp then
                pcall(
                function() b7.Remotes.RaceRally.AskClaimMilestone:InvokeServer(co.Id)
            end
            )
        end
    end
end
if b7.RR.RepeatId and(b7.RR.Repeat and ci >=(tonumber(b7.RR.Repeat.After) or 1 / 0)) then
    pcall(
    function() b7.Remotes.RaceRally.AskClaimMilestone:InvokeServer(b7.RR.RepeatId)
end
)
end
local cp
local cq = pairs
local cr = type(ca.Racers) == 'table' and ca.Racers or{} b9 = - 1
for cs in cq(cr) do
    local ct = b7.RR.Racers and b7.RR.Racers[cs]
    local cu = ct and tonumber(ct.Order) or 0
    if cu > b9 then
        cp = cs b9 = cu
    end
end
if cp and ca.EquippedRacer ~= cp then
    pcall(
    function() b7.Remotes.RaceRally.AskEquipRacer:InvokeServer(cp)
end
)
end
end
b2.buy =
function(b7)
local b9 = aB.RaceBuyList
if type(b9) ~= 'table' then
    return
    elseif
    # b9 == 0 then
        return
    end
    if os.clock() - b2.lastBuy < 2 then
        return
    end
    local ca = b6(b7)
    local ce = ca and ca.RaceRally
    if type(ce) ~= 'table' then
        return
    end
    local ci, cl = pcall(b7.RR.OrderedOffers)
    for cm, cn in ipairs(ci and cl or{}) do
        local cp = cn.Config and tonumber(cn.Config.Price)
        if table.find(b9, cn.Id) and(cp and cp <=(tonumber(ce.Tokens) or 0)) then
            local cq, cr, cs = tonumber(cn.Config.Limit) or 0, pcall(b7.RR.PurchasedCount, ce, cn.Id)
            if cq == 0 or not cr or(tonumber(cs) or 0) < cq then
                b2.lastBuy = os.clock() pcall(
                function() b7.Remotes.RaceRally.AskBuy:InvokeServer(cn.Id)
            end
            )
            return
        end
    end
end
end
task.spawn(
function()
local b7 = b4() and b2.m.Remotes
local b9 = b7 and b7.Alerts and b7.Alerts.Raise
if b9 then
    local ca
    local function ce(ci)
    if not n() then
        ca:Disconnect()
        return
    end
    if(type(ci) == 'table' and tostring(ci.Text or ci.Body or '') or tostring(ci)):lower():find('already raced', 1, true) then
        b2.racedRound = b2.roundId() or b2.racedRound
    end
end
ca = b9.OnClientEvent:Connect(ce)
end
local ca = b7 and b7.RigSync and b7.RigSync.CorrectionBegan
if ca then
    local ce
    local function ci()
    if not n() then
        ce:Disconnect()
        return
    end
    if b2.active then
        b2.corrections = b2.corrections + 1 b2.scale = math.max(1,(b2.scale or 3) - 0.15) b2.dist = nil
    end
end
ce = ca.OnClientEvent:Connect(ci)
end
while n() do
    pcall(
    function()
    local ce = b4()
    if not ce then
        b2.status = 'Race data not loaded'
        return
    end
    if aB.RaceAuto then
        if type((b5(ce, 'RaceId', 'RaceId'))) == 'string' then
            b2.racedRound = b2.roundId() or b2.racedRound
            local ci = b5(ce, 'FinishPlace', 'RaceFinishPlace')
            if type(ci) == 'number' then
                if b2.leftFor ~= ci and not b2.active then
                    b2.leftFor = ci task.wait(2) ce.Remotes.MountRace.AskLeave:FireServer() b2.status = 'Finished, back to base'
                end
                else
                b2.leftFor = nil b2.drive(ce)
            end
            elseif
            b2.joinLeft() > 0 and b2.racedThisRound() then
                b2.status = 'Already raced this round, waiting for the next one'
                elseif
                b2.joinLeft() > 0 then
                    local ci = aI.blocker('race')
                    local cl = b2.joinLeft() > b2.JOIN_LATE_SECONDS and b2.fieldSettling() or nil
                    if cl then
                        b2.status = cl == 1 / 0 and 'Race open, waiting for the field to reopen' or string.format('Race open, checking new eggs (%ds)', math.ceil(cl))
                        elseif
                        ci then
                            b2.status = 'Yielding to '..tostring(aI.TITLES[ci] or ci)
                            else
                            b2.join(ce)
                        end
                        else
                        b2.status = 'Waiting for the next race'
                    end
                end
                if aB.RaceClaim then
                    b2.claim(ce)
                end
                if aB.RaceBuy then
                    b2.buy(ce)
                end
            end
            ) task.wait(1)
        end
    end
    ) l.__SenaV4RaceRuntime = b2 aI.register('race',{wants =
    function()
    return aB.RaceAuto == true and(b2.inRace() or b2.wantsJoin())
end
, active =
function()
return b2.active == true or b2.inRace()
end
, enabled =
function()
return aB.RaceAuto == true
end
, status =
function()
return tostring(b2.status)
end
})
end
do
    local b2 ={status = 'No star right now', lastResult = 'No star caught yet', session = nil, busy = false, caught = 0}
    local function b3()
    local b4, b5 = pcall(require, e.Shared.Remotes)
    return b4 and b5 and b5.ShootingStar or nil
end
local function b4()
return j:GetServerTimeNow()
end
b2.position =
function(b5)
local b6 = b5.Leg
if type(b6) == 'table' and(typeof(b6.From) == 'Vector3' and typeof(b6.To) == 'Vector3') then
    local b7 =(tonumber(b6.ArriveAt) or 0) -(tonumber(b6.StartAt) or 0)
    local b9 = b7 > 0 and math.clamp((b4() - b6.StartAt) / b7, 0, 1) or 1
    return b6.From:Lerp(b6.To, b9)
end
local b7 = b5.Payload.Landing
return typeof(b7) == 'CFrame' and b7.Position or b7
end
b2.alert =
function(b5)
if not aB.StarAlert then
    return
end
local b6 = math.max(0, math.floor((tonumber(b5.Payload.ExpiresAt) or 0) - b4())) pcall(
function() game:GetService('StarterGui'):SetCore('SendNotification',{Title = 'Shooting Star', Text = string.format('A star is falling! It stays for %d:%02d.',
b6 // 60, b6 % 60), Duration = 8})
end
)
end
b2.begin =
function(b5)
if type(b5) ~= 'table' then
    return
    elseif
    type(b5.Id) ~= 'string' then
        return
    end
    if(tonumber(b5.ExpiresAt) or 0) <= b4() then
        return
    end
    b2.session ={Payload = b5, Leg = b5.Leg, Id = b5.Id} b2.status = 'Star falling' b2.alert(b2.session)
end
b2.finish =
function(b5, b6)
if b2.session and b2.session.Id == b5 then
    b2.session = nil b2.busy = false b2.lastResult = b6 b2.status = 'No star right now'
end
end
b2.catch =
function(b5)
local b6 = b3()
local b7 = g.Character
local b9 = b7 and b7:FindFirstChild('HumanoidRootPart')
local ca = b7 and b7:FindFirstChildOfClass('Humanoid')
if not b6 or not b9 then
    return
    elseif
    not ca then
        return
    end
    local function ce()
    local ci = n()
    return(
    if ci then
        not aB.StarAutoCatch
        else
        not ci) or b2.session ~= b5 or aI.blocker('star') ~= nil
    end
    local function ci(cl)
    local cm = b2.position(b5)
    return cm and(Vector3.new(cm.X, b9.Position.Y, cm.Z) - b9.Position).Magnitude <= cl
end
local function cl(cm)
local cn = b2.position(b5)
if not cn then
    return false
end
if ci(cm) then
    return true
end
aZ(b9, ca, CFrame.new(cn + Vector3.new(0, 3, 0)),
function()
local cp = l.__SenaV4EggRuntime
return ce() or cp ~= nil and cp.resetBlocked == true
end
, false, nil, true)
return ci(cm)
end
b2.status = 'Going to the star' b7 = 0
while true do
    local cm = ce()
    if not(
    if cm then
        not cm
        else
        b7 < 25) then
            break
        end
        cm = l.__SenaV4EggRuntime
        if cm and cm.resetBlocked then
            b2.status = 'Waiting for the field to reopen' task.wait(0.5)
            continue
        end
        b7 += 1
        if cl(8) then
            b2.status = 'Catching the star' b6.Hold:FireServer(b5.Id, true)
            local cn =(tonumber(b5.Payload.HoldSeconds) or 1.6) + 0.15
            local cp = os.clock()
            local cq = false
            while os.clock() - cp < cn and not ce() do
                local cr = l.__SenaV4EggRuntime
                if cr and cr.resetBlocked then
                    cq = true
                    break
                end
                local cs = ci(14)
                if
                if cs then
                    not cs
                    else
                    not cl(8) then
                        cq = true
                        break
                    end
                    task.wait(0.05)
                end
                if ce() then
                    return
                end
                if not cq then
                    b6.Catch:FireServer(b5.Id)
                    local cr = os.clock() + 2
                    while b2.session == b5 and os.clock() < cr do
                        task.wait(0.1)
                    end
                    if b2.session ~= b5 then
                        return
                    end
                end
                pcall(
                function() b6.Hold:FireServer(b5.Id, false)
            end
            )
        end
        task.wait(0.2)
    end
end
local b5 = b3()
if b5 then
    local b6 ={}
    local function b7(b9, ca)
    if b9 then
        table.insert(b6, b9.OnClientEvent:Connect(
        function(...)
        if not n() then
            for ce, ci in ipairs(b6) do
                pcall(ci.Disconnect, ci)
            end
            return
        end
        pcall(ca,...)
    end
    ))
end
end
b7(b5.Fall, b2.begin) b7(b5.Wander,
function(b9, ca)
if b2.session and(b2.session.Id == b9 and type(ca) == 'table') then
    b2.session.Leg = ca
end
end
) b7(b5.Slipped,
function(b9)
if b2.session and b2.session.Id == b9 then
    b2.status = 'Star slipped away, trying again'
end
end
) b7(b5.Claimed,
function(b9, ca)
if b2.session and b2.session.Id == b9 then
    b2.caught = b2.caught + 1 b2.finish(b9, string.format('Caught a star (+%s)', tostring(ca or 1)))
end
end
) b7(b5.Expired,
function(b9) b2.finish(b9, 'Star went home before it was caught')
end
) task.spawn(
function()
local b9, ca = pcall(
function()
return b5.AskState:InvokeServer()
end
)
if b9 and(type(ca) == 'table' and b2.session == nil) then
    b2.begin(ca)
end
end
)
end
task.spawn(
function()
while n() do
    local b6 = b2.session
    if b6 and(tonumber(b6.Payload.ExpiresAt) or 0) <= b4() then
        b2.finish(b6.Id, 'Star went home before it was caught')
        elseif
        b6 and aB.StarAutoCatch and not b2.busy and b4() >=(tonumber(b6.Payload.LandAt) or 0) then
            local b7 = aI.blocker('star')
            if b7 then
                b2.status = 'Yielding to '..tostring(aI.TITLES[b7] or b7)
                else
                b2.busy = true pcall(b2.catch, b6) b2.busy = false
                if b2.session == b6 then
                    b2.status = 'Star still out, retrying'
                end
            end
            elseif
            b6 then
                if b4() <(tonumber(b6.Payload.LandAt) or 0) then
                    b2.status = string.format('Star lands in %ds', math.ceil((tonumber(b6.Payload.LandAt) or 0) - b4()))
                end
            end
            task.wait(0.5)
        end
    end
    ) l.__SenaV4StarRuntime = b2 aI.register('star',{wants =
    function()
    local b6 = b2.session
    return aB.StarAutoCatch == true and b6 ~= nil and b4() >=(tonumber(b6.Payload.LandAt) or 0)
end
, active =
function()
return b2.busy == true
end
, enabled =
function()
return aB.StarAutoCatch == true
end
, status =
function()
return tostring(b2.status)
end
})
end
do
    local b2 ={status = 'Idle', active = false, wantsCharacter = false, lastSwing = 0, retryAt ={}, cards ={}, snap ={}}
    local b3 ={'Green', 'Blue', 'Purple', 'Golden'}
    local b4 ={Green = 1, Blue = 2, Purple = 3, Golden = 4}
    local b5 = 5
    local b6 = 6
    local function b7(b9,...)
    local ca ={...}
    local ce = b9
    for ci, cl in ipairs(ca) do
        if not ce then
            return nil
        end
        ce = ce:FindFirstChild(cl)
    end
    return ce
end
local b9
local function ca()
local ce ={}
if b9 then
    return b9
end
local function ci(cl)
if not cl then
    return nil
end
local cm, cn = pcall(require, cl)
return cm and cn or nil
end
ce[1] ={} ce[1].Remotes = ci(b7(e, 'Shared', 'Remotes')) ce[1].Save = ci(b7(e, 'Shared', 'Save')) ce[1].Catalog = ci(b7(e, 'Shared', 'Modules', 'ButterflyCatalog')) ce[1].Flags = ci(b7(e,
'Shared', 'Flags', 'ButterflyFlags')) ce[1].Quests = ci(b7(e, 'Data', 'WispQuests')) ce[1].Progress = ci(b7(e, 'Shared', 'Modules', 'WispProgression')) ce[1].Swarm = ci(b7(e,
'Controllers', 'Game', 'AdminAbuseClientController', 'Events', 'ButterflyBloom', 'Swarm'))
local cl = ce[1]
if cl.Remotes then
    if cl.Save then
        if not cl.Catalog then
            return nil
        end
        else
        return nil
    end
    else
    return nil
end
b9 = cl
return cl
end
local function ce(ci, cl)
local cm = ca()
local cn = cm and cm.Flags and cm.Flags[ci]
if not cn then
    return cl
end
cm, ci = pcall(
function()
return cn:Get()
end
)
if cm then
    if ci == nil then
        return cl
    end
    else
    return cl
end
return ci
end
local function ci(cl, cm,...)
local cn = ca()
local cp = cn and cn.Remotes[cl] and cn.Remotes[cl][cm]
if not cp then
    return false, cl..'.'..cm..' missing'
end
local cq = table.pack(pcall(cp.InvokeServer, cp,...))
if not cq[1] then
    return false, tostring(cq[2])
end
return cq[2] == true, type(cq[3]) == 'string' and cq[3] or nil, cq[2]
end
local function cl(cm)
return(b2.retryAt[cm] or 0) <= os.clock()
end
local function cm(cn) b2.retryAt[cn] = os.clock() + b5
end
local function cn()
local cp = g.Character
return cp and cp:FindFirstChild('HumanoidRootPart') or nil
end
b2.bloomLeft =
function()
local cp = ca()
local cq = workspace:GetAttribute(cp and cp.Catalog.EndsAtAttribute or 'ButterflyBloomEndsAt')
if typeof(cq) ~= 'number' then
    return 0
end
return math.max(0, cq - workspace:GetServerTimeNow())
end
b2.nextBloom =
function()
local cp = tonumber(ce('IntervalSeconds', 1800)) or 1800
local cq = tonumber(ce('OffsetSeconds', 900)) or 900
local cr = tonumber(ce('DurationSeconds', 300)) or 300
if cp <= 0 then
    return nil
end
local cs = workspace:GetServerTimeNow()
local ct = ca()
local cu = workspace:GetAttribute(ct and ct.Catalog.EndsAtAttribute or 'ButterflyBloomEndsAt')
local cw = typeof(cu) == 'number' and cu - cr or math.floor((cs - cq) / cp) * cp + cq
local cx = 0
while cw <= cs and cx < 64 do
    cw, cx = cw + cp, cx + 1
end
return cw > cs and cw - cs or nil
end
local function cp(cq)
if not cq then
    return nil
end
for cr, cs in ipairs(cq:GetChildren()) do
    if cs:IsA('Tool') and cs:GetAttribute('ButterflyNet') == true then
        return cs
    end
end
return nil
end
local cq b2.tiers =
function()
if cq then
    return cq
end
local cr = ca()
if not cr then
    return nil
end
local cs ={}
for ct, cu in ipairs(b3) do
    local cw = cr.Catalog.Tiers and cr.Catalog.Tiers[cu] cs[cu] ={name =(cw and tostring(cw.DisplayName) or cu):gsub('%s*Butterfly$', ''), color = cw and typeof(cw.Color) == 'Color3' and cw.Color or Color3.new(1,
    1, 1), icon = cw and cw.Icon and tostring(cw.Icon) or nil, rarity = cw and cw.Rarity and tostring(cw.Rarity) or nil, trade = ct < 4 and(tonumber(ce(('%sTo%sCost'):format(cu,
    b3[ct + 1]), 0)) or 0) or 0, essence = tonumber(ce('Essence'..cu, 0)) or 0}
end
cq = cs
return cs
end
b2.snapshot =
function()
local cr = ca()
local cs = b2.snap
if not cr then
    return cs
end
cs.left = b2.bloomLeft() cs.active = cs.left > 0 cs.enabled = ce('Enabled', true) ~= false
local ct = cs.active cs.nextIn =(
if ct then
    not ct
    else
    b2.nextBloom()) or nil
    local cu, cw = pcall(cr.Save.Peek)
    local cx = cu and cw or nil
    local cy = cx and cx.Butterflies cs.net = type(cy) == 'table' and cy.NetClaimed == true cs.holding = cp(g.Character) ~= nil cs.inBag = cp(g:FindFirstChildOfClass('Backpack')) ~= nil cs.counts = cs.counts or{}
    for cz, cA in ipairs(b3) do
        cs.counts[cA] = type(cy) == 'table' and cy.Counts and tonumber(cy.Counts[cA]) or 0
    end
    cs.essence = type(cy) == 'table' and tonumber(cy.Essence) or 0 cs.caught = type(cy) == 'table' and tonumber(cy.TotalCaught) or 0 cs.treeUnlocked = g:GetAttribute('EnchantedTreeUnlocked') == true
    local cB = cx and cx.WispCompanion cs.accepted = type(cB) == 'table' and cB.Accepted == true cs.unlocked = type(cB) == 'table' and cB.Unlocked == true cs.returning = type(cB) == 'table' and cB.Returning == true cs.stage = type(cB) == 'table' and tonumber(cB.Stage) or 1 cs.stages = cr.Quests and tonumber(cr.Quests.StageCount) or 4
    local cC =(cr.Quests and cr.Quests.List or{})[cs.stage] cs.questId = cC and tostring(cC.Id) or nil cs.quest = cC and tostring(cC.Title) or '-' cs.target = cC and tonumber(cC.Target) or 0 cs.progress = cC and type(cB) == 'table' and cB.Progress and tonumber(cB.Progress[cC.Id]) or 0 cs.claimable = false cs.readyReturn = false
    if cr.Progress and type(cB) == 'table' then
        local cD, cE = pcall(cr.Progress.HasClaimable, cB) cs.claimable = cD and cE == true cE, cD = pcall(cr.Progress.IsReady, cB) cs.readyReturn = cE and cD == true
    end
    cs.speed = cx and tonumber(cx.SpeedPower) or 0
    local cD = cx and cx.BanjoCricket cs.banjoSolved = type(cD) == 'table' and cD.Solved == true cs.banjoClaimed = type(cD) == 'table' and cD.Claimed == true cs.need = cr.Quests and tonumber(cr.Quests.RequiredSpeedPower) or 0
    return cs
end
b2.smartNext =
function(cr)
local cs = b2.tiers()
if cs then
    if not cr then
        return nil
    end
    else
    return nil
end
for ct = 3, 1, - 1 do
    local cu = b3[ct]
    local cw = b3[ct + 1]
    local cx = cs[cu].trade
    if cx > 0 and((cr[cw] or 0) < cs[cw].essence and(cr[cu] or 0) - cs[cu].essence >= cx) then
        return cu
    end
end
return nil
end
b2.canTrade =
function()
local cr = b2.snap
local cs = b2.tiers()
if cs then
    if not cr.counts then
        return false
    end
    else
    return false
end
local ct = aB.ButterflyTradeRecipe
if ct == 'Smart' then
    return b2.smartNext(cr.counts) ~= nil
end
for cu = 1, 3, 1 do
    local cw = b3[cu]
    if(ct == nil or ct == 'All' or ct == cw) and(cs[cw].trade > 0 and(cr.counts[cw] or 0) >= cs[cw].trade) then
        return true
    end
end
return false
end
b2.canCraft =
function()
local cr = b2.snap
local cs = b2.tiers()
if cs then
    if not cr.counts then
        return false
    end
    else
    return false
end
for ct, cu in ipairs(b3) do
    if cs[cu].essence > 0 and(cr.counts[cu] or 0) < cs[cu].essence then
        return false, cu
    end
end
return true
end
local function cr()
local cs = aB.ButterflyTiers
if type(cs) ~= 'table' then
    return nil
    elseif
    # cs == 0 then
        return nil
    end
    local ct ={}
    for cu, cw in ipairs(cs) do
        ct[tostring(cw)] = true
    end
    return ct
end
local function cs()
local ct = workspace:FindFirstChild('ButterflyBloomSwarm')
if not ct then
    return{}
end
local cu ={}
for cw, cx in ipairs(ct:GetChildren()) do
    if b4[cx.Name] and cx:IsA('Model') then
        local cy = cx.PrimaryPart and cx.PrimaryPart.Position or cx:GetPivot().Position cu[# cu + 1] ={pos = cy, tier = cx.Name}
    end
end
return cu
end
local function ct()
local cu = g.Character
local cw = cu and cu:FindFirstChildOfClass('Humanoid')
local cx = cp(g:FindFirstChildOfClass('Backpack'))
if not(cw and cx) then
    return false
end
pcall(
function() cw:EquipTool(cx)
end
)
return cp(cu) ~= nil
end
local cu ={part = nil, y = 0}
local function cw()
if cu.part then
    pcall(
    function() cu.part:Destroy()
end
)
end
cu.part = nil
end
local function cx()
local cy = cn()
if not cy then
    return
end
if not(cu.part and cu.part.Parent) then
    local cz = Instance.new('Part') cz.Name = 'SenaBloomPad' cz.Anchored = true cz.CanCollide = true cz.CanTouch = false cz.CastShadow = false cz.Transparency = 1 cz.Size = Vector3.new(24,
    1, 24) cu.y = cy.Position.Y - 3.5 cz.CFrame = CFrame.new(cy.Position.X, cu.y, cy.Position.Z) cz.Parent = workspace cu.part = cz
end
local cz = RaycastParams.new() cz.FilterType = Enum.RaycastFilterType.Exclude cz.FilterDescendantsInstances ={g.Character, cu.part}
local cB = workspace:Raycast(cy.Position + Vector3.new(0, 4, 0), Vector3.new(0, - 80, 0), cz)
if not cB then
    return
end
cu.y = cu.y + math.clamp(cB.Position.Y - 0.5 + b6 - cu.y, - 2, 2) cu.part.CFrame = CFrame.new(cy.Position.X, cu.y, cy.Position.Z)
end
local function cy(cz, cB)
local cC = g.Character
local cD = cC and cC:FindFirstChild('HumanoidRootPart')
local cE = cC and cC:FindFirstChildOfClass('Humanoid')
if cD then
    if not cE then
        return false
    end
    else
    return false
end
cw()
local cF = os.clock() +(cB or 30)
local function cG()
if n() then
    if os.clock() > cF then
        return true
    end
    else
    return true
end
return aI.blocker('butterfly') ~= nil
end
if bP and(cD.Position.Y < 16000 and(cz.Y < 16000 and(cD.Position - cz).Magnitude > 600)) then
    if bP:_isInSafeArea(cD) then
        else
        local cH = bP:_resolveSafeCFrame(cD)
        if cH and(cH.Position - cz).Magnitude > 40 then
            local cI = b2.status b2.status = 'Heading to the safe zone first' pcall(aZ, cD, cE, cH, cG) b2.status = cI
            local cJ = cn()
            if cJ then
                if cG() then
                    return false
                    elseif
                    not bP:_isInSafeArea(cJ) then
                        return false
                    end
                    else
                    return false
                end
                cD = cJ
            end
        end
    end
    pcall(aZ, cD, cE, CFrame.new(cz) * cD.CFrame.Rotation, cG)
    local cH = cn()
    return cH ~= nil and(cH.Position - cz).Magnitude <= 12
end
local function cz()
if g:GetAttribute('InEnchantedTree') == true then
    return true
end
local cB = cn()
return cB ~= nil and cB.Position.Y > 16000
end
local function cB(cC)
if cC and cC:IsA('ProximityPrompt') then
    if not cC.Enabled then
        return false
    end
    else
    return false
end
local cD = tonumber(cC.HoldDuration) or 0 pcall(
function() cC:InputHoldBegin() task.wait(cD > 0 and cD + 0.15 or 0.05) cC:InputHoldEnd()
end
)
if typeof(fireproximityprompt) == 'function' then
    pcall(fireproximityprompt, cC, cD > 0 and cD + 0.15 or 0)
end
return true
end
local cC
local function cD()
if cz() then
    return nil
end
if g:GetAttribute('EnchantedTreeUnlocked') ~= true then
    return 'Enchanted Tree is locked (finish the Wisp Event)'
end
if not(cC and cC.Parent) then
    local cE = b7(workspace, 'World', 'Build', 'EnchantedTreeInterior', 'Markers', 'EnterTrigger') cC = cE and cE:FindFirstChild('EnchantedTreePrompt', true) or nil
end
local cE = cC and cC.Parent
local cF = cE and(cE:IsA('Attachment') and cE.WorldPosition or cE:IsA('BasePart') and cE.Position)
if not cF then
    return 'tree entrance not found'
end
if aH() then
    return 'night - the forest is sealed'
end
b2.status = 'Flying to the Enchanted Tree'
if not cy(cF + Vector3.new(0, 3, 0), 60) then
    return 'could not reach the tree entrance'
end
b2.status = 'Entering the tree' cB(cC)
local cG = os.clock() + 8
while os.clock() < cG and not cz() do
    task.wait(0.05)
end
if cz() then
    return nil
end
return 'entering the tree failed'
end
local function cE()
if not cz() then
    return true
end
local cF = b7(workspace, 'World', 'Build', 'EnchantedTreeInterior', 'Markers', 'ExitTrigger')
if cF then
    if not(typeof(firetouchinterest) == 'function') then
        return false
    end
    else
    return false
end
b2.status = 'Leaving the tree'
local cG = os.clock() + 6
while os.clock() < cG and cz() do
    local cH = cn()
    if cH then
        pcall(firetouchinterest, cH, cF, 0) pcall(firetouchinterest, cH, cF, 1)
    end
    task.wait(0.3)
end
return not cz()
end
local function cF(cG)
local cH = b7(workspace, 'World', 'Machines', 'ButterflyStation', cG, 'Anchor')
return cH and cH:IsA('BasePart') and cH.Position or nil, cH
end
local function cG(cH)
local cI = cF(cH)
if not cI then
    return false, cH..' not found'
end
local cJ = cn()
if cJ and(cJ.Position - cI).Magnitude <= 10 then
    return true
end
local cK = cD()
if cK then
    return false, cK
end
b2.status = 'Walking to the '..cH
if not cy(cI + Vector3.new(0, 3, 0), 15) then
    return false, 'could not reach the '..cH
end
return true
end
local function cH()
local cI = b7(workspace, 'World', 'Areas', 'ButterflyBloom', 'Bounds')
return cI and cI:IsA('BasePart') and cI or nil
end
local function cI()
local cJ = cH()
local cK = cn()
if cJ then
    if cK then
        if cz() then
            return false
        end
        else
        return false
    end
    else
    return false
end
local cL = cJ.CFrame:PointToObjectSpace(cK.Position)
return math.abs(cL.X) <= cJ.Size.X / 2 + 20 and math.abs(cL.Z) <= cJ.Size.Z / 2 + 20
end
local function cJ()
local cK = cH()
return cK and cK.Position + Vector3.new(0, 4, 0) or nil
end
local function cK()
local cL = l.__SenaV4TreadmillManager
if cL then
    if not(cL.activeTreadmill ~= nil) then
        return
    end
    else
    return
end
b2.status = 'Leaving the treadmill'
local cM = os.clock() + 5
while cL.activeTreadmill ~= nil and os.clock() < cM do
    cL:_requestUnequip() task.wait(0.3)
end
local cN = cn()
if cN and cN.Anchored then
    pcall(
    function() cN.Anchored = false
end
)
end
end
local function cL()
local cM = l.__SenaV4TreadmillManager
if cM and not cM.destroyed then
    if not cM.config.idleFarm then
        return false
    end
    else
    return false
end
if not cM.busy and not cM.idleRunning then
    task.defer(
    function() cM:_startIdle()
end
)
end
return true
end
local function cM() cw()
if cz() then
    cE()
end
if cL() then
    return
end
local cN = cn()
if cN then
    if bP then
        if bP:_isInSafeArea(cN) then
            return
        end
        else
        return
    end
    else
    return
end
local cO = bP:_resolveSafeCFrame(cN)
if cO then
    b2.status = 'Back to the safe zone' cy(cO.Position, 60)
end
end
b2.claimNet =
function()
local cN, cO = cG('NetStand')
if not cN then
    return false, cO
end
b2.status = 'Claiming the net' cN, cO = cF('NetStand')
local cP = cO and cO:FindFirstChildWhichIsA('ProximityPrompt', true)
if cP and cP.Enabled then
    cB(cP)
    local cQ = os.clock() + 2
    while os.clock() < cQ do
        if b2.snapshot().net then
            return true
        end
        task.wait(0.1)
    end
end
cP, cO = ci('Butterflies', 'AskClaimNet')
return cP, cO
end
b2.tradeUp =
function() b2.snapshot()
if not b2.canTrade() then
    return false, 'nothing to trade up'
end
local cN, cO = cG('ButterflyMachine')
if not cN then
    return false, cO
end
local cP, cQ, cR, cS = b2.tiers(), aB.ButterflyTradeRecipe, 0
if cQ == 'Smart' then
    local cT = table.clone(b2.snap.counts) cS = cR
    while cS < 50 do
        local cU = b2.smartNext(cT)
        if not cU then
            break
        end
        b2.status = 'Trading up '..cP[cU].name..' for the essence'
        local cV, cW = ci('Butterflies', 'AskTradeUp', cU)
        if not cV then
            if cS == 0 then
                return false, cW or 'the machine refused'
            end
            break
        end
        cS += 1 cT[cU] =(cT[cU] or 0) - cP[cU].trade
        local cX = b3[b4[cU] + 1] cT[cX] =(cT[cX] or 0) + 1 task.wait(0.12)
    end
    return true, cS
end
cS = cR
for cT = 3, 1, - 1 do
    local cU = b3[cT]
    if cQ == nil or cQ == 'All' or cQ == cU then
        cR = b2.snap.counts[cU] or 0
        local cV = cP[cU].trade
        while cV > 0 and cR >= cV do
            b2.status = 'Trading up '..cP[cU].name
            local cW, cX = ci('Butterflies', 'AskTradeUp', cU)
            if not cW then
                if cS == 0 then
                    return false, cX or 'the machine refused'
                end
                break
            end
            cS += 1 cR -= cV task.wait(0.12)
        end
    end
end
return true, cS
end
b2.craft =
function() b2.snapshot()
local cN, cO = b2.canCraft()
if not cN then
    local cP = b2.tiers()
    return false, 'need more '..tostring(cP and cP[cO] and cP[cO].name or cO)
end
cO, cN = cG('MutationShrine')
if not cO then
    return false, cN
end
cO = 0
while cO < 10 and b2.canCraft() do
    b2.status = 'Crafting Enchanted Essence'
    local cP, cQ = ci('Butterflies', 'AskCraftEssence')
    if not cP then
        if cO == 0 then
            return false, cQ or 'the shrine refused'
        end
        return true, cO
    end
    cO += 1 task.wait(0.2) b2.snapshot()
end
return true, cO
end
b2.acceptWisp =
function()
local cN = b7(workspace, 'World', 'Build', 'EnchantedForestZone', 'WispSpawn')
if cN then
    if not cN:IsA('BasePart') then
        return false, 'Baby Wisp spot not found'
    end
    else
    return false, 'Baby Wisp spot not found'
end
if aH() then
    return false, 'night - the forest is sealed'
end
b2.status = 'Flying to the Baby Wisp'
if not cy(cN.Position + Vector3.new(0, 3, 6), 60) then
    return false, 'could not reach the Baby Wisp'
end
task.wait(0.3)
local cO, cP = ci('WispCompanion', 'Request', 'Accept')
if cO then
    pcall(ci, 'WispCompanion', 'Request', 'Open')
end
return cO, cP
end
b2.forestCategories =
function()
if b2.forestCats then
    return b2.forestCats
end
local cN ={} pcall(
function()
local cO = require(e.Data.Areas).Directory['Enchanted Forest']
for cP, cQ in ipairs(cO and cO.DropTable or{}) do
    if type(cQ) == 'table' and type(cQ[1]) == 'string' then
        cN[cQ[1]] = true
    end
end
end
)
if next(cN) then
    b2.forestCats = cN
end
return cN
end
b2.forestStock =
function()
local cN = ca()
local cO, cP = pcall(
function()
return cN.Save.Peek()
end
)
local cQ = cO and cP or nil
local cR = b2.forestCategories()
local cS ={eggs = 0, pets = 0, group = nil, best = 0}
if not cQ then
    return cS
end
for cT, cU in pairs(cQ.EggInventory or{}) do
    if type(cU) == 'table' and(cR[cU.AssetCategory] and cU.Placement == nil) then
        cS.eggs = cS.eggs + 1
    end
end
local cV, cW = pcall(require, e.Shared.Util.AssetItems)
local cX ={}
for cY, cZ in ipairs(cQ.EquippedAssets or{}) do
    cX[cZ] = true
end
local c_ ={}
for c0, c1 in pairs(cQ.Inventory or{}) do
    local c2
    if cV then
        if cW then
            if type(cW.Decode) == 'function' then
                local c3, c4 = pcall(cW.Decode, c1) c2 =
                if c3 then
                    if type(c4) == 'table' then
                        c4
                        else
                        c1
                        else
                        c1
                        else
                        c2 = c1
                    end
                    else
                    c2 = c1
                end
                else
                c2 = c1
            end
            if type(c2) == 'table' and cR[c2.Category] then
                cS.pets = cS.pets + 1
                if not cX[c0] and(not c2.InFuse and not c2.IsFavorite) then
                    local c3 = c_[c2.Category] or{} c_[c2.Category] = c3 c3[# c3 + 1] = c0
                    if # c3 > cS.best then
                        cS.best = # c3
                    end
                    if # c3 >= 3 and not cS.group then
                        cS.group ={c3[1], c3[2], c3[3]}
                    end
                end
            end
        end
        return cS
    end
    b2.fuseForest =
    function(cN)
    local cO = ca()
    local cP, cQ = pcall(cO.Save.Peek)
    if cP and(cQ and cQ.FusionLocked) then
        return false, 'the Fusery is busy'
    end
    local cR = cO.Remotes and cO.Remotes.Fusery
    if not cR then
        return false, 'Fusery missing'
    end
    pcall(
    function() cR.ConfirmBriefing:InvokeServer()
end
)
for cS, cV in ipairs(cN) do
    cQ, cP = pcall(
    function()
    return cR.LoadPet:InvokeServer(cV)
end
)
if cQ then
    if not cP then
        return false, 'could not load a pet into the Fusery'
    end
    else
    return false, 'could not load a pet into the Fusery'
end
task.wait(0.02)
end
cO, cN = pcall(
function()
return cR.BeginFuse:InvokeServer()
end
)
if cO then
    if not cN then
        return false, 'could not start the fuse'
    end
    else
    return false, 'could not start the fuse'
end
task.wait(0.06) pcall(
function() cR.FinishReveal:InvokeServer()
end
)
return true
end
b2.questDrive =
function(cN)
local cO, cP, cQ = l.__SenaV4EggRuntime
local cR = aB.WispAutoQuest and cN.accepted and not cN.unlocked and not cN.claimable and not cN.readyReturn and(cN.progress or 0) <(cN.target or 0)
if aB.WispAutoQuest and not cN.accepted and not cN.unlocked and(cN.speed or 0) <(cN.need or 0) then
    cQ =('Wisp needs %gB SpeedPower'):format(math.floor((cN.need or 0) / 100000000) / 10)
    else
    if cR and cN.questId == 'forest_eggs' then
        cP ={area = 'Enchanted Forest'} cQ =('Hunting Enchanted Forest eggs  \194\183  %d / %d'):format(cN.progress or 0, cN.target or 0)
        else
        if cR and cN.questId == 'eternal_egg' then
            cP ={rarity = 'Eternal'} cQ = 'Hunting any Eternal egg'
            else
            if cR and cN.questId == 'forest_fusion' then
                local cS = b2.forestStock()
                local cV
                if cS.group then
                    local cW = 'Fusing 3 Enchanted Forest pets'
                    if cl('fuse') then
                        local cX, cY = b2.fuseForest(cS.group) cQ = cX and 'Fused an Enchanted Forest animal' or 'Fuse: '..tostring(cY) cm('fuse')
                        else
                        cQ = cW
                    end
                    else
                    cP, cV =
                    if cS.eggs < 3 then
                        {area = 'Enchanted Forest'}
                        else
                        cP,('Need 3 of one Enchanted Forest pet (best %d)%s'):format(cS.best, aB.AutoPlace and aB.AutoHatch and '' or '  \194\183  turn on Auto Place + Auto Hatch') cQ = cV
                    end
                end
            end
        end
    end
    if cO and cO.setWispObjective then
        cO:setWispObjective(cP)
    end
    b2.questNote = cQ
end
b2.promptPoint =
function(cN)
local cO = cN and cN.Parent
if not cO then
    return nil
end
if cO:IsA('Attachment') then
    return cO.WorldPosition
end
if cO:IsA('BasePart') then
    return cO.Position
end
if cO:IsA('Model') then
    return cO:GetPivot().Position
end
return nil
end
b2.banjoPrompt =
function(cN)
local cO = b7(workspace, 'World', 'Build', 'EnchantedTreeInterior', 'Banjo Secret Room')
if not cO then
    return nil
end
for cP, cQ in ipairs(cO:GetDescendants()) do
    if cQ:IsA('ProximityPrompt') then
        local cR = cQ:FindFirstAncestorWhichIsA('Model')
        if cQ.Name == cN then
            return cQ
            elseif
            cR then
                if cR.Name == cN then
                    return cQ
                end
            end
        end
    end
    return nil
end
b2.firePrompt =
function(cN)
local cO = b2.promptPoint(cN)
if not cO then
    return false
end
local cP = cn()
if cP and(cP.Position - cO).Magnitude > math.max((tonumber(cN.MaxActivationDistance) or 10) - 2, 4) then
    cy(cO + Vector3.new(0, 2, 3), 20)
end
local cQ = cN.Enabled cN.Enabled = true cB(cN)
if not cQ then
    pcall(
    function() cN.Enabled = false
end
)
end
return true
end
b2.solveBanjo =
function()
local cN = ca()
local cO = cN.Remotes and cN.Remotes.BanjoCricket
if cO then
    if cO.Effect then
        if not cO.Aim then
            return false, 'Banjo remotes missing'
        end
        else
        return false, 'Banjo remotes missing'
    end
    else
    return false, 'Banjo remotes missing'
end
local cP = b2.banjoPrompt('BanjoCricketTalk') or b2.banjoPrompt('BanjoCricket')
if not cP then
    return false, 'Banjo Cricket not found'
end
local cQ = 0.45
local cR = 0.2 pcall(
function()
local cS = require(e.Data.BanjoCricket).Timing cQ = tonumber(cS.Note) or cQ cR = tonumber(cS.NoteGap) or cR
end
)
local cS ={notes = nil, cleared = 0, solved = false}
local cV = cO.Effect
local function cW(cX)
if type(cX) ~= 'table' then
    return
end
if cX.Kind == 'Playback' and type(cX.Notes) == 'table' then
    cS.notes = cX.Notes
    elseif
    cX.Kind == 'StageComplete' then
        cS.cleared = tonumber(cX.Cleared) or cS.cleared + 1
        elseif
        cX.Kind == 'Solved' then
            cS.solved = true
            elseif
            cX.Kind == 'Wrong' then
                cS.cleared = 0
                elseif
                cX.Kind == 'Reset' then
                    cS.cleared = 0
                end
            end
            local cX = cV.OnClientEvent:Connect(cW) b2.status = 'Talking to the Banjo Cricket' b2.firePrompt(cP)
            local cY = os.clock() + 150 cV = os.clock()
            while n() and aB.BanjoAuto and os.clock() < cY and not cS.solved do
                if b2.manual then
                    break
                    elseif
                    aI.blocker('butterfly') ~= nil then
                        break
                    end
                    if b2.snapshot().banjoSolved then
                        cS.solved = true
                        break
                    end
                    local c_ = cS.notes
                    if c_ then
                        cS.notes = nil b2.status =('Banjo Cricket  \194\183  stage %d  \194\183  %d notes'):format(cS.cleared + 1, # c_) task.wait(# c_ *(cQ + cR) + 0.3)
                        for c0, c1 in ipairs(c_) do
                            if cS.notes then
                                break
                            end
                            if not b2.hitMushroom(c1, cO) then
                                cS.err = 'equip a bat first (the mushrooms only take bat hits)'
                                break
                            end
                        end
                        if cS.err then
                            break
                        end
                        cV = os.clock()
                        else
                        if os.clock() - cV > 8 then
                            b2.firePrompt(cP) cV = os.clock()
                        end
                    end
                    task.wait(0.1)
                end
                cX:Disconnect()
                return cS.solved, cS.solved and nil or(cS.err or 'the cricket stopped playing')
            end
            b2.hitMushroom =
            function(cN, cO)
            local cP = cn()
            local cQ = g.Character
            local cR = cQ and cQ:FindFirstChildOfClass('Humanoid')
            if cP then
                if not cR then
                    return false
                end
                else
                return false
            end
            local cS, cV, cW = Vector3.new(0, 0, 0), 0
            for cX, cY in ipairs(game:GetService('CollectionService'):GetTagged('BanjoCricketMushroom')) do
                local c_ = cY:IsA('Model') and cY:IsDescendantOf(workspace) and cY:GetAttribute('MushroomIndex') cQ = typeof(c_) == 'number' and(cY:FindFirstChild('Hitbox') or cY.PrimaryPart)
                if cQ and cQ:IsA('BasePart') then
                    cS, cV, cW = cS + cQ.Position, cV + 1,
                    if c_ == cN then
                        cQ
                        else
                        cW
                    end
                end
                if not cW then
                    return false
                end
                local c_ = l.__SenaV4GodMode
                local c0 = c_ and c_:_equipBat()
                if not c0 then
                    return false
                end
                cQ =(cS / cV - cW.Position) * Vector3.new(1, 0, 1)
                local c1 =
                if cQ.Magnitude < 0.5 then
                    Vector3.new(0, 0, 1)
                    else
                    cQ
                    local c2 = cW.Position + c1.Unit * 7
                    local c3 = Vector3.new(c2.X, cP.Position.Y, c2.Z)
                    local c4 = Vector3.new(cW.Position.X, c3.Y, cW.Position.Z)
                    if(cP.Position - c3).Magnitude > 3 then
                        pcall(aZ, cP, cR, CFrame.lookAt(c3, c4),
                        function()
                        return not n()
                    end
                    ) cP = cn()
                    if not cP then
                        return false
                    end
                end
                cP.CFrame = CFrame.lookAt(cP.Position, Vector3.new(c4.X, cP.Position.Y, c4.Z)) task.wait(0.08) pcall(cO.Aim.FireServer, cO.Aim, cN)
                local c5 = os.clock() + 1.5
                while os.clock() < c5 do
                    local c6 = c0:GetAttribute('CooldownEndTime')
                    if not(c0:GetAttribute('CooldownActive') == true and typeof(c6) == 'number' and workspace:GetServerTimeNow() < c6) and os.clock() -(b2.lastMushroomHit or 0) >= 0.75 then
                        break
                    end
                    task.wait(0.05)
                end
                b2.lastMushroomHit = os.clock() pcall(
                function() c0:Activate()
            end
            ) task.wait(0.15)
            return true
        end
        b2.claimBanjo =
        function()
        local cN = b2.banjoPrompt('Jitterbug')
        if cN then
            b2.status = 'Talking to Jitterbug' b2.firePrompt(cN) task.wait(0.6)
        end
        local cO, cP = ci('BanjoCricket', 'AskClaim') task.wait(0.4)
        return cO or b2.snapshot().banjoClaimed, cP
    end
    b2.runBanjo =
    function()
    local cN = b2.snapshot()
    if cN.banjoClaimed then
        return true
    end
    if not cz() then
        local cO = cD()
        if cO then
            return false, cO
        end
    end
    if not cN.banjoSolved then
        local cO, cP = b2.solveBanjo()
        if not cO then
            return false, cP
        end
        task.wait(b2.bridgeSeconds or 3.5)
    end
    return b2.claimBanjo()
end
b2.returnWisp =
function()
local cN = b2.snapshot()
if cN.unlocked then
    return true
end
if not cN.returning then
    if not cN.readyReturn then
        return false, 'finish every Wisp quest first'
    end
    local cO, cP = ci('WispCompanion', 'Request', 'BeginReturn')
    if not cO then
        return false, cP or 'the wisp is not ready'
    end
end
local cO = b7(workspace, 'World', 'Build', 'EnchantedForestZone', 'Zone13Props', 'EnchantedTree', 'WispAnchor', 'WispTreePrompt')
if cO and cO:IsA('ProximityPrompt') then
    local cP = cO.Parent
    local cQ = cP and(cP:IsA('Attachment') and cP.WorldPosition or cP:IsA('BasePart') and cP.Position)
    if cQ then
        b2.status = 'Taking the wisp home'
        if cy(cQ + Vector3.new(0, 3, 4), 60) then
            local cR = os.clock() + 2
            while os.clock() < cR and not cO.Enabled do
                task.wait(0.1)
            end
            cB(cO)
            local cS = os.clock() + 3
            while os.clock() < cS and not b2.snapshot().unlocked do
                task.wait(0.1)
            end
            if b2.snap.unlocked then
                return true
            end
        end
    end
end
if not(cC and cC.Parent) then
    local cP = b7(workspace, 'World', 'Build', 'EnchantedTreeInterior', 'Markers', 'EnterTrigger') cC = cP and cP:FindFirstChild('EnchantedTreePrompt', true) or nil
end
local cP = cC and cC.Parent
local cQ = cP and(cP:IsA('Attachment') and cP.WorldPosition or cP:IsA('BasePart') and cP.Position)
if not cQ then
    return false, 'tree entrance not found'
end
b2.status = 'Taking the wisp home'
if not cy(cQ + Vector3.new(0, 3, 0), 60) then
    return false, 'could not reach the tree entrance'
end
cB(cC)
local cR = os.clock() + 3
while os.clock() < cR and not b2.snapshot().unlocked do
    task.wait(0.1)
end
if b2.snap.unlocked then
    return true
end
local cS, cV = ci('WispCompanion', 'Request', 'Return') task.wait(0.5)
return cS or b2.snapshot().unlocked, cV
end
b2.tierOptions =
function()
local cN = b2.tiers()
local cO ={}
for cP = # b3, 1, - 1 do
    local cQ = b3[cP] cO[# cO + 1] = cN and cN[cQ].name or cQ
end
return cO
end
b2.tierFromLabel =
function(cN)
local cO = b2.tiers()
for cP, cQ in ipairs(b3) do
    if cN == cQ then
        return cQ
        elseif
        cO then
            if cO[cQ].name == cN then
                return cQ
            end
        end
    end
    return nil
end
b2.setTiers =
function(cN)
local cO ={}
for cP, cQ in ipairs(type(cN) == 'table' and cN or{}) do
    local cR = b2.tierFromLabel(tostring(cQ))
    if cR then
        cO[# cO + 1] = cR
    end
end
aB.ButterflyTiers = cO
end
local cN ={'All Recipes', 'For Essence (shortfall only)', 'Emerald to Sapphire', 'Sapphire to Amethyst', 'Amethyst to Radiant'}
local cO ={['For Essence (shortfall only)'] = 'Smart',['Emerald to Sapphire'] = 'Green',['Sapphire to Amethyst'] = 'Blue',['Amethyst to Radiant'] = 'Purple'} b2.recipeOptions =
function()
return cN
end
b2.setRecipe =
function(cP) aB.ButterflyTradeRecipe = cO[tostring(cP)] or 'All'
end
local cP ={'Tween to Butterfly', 'Stand', 'Zigzag', 'Circle'}
local cQ ={['Tween to Butterfly'] = 'Tween', Stand = 'Stand', Zigzag = 'Zigzag', Circle = 'Circle'} b2.modeOptions =
function()
return cP
end
b2.setMode =
function(cR) aB.ButterflyCatchMode = cQ[tostring(cR)] or 'Tween'
end
local cR
local function cS()
for cV, cW in pairs(b2.cards) do
    pcall(
    function() cW.part:Destroy()
end
) b2.cards[cV] = nil
end
if cR then
    pcall(
    function() cR:Destroy()
end
) cR = nil
end
end
local function cV()
local cW = workspace.CurrentCamera
if not cW then
    return
end
if not(cR and cR.Parent) then
    cR = Instance.new('Folder') cR.Name = 'SenaBloomEsp' cR.Parent = cW
end
local cX = b2.tiers() or{}
local c_ = cn()
local c0 ={}
for c1, c2 in ipairs(cs()) do
    local c3 =('%d_%d_%d'):format(c2.pos.X, c2.pos.Y, c2.pos.Z) c0[c3] = true cW = b2.cards[c3]
    if cW and cW.part.Parent then
        else
        local c4 = Instance.new('Part') c4.Size = Vector3.new(0.2, 0.2, 0.2) c4.Anchored = true c4.CanCollide = false c4.CanQuery = false c4.CanTouch = false c4.Transparency = 1 c4.Parent = cR
        local c5 = Instance.new('BillboardGui') c5.Adornee = c4 c5.Size = UDim2.fromOffset(120, 20) c5.StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0) c5.AlwaysOnTop = true c5.MaxDistance = 260 c5.Parent = c4
        local c6 = Instance.new('TextLabel') c6.Size = UDim2.fromScale(1, 1) c6.BackgroundTransparency = 1 c6.Font = Enum.Font.GothamBold c6.TextSize = 13 c6.TextStrokeTransparency = 0.35 c6.Parent = c5 cW ={part = c4,
        label = c6} b2.cards[c3] = cW
    end
    cW.part.CFrame = CFrame.new(c2.pos)
    local c4 = cX[c2.tier] cW.label.TextColor3 = c4 and c4.color or Color3.new(1, 1, 1) cW.label.Text = c_ and('%s  %dm'):format(c4 and c4.name or c2.tier,
    math.floor((c2.pos - c_.Position).Magnitude)) or(c4 and c4.name or c2.tier)
end
for c3, c4 in pairs(b2.cards) do
    if not c0[c3] then
        pcall(
        function() c4.part:Destroy()
    end
    ) b2.cards[c3] = nil
end
end
end
local cW ={target = nil, since = 0, swinging = false} cW.skip = setmetatable({},{__mode = 'k'}) cW.pos =
function(cX)
if not(cX and cX.Parent) then
    return nil
end
local c_, c0 = pcall(
function()
return cX.PrimaryPart and cX.PrimaryPart.Position or cX:GetPivot().Position
end
)
return c_ and c0 or nil
end
cW.pick =
function(cX)
local c_ = workspace:FindFirstChild('ButterflyBloomSwarm')
if not c_ then
    return nil
end
local c0 = cr()
local c1 = os.clock()
local c2, c3
for c4, c5 in ipairs(c_:GetChildren()) do
    if c5:IsA('Model') and b4[c5.Name] and(
    if c0 then
        c0[c5.Name]
        else
        not c0) and(cW.skip[c5] or 0) <= c1 then
            local c6 = cW.pos(c5)
            if c6 then
                local c7 =(b4[c5.Name] == 4 and 1000000 or 0) -(c6 - cX).Magnitude
                if c2 then
                    if c7 > c2 then
                        c2 = c7 c3 = c5
                    end
                    else
                    c2 = c7 c3 = c5
                end
            end
        end
    end
    return c3
end
cW.gain =
function()
local cX, c_ = pcall(ca().Save.Peek)
local c0 = cX and c_ and c_.Butterflies and tonumber(c_.Butterflies.TotalCaught)
return c0 and b2.bloomBase and math.max(0, c0 - b2.bloomBase) or 0
end
cW.swing =
function(cX, c_)
if cW.swinging then
    return
end
local c0 = tonumber(ce('SwingCooldownSeconds', 0.45)) or 0.45
if os.clock() - b2.lastSwing < c0 then
    return
end
local c1 = ca()
if c1 then
    if c1.Swarm then
        if not c1.Swarm.Nearest then
            return
        end
        else
        return
    end
    else
    return
end
local c2, c3 = pcall(c1.Swarm.Nearest, c_, Vector3.new(0, 0, - 1), 4)
local c4 = c2 and c3 and c3.Flight
if not(c4 and c4.Id) then
    return
end
if c4.Tier ~= nil and tostring(c4.Tier) ~= cX.Name then
    return
end
b2.lastSwing = os.clock() cW.swinging = true task.spawn(
function()
local c5, c6, c7 = ci('Butterflies', 'AskSwing', c4.Id) cW.swinging = false
if c7 ~= 'Caught' and c7 ~= 'Gone' then
    cW.skip[cX] = os.clock() + 1.5
end
if cW.target == cX then
    cW.target = nil
end
local c8 = b2.tiers()
local c9 = c8 and c8[cX.Name] and c8[cX.Name].name or cX.Name b2.status =('%s %s  \194\183  +%d this Bloom'):format(c7 == 'Caught' and 'Caught' or 'Chasing',
c9, cW.gain())
end
)
end
cW.prepare =
function()
local cX = g.Character
local c_ = cX and cX:FindFirstChild('HumanoidRootPart')
local c0 = cX and cX:FindFirstChildOfClass('Humanoid')
if c_ then
    if not c0 then
        return nil
    end
    else
    return nil
end
cw() aR(cX) ar() aa()
local c1 = c0.AutoRotate c0.AutoRotate = false
return cX, c_, c0, c1
end
cW.release =
function(cX, c_, c0) cW.target = nil
if c_.Parent and c0 ~= nil then
    c_.AutoRotate = c0
end
cX.AssemblyLinearVelocity = Vector3.new(0, 0, 0) cX.AssemblyAngularVelocity = Vector3.new(0, 0, 0) W()
end
cW.keepGoing =
function(cX, c_, c0)
if n() then
    if aB.ButterflyAutoCatch then
        if b2.bloomLeft() > 0 then
            if cX.Parent then
                if not(c_.Health > 0) then
                    return false
                end
                else
                return false
            end
            else
            return false
        end
        else
        return false
    end
    else
    return false
end
if(aB.ButterflyCatchMode or 'Tween') ~= c0 then
    return false
end
return not(b2.manual or cz() or aH() or aI.blocker('butterfly') ~= nil)
end
cW.moveStep =
function(cX, c_, c0, c1, c2, c3, c4) ae(cX, c3 * q.HEADROOM)
local c5 = ac()[q.INTEGRITY_KEY]
local c6 = type(c5) == 'table' and c5.State or nil
if not am(c6, c_, c0) then
    c0.AssemblyLinearVelocity = Vector3.new(0, 0, 0) c0.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(c0.Position)
    if al(c6, c_, c0) then
        aj(c6, c3 * q.HEADROOM,(Vector3.new(0, 0, 0)))
        else
        an(c_, c0, c3)
    end
    return nil
end
local c7 = c0.Position
local c8 = c1 - c7
local c9 = c3 * c4
local da = c8.Magnitude <= c9 and c1 or c7 + c8.Unit * c9
local db =(c2 or c1) - da c1 = Vector3.new(db.X, 0, db.Z)
local dc =
if c1.Magnitude <= 0.001 then
    Vector3.new(c8.X, 0, c8.Z)
    else
    c1
    local dd = dc.Magnitude > 0.001 and dc.Unit or c0.CFrame.LookVector
    local de =(da - c7) / c4 V(da) c0.CFrame = CFrame.lookAt(da, da + dd) c0.AssemblyLinearVelocity = Vector3.new(0, 0, 0) c0.AssemblyAngularVelocity = Vector3.new(0,
    0, 0)
    if not ao(c_, c0, c3, de) then
        an(c_, c0, c3) ao(c_, c0, c3, de)
    end
    return da
end
cW.nearest =
function(cX, c_)
local c0 = workspace:FindFirstChild('ButterflyBloomSwarm')
if not c0 then
    return nil
end
local c1, c2, c3, c4, c5 = cr(), os.clock(), c_
for c6, c7 in ipairs(c0:GetChildren()) do
    if c7:IsA('Model') and b4[c7.Name] and(
    if c1 then
        c1[c7.Name]
        else
        not c1) and(cW.skip[c7] or 0) <= c2 then
            local c8 = cW.pos(c7)
            local c9 = c8 and(c8 - cX).Magnitude
            if c9 and c9 <= c3 then
                c3 = c9 c4 = c7 c5 = c8
            end
        end
    end
    return c4, c5
end
cW.cluster =
function(cX)
local c_ = workspace:FindFirstChild('ButterflyBloomSwarm')
local c0 ={}
for c1, c2 in ipairs(c_ and c_:GetChildren() or{}) do
    if c2:IsA('Model') and b4[c2.Name] then
        local c3 = cW.pos(c2)
        if c3 then
            c0[# c0 + 1] = c3
        end
    end
end
if # c0 == 0 then
    return nil, 0, 0
end
c_ = 0
for c3, c4 in ipairs(c0) do
    c_ =
    if cX then
        if(c4 - cX).Magnitude <= 24 then
            c_ + 1
            else
            c_
            else
            c_
        end
        local c5, c6
        for c7, c8 in ipairs(c0) do
            local c9 = Vector3.new(0, 0, 0)
            local da = 0
            for db, dc in ipairs(c0) do
                if(c8 - dc).Magnitude <= 24 then
                    c9, da = c9 + dc, da + 1
                end
            end
            local dd = c9 / da
            local de = da * 100 -(cX and(dd - cX).Magnitude or 0)
            if c5 then
                if de > c5 then
                    c5 = de c6 = dd
                end
                else
                c5 = de c6 = dd
            end
        end
        return c6, # c0, c_
    end
    cW.route =
    function(cX, c_, c0)
    if cX == 'Circle' then
        local c5 = 24
        local c6 = c0 * 2.0833333333333335
        return c_ + Vector3.new(math.cos(c6) * c5, 0, math.sin(c6) * c5)
    end
    local c5 = cH()
    if cX ~= 'Zigzag' then
        return c_
        elseif
        c5 then
            else
            return c_
        end
        local c6 = math.max(c5.Size.X / 2 - 12, 20)
        local c7 = math.clamp(c5.Size.Z / 2 - 12, 8, 30)
        local c8 = 8
        local c9 = math.sqrt((2 * c6 / c8) ^ 2 +(2 * c7) ^ 2)
        local da = c0 * 80 / c9 % 16
        local db = math.floor(da)
        local dc = da - db
        local dd = db <= c8 and db or 16 - db
        local de = db + 1 <= c8 and db + 1 or 16 -(db + 1)
        local df = - c6 + dd *(2 * c6 / c8)
        local dg = db % 2 == 0 and - c7 or c7
        local dh = - c6 + de *(2 * c6 / c8)
        local di =(db + 1) % 2 == 0 and - c7 or c7
        local dj = c5.CFrame:VectorToWorldSpace(Vector3.new(df +(dh - df) * dc, 0, dg +(di - dg) * dc))
        return Vector3.new(c5.Position.X + dj.X, c_.Y, c5.Position.Z + dj.Z)
    end
    cW.patrol =
    function(cX)
    local c_, c0, c5, c6 = cW.prepare()
    if not c_ then
        return false
    end
    local c7, c8, c9, da, db, dc = tonumber(ce('NetReach', 14)) or 14,({Stand = 'Standing in the swarm', Zigzag = 'Zigzag patrol', Circle = 'Circling the swarm'})[cX] or cX,
    os.clock(), 0
    local dd = false
    local de = 0
    while cW.keepGoing(c0, c5, cX) do
        local df = math.max(math.min(h.Heartbeat:Wait(), aS), 0.004166666666666667)
        local dg = os.clock()
        if dg >= da then
            local dh, di, dj = cW.cluster(db) da = dg + 1.5
            if di == 0 then
                dc = dc or dg
                else
                db, dc =
                if cX == 'Stand' then
                    if db then
                        if dj < 3 then
                            dh
                            else
                            db
                            else
                            dh
                            else
                            db and db:Lerp(dh, 0.5) or dh, nil
                        end
                    end
                    if dc and dg - dc > 2 then
                        break
                    end
                    if db then
                        dd = true
                        local dh = cW.route(cX, db, dg - c9)
                        local di =(dh - c0.Position).Magnitude > 40 and 1 / 0 or(cX == 'Stand' and 60 or(cX == 'Circle' and 70 or 110))
                        local dj, dk, dl = math.clamp(math.min(T(), di), q.MIN_SPEED, q.MAX_SPEED), cW.nearest(c0.Position, c7 + 6)
                        local dq = cW.moveStep(c_, c5, c0, dh, dl, dj, df)
                        if dq and(dk and(dl - dq).Magnitude <= c7 - 1.5) then
                            cW.swing(dk, dl)
                        end
                        if dg >= de then
                            if cW.swinging then
                                else
                                local dr = dg + 1 b2.status =('%s  \194\183  +%d this Bloom'):format(c8, cW.gain()) de = dr
                            end
                        end
                        else
                        c0.AssemblyLinearVelocity = Vector3.new(0, 0, 0) c0.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(c0.Position)
                    end
                end
                cW.release(c0, c5, c6)
                return dd
            end
            cW.run =
            function()
            local cX, c_, c0, c5 = cW.prepare()
            if not cX then
                return false
            end
            local c6 = tonumber(ce('NetReach', 14)) or 14
            local c7 = math.min(c6 - 3,(tonumber(ce('DodgeRadius', 9)) or 9) + 1)
            local c8
            local c9 = false
            while cW.keepGoing(c_, c0, 'Tween') do
                local da = math.max(math.min(h.Heartbeat:Wait(), aS), 0.004166666666666667)
                local db = cW.target
                local dc = cW.pos(db)
                if
                if dc then
                    os.clock() - cW.since > 3
                    else
                    not dc then
                        if dc then
                            cW.skip[db] = os.clock() + 2
                        end
                        db = cW.pick(c_.Position) cW.target, cW.since = db, os.clock() dc = cW.pos(db)
                        if db then
                            local dd = b2.tiers() b2.status =('Chasing %s  \194\183  +%d this Bloom'):format(dd and dd[db.Name] and dd[db.Name].name or db.Name, cW.gain())
                        end
                    end
                    if dc then
                        c8 = nil c9 = true
                        local dd = math.clamp(T(), q.MIN_SPEED, q.MAX_SPEED)
                        local de = c_.Position - dc
                        local df = de.Magnitude > 0.001 and dc + de.Unit * c7 or dc + Vector3.new(c7, 0, 0)
                        local dg = cW.moveStep(cX, c0, c_, df, dc, dd, da)
                        if dg and(dc - dg).Magnitude <= c6 - 1.5 then
                            cW.swing(db, dc)
                        end
                        else
                        c8 = c8 or os.clock()
                        if os.clock() - c8 > 2 then
                            break
                        end
                        c_.AssemblyLinearVelocity = Vector3.new(0, 0, 0) c_.AssemblyAngularVelocity = Vector3.new(0, 0, 0) V(c_.Position)
                    end
                end
                cW.release(c_, c0, c5)
                return c9
            end
            local function cX(c_)
            if cz() then
                cE()
                return
            end
            if not cI() then
                cw()
                if aH() then
                    b2.status = 'Night - waiting to fly to the forest'
                    return
                end
                if not cl('area') then
                    return
                end
                local c0 = cJ()
                if not c0 then
                    b2.status = 'Butterfly Bloom zone not found' cm('area')
                    return
                end
                b2.status = 'Flying to the Butterfly Bloom'
                if not cy(c0, 60) then
                    cm('area') b2.status = 'Could not reach the Enchanted Forest'
                end
                return
            end
            local c0 = l.__SenaV4TreadmillManager
            if c0 and c0.activeTreadmill ~= nil then
                cK()
            end
            if not c_.holding and not ct() then
                b2.status = 'Butterfly Net is not in your backpack'
                return
            end
            local c5 = aB.ButterflyCatchMode or 'Tween'
            if not(
            if c5 == 'Tween' then
                cW.run()
                else
                cW.patrol(c5)) then
                    cx() b2.status =('Waiting for butterflies  \194\183  +%d this Bloom'):format(cW.gain())
                end
            end
            local function c_(c0)
            if not c0.net then
                return c0.treeUnlocked and 'No Butterfly Net yet' or 'Enchanted Tree locked - finish the Wisp Event'
            end
            if c0.active then
                return 'Bloom is live'
            end
            if c0.nextIn then
                return('Next Bloom in %dm %02ds'):format(math.floor(c0.nextIn / 60), math.floor(c0.nextIn % 60))
            end
            return 'Idle'
        end
        local function c0()
        if b2.manual then
            return
        end
        local c5 = b2.snapshot()
        if c5.active then
            b2.bloomBase = b2.bloomBase or c5.caught
            else
            b2.bloomBase = nil
        end
        if aB.ButterflyEsp and c5.active then
            cV()
            else
            if next(b2.cards) then
                cS()
                else
                if cR then
                    cS()
                end
            end
        end
        pcall(b2.questDrive, c5)
        if aB.WispAutoQuest and(c5.claimable and(c5.questId and cl('quest'))) then
            local c6, c7 = ci('WispCompanion', 'Request', 'Claim', c5.questId) b2.status = c6 and 'Wisp quest claimed: '..c5.quest or 'Wisp claim: '..tostring(c7 or 'refused')
            if not c6 then
                cm('quest')
            end
        end
        local c6
        if aB.WispAutoQuest and not c5.accepted and not c5.unlocked and(c5.need or 0) > 0 and(c5.speed or 0) >= c5.need and cl('accept') then
            c6 = 'accept'
            else
            if aB.WispAutoQuest and not c5.unlocked and(c5.returning or c5.readyReturn) and cl('wisp') then
                c6 = 'wisp'
                else
                if aB.ButterflyAutoNet and not c5.net and c5.treeUnlocked and cl('net') then
                    c6 = 'net'
                    else
                    if aB.BanjoAuto and c5.treeUnlocked and not c5.banjoClaimed and not c5.active and cl('banjo') then
                        c6 = 'banjo'
                        else
                        if aB.ButterflyAutoCatch and c5.active and c5.net and not(bP and bP.enabled and os.clock() -(tonumber(bP.gateOpenAt) or 0) < 3) then
                            c6 = 'catch'
                            else
                            local c7 = c5.active c6 =
                            if(
                            if c7 then
                                not c7
                                else
                                aB.ButterflyAutoTrade) and c5.net and b2.canTrade() and cl('trade') then
                                    'trade'
                                    else
                                    if c5.active then
                                        c6
                                        else
                                        if aB.ButterflyAutoCraft then
                                        if c5.net then
                                        if b2.canCraft() then
                                        if cl('craft') then
                                        'craft'
                                        else
                                        c6
                                        else
                                        c6
                                        else
                                        c6
                                        else
                                        c6
                                    end
                                end
                            end
                        end
                    end
                    b2.wantsCharacter = c6 ~= nil
                    local c7 = c6 and aI.blocker('butterfly') or nil
                    local c8 = c6 and not c7 and aI.holder('butterfly') or nil
                    local c9 = b2.active b2.active = c6 ~= nil and c7 == nil and c8 == nil
                    if c6 and not b2.active then
                        cw()
                        if c7 and cz() then
                            b2.status = 'Leaving the tree for '..aI.TITLES[c7] cE()
                        end
                        b2.status = c7 and 'Yielding to '..aI.TITLES[c7] or 'Waiting for '..aI.TITLES[c8]..' to hand over'
                        return
                    end
                    if not c6 then
                        if c9 then
                            cM()
                        end
                        cw() b2.status = c_(c5)
                        return
                    end
                    if not c9 then
                        cK()
                    end
                    if c6 == 'accept' then
                        c7, c9 = b2.acceptWisp() b2.status = c7 and 'Wisp accepted - quests started' or 'Wisp: '..tostring(c9 or 'refused')
                        if not c7 then
                            cm('accept')
                        end
                        elseif
                        c6 == 'wisp' then
                            local da, db = b2.returnWisp() b2.status = da and 'Wisp returned - Enchanted Tree unlocked' or 'Wisp: '..tostring(db or 'refused')
                            if not da then
                                cm('wisp')
                            end
                            elseif
                            c6 == 'banjo' then
                                local da, db = b2.runBanjo() b2.status = da and 'Banjo Cricket secret claimed' or 'Banjo: '..tostring(db or 'refused')
                                if not da then
                                    cm('banjo')
                                end
                                if cz() then
                                    cE()
                                end
                                elseif
                                c6 == 'net' then
                                    local da, db = b2.claimNet() b2.status = da and 'Butterfly Net claimed' or 'Net: '..tostring(db or 'refused')
                                    if not da then
                                        cm('net')
                                    end
                                    elseif
                                    c6 == 'catch' then
                                        cX(c5)
                                        elseif
                                        c6 == 'trade' then
                                        local da, db = b2.tradeUp() b2.status = da and('Traded up %d time(s)'):format(tonumber(db) or 0) or 'Trade: '..tostring(db) cm('trade')
                                        elseif
                                        c6 == 'craft' then
                                        local da, db = b2.craft() b2.status = da and('Crafted %d Enchanted Essence'):format(tonumber(db) or 0) or 'Craft: '..tostring(db) cm('craft')
                                    end
                                end
                                task.spawn(
                                function()
                                while n() do
                                    local c5, c6 = pcall(c0)
                                    if not c5 then
                                        b2.active = false b2.wantsCharacter = false cw() b2.status = 'Error: '..tostring(c6) task.wait(1)
                                    end
                                    task.wait(0.2)
                                end
                                cw() cS()
                            end
                            ) aI.register('butterfly',{wants =
                            function()
                            return b2.wantsCharacter == true
                        end
                        , active =
                        function()
                        return b2.active == true
                    end
                    , enabled =
                    function()
                    return aB.ButterflyAutoCatch == true or aB.ButterflyAutoNet == true or aB.WispAutoQuest == true or aB.BanjoAuto == true or aB.ButterflyAutoTrade == true or aB.ButterflyAutoCraft == true
                end
                , status =
                function()
                return tostring(b2.status or '')
            end
            }) l.__SenaV4ButterflyRuntime = b2
        end
        do
            local b2 = game:GetService('Players')
            local b3 = game:GetService('ReplicatedStorage')
            local b4 = b2.LocalPlayer
            local b5 = 'SENAVIS_'
            local b6 ={held ={}}
            local function b7()
            local b9, ca = pcall(require, b3.Shared.Save)
            return b9 and ca or nil
        end
        local function b9()
        local ca, ce = pcall(require, b3.Data.Assets)
        if not ca then
            return nil
        end
        return ce.Directory or ce
    end
    local function ca(ce)
    return b5..ce..'_'..tostring(math.floor(os.clock() * 1000))..'_'..tostring(math.random(1, 1000000))
end
b6.categories =
function(ce)
local ci = b9()
local cl ={}
if not ci then
    return cl
end
for cm, cn in pairs(ci) do
    if type(cm) == 'string' and type(cn) == 'table' then
        if ce == 'Pet' then
            cl[# cl + 1] = cm
            elseif
            cn.Egg ~= nil then
                cl[# cl + 1] = cm
            end
        end
    end
    table.sort(cl)
    return cl
end
b6.spawnEgg =
function(ce, ci)
local cl = b7()
local cm = b9()
if cl and cm then
    if not cm[ce] then
        return nil
    end
    else
    return nil
end
local cn = ca('E') pcall(
function() cl.Amend('EggInventory',
function(cp) cp[cn] ={AssetCategory = ce, AssetScale = tonumber(ci) or 50, AssetColorIndex = 1, AssetColorSeed = math.random(1, 2000000000), AssetEyeColor = 'ffffff',
HasParasite = false, Mutations ={}}
end
)
end
)
return cn
end
b6.spawnPet =
function(ce, ci)
local cl = b7()
local cm = b9()
if cl and cm then
    if not cm[ce] then
        return nil
    end
    else
    return nil
end
local cn = ca('P') pcall(
function() cl.Amend('Inventory',
function(cp) cp[cn] ={Category = ce, Scale = tonumber(ci) or 50, ColorIndex = 1, ColorSeed = math.random(1, 2000000000), EyeColor = 'ffffff', Gender = 'Male',
Personality = 'Normal', InFuse = false, HasBeenFirstPlaced = false, Mutations ={}}
end
)
end
)
return cn
end
local function ce(ci)
local cl = b3:FindFirstChild('Assets') cl = cl and cl:FindFirstChild('Models')
local cm = cl and cl:FindFirstChild('Eggs')
return cm and cm:FindFirstChild(ci)
end
local function ci(cl)
local cm = b3:FindFirstChild('AssetModels')
return cm and cm:FindFirstChild(cl)
end
b6.hold =
function(cl, cm, cn)
local cp = b4.Character
if not cp then
    return false
end
local cq = cm and ce(cl) or ci(cl)
if not cq then
    return false
end
local cr, cs = pcall(
function()
return cq:Clone()
end
)
if cr then
    if not(cs and cs:IsA('Model')) then
        return false
    end
    else
    return false
end
local ct = cs.PrimaryPart or cs:FindFirstChildWhichIsA('BasePart')
if not ct then
    pcall(
    function() cs:Destroy()
end
)
return false
end
pcall(
function()
if not cs.PrimaryPart then
    cs.PrimaryPart = ct
end
end
)
local cu = math.clamp(1 +(tonumber(cn) or 50) / 70, 1, 2.4) *(0.85 + math.random() * 0.4) pcall(
function()
if cs.ScaleTo then
    cs:ScaleTo(cu)
end
end
)
local cw = Vector3.new(3, 3, 3) pcall(
function() cw = cs:GetExtentsSize()
end
)
local cx = Instance.new('Tool') cx.Name = b5..cl cx.RequiresHandle = true cx.CanBeDropped = false
local cy = b9() cn = cy and cy[cl]
local cz = cn and(cm and cn.Egg and cn.Egg.Icon or cn.Icon)
if type(cz) == 'string' then
    pcall(
    function() cx.TextureId = cz
end
)
end
ct.Name = 'Handle'
for cB, cC in ipairs(cs:GetDescendants()) do
    if cC:IsA('BasePart') then
        cC.Massless = true cC.CanCollide = false cC.Anchored = false
        if cC ~= ct then
            local cD = Instance.new('WeldConstraint') cD.Part0 = ct cD.Part1 = cC cD.Parent = ct
        end
    end
end
for cD, cE in ipairs(cs:GetChildren()) do
    cE.Parent = cx
end
ct.Parent = cx pcall(
function() cs:Destroy()
end
) pcall(
function()
local cF = math.max(cw.X, cw.Z) cx.Grip = CFrame.new(0, -(cw.Y * 0.55), cF * 0.5 + 0.5)
end
) cx.Parent = b4:FindFirstChild('Backpack') or cp
local cF = cp:FindFirstChildOfClass('Humanoid')
if cF then
    pcall(
    function() cF:EquipTool(cx)
end
)
end
b6.held[# b6.held + 1] = cx
return true
end
b6.spawn =
function(cl, cm, cn, cp)
if cm then
    if cm == 'None' then
        return
    end
    else
    return
end
local cq = tonumber(cn) or 50
if cp then
    pcall(b6.hold, cm, cl ~= 'Pet', cq)
    elseif
    cl == 'Pet' then
        local cr = math.clamp(1 + cq / 25, 1.2, 5) *(0.85 + math.random() * 0.4) b6.spawnPet(cm, cr)
        else
        b6.spawnEgg(cm, cq *(0.85 + math.random() * 0.5))
    end
end
b6.clear =
function()
local cl = b7()
if cl then
    pcall(
    function() cl.Amend('EggInventory',
    function(cm)
    for cn in pairs(cm) do
        if type(cn) == 'string' and cn:sub(1, # b5) == b5 then
            cm[cn] = nil
        end
    end
end
)
end
) pcall(
function() cl.Amend('Inventory',
function(cm)
for cn in pairs(cm) do
    if type(cn) == 'string' and cn:sub(1, # b5) == b5 then
        cm[cn] = nil
    end
end
end
)
end
) pcall(
function() cl.Amend('EquippedAssets',
function(cm)
for cn = # cm, 1, - 1 do
    local cp = cm[cn]
    if type(cp) == 'string' and cp:sub(1, # b5) == b5 then
        table.remove(cm, cn)
    end
end
end
)
end
)
end
for cm, cn in ipairs(b6.held) do
    pcall(
    function() cn:Destroy()
end
)
end
b6.held ={}
for cp, cq in ipairs({b4.Character, b4:FindFirstChild('Backpack')}) do
    if cq then
        for cr, cs in ipairs(cq:GetChildren()) do
            if cs:IsA('Tool') and cs.Name:sub(1, # b5) == b5 then
                pcall(
                function() cs:Destroy()
            end
            )
        end
    end
end
end
end
l.__SenaV4VisualSAE = b6
end
do
    local b2 =(tonumber(game:GetService('StarterPlayer').CameraMaxZoomDistance) or 128) * 1.95
    local function b3()
    if g.CameraMaxZoomDistance < b2 then
        g.CameraMaxZoomDistance = b2
    end
end
pcall(b3)
local function b4()
if n() then
    pcall(b3)
end
end
g:GetPropertyChangedSignal('CameraMaxZoomDistance'):Connect(b4)
end
l.__SenaV4Visual =(
function()
local b2 = game:GetService('HttpService')
local b3 ={base = 'https://senahub.xyz/api/visual/', manifest = nil, status = 'Idle', spawned ={}, backs ={}, backRod = nil, remote ={}}
local b4 = 'SenaVisual/cache'
local b5 = Vector3.new(0.3, 0.75, 0.6).Unit
local b6 ={RightShoulder = CFrame.Angles(0.6981317007977318, 0, 0.17453292519943295), RightElbow = CFrame.Angles(1.7453292519943295, 0, 0), RightWrist = CFrame.new(),
LeftShoulder = CFrame.new(), LeftElbow = CFrame.new(), LeftWrist = CFrame.new()}
local b7 = 0.8
local b9 = CFrame.new(0.5, 1.3, 1, - 0.7071, - 0.7071, 0, - 0.7071, 0.7071, 0, 0, 0, - 1):Inverse()
local function ca(ce)
local ci = ''
for cl in string.gmatch(ce, '[^/]+') do
    ci = ci == '' and cl or ci..'/'..cl
    if not isfolder(ci) then
        makefolder(ci)
    end
end
end
local function ce(ci)
local cl, cp = pcall(
function()
return game:HttpGet(ci, true)
end
)
if cl and(type(cp) == 'string' and cp ~= '') then
    return cp
end
return nil
end
b3.loadManifest =
function()
if b3.manifest then
    return b3.manifest
end
ca(b4)
local ci = ce(b3.base..'manifest.json')
local cl
if ci then
    pcall(writefile, b4..'/manifest.json', ci) cl = ci
    else
    if isfile(b4..'/manifest.json') then
        ci = readfile(b4..'/manifest.json')
    end
    cl = ci
end
local cp, cq = pcall(
function()
return b2:JSONDecode(cl)
end
)
if cp and type(cq) == 'table' then
    b3.manifest = cq
end
return b3.manifest
end
b3.names =
function(ci)
local cl ={}
local cp = b3.loadManifest()
for cq, cr in ipairs(cp and cp[ci] or{}) do
    cq = cr.name
    local cs =
    if cr.tier then
        cr.name..' ['..cr.tier..']'
        else
        cq table.insert(cl, cs)
    end
    return cl
end
local function ci(cl, cp)
local cq = b3.loadManifest()
for cr, cs in ipairs(cq and cq[cl] or{}) do
    if cs.name == cp then
        return cs
        elseif
        cs.name..' ['..tostring(cs.tier)..']' == cp then
            return cs
        end
    end
    return nil
end
local function cl(cp, cq)
local cr = b4..'/'..cp ca(cr)
local cs = cr..'/'..cq.file
if not isfile(cs) then
    b3.status = 'Downloading '..cq.name..'...'
    local ct = ce(b3.base..cp..'/'..cq.file)
    if not ct then
        return nil, 'Download failed'
    end
    writefile(cs, ct)
end
cp, cr = pcall(
function()
return game:GetObjects(getcustomasset(cs))
end
)
if(
if cp then
    type(cr) ~= 'table'
    else
    not cp) or not cr[1] then
        pcall(delfile, cs)
        return nil, 'Could not load model'
    end
    return cr[1]
end
b3.rodScale = 1 b3.fishWeight = 0
local function cp(cq, cr, cs)
local ct ={}
for cu, cw in ipairs(cq:GetDescendants()) do
    if cw:IsA('JointInstance') then
        cw:Destroy()
        elseif
        cw:IsA('WeldConstraint') then
            cw:Destroy()
            elseif
            cw:IsA('BasePart') then
                table.insert(ct, cw)
                elseif
                cw:IsA('Script') then
                    cw:Destroy()
                    elseif
                    cw:IsA('LocalScript') then
                        cw:Destroy()
                    end
                end
                if # ct == 0 then
                    return nil
                end
                local cx = cq:FindFirstChild('Handle', true)
                local cy =
                if cx then
                    if cx:IsA('BasePart') then
                        cx
                        else
                        ct[1]
                        else
                        ct[1]
                        if cr or cs and cs ~= 1 then
                            local cz, cC = cq:GetBoundingBox()
                            local cD = cs or cr / math.max(cC.X, cC.Y, cC.Z, 0.01)
                            local cE =
                            if cr then
                                cz
                                else
                                cy.CFrame
                                for cF, cG in ipairs(ct) do
                                    local cH = cE:ToObjectSpace(cG.CFrame) cG.Size = cG.Size * cD cG.CFrame = cE *(CFrame.new(cH.Position * cD) * cH.Rotation)
                                end
                                for cH, cI in ipairs(cq:GetDescendants()) do
                                    if cI:IsA('Attachment') and not cI.Parent:IsA('Bone') then
                                        cI.Position = cI.Position * cD
                                    end
                                end
                            end
                            for cz, cC in ipairs(ct) do
                                cC.Anchored = false cC.CanCollide = false cC.CanQuery = false cC.CanTouch = false cC.Massless = true
                                if cC ~= cy then
                                    local cD = Instance.new('Weld') cD.Part0 = cy cD.Part1 = cC cD.C0 = cy.CFrame:ToObjectSpace(cC.CFrame) cD.Parent = cy
                                end
                            end
                            cy.Name = 'Handle'
                            return cy, ct
                        end
                        local function cq(cr, cs)
                        local ct = Vector3.new(0, 0, 0)
                        local cw = Vector3.new(0, 0, 0)
                        for cx, cy in ipairs(cs) do
                            if cy ~= cr and cy.Transparency < 0.95 then
                                local cz = cy.Size / 2
                                local cC ={- 1, 1}
                                local cD = ct
                                local cE = cw
                                for cG, cH in ipairs(cC) do
                                    for cI, cJ in ipairs({- 1, 1}) do
                                        for cK, cL in ipairs({- 1, 1}) do
                                        local cM = cr.CFrame:PointToObjectSpace(cy.CFrame:PointToWorldSpace(Vector3.new(cz.X * cH, cz.Y * cJ, cz.Z * cL))) cD, cE = cD:Min(cM), cE:Max(cM)
                                    end
                                end
                            end
                            ct = cD cw = cE
                        end
                    end
                    local cz = cw - ct
                    local cC =
                    if cz.X >= cz.Y and cz.X >= cz.Z then
                        Vector3.new(cw.X >= - ct.X and 1 or - 1, 0, 0)
                        else
                        if cz.Y >= cz.Z then
                            Vector3.new(0, cw.Y >= - ct.Y and 1 or - 1, 0)
                            else
                            Vector3.new(0, 0, cw.Z >= - ct.Z and 1 or - 1)
                            local cD = Vector3.new(1, 0, 0)
                            local cE =
                            if math.abs(cC.X) > 0.5 then
                                cz.Z >= cz.Y and Vector3.new(0, 0, 1) or Vector3.new(0, 1, 0)
                                else
                                if math.abs(cC.Z) > 0.5 then
                                    cz.X >= cz.Y and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)
                                    else
                                    cD
                                    local cG = - math.min(ct:Dot(cC), cw:Dot(cC))
                                    return CFrame.fromMatrix(Vector3.new(0, 0, 0), cE, cC), math.max(0, cG - 0.6)
                                end
                                b3.updateBack =
                                function()
                                local cr = g:FindFirstChild('Backpack')
                                for cs, ct in pairs(b3.backs) do
                                    ct(cs == b3.backRod and cr ~= nil and cs.Parent == cr)
                                end
                                task.defer(b3.refreshQuality)
                            end
                            b3.refreshQuality =
                            function()
                            local cr = false
                            local cs = g.Character
                            if cs then
                                for ct, cw in ipairs(cs:GetChildren()) do
                                    if cw:IsA('Tool') and cw:GetAttribute('SenaVisual') or cw.Name == 'SenaVisualBack' then
                                        cr = true
                                        break
                                    end
                                end
                            end
                            if next(b3.remote) ~= nil then
                                cr = true
                            end
                            pcall(
                            function()
                            if cr then
                                settings().Rendering.QualityLevel = Enum.QualityLevel.Level10
                                elseif
                                aB.StartupBoost then
                                    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                                end
                            end
                            )
                        end
                        local function cr(cs, ct, cw)
                        local cx = Vector3.new(1, 1, 1) * 1000000000
                        local cz = - Vector3.new(1, 1, 1) * 1000000000
                        for cC, cD in ipairs(cw) do
                            local cE = cD.Size / 2
                            for cG, cH in ipairs({- 1, 1}) do
                                for cI, cJ in ipairs({- 1, 1}) do
                                    for cK, cL in ipairs({- 1, 1}) do
                                        local cM = cD.CFrame:PointToWorldSpace(Vector3.new(cE.X * cH, cE.Y * cJ, cE.Z * cL)) cx, cz = cx:Min(cM), cz:Max(cM)
                                    end
                                end
                            end
                        end
                        local cE = cz - cx
                        local cG ={}
                        local cH = 0
                        local cI = Vector3.new(0, 0, 0)
                        for cJ, cK in ipairs(cw) do
                            if cK.Transparency < 0.95 then
                                local cL = math.max(cK.Size.X * cK.Size.Y * cK.Size.Z, 0.0001)
                                local cM = cK.Size / 2
                                local cN ={- 1, 1}
                                local cO = 1 / 0
                                for cP, cQ in ipairs(cN) do
                                    for cR, cS in ipairs({- 1, 1}) do
                                        for cV, cW in ipairs({- 1, 1}) do
                                        cO = math.min(cO, cK.CFrame:PointToWorldSpace(Vector3.new(cM.X * cQ, cM.Y * cS, cM.Z * cW)).Y)
                                    end
                                end
                            end
                            table.insert(cG,{y = cO, vol = cL}) cH, cI = cH + cL, cI + cK.Position * cL
                        end
                    end
                    local cL =(cx + cz) / 2 - Vector3.new(0, cE.Y / 2, 0)
                    if cH > 0 then
                        table.sort(cG,
                        function(cM, cN)
                        return cM.y < cN.y
                    end
                    )
                    local cM = 0
                    local cN = cG[1].y
                    for cO, cP in ipairs(cG) do
                        cM += cP.vol cN = cP.y
                        if cM >= cH * 0.1 then
                            break
                        end
                    end
                    local cQ = cI / cH cL = Vector3.new(cQ.X, cN, cQ.Z)
                end
                local function cM(cN)
                for cO, cP in ipairs(cw) do
                    if cP.Transparency < 0.95 then
                        local cQ = cP.CFrame:PointToObjectSpace(cN)
                        local cR = cP.Size / 2 + Vector3.new(0.6, 0.6, 0.6)
                        if math.abs(cQ.X) <= cR.X and(math.abs(cQ.Y) <= cR.Y and math.abs(cQ.Z) <= cR.Z) then
                            return true
                        end
                    end
                end
                return false
            end
            cE = 0
            while cE < 150 do
                local cN = cL - Vector3.new(0, 1.6 + cE, 0)
                if not cM(cN) and not cM(cN - Vector3.new(0, 1.8, 0)) then
                    break
                end
                cE += 1
            end
            local function cN(cO)
            local cP = Vector3.new(cO.X, 0, cO.Z)
            return cP.Magnitude > 0.05 and cP.Unit or nil
        end
        cG = nil
        for cO, cP in ipairs(cw) do
            if string.find(string.lower(cP.Name), 'eye', 1, true) then
                cG = cN(cP.Position - cL)
                break
            end
        end
        if cG then
            else
            for cQ, cR in ipairs(cs:GetDescendants()) do
                local cS = string.lower(cR.Name)
                if cR:IsA('Attachment') and(cS:find('head') or cS:find('eye') or cS:find('jaw') or cS:find('mouth')) then
                    cG = cN(cR.WorldPosition - cL)
                    if cG then
                        break
                    end
                end
            end
        end
        local cQ = cG or cN(ct.CFrame.LookVector) or Vector3.new(0, 0, 1)
        return{lift = cE, rootRel = CFrame.new(cL):ToObjectSpace(ct.CFrame), turn = CFrame.lookAt(Vector3.new(0, 0, 0), cQ):Inverse()}
    end
    local function cs(ct, cw, cx, cz)
    local cE, cG = cl(ct, cw)
    if not cE then
        return nil, cG
    end
    local cH, cI
    if ct == 'fish' then
        local cL = tonumber(cw.minKg)
        local cM = tonumber(cw.bigMaxKg) or tonumber(cw.maxKg)
        local cN =
        if cL then
            if cL > 0 then
                if cM then
                    math.max(1,(cL +(cM - cL) *(cx or 0)) / cL)
                    else
                    1
                    else
                    1
                    else
                    1
                    local cO = tonumber(cw.nativeLen) cH, cI = cp(cE, nil,
                    if cO then
                        if cO > 50 then
                            cN * 0.8
                            else
                            cN
                            else
                            cN)
                            else
                            cH, cI = cp(cE, nil, cz or 1)
                        end
                        if not cH then
                            cE:Destroy()
                            return nil, 'Empty model'
                        end
                        cH.Parent = cE
                        local cL ={model = cE, handle = cH, kind = ct}
                        if ct == 'fish' then
                            cL.overhead = cr(cE, cH, cI) cH.Name = 'FishRoot'
                            else
                            cL.rodAxis, cL.gripShift = cq(cH, cI) cH.Name = 'RodRoot'
                        end
                        return cL
                    end
                    local function ct(cw)
                    local cx = cw.model:Clone() cx.Name = 'SenaVisualBack'
                    for cz, cE in ipairs(cx:GetDescendants()) do
                        if cE:IsA('BasePart') then
                            cE.Size = cE.Size * b7
                            elseif
                            cE:IsA('Weld') then
                                cE.C0 = CFrame.new(cE.C0.Position * b7) * cE.C0.Rotation
                                elseif
                                cE:IsA('Attachment') then
                                    if not cE.Parent:IsA('Bone') then
                                        cE.Position = cE.Position * b7
                                    end
                                end
                            end
                            return cx, cx:FindFirstChild('RodRoot', true)
                        end
                        local function cw(cx, cz, cE, cG)
                        local cH = cx and(cx:FindFirstChild('UpperTorso') or cx:FindFirstChild('Torso'))
                        if cH then
                            if not cE then
                                return nil
                            end
                            else
                            return nil
                        end
                        cz.Parent = cx
                        local cI = Instance.new('Weld') cI.Part0 = cH cI.Part1 = cE cI.C0 = b9 * CFrame.new(0, cG.gripShift * b7, 0) * cG.rodAxis:Inverse() cI.Parent = cE
                        return cI
                    end
                    local function cx(cz, cE, cG)
                    local cH = cz and cz:FindFirstChild('RightHand')
                    local cI = cz and cz:FindFirstChild('UpperTorso')
                    if not(cH and cI) then
                        return
                        function()
                    end
                end
                local cL ={}
                for cM, cN in pairs(b6) do
                    local cO = cz:FindFirstChild(cM, true)
                    if cO and cO:IsA('Motor6D') then
                        cL[cO] = cN
                    end
                end
                local cO, cP = true
                local function cQ()
                for cR, cS in pairs(cL) do
                    cR.Transform = cS
                end
            end
            local cR = h.PreSimulation:Connect(cQ) task.spawn(
            function() h.PostSimulation:Wait() h.PostSimulation:Wait()
            if cO then
                if not cE.Parent then
                    return
                end
                else
                return
            end
            local cS = cI.CFrame:PointToObjectSpace(cH.Position) + Vector3.new(0, 0, - 0.1)
            local cV =(Vector3.new(1, 0, 0) - b5 * Vector3.new(1, 0, 0):Dot(b5)).Unit cP = Instance.new('Weld') cP.Part0 = cI cP.Part1 = cE cP.C0 = CFrame.fromMatrix(cS,
            cV, b5) * CFrame.new(0, cG.gripShift, 0) * cG.rodAxis:Inverse() cP.Parent = cE
        end
        )
        local function cS() cO = false cR:Disconnect()
        if cP then
            cP:Destroy()
        end
    end
    return cS
end
local function cz(cE, cG, cH)
local cI = cE and cE:FindFirstChild('Head')
if not cI then
    return
    function()
end
end
local cL = cH.overhead
local cM = Instance.new('Weld') cM.Part0 = cI cM.Part1 = cG cM.C0 = CFrame.new(0, cI.Size.Y / 2 + 1 + cL.lift, 0) * cL.turn * cL.rootRel cM.Parent = cG
local cN = CFrame.Angles(3.141592653589793, 0, 0)
local cO = cE:FindFirstChild('RightShoulder', true)
local cP = cE:FindFirstChild('LeftShoulder', true)
local cQ = cE:FindFirstChild('RightElbow', true)
local cR = cE:FindFirstChild('LeftElbow', true)
local function cS()
if cO then
    cO.Transform = cN * CFrame.Angles(0, 0, - 0.20943951023931956)
end
if cP then
    cP.Transform = cN * CFrame.Angles(0, 0, 0.20943951023931956)
end
if cQ then
    cQ.Transform = CFrame.new()
end
if cR then
    cR.Transform = CFrame.new()
end
end
local cV = h.PreSimulation:Connect(cS)
return
function() cV:Disconnect() cM:Destroy()
end
end
local function cE(cG, cH)
local cI, cL = cs(cG, cH, b3.fishWeight, b3.rodScale)
if not cI then
    return nil, cL
end
local cM = cI.model
local cN = cI.handle
local cO = Instance.new('Tool') cO.Name = cH.name cO.CanBeDropped = false cO.RequiresHandle = false cO:SetAttribute('SenaVisual', cG)
if cG == 'fish' then
    cO:SetAttribute('ItemType', 'Phone') cO.ToolTip = tostring(cH.tier or 'Fish')
    else
    cO.ToolTip = 'Rod'
end
if cH.icon then
    cO.TextureId = cH.icon
end
local cP, cQ, cR, cS
if cG == 'rods' then
    cR, cS = ct(cI)
    else
    cR, cS = cP, cQ
end
for cV, cW in ipairs(cM:GetChildren()) do
    cW.Parent = cO
end
cM:Destroy()
local function cX() task.defer(b3.refreshQuality)
end
cO.Equipped:Connect(cX)
local function c_() task.defer(b3.refreshQuality)
end
cO.Unequipped:Connect(c_)
local c0
if cG == 'rods' then
    local c5 b3.backs[cO] =
    function(c6)
    local c7 = g.Character
    if c6 then
        if c7 then
            if cR.Parent ~= c7 then
                if c5 then
                    c5:Destroy()
                end
                c5 = cw(c7, cR, cS, cI)
            end
            else
            cR.Parent = nil
        end
        else
        cR.Parent = nil
    end
end
local function c6() b3.backs[cO] = nil cR:Destroy()
end
cO.Destroying:Connect(c6) cO.Equipped:Connect(
function() b3.backRod = cO b3.updateBack()
if c0 then
    c0()
end
c0 = cx(cO.Parent, cN, cI)
end
) cO.Unequipped:Connect(
function()
if c0 then
    c0() c0 = nil
end
b3.backRod = cO task.defer(b3.updateBack)
end
)
else
cO.Equipped:Connect(
function()
if c0 then
    c0()
end
c0 = cz(cO.Parent, cN, cI)
end
) cO.Unequipped:Connect(
function()
if c0 then
    c0() c0 = nil
end
end
)
end
return cO
end
b3.spawn =
function(cG, cH)
local cI = ci(cG, cH)
if not cI then
    b3.status = 'Pick an item first'
    return false
end
local cL = g:FindFirstChild('Backpack')
if not cL then
    b3.status = 'Backpack not ready'
    return false
end
local cM = cL:FindFirstChild(cI.name)
if cM and cM:GetAttribute('SenaVisual') then
    b3.status = cI.name..' is already in your backpack'
    return true
end
b3.status = 'Loading '..cI.name..'...'
local cN, cO = cE(cG, cI)
if not cN then
    b3.status = cI.name..': '..tostring(cO)
    return false
end
cN.Parent = cL
if cG == 'rods' then
    b3.backRod = cN b3.updateBack()
end
b3.spawned[cG..'|'..cI.name] ={kind = cG, label = cI.name} b3.status = cI.name..' added to your backpack'
return true
end
b3.respawn =
function(cG)
local cH ={}
for cI, cL in pairs(b3.spawned) do
    if cL.kind == cG then
        cH[cI] = cL
    end
end
for cM, cN in pairs(cH) do
    for cO, cP in ipairs({g:FindFirstChild('Backpack'), g.Character}) do
        local cQ = cP and cP:FindFirstChild(cN.label)
        if cQ and(cQ:IsA('Tool') and cQ:GetAttribute('SenaVisual')) then
            cQ:Destroy()
        end
    end
    b3.spawn(cN.kind, cN.label)
end
end
b3.clear =
function() b3.spawned ={}
for cG, cH in ipairs({g:FindFirstChild('Backpack'), g.Character}) do
    if cH then
        for cM, cN in ipairs(cH:GetChildren()) do
            if cN:IsA('Tool') and cN:GetAttribute('SenaVisual') then
                cN:Destroy()
            end
        end
    end
end
b3.status = 'Removed all visual items' task.defer(b3.refreshQuality)
end
local function cG(cH)
local cM = b3.remote[cH]
if not cM then
    return
end
b3.remote[cH] = nil
for cN, cO in ipairs(cM.cleanup) do
    pcall(cO)
end
end
local function cH(cM)
local cN, cO, cP = string.match(cM or '', '^(%a+)|([^|]+)|?(.*)$')
return cN, cO, tonumber(cP)
end
local function cM(cN, cO, cP)
local cQ = d:GetPlayerByUserId(tonumber(cN) or 0)
local cR = cQ and cQ.Character
if not cR then
    cG(cN)
    return
end
local cS = cO..'#'..cP
local cV = b3.remote[cN]
if cV and(cV.key == cS and cV.char == cR) then
    return
end
cG(cN)
local cW ={key = cS, char = cR, cleanup ={}} b3.remote[cN] = cW
local cX, c_, c0 = cH(cO)
local c5 =(cX == 'rods' or cX == 'fish') and ci(cX, c_) or nil
if c5 then
    local c6 = cs(cX, c5, cX == 'fish' and(c0 or 0) or 0, cX == 'rods' and(c0 or 1) or 1)
    if c6 and b3.remote[cN] == cW and cR.Parent then
        c6.model.Name = 'SenaVisualRemote' c6.model.Parent = cR table.insert(cW.cleanup,(cX == 'rods' and cx or cz)(cR, c6.handle, c6)) table.insert(cW.cleanup,
        function() c6.model:Destroy()
    end
    )
    elseif
    c6 then
        c6.model:Destroy()
    end
end
c0, cS = cH(cP)
local c6 = c0 == 'rods' and ci('rods', cS) or nil
if c6 and b3.remote[cN] == cW then
    local c7 = cs('rods', c6, 0, 1)
    if c7 and b3.remote[cN] == cW and cR.Parent then
        local c8, c9 = ct(c7) c7.model:Destroy() cw(cR, c8, c9, c7) table.insert(cW.cleanup,
        function() c8:Destroy()
    end
    )
    elseif
    c7 then
        c7.model:Destroy()
    end
end
task.defer(b3.refreshQuality)
end
task.spawn(
function()
while n() do
    local cN = 6
    local function cO()
    if # d:GetPlayers() <= 1 then
        for cP in pairs(b3.remote) do
            cG(cP)
        end
        return
    end
    local cP = l.SenaBackend or{}
    local cQ = cP.Api or 'https://senahub.xyz/api'
    local cR = ''
    local cS = ''
    local cV = g.Character
    if cV then
        for cW, cX in ipairs(cV:GetChildren()) do
            local c_ = cX:IsA('Tool') and cX:GetAttribute('SenaVisual')
            if c_ then
                cR = c_..'|'..cX.Name..'|'..tostring(c_ == 'fish' and b3.fishWeight or b3.rodScale)
                break
            end
        end
        cS =
        if cV:FindFirstChild('SenaVisualBack') then
            if b3.backRod then
                'rods|'..b3.backRod.Name
                else
                cS
                else
                cS
            end
            local cW = b2:JSONDecode(game:HttpGet(string.format('%s/vstate?key=%s&job=%s&uid=%d&held=%s&back=%s', cQ, b2:UrlEncode(cP.Key or 'sena_20VvixjHsd1OPPwgHYJAstpM'),
            b2:UrlEncode(game.JobId), g.UserId, b2:UrlEncode(cR), b2:UrlEncode(cS)), true))
            if type(cW) ~= 'table' then
                return
                elseif
                cW.ok ~= true then
                    return
                end
                cN = tonumber(cW.poll) or 4
                local cX ={}
                for c_, c0 in pairs(cW.players or{}) do
                    local c5 = tostring(c_) cX[c5] = true cM(c5, tostring(c0.held or ''), tostring(c0.back or ''))
                end
                for c5 in pairs(b3.remote) do
                    if not cX[c5] then
                        cG(c5)
                    end
                end
            end
            pcall(cO) task.wait(cN)
        end
        for cN in pairs(b3.remote) do
            cG(cN)
        end
    end
    )
    local function cN()
    if not n() then
        return
    end
    task.wait(1.5)
    for cO, cP in pairs(b3.spawned) do
        pcall(b3.spawn, cP.kind, cP.label)
    end
end
g.CharacterAdded:Connect(cN)
return b3
end
)()
local b2 ={} do
    local b3 = game:GetService('HttpService') b2.hopFailed = false b2.lastHopAt = 0 pcall(
    function()
    local function b4(b5)
    if b5 == g then
        b2.hopFailed = true
    end
end
i.TeleportInitFailed:Connect(b4)
end
) b2.collectServers =
function(b4)
local b5 ={}
local b6 = ''
for b7 = 1, 3, 1 do
    local b9, ca = pcall(
    function()
    local b9 =([[https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true]]):format(game.PlaceId)
    return b3:JSONDecode(game:HttpGet(
    if b6 ~= '' then
        b9..'&cursor='..b6
        else
        b9))
    end
    )
    if b9 then
        if type(ca) ~= 'table' then
            break
        end
        else
        break
    end
    for ce, ci in ipairs(ca.data or{}) do
        if tostring(ci.id) ~= game.JobId and(ci.playing and(ci.maxPlayers and(ci.playing < ci.maxPlayers and(
        if b4 then
            ci.playing <= b4
            else
            not b4)))) then
                b5[# b5 + 1] ={id = tostring(ci.id), playing = ci.playing}
            end
        end
        b6 = ca.nextPageCursor or ''
        if b6 == '' then
            break
        end
    end
    table.sort(b5,
    function(b7, b9)
    return b7.playing < b9.playing
end
)
return b5
end
b2.hopToList =
function(b4)
if type(b4) ~= 'table' then
    return false
    elseif
    # b4 == 0 then
        return false
    end
    for b5, b6 in ipairs(b4) do
        b2.hopFailed = false
        if pcall(
        function() i:TeleportToPlaceInstance(game.PlaceId, b6.id, g)
    end
    ) then
        local b7 = os.clock()
        while true do
            local b9 = b2.hopFailed
            if not(
            if b9 then
                not b9
                else
                os.clock() - b7 < 6) then
                    break
                end
                task.wait(0.25)
            end
            if not b2.hopFailed then
                return true
            end
        end
        task.wait(0.3)
    end
    return false
end
b2.hopEmptiest =
function()
return b2.hopToList(b2.collectServers(nil))
end
b2.privateStatus = 'Pick a max player count, then Hop Server Now.' b2.privateMax =
function()
return math.max(1, math.floor(tonumber(tostring(aB.PrivateServerMax or '2'):match('%d+')) or 2))
end
b2.findPrivateTargets =
function()
local b4 = b2.privateMax()
local b5 = b2.collectServers(nil)
if # b5 == 0 then
    return nil
end
local b6 ={}
for b7, b9 in ipairs(b5) do
    if b9.playing + 1 <= b4 then
        b6[# b6 + 1] = b9
    end
end
if # b6 == 0 then
    local ca = b5[1].playing
    for ce, ci in ipairs(b5) do
        if ci.playing == ca then
            b6[# b6 + 1] = ci
        end
    end
end
local ca ={}
while # b6 > 0 and # ca < 5 do
    ca[# ca + 1] = table.remove(b6, math.random(1, # b6))
end
return ca
end
b2.hopPrivateOnce =
function()
local b4 = b2.privateMax()
local b5 = # d:GetPlayers()
if b5 <= b4 then
    b2.privateStatus = 'This server is good ('..b5..' player(s), max '..b4..').'
    return false
end
if b2.hubBusy() then
    b2.privateStatus = 'Waiting until you finish stealing...'
    return false
end
b2.privateStatus = 'Searching for a quieter server...'
local b6 = b2.findPrivateTargets()
if b6 then
    if # b6 == 0 then
        b2.privateStatus = 'Could not load the server list. Try again.'
        return false
    end
    else
    b2.privateStatus = 'Could not load the server list. Try again.'
    return false
end
b2.privateStatus = 'Teleporting...' b2.lastHopAt = os.clock()
if b2.hopToList(b6) then
    return true
end
b2.privateStatus = 'Teleport failed. Trying again soon.'
return false
end
b2.startPrivateAutoHop =
function()
if b2.privateAutoRunning then
    return
end
b2.privateAutoRunning = true task.spawn(
function()
while n() and aB.PrivateServerAuto do
    local b4 = b2.privateMax()
    if # d:GetPlayers() <= b4 then
        b2.privateStatus = 'Good server found. Waiting...' task.wait(3)
        else
        b2.hopPrivateOnce() task.wait(5)
    end
end
b2.privateAutoRunning = false
if not aB.PrivateServerAuto then
    b2.privateStatus = 'Auto hop stopped.'
end
end
)
end
b2.hubBusy =
function()
if aB.IsPlacing then
    return true
end
local b4 = l.__SenaV4EggRuntime
if b4 then
    if b4.running then
        return true
        elseif
        b4.travelBusy then
            return true
            elseif
            b4.carry then
                if b4.carry.active then
                    return true
                end
            end
        end
        local b5 = l.__SenaV4PlayerSteal
        if b5 and b5.running then
            return true
        end
        return false
    end
    b2.startHopLoop =
    function()
    if b2.hopLoopRunning then
        return
    end
    b2.hopLoopRunning = true task.spawn(
    function()
    while n() do
        task.wait(2)
        if aB.HopNoMatch and not b2.hubBusy() then
            local b4 = tonumber(aB.HopCooldown) or 5
            if os.clock() - b2.lastHopAt > b4 then
                local b5 = l.__SenaV4EggRuntime
                local b6 = b5 and b5.stats and b5.stats.matching or 0
                if aB.AutoSteal and(b6 <= 0 and not aH()) then
                    b2.lastHopAt = os.clock() b2.hopEmptiest()
                end
            end
        end
    end
    b2.hopLoopRunning = false
end
)
end
b2.startAntiTreadmillLoop =
function()
if b2.antiTreadmillRunning then
    return
end
b2.antiTreadmillRunning = true task.spawn(
function()
while n() do
    if aB.AntiTreadmill then
        local b4 = l.__SenaV4TreadmillManager pcall(
        function()
        if b4 and b4.activeTreadmill ~= nil then
            b4:_cancelIdle(true) b4:_requestUnequip()
        end
    end
    )
    local b5 = g.Character
    local b6 = b5 and b5:FindFirstChild('HumanoidRootPart')
    if b6 and b6.Anchored then
        pcall(
        function() b6.Anchored = false
    end
    )
end
end
task.wait(0.3)
end
b2.antiTreadmillRunning = false
end
)
end
b2.setBackpackRates =
function(b4) aB.BackpackRateEsp = b4 == true
if b2.backpackRatesRunning then
    return
end
b2.backpackRatesRunning = true task.spawn(
function()
local b5, b6 pcall(
function() b5 = require(e.Shared.Util.EggRecords) b6 = require(e.Shared.Save)
end
)
while n() do
    local b7 pcall(
    function() b7 = g.PlayerGui.BackpackGui.Backpack.Main.Inventory.ScrollingFrame
end
)
local b9 = l.__SenaV4Webhook
local ca = b7 and b7.Parent:FindFirstChild('SenaDiscord')
if b7 and aB.BackpackRateEsp and not ca then
    local ce = Instance.new('TextLabel') ce.Name = 'SenaDiscord' ce.BackgroundTransparency = 1 ce.Position = UDim2.new(0.34, 0, 0.017, 0) ce.Size = UDim2.new(0.3,
    0, 0.09, 0) ce.Font = Enum.Font.GothamBlack ce.Text = 'LUKZ' ce.TextScaled = true ce.TextXAlignment = Enum.TextXAlignment.Left ce.TextColor3 = Color3.fromRGB(255,
    255, 255) ce.TextStrokeTransparency = 0 ce.ZIndex = 40 ce.Parent = b7.Parent
    elseif
    ca then
        if not aB.BackpackRateEsp then
            ca:Destroy()
        end
    end
    if b7 then
        local ce ={}
        if aB.BackpackRateEsp and b5 and b6 and b9 then
            local ci =(b6.Peek or b6.Get)()
            for cl, cp in pairs(ci and ci.EggInventory or{}) do
                ci, cl = pcall(b5.DisplayNameWithWeight, cp)
                if ci and type(cl) == 'string' then
                    ce[cl] = ce[cl] or{} table.insert(ce[cl], cp)
                end
            end
        end
        local ci ={}
        for cl, cp in ipairs(b7:GetChildren()) do
            local cq = cp:IsA('GuiButton') and cp:FindFirstChild('ToolName')
            if cq then
                local cr = cq.Text
                local cs =(ci[cr] or 0) + 1
                local ct = ce[cr] and ce[cr][cs]
                local cw = cp:FindFirstChild('SenaRate')
                if ct then
                    ci[cr] = cs
                    if cw then
                        else
                        cw = Instance.new('TextLabel') cw.Name = 'SenaRate' cw.BackgroundColor3 = Color3.fromRGB(0, 0, 0) cw.BackgroundTransparency = 0.35 cw.BorderSizePixel = 0 cw.Position = UDim2.new(0.04,
                        0, 0, 3) cw.Size = UDim2.new(0.92, 0, 0.24, 0) cw.Font = Enum.Font.GothamBlack cw.TextScaled = true cw.TextColor3 = Color3.fromRGB(73, 211, 31) cw.TextStrokeTransparency = 0 cw.ZIndex = 40
                        local cx = Instance.new('UICorner') cx.CornerRadius = UDim.new(0, 6) cx.Parent = cw
                        local cz = Instance.new('UITextSizeConstraint') cz.MaxTextSize = 20 cz.Parent = cw cw.Parent = cp
                    end
                    cw.Text = b9.compact(b9.rateOf(ct))..'/s'
                    elseif
                    cw then
                        cw:Destroy()
                    end
                end
            end
        end
        if not aB.BackpackRateEsp then
            break
        end
        task.wait(1)
    end
    b2.backpackRatesRunning = false
end
)
end
end
(
function()
local b3, b4, b5, b6, b7 ={status = 'Disabled', banner = 'Unknown', rotation = 0, pity = 0, pityMax = 100, free = 0, trades = 0, demands = '-', stock = '-',
ready = 0, total = 3, missing = 'None', cache = nil, cacheAt = 0, lastReroll = 0} pcall(
function() b4 = require(e.Data.Assets).Directory
end
) pcall(
function() b5 = require(e.Shared.Util.AssetItems)
end
) pcall(
function() b6 = require(e.Shared.Util.AssetEarnings)
end
) pcall(
function() b7 = require(e.Shared.Save)
end
)
local function b9()
local ca, ce = pcall(
function()
return require(e.Shared.Remotes).ScrambleTradeIn
end
)
return ca and ce or nil
end
local function ca()
return aB.ScrambleTradeInTrade or aB.ScrambleTradeInReroll
end
local function ce(ci)
return((tostring(ci or ''):lower():match('^%s*(.-)%s*$') or ''):gsub('%s*egg$', ''))
end
local function ci(cl, cp)
if type(cl) ~= 'string' then
    return false
    elseif
    type(cp) ~= 'string' then
        return false
    end
    if cl == cp then
        return true
    end
    local cq = ce(cl)
    local cr = ce(cp)
    return cq ~= '' and cq == cr
end
b3.matches = ci
local function cl(cp)
local cq = b4 and b4[cp]
local cr = type(cq) == 'table' and cq.DisplayName
return type(cr) == 'string' and cr ~= '' and cr or tostring(cp)
end
local function cp(cq, cr)
local cs ={}
for ct, cw in ipairs(cq) do
    cs[ct] = cl(cw)
end
return table.concat(cs, cr)
end
b3.state =
function(cq)
local cr = os.clock()
if not cq and(b3.cache and cr - b3.cacheAt < 12) then
    return b3.cache
end
local cs = b9()
if not(cs and cs.AskState) then
    return b3.cache
end
local ct, cw = pcall(
function()
return cs.AskState:InvokeServer()
end
)
if ct and type(cw) == 'table' then
    b3.cache = cw b3.cacheAt = cr
end
return b3.cache
end
local function cq(cr)
local cs = aB.ScrambleTradeInBanners
if type(cs) ~= 'table' then
    return true
    elseif
    # cs == 0 then
        return true
    end
    if cr then
        if not cr.BannerId then
            return true
        end
        else
        return true
    end
    local ct = ce(cr.BannerId)
    local cw = ce(cr.BannerDisplayName)
    for cx, cz in ipairs(cs) do
        local cE = ce(cz)
        if cE == ct then
            return true
            elseif
            cw ~= '' then
                if cE == cw then
                    return true
                end
            end
        end
        return false
    end
    local function cr(cs)
    return cs and type(cs.Requirements) == 'table' and cs.Requirements or{}
end
local function cs()
local ct
if b7 then
    pcall(
    function() ct =(b7.Peek or b7.Get)()
end
)
end
return ct
end
local function ct(cw)
local cx ={}
if not cw then
    return cx
end
for cz, cE in pairs(cw.EggInventory or{}) do
    if type(cE) == 'table' and(cE.AssetCategory and(cE.Placement == nil and not cE.IsFavorite)) then
        cx[# cx + 1] ={uid = cz, category = cE.AssetCategory}
    end
end
return cx
end
local function cw(cx, cz)
local cE = ct(cz)
local cG ={}
local cH ={}
local cM ={}
for cN, cO in ipairs(cx) do
    cz = nil
    for cP, cQ in ipairs(cE) do
        if not cG[cQ.uid] and ci(cQ.category, cO) then
            cz = cQ
            break
        end
    end
    if cz then
        cG[cz.uid] = true cH[cN] = cz
        else
        cM[# cM + 1] = cO
    end
end
return cH, cM, cE
end
b3.selectEggs = cw
local function cx(cz, cE, cG)
local cH ={}
local cM ={}
for cN, cO in ipairs(cz) do
    if not cH[cO] then
        cM[# cM + 1] = cO
    end
    cH[cO] =(cH[cO] or 0) + 1
end
local cP ={}
for cQ, cR in ipairs(cM) do
    cQ = 0
    for cS, cV in ipairs(cG) do
        cQ =
        if ci(cV.category, cR) then
            cQ + 1
            else
            cQ
        end
        cP[# cP + 1] = string.format('%s %d/%d', cl(cR), math.min(cQ, cH[cR]), cH[cR])
    end
    return table.concat(cP, '  ')
end
local function cz()
local cE = g.Character and g.Character:FindFirstChild('HumanoidRootPart')
if not cE then
    return false
end
local cG = k()
local cH = cG and cG:FindFirstChild('Machines')
local cM = cH and cH:FindFirstChild('RiftMachine')
local cP = cM and cM:FindFirstChild('Machine') cE.CFrame = cP and cP:IsA('BasePart') and cP.CFrame * CFrame.new(0, cP.Size.Y * 0.5 + 3, 4) or CFrame.new(533.4,
72, - 330) cE.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
return true
end
b3.teleport = cz b3.openUI =
function()
return(pcall(
function() require(e.Client.Tabs).Activate('DrScrambleTradeIn')
end
))
end
local function cE(cG, cH)
local cM = b9()
if not(cM and cM.AskTradeIn) then
    return false, 'Trade remote unavailable'
end
local cP ={}
for cQ = 1, # cG, 1 do
    local cR = cH[cQ]
    if not cR then
        return false, 'Requirements incomplete'
    end
    cP[# cP + 1] = cR.uid
end
b3.status = "Placing eggs into Dr Scramble's Lab" cH, cG = pcall(
function()
return cM.AskTradeIn:InvokeServer(cP)
end
)
if(
if cH then
    cG == false
    else
    not cH) and cz() then
        task.wait(0.3) cH, cG = pcall(
        function()
        return cM.AskTradeIn:InvokeServer(cP)
    end
    )
end
if
if cH then
    cG == false
    else
    not cH then
        return false, tostring(cG or 'Trade rejected')
    end
    pcall(
    function()
    if cM.AskFinishReveal then
        cM.AskFinishReveal:InvokeServer()
    end
end
) b3.trades = b3.trades + 1 b3.state(true)
return true
end
b3.tradeOnce =
function()
local cG = cr(b3.state(true))
if # cG < 3 then
    return false, 'Cannot read the recipe'
end
local cH, cM = cw(cG, cs())
if # cM > 0 then
    return false, 'Missing: '..cp(cM, ', ')
end
return cE(cG, cH)
end
b3.reroll =
function()
local cG = b3.state(false)
local cH = tonumber(cG and cG.FreeRefreshesRemaining)
if cH then
    if cH <= 0 then
        return false, 'No free rerolls left'
    end
    else
    return false, 'No free rerolls left'
end
local cM = b9()
if not(cM and cM.AskRefresh) then
    return false, 'Refresh remote unavailable'
end
if not pcall(
function()
return cM.AskRefresh:InvokeServer()
end
) then
    return false, 'Reroll failed'
end
b3.state(true)
return true
end
local function cG(cH)
local cM = l.__SenaV4EggRuntime
if cM and type(cM.setScrambleWants) == 'function' then
    pcall(cM.setScrambleWants, cM, cH or{}, false)
end
end
local function cH() cG({})
end
b3.clearSteal = cH b3.tick =
function()
local cM = b3.state(true)
if not cM then
    b3.status = 'Trade-In state unavailable' cH()
    return
end
if cM.Unlocked == false then
    b3.status = 'Dr Scramble Trade-In is locked' cH()
    return
end
b3.banner = tostring(cM.BannerDisplayName or cM.BannerId or 'Unknown') b3.rotation = math.max(0, math.floor(tonumber(cM.SecondsUntilRotation) or 0)) b3.pity = tonumber(cM.PityCount) or 0 b3.pityMax = tonumber(cM.PityThreshold) or 100 b3.free = tonumber(cM.FreeRefreshesRemaining) or 0
if cM.PendingReward then
    b3.status = 'Finishing reward'
    local cP = b9() pcall(
    function()
    if cP and cP.AskFinishReveal then
        cP.AskFinishReveal:InvokeServer()
    end
end
) b3.cache = nil
return
end
if not cq(cM) then
    b3.status = 'Waiting for banner (now: '..b3.banner..')' b3.demands = '-' b3.stock = '-' b3.ready = 0 b3.missing = 'None' cH()
    return
end
local cP = cr(cM)
local cQ = tostring(cM.BannerId or '?')..'|'..table.concat(cP, ',')
if cQ ~= b3.recipeSig then
    b3.recipeSig = cQ cH()
end
b3.total = # cP b3.demands = # cP > 0 and cp(cP, ' / ') or '-'
if # cP < 3 then
    b3.status = 'Waiting for requirements' cH()
    return
end
local cR = cs()
local cS, cV, cW = cw(cP, cR) b3.stock = cx(cP, cR, cW) b3.ready = # cP - # cV b3.missing = # cV > 0 and cp(cV, ', ') or 'None'
if # cV == 0 then
    cH()
    if aB.ScrambleTradeInTrade then
        b3.status = 'Requirements complete, placing + trading' cQ, cW = cE(cP, cS) b3.status = cQ and 'Trade complete' or 'Trade: '..tostring(cW)
        else
        b3.status = 'Ready to trade (Auto Trade-In is off)'
    end
    return
end
if aB.ScrambleTradeInTrade then
    cG(cV)
    else
    cH()
end
if aB.ScrambleTradeInReroll and(b3.free > 0 and os.clock() - b3.lastReroll > 3) then
    b3.lastReroll = os.clock() b3.status = 'Rerolling the recipe' b3.reroll()
    return
end
b3.status = 'Stealing required eggs: '..b3.missing
end
task.spawn(
function()
while n() do
    if ca() then
        local cM, cP = pcall(b3.tick)
        if not cM then
            b3.status = 'Trade-In error: '..tostring(cP)
        end
        else
        if b3.status ~= 'Disabled' then
            b3.status = 'Disabled'
        end
        cH()
    end
    task.wait(10)
end
end
) l.__SenaV4ScrambleTradeIn = b3
end
)();
(
function()
local b3 = game:GetService('Players')
local b4 = game:GetService('ReplicatedStorage')
local b5 = game:GetService('Workspace')
local b6 = b3.LocalPlayer
local b7 = require(b4.Shared.Remotes)
local b9 = require(b4.Shared.Save)
local ca = require(b4.Shared.Flags.ScrambleBossFlags)
local ce = b7.ScrambleBoss
local ci ={} ci.__index = ci
local cl = 'auto_scramble_boss'
local cp = 'ScrambleArena'
local cq = 'ScrambleArenaPortal'
local cr = 0.05
local cs = 0.5
local ct = 1
local cw = 7
local cx = 250
local cz = 250
local cE = 225
local cG = 0.75
local cH = 13
local cM = 1.5
local cP = 1.5
local cQ = 0.75
local cR = 0.08
local cS = 0.25
local cV = 18
local cW = 5
local cX = 10
local c0 = 5
local c5 = 3.25
local function c6(c7, c8)
if type(c7) ~= 'table' then
    return c8
end
if type(c7.Get) == 'function' then
    local c9, da = pcall(c7.Get, c7)
    if c9 and da ~= nil then
        return da
    end
end
local c9 = rawget(c7, 'Value')
if c9 ~= nil then
    return c9
end
return c8
end
local function c7(c8)
return Vector3.new(c8.X, 0, c8.Z)
end
local c8 =(
function()
local c8
local function c9()
if c8 then
    return c8
end
local da ={} pcall(
function()
for db, dc in ipairs(b4.Data.Gears.Configs:GetChildren()) do
    local dd, de = pcall(require, dc)
    if dd and type(de) == 'table' and type(de.BatControllerData) == 'table' then
        for df, dg in ipairs({dc.Name, de._id, de.DisplayName, de.ToolModel}) do
            if type(dg) == 'string' then
                da[dg:lower()] = true
            end
        end
    end
end
end
)
if next(da) then
    c8 = da
end
return da
end
return
function(da)
if da then
    if not da:IsA('Tool') then
        return false
    end
    else
    return false
end
if da:GetAttribute('IsBat') == true then
    return true
end
local db = da:GetAttribute('ItemType')
if db ~= nil and db ~= 'Gear' then
    return false
end
local dc = c9()
local dd = tostring(da:GetAttribute('GearName') or ''):lower()
local de = tostring(da.Name or ''):gsub('%s*%[.-%]%s*$', ''):lower()
if dc[dd] then
    return true
    elseif
    dc[de] then
        return true
    end
    return db == 'Gear' and(dd:find('bat', 1, true) ~= nil or de:find('bat', 1, true) ~= nil)
end
end
)() l.__SenaV4IsBatTool = c8
local function c9(da, db)
if da then
    if not da:IsA('BasePart') then
        return 1 / 0
    end
    else
    return 1 / 0
end
local dc = da.CFrame:PointToObjectSpace(db)
local dd = da.Size * 0.5
local de = Vector3.new(math.clamp(dc.X, - dd.X, dd.X), math.clamp(dc.Y, - dd.Y, dd.Y), math.clamp(dc.Z, - dd.Z, dd.Z))
return(da.CFrame:PointToWorldSpace(de) - db).Magnitude
end
local function da(db)
if not db then
    return nil
end
local dc = db:FindFirstChild('Hitbox', true)
if dc and dc:IsA('BasePart') then
    return dc
end
for dd, de in ipairs(db:GetDescendants()) do
    if de:IsA('TouchTransmitter') and(de.Parent and de.Parent:IsA('BasePart')) then
        return de.Parent
    end
end
if db:IsA('BasePart') then
    return db
end
return db:FindFirstChildWhichIsA('BasePart', true)
end
local function db()
local dc, dd = type(b9) == 'table' and(b9.Get or b9.Peek) or nil
if dc then
    local de, df = pcall(dc) dd =
    if de then
        if type(df) ~= 'table' then
            {}
            else
            df
            else
            {}
            else
            dd ={}
        end
        local de = type(dd.Scramble) == 'table' and dd.Scramble or{}
        local df = tostring(c6(ca.SamplesWalletId, 'DrScrambleBoss'))
        local dg = type(de.Wallets) == 'table' and de.Wallets or{}
        local dh = type(dd.ScrambleFinalHits) == 'table' and dd.ScrambleFinalHits or{}
        return{mastery = math.max(tonumber(de.Mastery) or 0, 0), samples = math.max(tonumber(dg[df]) or 0, 0), walletId = df, finalHits = math.max(tonumber(dh.Total) or 0,
        0), mecha = dd.MechaScramblerObtained == true}
    end
    ci.new =
    function(dc, dd)
    local de = setmetatable({}, ci) de.coordinator = dc de.eggRuntime = dd de.enabled = false de.destroyed = false de.worker = nil de.operationToken = nil de.listeners ={} de.connections ={} de.status = 'Off' de.rewardLabel = '--' de.finalHitLabel = '--' de.activeArena = nil de.rewardBaseline = nil de.cachedReward = db() de.nextRewardPollAt = 0 de.defeatedAt = nil de.rewardAcknowledged = false de.exitRequested = false de.lastPhase = '' de.lastSwingAt = 0 de.swingSequence = 0 de.lastBatRequestAt = 0 de.lastEnterAttemptAt = 0 de.lastPortalTouchAt = 0 de.lastExitTouchAt = 0 de.lastGrabEscapeAt = 0 de.safePreflightReady = false de.glideTravelActive = false de.glideHoldActive = false de.lastSnapshotSignature = nil table.insert(de.connections,
    b6.CharacterAdded:Connect(
    function() de:_restoreCharacterControl()
    if de.enabled then
        de:_setStatus('Respawned - rejoining boss')
    end
end
)) de:_ensureWorker()
return de
end
ci._arena =
function(dc)
local dd = b5:FindFirstChild(cp)
return dd and dd:IsA('Model') and dd or nil
end
ci._portal =
function(dc)
return b5:FindFirstChild(cq)
end
ci._inArena =
function(dc)
if b6:GetAttribute('InScrambleArena') == true then
    return true
end
local dd = dc:_arena()
local de = dd and dd:GetAttribute('Center')
local df = b6.Character and b6.Character:FindFirstChild('HumanoidRootPart')
if df then
    if not(typeof(de) == 'Vector3') then
        return false
    end
    else
    return false
end
return(df.Position - de).Magnitude <(tonumber(dd:GetAttribute('Radius')) or 450) + 80
end
ci._isResetWallOpen =
function(dc)
local dd = dc.eggRuntime
if dd and type(dd._wallOpen) == 'function' then
    local de, df = pcall(dd._wallOpen, dd)
    if de then
        return df == true
    end
end
return true
end
ci._eventPresent =
function(dc)
local dd = dc:_arena()
local de = dd and tostring(dd:GetAttribute('Phase') or '') or ''
local df = dc:_inArena()
local dg = dc:_portal() ~= nil
if dd and de == 'Defeated' then
    if df then
        elseif
        dg then
            else
            return false
        end
    end
    return df or dg or dd ~= nil and de ~= 'Defeated' or b5:GetAttribute('Event_ScrambleBoss') == true
end
ci.isFightPending =
function(dc)
local dd = dc.destroyed
return(
if dd then
    not dd
    else
    dc.enabled) and dc:_eventPresent()
end
ci._countdown =
function(dc)
local dd = b5:GetServerTimeNow()
local de = dc:_arena()
local df = de and tonumber(de:GetAttribute('SpawnsAt')) or 0
if de and(tostring(de:GetAttribute('Phase') or '') == 'Waiting' and df > dd) then
    return 'Starts in', math.max(0, df - dd)
end
if dc:_portal() then
    return 'Portal', 0
end
if dc:_inArena() then
    return 'Fight', 0
    elseif
    de then
        return 'Fight', 0
    end
    local dg = math.max(tonumber(c6(ca.ScheduleIntervalSeconds, 1800)) or 1800, 1) de = math.ceil(dd / dg) * dg
    local dh =
    if de <= dd + 0.01 then
        de + dg
        else
        de
        return 'Starts in', math.max(0, dh - dd)
    end
    ci._refreshReward =
    function(dc, dd)
    if dd ~= true and os.clock() < dc.nextRewardPollAt then
        return dc.cachedReward
    end
    dc.nextRewardPollAt = os.clock() + cS dc.cachedReward = db()
    return dc.cachedReward
end
ci._snapshot =
function(dc)
local dd = dc:_arena()
local de, df, dg = dd and tostring(dd:GetAttribute('Phase') or 'Waiting') or 'Waiting', dc:_countdown()
local dh = dc:_refreshReward(false)
local di = dd and dd:FindFirstChild('Mech')
return{enabled = dc.enabled, pending = dc:isFightPending(), eventActive = b5:GetAttribute('Event_ScrambleBoss') == true or dd ~= nil, portalOpen = dc:_portal() ~= nil,
inArena = dc:_inArena(), phase = de, status = dc.status, countdownLabel = df, countdownSeconds = dg, health = dd and math.max(tonumber(dd:GetAttribute('Health')) or 0,
0) or 0, maxHealth = dd and math.max(tonumber(dd:GetAttribute('MaxHealth')) or 0, 0) or 0, overheated = di and di:GetAttribute('Overheated') == true or false,
coreHealth = dd and math.max(tonumber(dd:GetAttribute('CoreHealth')) or 0, 0) or 0, coreMax = dd and math.max(tonumber(dd:GetAttribute('CoreMax')) or 0,
0) or 0, coreStage = dd and math.max(tonumber(dd:GetAttribute('CoreStage')) or 0, 0) or 0, humanHits = dd and math.max(tonumber(dd:GetAttribute('HumanHits')) or 0,
0) or 0, humanNeeded = dd and math.max(tonumber(dd:GetAttribute('HumanNeeded')) or tonumber(c6(ca.HumanHits, 3)) or 3, 1) or tonumber(c6(ca.HumanHits, 3)) or 3,
mastery = dh.mastery, samples = dh.samples, reward = dc.rewardLabel, finalHit = dc.finalHitLabel}
end
ci._emit =
function(dc, dd)
if next(dc.listeners) == nil then
    return
end
local de = dc:_snapshot()
local df = table.concat({tostring(de.enabled), tostring(de.pending), tostring(de.eventActive), tostring(de.portalOpen), tostring(de.inArena), tostring(de.phase),
tostring(de.status), tostring(math.floor(de.countdownSeconds)), tostring(de.health), tostring(de.maxHealth), tostring(de.overheated), tostring(de.coreHealth),
tostring(de.coreMax), tostring(de.coreStage), tostring(de.humanHits), tostring(de.humanNeeded), tostring(de.mastery), tostring(de.samples), tostring(de.reward),
tostring(de.finalHit)}, '\0')
if dd ~= true and df == dc.lastSnapshotSignature then
    return
end
dc.lastSnapshotSignature = df
for dg in pairs(dc.listeners) do
    pcall(dg, de)
end
end
ci.subscribe =
function(dc, dd)
if type(dd) ~= 'function' then
    return
    function()
end
end
dc.listeners[dd] = true dc.lastSnapshotSignature = nil pcall(dd, dc:_snapshot())
return
function() dc.listeners[dd] = nil
end
end
ci.onChanged = ci.subscribe ci._setStatus =
function(dc, dd)
local de = tostring(dd or 'Idle')
if dc.status == de then
    return
end
dc.status = de dc:_emit(true)
end
ci._releaseOperation =
function(dc)
local dd = dc.operationToken dc.operationToken = nil
if dd and dc.coordinator then
    dc.coordinator:release(dd)
end
end
ci._acquireOperation =
function(dc)
if dc.operationToken and not dc.operationToken.released then
    return true
end
if not dc.coordinator then
    return true
end
local dd, de = dc.coordinator:tryAcquire(cl,{})
if dd then
    else
    if tostring(de) == 'Busy: auto_steal' then
        local df = dc.eggRuntime
        if df ~= nil then
            if df.running then
                else
                if df.carry and df.carry.active then
                    else
                    if df._instantReturnToken == nil then
                        if df.safeStarting then
                            else
                            if df.activeTween and not df.activeTween.sharedTravel then
                                else
                                if type(df._releaseOperation) == 'function' then
                                    pcall(df._releaseOperation, df) dd, de = dc.coordinator:tryAcquire(cl,{})
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
if not dd then
    dc:_setStatus('Waiting - '..tostring(de or 'another operation'))
    return false
end
dc.operationToken = dd
return true
end
ci._character =
function(dc)
local dd = b6.Character
local de = dd and dd:FindFirstChildOfClass('Humanoid')
local df = dd and dd:FindFirstChild('HumanoidRootPart')
if dd then
    if de then
        if df then
            if de.Health <= 0 then
                return nil, nil, nil
            end
            else
            return nil, nil, nil
        end
        else
        return nil, nil, nil
    end
    else
    return nil, nil, nil
end
return dd, de, df
end
ci._stopMovement =
function(dc, dd)
if not dc.glideTravelActive and(not dc.glideHoldActive and not dc:_inArena()) then
    dc.glideTravelActive = false dc.glideHoldActive = false
    return
end
local de = dd or b6.Character and b6.Character:FindFirstChild('HumanoidRootPart')
if de then
    pcall(
    function() de.AssemblyLinearVelocity = Vector3.new(0, 0, 0) de.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
)
end
local df = dc.eggRuntime
if df and type(df._stopHoverPad) == 'function' then
    df:_stopHoverPad()
end
dc.glideTravelActive = false dc.glideHoldActive = false
end
ci._restoreCharacterControl =
function(dc) dc.safePreflightReady = false dc:_stopMovement()
end
ci._glideTo =
function(dc, dd, de, df, dg, dh)
if typeof(dd) ~= 'CFrame' then
    return false, nil, nil
end
local di, dj, dk = dc:_character()
if dj then
    if not dk then
        return false, dj, dk
    end
    else
    return false, dj, dk
end
local dl = math.max(tonumber(df) or 3, 0)
local dq = dc.eggRuntime
if(dk.Position - dd.Position).Magnitude <= dl then
    if dh == true then
        if dq then
            if type(dq._startHoverPad) == 'function' then
                dq:_startHoverPad() dc.glideHoldActive = true
                else
                dc:_stopMovement(dk)
            end
            else
            dc:_stopMovement(dk)
        end
        else
        dc:_stopMovement(dk)
    end
    return true, dj, dk
end
if dq then
    if type(dq.travelAndWait) ~= 'function' then
        return false, dj, dk
    end
    else
    return false, dj, dk
end
dc.glideTravelActive = true
local dr = dk.Position
local ds = dq:travelAndWait(dd,{speed = de, preempt = true, arrivalHoldSeconds = 0, keepHoverPad = dh == true, abort =
function()
local ds = b6.Character and b6.Character:FindFirstChild('HumanoidRootPart')
if ds then
    local dt =(ds.Position - dr).Magnitude > 150 dr = ds.Position
    if dt then
        return true
    end
end
return dc.destroyed or not dc.enabled or b6:GetAttribute('ScrambleGrabbed') == true or dg ~= nil and dg()
end
}) dc.glideTravelActive = false dk, df, dq = dc:_character()
local dt = dq and(dq.Position - dd.Position).Magnitude <= dl
local du = ds == true and dt == true
if dh == true and du then
    dc.glideHoldActive = true
    elseif
    dh == true then
        dc.glideHoldActive = true dc:_stopMovement(dq)
    end
    return du, df, dq
end
ci._approachPart =
function(dc, dd, de, df, dg, dh)
if not(de and de:IsA('BasePart')) then
    return false, nil, nil
end
local di, dj, dk = dc:_character()
if dj then
    if not dk then
        return false, dj, dk
    end
    else
    return false, dj, dk
end
dj = de.Position
local dl =
if dg then
    if dg > 0 then
        dj + c7(de.AssemblyLinearVelocity) * dg
        else
        dj
        else
        dj dg = c7(dk.Position - dl) dg =
        if dg.Magnitude < 0.1 then
            c7(- de.CFrame.LookVector)
            else
            dg
            local dq =
            if dg.Magnitude < 0.1 then
                Vector3.new(1, 0, 0)
                else
                dg
                local dr = tonumber(dd:GetAttribute('FloorY')) or dk.Position.Y - c5
                local ds = Vector3.new(dl.X, dr + c5 +(tonumber(dh) or 0), dl.Z) + dq.Unit * df
                local dt = tostring(dd:GetAttribute('Phase') or '') dc:_glideTo(CFrame.lookAt(ds, Vector3.new(dl.X, ds.Y, dl.Z)), cz, 2.5,
                function()
                local du = dc:_inArena()
                return(
                if du then
                    dc:_arena() ~= dd
                    else
                    not du) or not de.Parent or tostring(dd:GetAttribute('Phase') or '') ~= dt
                end
                , true) ds, dh, dg = dc:_character()
                return dg ~= nil and c9(de, dg.Position) <= cH, dh, dg
            end
            ci._findBat =
            function(dc)
            local dd = b6.Character
            local de = b6:FindFirstChildOfClass('Backpack')
            if dd then
                for df, dg in ipairs(dd:GetChildren()) do
                    if c8(dg) then
                        return dg, true
                    end
                end
            end
            if de then
                for df, dg in ipairs(de:GetChildren()) do
                    if c8(dg) then
                        return dg, false
                    end
                end
            end
            return nil, false
        end
        ci._equipBat =
        function(dc)
        local dd, de = dc:_character()
        if dd then
            if not de then
                return nil
            end
            else
            return nil
        end
        local df, dg = dc:_findBat()
        if not df then
            local dh = os.clock()
            if dh - dc.lastBatRequestAt >= cM then
                dc.lastBatRequestAt = dh pcall(
                function()
                if b7.Codex and b7.Codex.AskWearFieldBat then
                    b7.Codex.AskWearFieldBat:InvokeServer()
                end
            end
            )
        end
        return nil
    end
    if dg and df.Parent == dd then
        return df
    end
    pcall(de.EquipTool, de, df)
    return df.Parent == dd and df or nil
end
ci._faceTarget =
function(dc, dd, de)
if not dd or not de then
    return false
end
local df = Vector3.new(de.Position.X, dd.Position.Y, de.Position.Z)
if(df - dd.Position).Magnitude <= 0.05 then
    return false
end
return(pcall(
function() dd.CFrame = CFrame.lookAt(dd.Position, df) dd.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end
))
end
ci._swing =
function(dc, dd)
local de, df, dg = dc:_character()
if dg then
    if not dd then
        return false
        elseif
        c9(dd, dg.Position) > cH then
            return false
        end
        else
        return false
    end
    dc:_faceTarget(dg, dd)
    local dh = b5:GetServerTimeNow()
    if dh - dc.lastSwingAt < cG then
        return false
    end
    local di = dc:_equipBat()
    if not di then
        dc:_setStatus('Waiting for Bat')
        return false
    end
    dc.lastSwingAt = dh pcall(di.Activate, di)
    local dj = di:FindFirstChild('Handle') or di:FindFirstChildWhichIsA('BasePart', true)
    if dj and type(firetouchinterest) == 'function' then
        pcall(
        function() firetouchinterest(dj, dd, 0) task.wait(0.02) firetouchinterest(dj, dd, 1)
    end
    )
end
dc.swingSequence =(dc.swingSequence or 0) + 1 pcall(
function()
if b7.BatSwing and b7.BatSwing.Trigger then
    b7.BatSwing.Trigger:FireServer(nil, string.format('%d:%d:%d', b6.UserId, dc.swingSequence, math.floor(dh * 1000)))
end
end
)
return true
end
ci._touch =
function(dc, dd, de)
if not dd or not de then
    return false
    elseif
    type(firetouchinterest) ~= 'function' then
        return false
    end
    return(pcall(
    function() firetouchinterest(dd, de, 0) task.wait(0.03) firetouchinterest(dd, de, 1)
end
))
end
ci._preparePortalEntry =
function(dc)
if dc.safePreflightReady then
    return true
    elseif
    dc:_inArena() then
        return true
    end
    local dd, de, df = dc:_character()
    local dg = dc.eggRuntime
    if(
    if df then
        not dg
        else
        not df) or type(dg._isInSafeArea) ~= 'function' or type(dg._resolveSafeCFrame) ~= 'function' then
            dc:_setStatus('Waiting for Safe Zone route')
            return false
        end
        if dg:_isInSafeArea(df) then
            dc.safePreflightReady = true
            return true
        end
        local dh = dg:_resolveSafeCFrame(df)
        if not dh then
            return false
        end
        dc:_setStatus('Gliding to Safe Zone before boss')
        local di, dj, dk = dc:_glideTo(dh, cx, 8,
        function()
        return dc:_inArena() or not dc:_eventPresent()
    end
    ) dc.safePreflightReady = di and dk ~= nil and dg:_isInSafeArea(dk)
    return dc.safePreflightReady
end
ci._tryEnterArena =
function(dc, dd)
if not dc:_isResetWallOpen() then
    dc:_setStatus('Boss portal ready - waiting reset wall')
    return
end
local de = dc:_portal()
local df = da(de)
local dg = false
if df then
    local dh = df.Position + Vector3.new(0, math.min(df.Size.Y * 0.25, 3), 0)
    local di = CFrame.lookAt(dh, df.Position) dc:_setStatus('Gliding to boss portal')
    local dj, dk, dl = dc:_glideTo(di, cx, 4,
    function()
    return dc:_inArena() or not dc:_isResetWallOpen() or not df.Parent or dc:_portal() ~= de
end
)
if dj then
    dc:_setStatus('Entering boss portal')
end
local dq = os.clock() <(dc.enterCooldownUntil or 0) or dc:_inArena()
if
if dq then
    not dq
    else
    dj or(dc.portalMisses or 0) > 0 then
        dc.portalMisses =(dc.portalMisses or 0) + 1
        if dc.portalMisses > 3 then
            dg = true
            else
            dc.lastPortalTouchAt = os.clock() dc.enterCooldownUntil = os.clock() + 3.5
            local dr = dl or select(3, dc:_character())
            if dr and dc:_isResetWallOpen() then
                pcall(
                function()
                if not df.CanTouch then
                    df.CanTouch = true
                end
            end
            ) dc:_touch(dr, df)
        end
    end
end
else
dg = dd ~= nil dc:_setStatus(dd and 'Joining active boss' or 'Waiting for boss portal')
end
if dg and(dc:_isResetWallOpen() and(not dc:_inArena() and(os.clock() - dc.lastEnterAttemptAt >= cP and os.clock() >=(dc.enterCooldownUntil or 0)))) then
    dc.lastEnterAttemptAt = os.clock() dc.enterCooldownUntil = os.clock() + 3.5
    local dh, di = pcall(
    function()
    if ce and ce.EnterArena then
        return ce.EnterArena:InvokeServer()
    end
end
)
if dh and di == true then
    dc.portalMisses = 0
    else
    local dj = dc.portalMisses
    if dj and dj > 3 then
        dc.portalMisses = 1
    end
end
end
end
ci._beginArena =
function(dc, dd)
if dc.activeArena == dd then
    return
end
dc.activeArena = dd dc.portalMisses = 0 dc.rewardBaseline = dc:_refreshReward(true) dc.defeatedAt = nil dc.rewardAcknowledged = false dc.exitRequested = false dc.rewardLabel = 'Pending' dc.finalHitLabel = 'No' dc.lastPhase = ''
end
ci._fightMech =
function(dc, dd)
local de = dd:FindFirstChild('Mech')
local df = de and de:FindFirstChild('Hitbox')
if df then
    if not df:IsA('BasePart') then
        dc:_setStatus('Waiting for Mech hitbox')
        return
    end
    else
    dc:_setStatus('Waiting for Mech hitbox')
    return
end
local dg = tonumber(dd:GetAttribute('GrabVictim')) or 0
local dh = de:FindFirstChild('GrabRescue')
if dg ~= 0 and(dg ~= b6.UserId and(dh and dh:IsA('BasePart'))) then
    local di = math.max(tonumber(dd:GetAttribute('GrabFree')) or 0, 0)
    local dj = math.max(tonumber(dd:GetAttribute('GrabNeeded')) or 1, 1) dc:_setStatus(string.format('Rescuing grabbed player - %d/%d', di, dj))
    if dc:_approachPart(dd, dh, c0, 0, 0) then
        dc:_swing(dh)
    end
    return
end
local di = math.max(tonumber(dd:GetAttribute('Health')) or 0, 0)
local dj = math.max(tonumber(dd:GetAttribute('MaxHealth')) or 0, 0)
local dk = de:GetAttribute('Overheated') == true dc:_setStatus(string.format('Mech %d/%d%s', math.floor(di + 0.5), math.floor(dj + 0.5), dk and ' - OVERHEAT' or ''))
if dc:_approachPart(dd, df, cV, 0.08, cW) and di > 0 then
    dc:_swing(df)
end
end
ci._fightBall =
function(dc, dd)
local de = dd:FindFirstChild('Ball')
if de then
    if not de:IsA('Model') then
        dc:_setStatus('Waiting for Scramble Core')
        return
    end
    else
    dc:_setStatus('Waiting for Scramble Core')
    return
end
local df = math.max(tonumber(dd:GetAttribute('CoreStage')) or 0, 0)
if dd:GetAttribute('BallStunned') == true and de:GetAttribute('Stunned') == true then
    local dg = de.PrimaryPart
    if dg then
        if not dg:IsA('BasePart') then
            dc:_setStatus('Waiting for Core PrimaryPart')
            return
        end
        else
        dc:_setStatus('Waiting for Core PrimaryPart')
        return
    end
    local dh = math.max(tonumber(dd:GetAttribute('CoreHealth')) or 0, 0)
    local di = math.max(tonumber(dd:GetAttribute('CoreMax')) or 0, 0) dc:_setStatus(string.format('Core %d/%d - stage %d/3', math.floor(dh + 0.5), math.floor(di + 0.5),
    df))
    if dc:_approachPart(dd, dg, cX, 0, 0) and dh > 0 then
        dc:_swing(dg)
    end
    return
end
local dg = tonumber(dd:GetAttribute('BallTarget')) or 0
local dh = tostring(dd:GetAttribute('BallCoil') or '')
if dg ~= b6.UserId then
    dc:_stopMovement() dc:_setStatus(string.format('Ball stage %d/3 - waiting target', df))
    return
end
local di = dd:FindFirstChild('Coils')
local dj = di and di:FindFirstChild(dh)
local dk = dj and dj:GetAttribute('Home')
if typeof(dk) ~= 'Vector3' then
    dc:_setStatus('Targeted by Ball - waiting coil')
    return
end
dj = c7(dk - de:GetBoundingBox().Position)
local dl =
if dj.Magnitude < 1 then
    Vector3.new(1, 0, 0)
    else
    dj
    local dq, dr, ds = dc:_character()
    local dt = tonumber(dd:GetAttribute('FloorY')) or ds and ds.Position.Y - c5 or dk.Y
    local du = Vector3.new(dk.X, dt + c5, dk.Z) + dl.Unit * 40 dc:_setStatus(string.format('Baiting Ball into %s - stage %d/3', dh, df)) dc:_glideTo(CFrame.lookAt(du,
    Vector3.new(dk.X, du.Y, dk.Z)), cE, 4,
    function()
    local dv = dc:_inArena()
    return(
    if dv then
        dc:_arena() ~= dd
        else
        not dv) or tostring(dd:GetAttribute('Phase') or '') ~= 'Ball' or tonumber(dd:GetAttribute('BallTarget')) ~= b6.UserId
    end
    , true)
end
ci._findHuman =
function(dc, dd)
for de, df in ipairs({'ScrambleHuman', 'Human', 'DrScramble', 'Scramble', 'Pilot'}) do
    local dg = dd:FindFirstChild(df)
    if dg and dg:IsA('Model') then
        if dg.PrimaryPart then
            return dg
            elseif
            dg:FindFirstChildWhichIsA('BasePart') then
                return dg
            end
        end
    end
    for dg, dh in ipairs(dd:GetChildren()) do
        if dh:IsA('Model') and(dh.Name ~= 'Mech' and(dh:FindFirstChildOfClass('Humanoid') and not b3:GetPlayerFromCharacter(dh))) then
            return dh
        end
    end
    for di, dj in ipairs(dd:GetDescendants()) do
        if dj:IsA('Model') and(dj.Name ~= 'Mech' and(dj:FindFirstChildOfClass('Humanoid') and not b3:GetPlayerFromCharacter(dj))) then
            return dj
        end
    end
    return nil
end
ci._stickTo =
function(dc, dd, df)
local dh, di, dj = dc:_character()
if dj and dd then
    if not dd:IsA('BasePart') then
        return
    end
    else
    return
end
local dk = dd.Position dc = c7(dj.Position - dk)
local dl =
if dc.Magnitude < 0.1 then
    c7(- dd.CFrame.LookVector)
    else
    dc
    local dq = dk +(
    if dl.Magnitude < 0.1 then
        Vector3.new(1, 0, 0)
        else
        dl).Unit *(tonumber(df) or 3) pcall(
        function() dj.CFrame = CFrame.lookAt(dq, Vector3.new(dk.X, dq.Y, dk.Z)) dj.AssemblyLinearVelocity = Vector3.new(0, 0, 0) dj.AssemblyAngularVelocity = Vector3.new(0,
        0, 0)
    end
    )
end
ci._fightHuman =
function(dc, dd)
local df = math.max(tonumber(dd:GetAttribute('HumanHits')) or 0, 0)
local dh = math.max(tonumber(dd:GetAttribute('HumanNeeded')) or tonumber(c6(ca.HumanHits, 3)) or 3, 1)
if df >= dh then
    dc:_stopMovement() dc:_setStatus(string.format('Dr Scramble down - %d/%d', df, dh))
    return
end
local di = dc:_findHuman(dd)
if not di then
    dc:_setStatus('Final phase - waiting for Dr Scramble')
    return
end
local dj = di:FindFirstChildOfClass('Humanoid')
if dj and dj.Health <= 0 then
    dc:_stopMovement() dc:_setStatus(string.format('Dr Scramble down - %d/%d', df, dh))
    return
end
local dk = di.PrimaryPart or di:FindFirstChild('HumanoidRootPart') or di:FindFirstChildWhichIsA('BasePart')
if not dk then
    dc:_setStatus('Waiting for Human part')
    return
end
if di:GetAttribute('Immune') == true then
    dc:_stopMovement() dc:_setStatus(string.format('Final Human immune - %d/%d', df, dh))
    return
end
dc:_setStatus(string.format('Hitting Dr Scramble - %d/%d', df, dh)) dc:_stickTo(dk, 3) dc:_swing(dk)
end
ci._updateReward =
function(dc)
local dd = dc:_refreshReward(true)
local df = dc.rewardBaseline
if not df then
    dc.rewardBaseline = dd
    return false
end
local dh = math.max(dd.mastery - df.mastery, 0)
local di = math.max(dd.samples - df.samples, 0)
local dj = math.max(dd.finalHits - df.finalHits, 0)
local dk = df.mecha
local dl =
if dk then
    not dk
    else
    dd.mecha
    if dj > 0 then
        dc.finalHitLabel = 'Yes'
    end
    if dh > 0 then
        dc.rewardAcknowledged = true
        local dq ={'+'..tostring(dh)..' Mastery'}
        if di > 0 then
            dq[# dq + 1] = '+'..tostring(di)..' Samples'
        end
        if dl then
            dq[# dq + 1] = 'Mecha Egg'
        end
        dc.rewardLabel = table.concat(dq, ' - ')
        elseif
        dl then
            dc.rewardAcknowledged = true dc.rewardLabel = 'Mecha Scrambler Egg'
            else
            dc.rewardLabel = 'Pending'
        end
        return dc.rewardAcknowledged
    end
    ci._leaveArena =
    function(dc, dd)
    local df = da((dd:FindFirstChild('LeaveTeleport')))
    if not df then
        dc:_setStatus('Defeated - waiting arena exit')
        return
    end
    dc:_setStatus('Reward confirmed - gliding to exit')
    local dh, di, dj = dc:_glideTo(df.CFrame, cx, 3.5,
    function()
    local dh = dc:_inArena()
    return
    if dh then
        dc:_arena() ~= dd
        else
        not dh
    end
    )
    if dh then
        dc:_setStatus('Leaving boss arena')
    end
    if dh and(dj and os.clock() - dc.lastExitTouchAt >= cQ) then
        dc.lastExitTouchAt = os.clock() dc.exitRequested = true dc:_touch(dj, df)
    end
end
ci._fightDefeated =
function(dc, dd) dc.defeatedAt = dc.defeatedAt or os.clock() dc:_stopMovement() dc:_setStatus(dc:_updateReward() and 'Defeated - '..dc.rewardLabel or 'Defeated - server returning you')
end
ci._stepFight =
function(dc, dd) dc:_beginArena(dd)
local df = tostring(dd:GetAttribute('Phase') or 'Waiting') dc.lastPhase = df
if b6:GetAttribute('ScrambleGrabbed') == true then
    local dh = os.clock()
    if dh - dc.lastGrabEscapeAt >= cR then
        dc.lastGrabEscapeAt = dh pcall(
        function()
        if ce and ce.HazardHit then
            ce.HazardHit:FireServer(- 2)
        end
    end
    )
end
dc:_setStatus('Grabbed - breaking free')
return
end
if df == 'Waiting' then
    local dh = math.max(0,(tonumber(dd:GetAttribute('SpawnsAt')) or 0) - b5:GetServerTimeNow()) dc:_setStatus(dh > 0 and string.format('Boss starts in %ds',
    math.ceil(dh)) or 'Waiting for challengers')
    elseif
    df == 'Mech' then
        dc:_fightMech(dd)
        elseif
        df == 'Ejecting' then
            dc:_stopMovement() dc:_setStatus('Mech defeated - ejecting')
            elseif
            df == 'Ball' then
                dc:_fightBall(dd)
                elseif
                df == 'Human' then
                    dc:_fightHuman(dd)
                    elseif
                    df == 'Final' then
                        dc:_fightHuman(dd)
                        elseif
                        df == 'Defeated' then
                            dc:_fightDefeated(dd)
                            else
                            dc:_setStatus('Waiting for phase - '..df)
                        end
                    end
                    ci._resetCycle =
                    function(dc) dc.activeArena = nil dc.rewardBaseline = nil dc.defeatedAt = nil dc.rewardAcknowledged = false dc.exitRequested = false dc.lastPhase = '' dc.safePreflightReady = false dc.noMatchSince = nil
                end
                ci.wantsCharacter =
                function(dc)
                if dc.destroyed then
                    return false
                    elseif
                    not dc.enabled then
                        return false
                    end
                    if dc:_inArena() then
                        return true
                    end
                    if not dc:_isResetWallOpen() then
                        return false
                    end
                    if dc:_portal() ~= nil then
                        return true
                    end
                    local dd = dc:_arena()
                    local df = dd and tostring(dd:GetAttribute('Phase') or '') or ''
                    return dd ~= nil and df ~= '' and df ~= 'Defeated'
                end
                ci._holdPortal =
                function(dc, dd)
                if dc.eggRuntime and type(dc.eggRuntime._setScramblePortalHold) == 'function' then
                    dc.eggRuntime:_setScramblePortalHold(dd == true)
                end
            end
            ci._step =
            function(dc)
            if not dc:_eventPresent() then
                dc:_restoreCharacterControl() dc:_releaseOperation() dc.noMatchSince = nil dc:_holdPortal(false)
                if dc.activeArena then
                    dc:_resetCycle()
                end
                dc:_setStatus('Waiting for boss portal')
                return cs
            end
            if not dc:_inArena() then
                if not dc:wantsCharacter() then
                    dc.noMatchSince = nil dc:_restoreCharacterControl() dc:_releaseOperation() dc:_holdPortal(false) dc:_setStatus(dc:_isResetWallOpen() and 'Waiting for boss portal' or 'Boss portal ready - waiting reset wall')
                    return cs
                end
                local dd = aI.blocker('mech_boss')
                if dd then
                    dc.noMatchSince = nil dc:_holdPortal(false) dc:_releaseOperation() dc:_restoreCharacterControl() dc:_setStatus('Yielding to '..aI.TITLES[dd])
                    return cs
                end
                if aB.AutoSteal and aI.rank('auto_steal') < aI.rank('mech_boss') then
                    dc.noMatchSince = dc.noMatchSince or os.clock()
                    local df = os.clock() - dc.noMatchSince
                    if df < cw then
                        dc:_holdPortal(false) dc:_releaseOperation() dc:_restoreCharacterControl() dc:_setStatus(string.format('Checking matched egg %ds', math.ceil(cw - df)))
                        return cs
                    end
                end
            end
            if not dc:_acquireOperation() then
                dc:_holdPortal(false)
                return cs
            end
            local dd, df = dc:_character()
            if not df then
                dc:_restoreCharacterControl() dc:_holdPortal(false) dc:_setStatus('Respawning - re-entry pending')
                return cs
            end
            local dh = dc:_arena()
            if not dc:_inArena() then
                dc:_holdPortal(true)
                if not dc:_preparePortalEntry() then
                    return cr
                end
                if not dc:_isResetWallOpen() then
                    dc:_stopMovement() dc:_setStatus('Boss portal ready - waiting reset wall')
                    return cs
                end
                dc:_tryEnterArena(dh)
                return cr
            end
            dc:_holdPortal(true)
            if not dh then
                dc:_setStatus('Inside boss - waiting arena replication')
                return cr
            end
            dc:_stepFight(dh)
            return cr
        end
        ci._ensureWorker =
        function(dc)
        if dc.worker then
            return
        end
        dc.worker = task.spawn(
        function()
        while true do
            local dd = dc.destroyed
            if not(
            if dd then
                not dd
                else
                n()) then
                    break
                end
                dd = nil
                if dc.enabled then
                    local df, dh = xpcall(
                    function()
                    return dc:_step()
                end
                , debug.traceback)
                if df then
                    dd = dh
                    else
                    warn('[StealAnEgg] ScrambleBoss worker failed:\n'..tostring(dh)) dc:_restoreCharacterControl() dc:_releaseOperation() dc.status = 'Runtime error - retrying' dd = cs
                end
                else
                dd = ct
            end
            dc:_emit(false) task.wait(dd)
        end
        dc.worker = nil
    end
    )
end
ci.setEnabled =
function(dc, dd)
local df = dd == true
if dc.enabled == df then
    return
end
dc.enabled = df
if df then
    dc:_setStatus(dc:_eventPresent() and 'Boss detected' or 'Waiting for boss portal') dc:_ensureWorker()
    else
    dc:_restoreCharacterControl() dc:_releaseOperation() dc:_resetCycle() dc.status = 'Off' dc:_holdPortal(false)
end
dc:_emit(true)
end
ci.destroy =
function(dc)
if dc.destroyed then
    return
end
dc.destroyed = true dc.enabled = false dc:_restoreCharacterControl() dc:_releaseOperation()
for dd, df in ipairs(dc.connections) do
    pcall(df.Disconnect, df)
end
table.clear(dc.connections) table.clear(dc.listeners)
if dc.worker then
    pcall(task.cancel, dc.worker) dc.worker = nil
end
end
pcall(
function()
local dc = l.__SenaV4ScrambleBoss
if dc and type(dc.destroy) == 'function' and dc ~= nil and getmetatable(dc) == ci then
    dc:destroy()
    elseif
    type(dc) == 'table' then
        if type(dc.destroy) == 'function' then
            dc:destroy()
        end
    end
end
) l.__SenaV4ScrambleBoss = ci.new(bO, bP) aI.register('mech_boss',{wants =
function()
local dc = l.__SenaV4ScrambleBoss
return dc ~= nil and dc:wantsCharacter()
end
, active =
function()
local dc = l.__SenaV4ScrambleBoss
if dc then
    if dc.destroyed then
        return false
    end
    else
    return false
end
local dd = dc.operationToken
return dc:_inArena() or dd ~= nil and not dd.released
end
, enabled =
function()
local dc = l.__SenaV4ScrambleBoss
return dc ~= nil and dc.enabled == true
end
, status =
function()
local dc = l.__SenaV4ScrambleBoss
return dc and tostring(dc.status or '') or ''
end
}) task.spawn(
function()
while n() do
    local dc = l.__SenaV4ScrambleBoss
    local dd = aB.ScrambleBossAuto == true or dc ~= nil and dc.enabled == true
    if aB.AutoSteal and not dd and b6:GetAttribute('InScrambleArena') == true then
        local df = b5:FindFirstChild(cp)
        local dh = df and df:FindFirstChild('LeaveTeleport')
        local di = dh and da(dh)
        local dj = b6.Character
        local dk = dj and dj:FindFirstChild('HumanoidRootPart')
        if di and dk then
            pcall(
            function() dk.CFrame = CFrame.new(di.Position + Vector3.new(0, 3, 0)) dk.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            if type(firetouchinterest) == 'function' then
                firetouchinterest(dk, di, 0) task.wait(0.03) firetouchinterest(dk, di, 1)
            end
        end
        )
    end
    task.wait(0.5)
end
task.wait(0.25)
end
end
)
end
)()
local b3 ={}
local function b4()
local function b5(b6, b7)
local b9, ca = pcall(
function()
return Enum.Font[b6]
end
)
return b9 and ca or b7
end
local b6 = b5('BuilderSansBold', Enum.Font.GothamBold)
local b7 = b5('BuilderSansMedium', Enum.Font.GothamMedium) game:GetService('UserInputService')
local b9 = require(e.Data.Assets)
local ca = require(e.Client.EggState)
local ce = require(e.Shared.Save)
local ci ={strokeCol = Color3.fromRGB(36, 36, 42), accent = Color3.fromRGB(26, 147, 250), accentA = Color3.fromRGB(19, 96, 250), accentB = Color3.fromRGB(33,
198, 250), surface = Color3.fromRGB(22, 22, 27), surfaceHi = Color3.fromRGB(28, 28, 34), text = Color3.fromRGB(235, 236, 245), btnText = Color3.fromRGB(186,
184, 198), muted = Color3.fromRGB(156, 154, 170), shadow = Color3.fromRGB(4, 4, 8), obsTop = Color3.fromRGB(18, 18, 24), obsMid = Color3.fromRGB(12, 12,
16), obsLow = Color3.fromRGB(10, 14, 26), btnBg = Color3.fromRGB(30, 30, 36), btnHover = Color3.fromRGB(44, 44, 52), inputBg = Color3.fromRGB(14, 14, 18),
switchOff = Color3.fromRGB(42, 42, 48), good = Color3.fromRGB(163, 230, 53)}
local cl = ci
local cp = 'rbxassetid://96240498384290'
local cq = 'LUKZ'
local function cr() pcall(
function()
if type(setthreadidentity) == 'function' then
    setthreadidentity(8)
    elseif
    l then
        if type(l.__SenaV4IdentitySetter) == 'function' then
            l.__SenaV4IdentitySetter(8)
        end
    end
end
)
end
local function cs()
local ct = g and g:FindFirstChild('PlayerGui')
if ct then
    return ct
end
local cw, cx = pcall(
function()
return game:GetService('CoreGui')
end
)
if cw and cx then
    return cx
end
return game:GetService('CoreGui')
end
local function ct(cw)
local cx = tonumber(cw) or 0
if cx >= 1000000000000 then
    return string.format('%.2fT', cx / 1000000000000)
    elseif
    cx >= 1000000000 then
        return string.format('%.2fB', cx / 1000000000)
        elseif
        cx >= 1000000 then
            return string.format('%.2fM', cx / 1000000)
            elseif
            cx >= 1000 then
                return string.format('%.2fK', cx / 1000)
                else
                return string.format('%d', cx)
            end
        end
        local function cw(cx)
        return ct(cx)
    end
    local function cx(cz)
    local cE = b9.Directory and b9.Directory[cz]
    if cE and cE.Rarity then
        local cG = cE.Rarity.DisplayName or cE.Rarity._id or '?'
        return bB.rarityRank(cG), cG, cE.Rarity.Color
    end
    return 0, '?', nil
end
local function cz(cE)
local cG = b9.Directory and b9.Directory[cE]
if type(cG) ~= 'table' then
    return nil
end
local function cH(cM)
if type(cM) == 'string' and cM ~= '' then
    if cM:find('rbxassetid') then
        return cM
        elseif
        cM:find('rbxthumb') then
            return cM
        end
        if cM:match('^%d+$') then
            return 'rbxassetid://'..cM
        end
        elseif
        type(cM) == 'number' then
            if cM > 0 then
                return 'rbxassetid://'..tostring(cM)
            end
        end
        return nil
    end
    local cM ={'Image', 'Icon', 'Thumbnail', 'ImageId', 'IconId', 'Texture', 'Asset', 'DisplayImage'}
    for cP, cQ in ipairs(cM) do
        local cR = cH(cG[cQ])
        if cR then
            return cR
        end
    end
    if type(cG.Egg) == 'table' then
        for cR, cS in ipairs(cM) do
            local cV = cH(cG.Egg[cS])
            if cV then
                return cV
            end
        end
    end
    return nil
end
local cE ={}
local cG ={}
for cH, cM in pairs(b9.Directory or{}) do
    if type(cM) == 'table' and cM.Rarity then
        local cP = cM.Rarity.DisplayName or cM.Rarity._id or '?'
        local cQ = bB.rarityRank(cP) cG[cP] = cQ table.insert(cE,{cat = cH, rnum = cQ, rname = cP})
    end
end
table.sort(cE,
function(cP, cQ)
if cP.rnum == cQ.rnum then
    return cP.cat < cQ.cat
end
return cP.rnum > cQ.rnum
end
)
local function cP()
local cQ ={}
local cR ={}
for cS, cV in ipairs(cE) do
    if not cQ[cV.rname] then
        cQ[cV.rname] = true table.insert(cR,{cV.rname, cV.rnum})
    end
end
table.sort(cR,
function(cW, cX)
return cW[2] > cX[2]
end
)
local cW ={'Any'}
for cX, c0 in ipairs(cR) do
    table.insert(cW, c0[1])
end
return cW
end
local function cQ()
local cR ={}
for cW, cX in ipairs(cP()) do
    if cX ~= 'Any' then
        table.insert(cR, cX)
    end
end
return cR
end
local function cR(cW)
local cX = 0 pcall(
function() cX = aB:getAreaEggValue(cW) or 0
end
)
if cX > 0 then
    return cX
end
pcall(
function()
local c0 = require(e.Shared.Util.AssetEarnings)
if c0 and type(c0.LiveRatePerSecond) == 'function' then
    cX = c0.LiveRatePerSecond(cW) or 0
end
end
)
return cX or 0
end
local function cW(cX)
local c0 = 0 pcall(
function()
local c5 = require(e.Shared.Util.EggRecords)
local c6 = cX.AssetCategory or cX.Category
local c7 = cX.AssetScale or cX.Scale or 1 c0 = c5.WeightKgForScale(c6, c7)
end
)
return c0 or 0
end
local function cX()
local c0 = 0
local c5 = 0
local function c6()
for c7, c8 in pairs(ca.ReadOwnerEggs(g.UserId) or{}) do
    if c8.Placement ~= nil then
        c0 += 1
        else
        c5 += 1
    end
end
end
pcall(c6)
return c0, math.max(0, 50 - c0), c5
end
local c0 ={} do
    local c5 = game:GetService('TweenService') c0.type ={title ={b6, 14}, body ={b6, 12}, meta ={b7, 11}, label ={b6, 10}, value ={b6, 16}} c0.fast = TweenInfo.new(0.14,
    Enum.EasingStyle.Quad, Enum.EasingDirection.Out) c0.text =
    function(c6, c7)
    local c8 = c0.type[c7.style or 'body'] or c0.type.body
    local c9 = Instance.new('TextLabel') c9.BackgroundTransparency = 1 c9.Font = c8[1] c9.TextSize = c7.textsize or c8[2] c9.TextColor3 = c7.color or cl.text c9.TextXAlignment = c7.align or Enum.TextXAlignment.Left c9.TextYAlignment = c7.valign or Enum.TextYAlignment.Center c9.RichText = c7.rich == true
    local da = tostring(c7.text or '') c9.Text = c7.style == 'label' and string.upper(da) or da
    if c7.wrap then
        c9.TextWrapped = true c9.AutomaticSize = Enum.AutomaticSize.Y
        else
        c9.TextTruncate = Enum.TextTruncate.AtEnd
    end
    c9.Size = c7.size or UDim2.new(1, 0, 0, c8[2] + 4)
    if c7.pos then
        c9.Position = c7.pos
    end
    if c7.anchor then
        c9.AnchorPoint = c7.anchor
    end
    if c7.name then
        c9.Name = c7.name
    end
    if c7.order then
        c9.LayoutOrder = c7.order
    end
    c9.Parent = c6
    return c9
end
local c6 ={}
local c7 = false
local function c8(c9, da)
local db = l.ChloeX
if type(db) == 'table' and type(db.ApplyIcon) == 'function' then
    return(pcall(db.ApplyIcon, c9, da, 48))
end
local dc = l.SenaLucideIcons
local dd = type(dc) == 'table' and(dc['48px'] or dc['256px']) or nil
local df = dd and dd[da]
if type(df) == 'table' and(df[2] and df[3]) then
    c9.Image = 'rbxassetid://'..tostring(df[1]) c9.ImageRectSize = Vector2.new(df[2][1], df[2][2]) c9.ImageRectOffset = Vector2.new(df[3][1], df[3][2])
    return true
end
return false
end
c0.icon =
function(c9, da)
if c8(c9, da) then
    return
end
c6[# c6 + 1] ={c9, da}
if c7 then
    return
end
c7 = true task.spawn(
function()
local db = os.clock()
while true do
    if not(# c6 > 0 and os.clock() - db < 30) then
        break
    end
    task.wait(0.5) cr()
    local dc ={}
    for dd, df in ipairs(c6) do
        if df[1].Parent and not c8(df[1], df[2]) then
            dc[# dc + 1] = df
        end
    end
    c6 = dc
end
c7 = false
end
)
end
c0.image =
function(c9, da, db, dc)
local dd = Instance.new('ImageLabel') dd.BackgroundTransparency = 1 dd.ImageColor3 = dc or cl.muted dd.Size = UDim2.fromOffset(db, db) dd.Parent = c9 c0.icon(dd,
da)
return dd
end
local c9 ={primary ={bg = cl.accent, hover = cl.accentB, text = Color3.fromRGB(255, 255, 255), alpha = 0.1}, ghost ={bg = cl.btnBg, hover = cl.btnHover,
text = cl.btnText, alpha = 0.15}, danger ={bg = Color3.fromRGB(70, 30, 34), hover = Color3.fromRGB(92, 38, 42), text = Color3.fromRGB(248, 113, 113), alpha = 0.1}} c0.button =
function(da, db)
local dc = c9[db.kind or 'ghost'] or c9.ghost
local dd = Instance.new('TextButton') dd.AutoButtonColor = false dd.AutomaticSize = Enum.AutomaticSize.X dd.BackgroundColor3 = dc.bg dd.BackgroundTransparency = dc.alpha dd.BorderSizePixel = 0 dd.LayoutOrder = db.order or 0 dd.Size = UDim2.fromOffset(db.minw or 0,
db.h or 26) dd.Text = '' Instance.new('UICorner', dd).CornerRadius = UDim.new(0, 6)
local df = Instance.new('UIPadding', dd) df.PaddingLeft = UDim.new(0, db.icon and 8 or 10) df.PaddingRight = UDim.new(0, 10)
local dh = Instance.new('UIListLayout', dd) dh.FillDirection = Enum.FillDirection.Horizontal dh.HorizontalAlignment = Enum.HorizontalAlignment.Center dh.Padding = UDim.new(0,
5) dh.SortOrder = Enum.SortOrder.LayoutOrder dh.VerticalAlignment = Enum.VerticalAlignment.Center
local di
local dj, dk = db.icon
if dj then
    local dl = c0.image(dd, db.icon, 13, dc.text) dl.LayoutOrder = 0 dk = dl
    else
    dk = di
end
local dl = Instance.new('TextLabel') dl.AutomaticSize = Enum.AutomaticSize.X dl.BackgroundTransparency = 1 dl.Font = b6 dl.LayoutOrder = 1 dl.Size = UDim2.new(0,
0, 1, 0) dl.Text = tostring(db.text or '') dl.TextColor3 = dc.text dl.TextSize = 12 dl.Parent = dd
local dq = Instance.new('UIScale', dd)
local dr ={inst = dd, label = dl, icon = dk, active = false, enabled = true}
local function ds()
local dt = dr.active and c9.primary or dc dd.BackgroundColor3 = dt.bg dd.BackgroundTransparency = dr.enabled and dt.alpha or 0.6 dl.TextColor3 = dt.text dl.TextTransparency = dr.enabled and 0 or 0.5
if dk then
    dk.ImageColor3 = dt.text
end
end
dd.MouseEnter:Connect(
function()
if dr.enabled and not dr.active then
    local dt = c0.fast
    local du ={} du.BackgroundColor3 = dc.hover c5:Create(dd, dt, du):Play()
end
end
) dd.MouseLeave:Connect(
function()
if not dr.active then
    local dt = c0.fast
    local du ={} du.BackgroundColor3 = dc.bg c5:Create(dd, dt, du):Play()
end
end
)
local function dt()
if not dr.enabled then
    return
end
c5:Create(dq, c0.fast,{Scale = 0.96}):Play()
end
dd.MouseButton1Down:Connect(dt)
local function du() c5:Create(dq, c0.fast,{Scale = 1}):Play()
end
dd.MouseButton1Up:Connect(du)
local function dv()
if dr.enabled and db.onClick then
    cr()
    local dz, dA = pcall(db.onClick, dr)
    if not dz then
        warn('[Sena panels] button error:', dA)
    end
end
end
dd.MouseButton1Click:Connect(dv) dr.setText =
function(dz) dl.Text = tostring(dz)
end
dr.setActive =
function(dz) dr.active = dz == true ds()
end
dr.setEnabled =
function(dz) dr.enabled = dz ~= false dd.Active = dr.enabled ds()
end
dr.setKind =
function(dz) dc = c9[dz] or c9.ghost ds()
end
dd.Parent = da
return dr
end
c0.segmented =
function(da, db)
local dc = Instance.new('ScrollingFrame') dc.AutomaticCanvasSize = Enum.AutomaticSize.X dc.BackgroundTransparency = 1 dc.BorderSizePixel = 0 dc.CanvasSize = UDim2.new(0,
0, 0, 0) dc.ScrollBarThickness = 0 dc.ScrollingDirection = Enum.ScrollingDirection.X dc.Size = db.size or UDim2.new(1, 0, 0,(db.h or 24) + 4)
if db.pos then
    dc.Position = db.pos
end
if db.order then
    dc.LayoutOrder = db.order
end
local dd = Instance.new('UIListLayout', dc) dd.FillDirection = Enum.FillDirection.Horizontal dd.Padding = UDim.new(0, 6) dd.SortOrder = Enum.SortOrder.LayoutOrder dd.VerticalAlignment = Enum.VerticalAlignment.Center
local df df ={inst = dc, value = db.value, buttons ={}, set =
function(dh, di) df.value = dh
for dj, dk in pairs(df.buttons) do
    dk.setActive(dj == dh)
end
if di and db.onChange then
    db.onChange(dh)
end
end
}
for dh, di in ipairs(db.options or{}) do
    local dj = di[1]
    local dk = di[2] df.buttons[dj] = c0.button(dc,{text = dk, h = db.h or 24, order = dh, onClick =
    function() df.set(dj, true)
end
})
end
df.set(db.value, false) dc.Parent = da
return df
end
c0.list =
function(da)
local db ={}
return{setData =
function(dc) cr()
for dd, df in ipairs(dc) do
    local dh = db[dd]
    if dh then
        else
        dh = da.build(dd) db[dd] = dh
    end
    dh.frame.LayoutOrder = dd dh.frame.Visible = true da.bind(dh, df, dd)
end
for dh = # dc + 1, # db, 1 do
    db[dh].frame.Visible = false
end
end
}
end
c0.stat =
function(da, db)
local dc = Instance.new('Frame') dc.BackgroundColor3 = cl.surface dc.BackgroundTransparency = 0.1 dc.BorderSizePixel = 0 dc.LayoutOrder = db.order or 0 dc.Size = db.size or UDim2.new(0.5,
- 4, 0, 62) Instance.new('UICorner', dc).CornerRadius = UDim.new(0, 8)
local dd = Instance.new('UIStroke', dc) dd.Color = cl.strokeCol dd.Transparency = 0.6 c0.image(dc, db.icon or 'circle-dot', 12, cl.muted).Position = UDim2.fromOffset(10,
10)
local df = c0.text(dc,{text = db.label, style = 'label', color = cl.muted, pos = UDim2.fromOffset(27, 7), size = UDim2.new(1, - 36, 0, 16)})
local dh = c0.text(dc,{text = '--', style = 'value', pos = UDim2.fromOffset(10, 23), size = UDim2.new(1, - 20, 0, 20)})
local di = c0.text(dc,{text = '', style = 'meta', color = cl.muted, pos = UDim2.fromOffset(10, 43), size = UDim2.new(1, - 20, 0, 14)}) di.RichText = true dc.Parent = da
return{inst = dc, label = df, value = dh, meta = di, set =
function(dj, dk, dl)
local dq = tostring(dj)
if dh.Text ~= dq then
    dh.Text = dq
end
local dr = tostring(dk or '')
if di.Text ~= dr then
    di.Text = dr
end
di.TextColor3 = dl or cl.muted
end
}
end
c0.card =
function(da, db)
local dc = Instance.new('Frame') dc.AutomaticSize = Enum.AutomaticSize.Y dc.BackgroundColor3 = cl.surface dc.BackgroundTransparency = 0.1 dc.BorderSizePixel = 0 dc.LayoutOrder = db.order or 0 dc.Size = UDim2.new(1,
0, 0, 0) Instance.new('UICorner', dc).CornerRadius = UDim.new(0, 8)
local dd = Instance.new('UIStroke', dc) dd.Color = cl.strokeCol dd.Transparency = 0.6
local df = Instance.new('UIPadding', dc) df.PaddingBottom = UDim.new(0, 10) df.PaddingLeft = UDim.new(0, 10) df.PaddingRight = UDim.new(0, 10) df.PaddingTop = UDim.new(0,
8)
local dh = Instance.new('UIListLayout', dc) dh.Padding = UDim.new(0, 5) dh.SortOrder = Enum.SortOrder.LayoutOrder
local di = Instance.new('Frame') di.BackgroundTransparency = 1 di.LayoutOrder = 0 di.Size = UDim2.new(1, 0, 0, 16) di.Parent = dc
if db.icon then
    c0.image(di, db.icon, 12, cl.accent).Position = UDim2.fromOffset(0, 2)
end
c0.text(di,{text = db.title, style = 'label', color = cl.muted, pos = UDim2.fromOffset(db.icon and 17 or 0, 0), size = UDim2.new(1, - 20, 1, 0)}) dc.Parent = da
return dc
end
local da ={} c0.later =
function(db, dc)
if da[db] then
    return
end
da[db] = true task.defer(
function() da[db] = nil cr()
local dd, df = pcall(dc)
if not dd then
    warn('[Sena panels] repaint error:', df)
end
end
)
end
c0.assetrow =
function(db, dc, dd)
local df = Instance.new('Frame') df.BackgroundColor3 = cl.surface df.BackgroundTransparency = 0.12 df.BorderSizePixel = 0 df.Size = UDim2.new(1, - 6, 0,
40) Instance.new('UICorner', df).CornerRadius = UDim.new(0, 6)
local dh = Instance.new('UIStroke', df) dh.Color = cl.strokeCol dh.Transparency = 0.72
local di = Instance.new('Frame') di.BorderSizePixel = 0 di.Position = UDim2.fromOffset(0, 6) di.Size = UDim2.new(0, 3, 1, - 12) di.Parent = df Instance.new('UICorner',
di).CornerRadius = UDim.new(1, 0)
local dj = Instance.new('ImageLabel') dj.BackgroundColor3 = Color3.fromRGB(255, 255, 255) dj.BackgroundTransparency = 0.94 dj.BorderSizePixel = 0 dj.Position = UDim2.fromOffset(10,
7) dj.ScaleType = Enum.ScaleType.Fit dj.Size = UDim2.fromOffset(26, 26) dj.Parent = df Instance.new('UICorner', dj).CornerRadius = UDim.new(0, 6)
local dk = Instance.new('Frame') dk.AnchorPoint = Vector2.new(0.5, 0.5) dk.BorderSizePixel = 0 dk.Position = UDim2.fromScale(0.5, 0.5) dk.Size = UDim2.fromOffset(9,
9) dk.Parent = dj Instance.new('UICorner', dk).CornerRadius = UDim.new(1, 0)
local dl = c0.text(df,{style = 'body', pos = UDim2.fromOffset(44, 5), size = UDim2.new(1, -(44 + dc + 14), 0, 16)})
local dq = c0.text(df,{style = 'meta', pos = UDim2.fromOffset(44, 21), size = UDim2.new(1, -(44 + dc + 14), 0, 14)})
local dr = Instance.new('Frame') dr.AnchorPoint = Vector2.new(1, 0.5) dr.BackgroundTransparency = 1 dr.Position = UDim2.new(1, - 8, 0.5, 0) dr.Size = UDim2.new(0,
dc, 1, - 8) dr.Parent = df df.Parent = db
local ds ={frame = df, bar = di, icon = dj, dot = dk, name = dl, sub = dq, right = dr}
if dd then
    dd(ds)
end
return ds
end
c0.bindasset =
function(db, dc, dd, df, dh) db.bar.BackgroundColor3 = dd or cl.accent db.icon.Image = dc or '' db.dot.Visible = dc == nil db.dot.BackgroundColor3 = dd or cl.accent db.name.Text = tostring(df or '') db.sub.Text = tostring(dh or '') db.sub.TextColor3 = dd or cl.muted
end
c0.scroller =
function(db, dc, dd)
local df = Instance.new('ScrollingFrame') df.AutomaticCanvasSize = Enum.AutomaticSize.Y df.BackgroundTransparency = 1 df.BorderSizePixel = 0 df.CanvasSize = UDim2.new(0,
0, 0, 0) df.Position = dc df.ScrollBarImageColor3 = cl.accent df.ScrollBarThickness = 3 df.ScrollingDirection = Enum.ScrollingDirection.Y df.Size = dd df.Parent = db
local dh = Instance.new('UIListLayout', df) dh.Padding = UDim.new(0, 4) dh.SortOrder = Enum.SortOrder.LayoutOrder
return df
end
c0.empty =
function(db, dc)
local dd = c0.text(db,{text = dc, style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Center, size = UDim2.new(1, - 6, 0, 40)}) dd.LayoutOrder = - 1 dd.Visible = false
return dd
end
end
local c5 ={}
local c6 ={}
local function c7(c8)
local c9 = c8 and(c8.AssetCategory or c8.Category)
if not c9 then
    return
end
local da = c8.Uid
if da ~= nil then
    if c6[da] then
        return
    end
    c6[da] = true
end
da = c5[c9]
if da then
    else
    local db, dc, dd = cx(c9) da ={name = c9, rarity = dc, rnum = db, color = dd, count = 0, last = 0, image = cz(c9)} c5[c9] = da
end
da.count = da.count + 1 da.last = os.clock()
end
local c8 ={}
local function c9(da)
local db = c8[da]
return db ~= nil and db.gui ~= nil and db.gui.Parent ~= nil and db.gui.Enabled or false
end
local da, db, dc, dd
local df ={list = nil, headLbl = nil, countLbl = nil, statusBtn = nil, sel = nil, rows ={}, picked ={}, chips ={}, sortBtns ={}, modeBtns ={}}
local dh ={history ={}, reportedUids ={}, knownFieldUids ={}, lastAlert = nil, lastReportTime = 0, lastSync = 0, onlineCount = 1, category = 'targets',
filter = 'All'}
local function di(dj) cr()
if dj == 'logs' then
    if da then
        da()
    end
    elseif
    dj == 'eggs' then
        if db then
            db()
        end
        elseif
        dj == 'inventory' then
            if dc then
                dc()
            end
            elseif
            dj == 'checker' then
                if df and df.refresh then
                    df.refresh()
                end
                elseif
                dj == 'eggdata' then
                    if dh and dh.refresh then
                        dh.refresh()
                    end
                    elseif
                    dj == 'stats' then
                        if dd then
                            dd()
                        end
                    end
                end
                local dj ={sort = 'rarity', list = nil, total = nil, empty = nil} da =
                function() cr()
                if not dj.list then
                    return
                end
                local dk ={}
                local dl = c5
                local dq = 0
                for dr, ds in pairs(dl) do
                    table.insert(dk, ds) dq += ds.count
                end
                if dj.sort == 'count' then
                    table.sort(dk,
                    function(dt, du)
                    if dt.count == du.count then
                        return(dt.rnum or 0) >(du.rnum or 0)
                    end
                    return dt.count > du.count
                end
                )
                elseif
                dj.sort == 'name' then
                    table.sort(dk,
                    function(dt, du)
                    return tostring(dt.name) < tostring(du.name)
                end
                )
                else
                table.sort(dk,
                function(dt, du)
                if dt.rnum == du.rnum then
                    return dt.count > du.count
                end
                return(dt.rnum or 0) >(du.rnum or 0)
            end
            )
        end
        dj.list.setData(dk) dj.empty.Visible = # dk == 0 dj.total.Text = string.format('%d egg%s seen', dq, dq == 1 and '' or 's')
    end
    local function dk(dl) dj.total = c0.text(dl,{style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1,
    - 14, 0, 6), size = UDim2.fromOffset(140, 20)})
    local dq = c0.segmented(dl,{options ={{'rarity', 'Rarity'},{'count', 'Amount'},{'name', 'Name'}}, value = dj.sort, pos = UDim2.fromOffset(14, 2), size = UDim2.new(1,
    - 170, 0, 28), onChange =
    function(dq) dj.sort = dq da()
end
})
local dr = c0.button(dl,{text = 'Clear', icon = 'trash-2', onClick =
function() c5, c6 ={},{} da()
end
}) dr.inst.AnchorPoint = Vector2.new(1, 0) dr.inst.Position = UDim2.new(1, - 14, 0, 30) c0.text(dl,{text = 'Egg', style = 'label', color = cl.muted, pos = UDim2.fromOffset(16,
40), size = UDim2.fromOffset(120, 14)})
local ds = c0.scroller(dl, UDim2.fromOffset(14, 60), UDim2.new(1, - 28, 1, - 68)) dj.empty = c0.empty(ds, [[No eggs seen yet. Eggs that spawn on the field show up here.]]) dj.list = c0.list({build =
function()
return c0.assetrow(ds, 70,
function(dt) dt.count = c0.text(dt.right,{style = 'value', textsize = 14, color = cl.accent, align = Enum.TextXAlignment.Right, size = UDim2.fromScale(1,
1)})
end
)
end
, bind =
function(dt, du) c0.bindasset(dt, du.image, du.color, du.name, du.rarity) dt.count.Text = 'x'..tostring(du.count)
end
}) dq.set(dj.sort, false) da()
end
local dl ={filter = 'All', list = nil, total = nil, status = nil, empty = nil}
local dq ={} db =
function() cr()
if not dl.list then
    return
end
local dr, ds = pcall(
function()
return ca.ReadOwnerEggs(g.UserId)
end
)
if
if dr then
    type(ds) ~= 'table'
    else
    not dr then
        dl.list.setData({}) dl.total.Text = '0 waiting'
        return
    end
    local dt ={}
    local du = 0
    for dv, dz in pairs(ds) do
        if dz.Placement == nil and tostring(dv):sub(1, 8) ~= 'SENAVIS_' then
            local dA, dB, dC = cx(dz.AssetCategory)
            if dl.filter == 'All' or dB == dl.filter then
                local dD = dq[dv] ~= false du =
                if dD then
                    du + 1
                    else
                    du
                    local dE = b9.Directory and b9.Directory[dz.AssetCategory] table.insert(dt,{uid = dv, name = dE and dE.DisplayName or dz.AssetCategory or tostring(dv):sub(1,
                    8), rarity = dB, rnum = dA, color = dC, image = cz(dz.AssetCategory), enabled = dD})
                end
            end
        end
        table.sort(dt,
        function(dA, dB)
        if dA.rnum == dB.rnum then
            return dA.name < dB.name
        end
        return(dA.rnum or 0) >(dB.rnum or 0)
    end
    ) dl.list.setData(dt) dl.empty.Visible = # dt == 0 dl.total.Text = string.format('%d waiting  \194\183  %d on', # dt, du) ds, dr, dt = cX()
    if dr <= 0 then
        dl.status.Text = string.format('Plot full: %d/50 placed, %d waiting', ds, dt) dl.status.TextColor3 = Color3.fromRGB(245, 196, 81)
        else
        dl.status.Text = string.format('Plot %d/50  \194\183  room for %d more  \194\183  %d waiting', ds, dr, dt) dl.status.TextColor3 = cl.muted
    end
end
local function dr(ds)
local dt ={{'All', 'All'}}
for du, dv in ipairs(cQ()) do
    dt[# dt + 1] ={dv, dv}
end
c0.segmented(ds,{options = dt, value = dl.filter, pos = UDim2.fromOffset(14, 2), size = UDim2.new(1, - 28, 0, 28), onChange =
function(dz) dl.filter = dz db()
end
}) c0.text(ds,{text = 'Egg', style = 'label', color = cl.muted, pos = UDim2.fromOffset(16, 38), size = UDim2.fromOffset(120, 14)}) c0.text(ds,{text = 'Place',
style = 'label', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1, - 18, 0, 38), size = UDim2.fromOffset(60,
14)})
local dz = c0.scroller(ds, UDim2.fromOffset(14, 56), UDim2.new(1, - 28, 1, - 124)) dl.empty = c0.empty(dz, 'No eggs waiting to be placed.') dl.list = c0.list({build =
function()
return c0.assetrow(dz, 64,
function(dA) dA.toggle = c0.button(dA.right,{text = 'ON', h = 24, minw = 52, onClick =
function()
local dB = dA.uid
if dB == nil then
    return
end
if dq[dB] == false then
    dq[dB] = nil
    else
    dq[dB] = false
end
db()
end
}) dA.toggle.inst.AnchorPoint = Vector2.new(1, 0.5) dA.toggle.inst.Position = UDim2.new(1, 0, 0.5, 0)
end
)
end
, bind =
function(dA, dB) dA.uid = dB.uid c0.bindasset(dA, dB.image, dB.color, dB.name, dB.rarity) dA.toggle.setText(dB.enabled and 'ON' or 'OFF') dA.toggle.setActive(dB.enabled)
end
})
local dA = Instance.new('Frame') dA.BackgroundTransparency = 1 dA.Position = UDim2.new(0, 14, 1, - 62) dA.Size = UDim2.new(1, - 28, 0, 28) dA.Parent = ds
local dB = Instance.new('UIListLayout', dA) dB.FillDirection = Enum.FillDirection.Horizontal dB.Padding = UDim.new(0, 6) dB.SortOrder = Enum.SortOrder.LayoutOrder dB.VerticalAlignment = Enum.VerticalAlignment.Center c0.button(dA,
{text = 'Toggle all', order = 1, h = 28, icon = 'list', onClick =
function()
local dC, dD = pcall(
function()
return ca.ReadOwnerEggs(g.UserId)
end
)
if dC then
    if type(dD) ~= 'table' then
        return
    end
    else
    return
end
dC = false
for dE, dF in pairs(dD) do
    if dF.Placement == nil and dq[dE] == false then
        dC = true
        break
    end
end
for dG, dH in pairs(dD) do
    if dH.Placement == nil then
        if dC then
            dq[dG] = nil
            else
            dq[dG] = false
        end
    end
end
db()
end
}) c0.button(dA,{text = 'Start placing', kind = 'primary', order = 2, h = 28, icon = 'play', onClick =
function()
if type(applyAutoPlace) == 'function' then
    applyAutoPlace(true)
    elseif
    type(bz) == 'table' then
        if type(bz.AutoPlaceLoop) == 'function' then
            aB.AutoPlace = true task.spawn(bz.AutoPlaceLoop)
        end
    end
end
}) dl.total = c0.text(dA,{style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, order = 3, size = UDim2.new(1, - 250, 1, 0)}) dl.total.LayoutOrder = 3 dl.status = c0.text(ds,
{style = 'meta', color = cl.muted, pos = UDim2.new(0, 16, 1, - 28), size = UDim2.new(1, - 32, 0, 18)}) db()
end
local ds ={view = 'backpack', sort = 'moneys', asc = false, list = nil, total = nil, empty = nil, sortbar = nil}
local function dt(du)
local dz =(ce.Peek or ce.Get)() or{}
local dA ={}
local dB = 0
local function dC(dD, dG)
if tostring(dD):sub(1, 8) == 'SENAVIS_' then
    return
end
local dH = dG.AssetCategory or dG.Category
local dI, dL, dM, dN = b9.Directory and b9.Directory[dH], cx(dH)
local dO = cR({AssetCategory = dH, AssetScale = dG.Scale or dG.AssetScale or 1, Category = dH, Scale = dG.Scale or dG.AssetScale or 1, Mutations = dG.Mutations or{}})
local dP = cW(dG) dB += dO table.insert(dA,{name = dI and dI.DisplayName or tostring(dH), icon = cz(dH), kg = dP, kgS = string.format('%.1f kg', dP), moneys = dO,
rnum = dL, rarity = dM, color = dN})
end
if du == 'inplot' then
    for dD, dG in ipairs(dz.EquippedAssets or{}) do
        local dH = dz.Inventory and dz.Inventory[dG]
        if dH then
            dC(dG, dH)
        end
    end
    else
    for dD, dG in pairs(dz.Inventory or{}) do
        if type(dG) == 'table' then
            if dG.AssetCategory then
                dC(dD, dG)
                elseif
                dG.Category then
                    dC(dD, dG)
                end
            end
        end
    end
    return dA, dB
end
b3.collectPets = dt
local du ={moneys = 'Money/s', kg = 'Kg', rarity = 'Rarity', name = 'Name'}
local function dz()
if not ds.sortbar then
    return
end
for dA, dB in pairs(ds.sortbar.buttons) do
    local dC = du[dA]
    local dD =
    if dA == ds.sort then
        dC..(ds.asc and '  \226\134\145' or '  \226\134\147')
        else
        dC dB.setText(dD)
    end
end
dc =
function() cr()
if not ds.list then
    return
end
local dA, dB = dt(ds.view)
local dC = ds.sort == 'rarity' and 'rnum' or ds.sort table.sort(dA,
function(dD, dG)
if dD[dC] == dG[dC] then
    return dD.name < dG.name
end
if ds.asc then
    return(dD[dC] or 0) <(dG[dC] or 0)
end
return(dD[dC] or 0) >(dG[dC] or 0)
end
) ds.list.setData(dA) ds.empty.Visible = # dA == 0
if ds.view == 'inplot' then
    ds.total.Text = string.format('%d placed  \194\183  %s/s', # dA, cw(dB))
    else
    ds.total.Text = string.format('%d pet%s', # dA, # dA == 1 and '' or 's')
end
end
local function dA(dB) ds.total = c0.text(dB,{style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1,
- 14, 0, 6), size = UDim2.fromOffset(170, 20)}) c0.segmented(dB,{options ={{'backpack', 'Backpack'},{'inplot', 'Base'}}, value = ds.view, pos = UDim2.fromOffset(14,
2), size = UDim2.new(1, - 200, 0, 28), onChange =
function(dC) ds.view = dC dc()
end
}) ds.sortbar = c0.segmented(dB,{options ={{'moneys', 'Money/s'},{'kg', 'Kg'},{'rarity', 'Rarity'},{'name', 'Name'}}, value = ds.sort, pos = UDim2.fromOffset(14,
34), size = UDim2.new(1, - 28, 0, 28), onChange =
function(dC)
if ds.sort == dC then
    ds.asc = not ds.asc
    else
    ds.sort = dC ds.asc = false
end
dz() dc()
end
}) c0.text(dB,{text = 'Pet', style = 'label', color = cl.muted, pos = UDim2.fromOffset(16, 68), size = UDim2.fromOffset(120, 14)}) c0.text(dB,{text = 'Money/s  \194\183  Kg',
style = 'label', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1, - 18, 0, 68), size = UDim2.fromOffset(140,
14)})
local dC = c0.scroller(dB, UDim2.fromOffset(14, 86), UDim2.new(1, - 28, 1, - 94)) ds.empty = c0.empty(dC, 'No pets here yet.') ds.list = c0.list({build =
function()
return c0.assetrow(dC, 96,
function(dD) dD.money = c0.text(dD.right,{style = 'body', align = Enum.TextXAlignment.Right, pos = UDim2.fromOffset(0, 1), size = UDim2.new(1, 0, 0, 16)}) dD.money.Font = b6 dD.kg = c0.text(dD.right,
{style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, pos = UDim2.fromOffset(0, 17), size = UDim2.new(1, 0, 0, 14)})
end
)
end
, bind =
function(dD, dG) c0.bindasset(dD, dG.icon, dG.color, dG.name, dG.rarity) dD.money.Text = cw(dG.moneys)..'/s' dD.money.TextColor3 = dG.moneys > 0 and cl.text or cl.muted dD.kg.Text = dG.kgS
end
}) dz() dc()
end
local dB ={}
local dC = os.clock()
local dD
local dG ={}
local function dH()
local dI = l.__SenaV4Webhook
if type(dI) == 'table' and type(dI.stolen) == 'function' and not rawget(dI, '__senaStatsWrapped') then
    local dL = dI.stolen rawset(dI, '__senaStatsWrapped', true) dI.stolen =
    function(dM, dN, dO) pcall(
    function()
    local dP = type(dM) == 'table' and dM.Uid or nil
    if dP ~= nil then
        if dG[dP] then
            return
        end
        dG[dP] = true
    end
    local dQ = type(dI.rateOf) == 'function' and tonumber(dI.rateOf(dM)) or 0
    if
    if dD then
        dQ > dD.rate
        else
        not dD then
            dD ={name = tostring(type(dN) == 'table' and dN.name or type(dM) == 'table' and dM.AssetCategory or 'Egg'), rate = dQ or 0}
        end
    end
    )
    return dL(dM, dN, dO)
end
end
end
pcall(dH)
local function dI(dL)
local dM = math.max(0, math.floor(dL))
return string.format('%02d:%02d:%02d', math.floor(dM / 3600), math.floor(dM % 3600 / 60), dM % 60)
end
dd =
function() cr()
if not dB.tiles then
    return
end
local dL =(ce.Peek or ce.Get)() or{}
local dM = l.__SenaV4TaskLadder
local dN = dM and dM.current() or nil
if dN then
    local dO = dM.describe(dN) dB.nowTask.Text = dM.TITLES[dN] or tostring(dN) dB.nowStatus.Text = tostring(dO or '') dB.nowDot.BackgroundColor3 = cl.good
    else
    dB.nowTask.Text = 'Idle' dB.nowStatus.Text = 'Nothing is using the character' dB.nowDot.BackgroundColor3 = cl.muted
end
local dO = 0 pcall(
function() dO = math.floor((g:GetNetworkPing() or 0) * 2000 + 0.5)
end
) dB.nowMeta.Text = string.format('%s  \194\183  %d ms  \194\183  %d fps', dI(os.clock() - dC), dO, math.floor((tonumber(I()) or 0) + 0.5)) dM, dN = dt('inplot')
local dP = tonumber(dL.Money) or 0 dB.tiles.money.set(cw(dP), '+'..cw(dN * 3600)..' per hour', cl.good) dB.tiles.income.set(cw(dN)..'/s', # dM..' pet'..(# dM == 1 and '' or 's')..' placed')
local dQ
local dR = '' pcall(
function()
local dS = l.__SenaV4MovementExtras
if dS then
    dQ = tonumber(dS:_gameWalkSpeed())
end
end
) pcall(
function()
local dS = l.__SenaV4TreadmillManager
if dS then
    local dT, dU, dV = dS:_readUpgradeState()
    if dV then
        dR = 'Next: '..tostring(dV.DisplayName or dV._id or 'tier')..'  '..cw(tonumber(dV.Price) or 0)
        elseif
        dT then
            dR = 'Treadmill maxed'
        end
    end
end
) dB.tiles.speed.set(dQ and string.format('%.0f', dQ) or '--', dR)
local dS = l.__SenaV4EggRuntime
local dT = l.__SenaV4PlayerSteal dN =(dS and dS.stats and tonumber(dS.stats.delivered) or 0) +(dT and tonumber(dT.taken) or 0) dB.tiles.stolen.set(tostring(dN),
dD and 'Best: '..dD.name..'  '..cw(dD.rate)..'/s' or 'No steal yet this session') dP = 0
for dU in pairs(dL.Inventory or{}) do
    dP =
    if tostring(dU):sub(1, 8) ~= 'SENAVIS_' then
        dP + 1
        else
        dP
    end
    local dV, dW, dX = cX() dB.tiles.collection.set(dP..' pets', string.format('Eggs %d/50 placed  \194\183  %d waiting', dV, dX))
    local dY = false pcall(
    function() dY = dS ~= nil and dS:getSnapshot().wallClosed == true
end
) dB.tiles.world.set(dY and 'Night' or 'Day', # d:GetPlayers()..' players in this server', dY and Color3.fromRGB(245, 196, 81) or cl.muted)
local dZ, d0 = l.__SenaV4ScrambleBoss pcall(
function() d0 = dZ and dZ:_snapshot()
end
)
local d1 = d0 ~= nil and(d0.eventActive or d0.portalOpen or d0.inArena) dB.scramble.Visible = d1 == true
if d1 then
    if d0.inArena then
        dB.scrambleLine1.Text = string.format('Fighting  \194\183  %s  \194\183  HP %d / %d', tostring(d0.phase), d0.health or 0, d0.maxHealth or 0)
        else
        if d0.portalOpen then
            dB.scrambleLine1.Text = 'Boss portal is open'
            else
            dB.scrambleLine1.Text = 'Boss portal '..tostring(d0.countdownLabel or 'soon')
        end
    end
    dB.scrambleLine2.Text = string.format('Mastery %s  \194\183  Samples %s  \194\183  Last reward: %s', tostring(d0.mastery or 0), tostring(d0.samples or 0),
    tostring(d0.reward or '--'))
end
table.sort(dM,
function(d2, d3)
return(d2.moneys or 0) >(d3.moneys or 0)
end
)
local d2 ={}
for d3 = 1, math.min(5, # dM), 1 do
    d2[d3] = dM[d3]
end
dB.top.setData(d2) dB.topEmpty.Visible = # d2 == 0
end
local function dL(dM)
local dN = Instance.new('ScrollingFrame') dN.AutomaticCanvasSize = Enum.AutomaticSize.Y dN.BackgroundTransparency = 1 dN.BorderSizePixel = 0 dN.CanvasSize = UDim2.new(0,
0, 0, 0) dN.Position = UDim2.fromOffset(14, 0) dN.ScrollBarImageColor3 = cl.accent dN.ScrollBarThickness = 3 dN.ScrollingDirection = Enum.ScrollingDirection.Y dN.Size = UDim2.new(1,
- 28, 1, - 4) dN.Parent = dM
local dO = Instance.new('UIListLayout', dN) dO.Padding = UDim.new(0, 8) dO.SortOrder = Enum.SortOrder.LayoutOrder
local dP = Instance.new('Frame') dP.BackgroundColor3 = cl.surface dP.BackgroundTransparency = 0.1 dP.BorderSizePixel = 0 dP.LayoutOrder = 1 dP.Size = UDim2.new(1,
- 6, 0, 50) dP.Parent = dN Instance.new('UICorner', dP).CornerRadius = UDim.new(0, 8)
local dQ = Instance.new('UIStroke', dP) dQ.Color = cl.accent dQ.Transparency = 0.6
local dR = Instance.new('Frame') dR.BorderSizePixel = 0 dR.Position = UDim2.fromOffset(12, 13) dR.Size = UDim2.fromOffset(8, 8) dR.Parent = dP Instance.new('UICorner',
dR).CornerRadius = UDim.new(1, 0) dB.nowDot = dR dB.nowTask = c0.text(dP,{text = 'Idle', style = 'body', pos = UDim2.fromOffset(26, 6), size = UDim2.new(0.55,
- 26, 0, 18)}) dB.nowTask.Font = b6 dB.nowStatus = c0.text(dP,{text = '', style = 'meta', color = cl.muted, pos = UDim2.fromOffset(12, 27), size = UDim2.new(1,
- 24, 0, 16)}) dB.nowMeta = c0.text(dP,{text = '', style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1,
- 12, 0, 7), size = UDim2.new(0.45, 0, 0, 16)})
local dS = Instance.new('Frame') dS.AutomaticSize = Enum.AutomaticSize.Y dS.BackgroundTransparency = 1 dS.LayoutOrder = 2 dS.Size = UDim2.new(1, - 6, 0,
0) dS.Parent = dN
local dT = Instance.new('UIGridLayout', dS) dT.CellPadding = UDim2.fromOffset(8, 8) dT.CellSize = UDim2.new(0.5, - 4, 0, 62) dT.SortOrder = Enum.SortOrder.LayoutOrder dB.tiles ={money = c0.stat(dS,
{label = 'Money', icon = 'wallet', order = 1}), income = c0.stat(dS,{label = 'Income', icon = 'trending-up', order = 2}), speed = c0.stat(dS,{label = 'Speed',
icon = 'gauge', order = 3}), stolen = c0.stat(dS,{label = 'Stolen', icon = 'hand', order = 4}), collection = c0.stat(dS,{label = 'Collection', icon = 'package',
order = 5}), world = c0.stat(dS,{label = 'World', icon = 'globe', order = 6})} dB.scramble = c0.card(dN,{title = 'Dr Scramble', icon = 'swords', order = 3}) dB.scramble.Size = UDim2.new(1,
- 6, 0, 0) dB.scramble.Visible = false dB.scrambleLine1 = c0.text(dB.scramble,{text = '', style = 'body', order = 1}) dB.scrambleLine2 = c0.text(dB.scramble,
{text = '', style = 'meta', color = cl.muted, order = 2})
local dU = c0.card(dN,{title = 'Top earners on your plot', icon = 'trending-up', order = 4}) dU.Size = UDim2.new(1, - 6, 0, 0)
local dV = Instance.new('Frame') dV.AutomaticSize = Enum.AutomaticSize.Y dV.BackgroundTransparency = 1 dV.LayoutOrder = 1 dV.Size = UDim2.new(1, 0, 0, 0) dV.Parent = dU
local dW = Instance.new('UIListLayout', dV) dW.Padding = UDim.new(0, 4) dW.SortOrder = Enum.SortOrder.LayoutOrder dB.topEmpty = c0.empty(dV, 'Place pets on your plot to see them here.') dB.top = c0.list({build =
function()
return c0.assetrow(dV, 96,
function(dX) dX.frame.Size = UDim2.new(1, 0, 0, 40) dX.money = c0.text(dX.right,{style = 'body', align = Enum.TextXAlignment.Right, pos = UDim2.fromOffset(0,
1), size = UDim2.new(1, 0, 0, 16)}) dX.money.Font = b6 dX.kg = c0.text(dX.right,{style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, pos = UDim2.fromOffset(0,
17), size = UDim2.new(1, 0, 0, 14)})
end
)
end
, bind =
function(dX, dY) c0.bindasset(dX, dY.icon, dY.color, dY.name, dY.rarity) dX.money.Text = cw(dY.moneys)..'/s' dX.kg.Text = dY.kgS
end
}) dd() task.spawn(
function()
while n() and dN.Parent do
    task.wait(1)
    if c9('stats') then
        c0.later('stats', dd)
    end
end
end
)
end
df.sort = 'value' df.rarity = 'All' df.picked ={} df.chips ={} df.sortBtns ={} df.modeBtns ={} df.rows ={} df.fmtKg =
function(dM)
local dN = tonumber(dM) or 0
local dO = dN >= 100 and string.format('%.1f', dN) or string.format('%.2f', dN)
local dP, dQ = dO:match('^(%d+)(%.%d+)$')
return(dP or dO):reverse():gsub('(%d%d%d)', '%1,'):reverse():gsub('^,', '')..(dQ or '')..' kg'
end
df.scan =
function()
local dM pcall(
function() dM = ca.ReadFieldEggs()
end
)
local dN ={}
for dO, dP in ipairs(dM and dM.Records or{}) do
    if dP.State ~= 'Claimed' and(dP.State ~= 'Carried' and(not dP.CarrierUserId and(dP.BottomCFrame and not tostring(dP.Uid):find('FirstAreaEgg')))) then
        local dQ = dP.AssetCategory
        local dR, dS, dT, dU = dQ and b9.Directory and b9.Directory[dQ], cx(dQ)
        local dV = cR({AssetCategory = dQ, Category = dQ, AssetScale = dP.AssetScale or dP.Scale or 1, Scale = dP.AssetScale or dP.Scale or 1, Mutations = dP.Mutations or{}})
        local dW = cW(dP) dN[# dN + 1] ={rec = dP, uid = dP.Uid, name = dR and dR.DisplayName or tostring(dQ or 'Egg'), rarity = dT, rnum = dS, color = dU, area = tostring(dP.AreaId or '?'),
        rate = dV, kg = dW, scale = tonumber(dP.AssetScale or dP.Scale) or 1, icon = cz(dQ)}
    end
end
if df.rarity ~= 'All' then
    local dQ ={}
    for dR, dS in ipairs(dN) do
        if dS.rarity == df.rarity then
            dQ[# dQ + 1] = dS
        end
    end
    dN = dQ
end
table.sort(dN,
function(dQ, dR)
if df.sort == 'weight' then
    if(dQ.kg or 0) ~=(dR.kg or 0) then
        return(dQ.kg or 0) >(dR.kg or 0)
    end
    return(dQ.rate or 0) >(dR.rate or 0)
end
if df.sort == 'rarity' then
    if dQ.rnum ~= dR.rnum then
        return(dQ.rnum or 0) >(dR.rnum or 0)
    end
    return(dQ.rate or 0) >(dR.rate or 0)
end
if dQ.rate ~= dR.rate then
    return(dQ.rate or 0) >(dR.rate or 0)
end
return(dQ.rnum or 0) >(dR.rnum or 0)
end
)
return dN
end
local dM ={{'Instant Steal (Recommended)', 'Instant'},{'High Speed User Normal', 'High'},{'High Speed User (Fly)', 'High Fly'},{'Zig-Zag High Speed User',
'Zig-Zag'}}
local function dN()
local dO = type(b3.getStealMode) == 'function' and b3.getStealMode() or nil
return type(dO) == 'string' and dO or 'Instant Steal (Recommended)'
end
function b3.syncStealMode()
if df.modeSeg then
    df.modeSeg.set(dN(), false)
end
end
df.paintChips =
function()
if df.raritySeg then
    df.raritySeg.set(df.rarity, false)
end
if df.sortSeg then
    df.sortSeg.set(df.sort, false)
end
if df.modeSeg then
    df.modeSeg.set(dN(), false)
end
end
df.paintRows =
function()
local dO = 0
for dP, dQ in ipairs(df.rows) do
    if dQ.frame.Visible and dQ.uid ~= nil then
        local dR = df.picked[tostring(dQ.uid)] == true dO =
        if dR then
            dO + 1
            else
            dO dQ.frame.BackgroundTransparency = dR and 0.02 or 0.12 dQ.stroke.Transparency = dR and 0.1 or 0.72 dQ.stroke.Color = dR and cl.accent or cl.strokeCol dQ.tick.BackgroundTransparency = dR and 0.1 or 0.86 dQ.check.Visible = dR
        end
    end
    if df.statusBtn and not df.running then
        df.statusBtn.setText(dO > 0 and 'Steal selected ('..dO..')' or 'Steal selected') df.statusBtn.setEnabled(true)
    end
    if df.headLbl then
        df.headLbl.Text = dO > 0 and dO..' picked' or 'Tap eggs to pick them'
    end
end
df.refresh =
function() cr()
if not df.view then
    return
end
local dO = df.scan()
local dP ={}
for dQ, dR in ipairs(dO) do
    dP[tostring(dR.uid)] = true
end
for dS in pairs(df.picked) do
    if not dP[dS] then
        df.picked[dS] = nil
    end
end
df.view.setData(dO) df.emptyLbl.Visible = # dO == 0
if df.countLbl then
    df.countLbl.Text = # dO..' egg'..(# dO == 1 and '' or 's')
end
pcall(df.paintChips) pcall(df.paintRows)
end
df.build =
function(dO)
local dP = Instance.new('Frame') dP.BackgroundTransparency = 1 dP.BorderSizePixel = 0 dP.Size = UDim2.fromScale(1, 1) dP.Parent = dO df.headLbl = c0.text(dP,
{text = 'Tap eggs to pick them', style = 'meta', color = cl.muted, pos = UDim2.fromOffset(14, 2), size = UDim2.new(1, - 135, 0, 18)}) df.countLbl = c0.text(dP,
{text = '0 eggs', style = 'meta', color = cl.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1, - 16, 0, 2), size = UDim2.fromOffset(110,
18)})
local dQ ={{'All', 'All'}}
local dR ={}
for dS, dT in ipairs(cQ()) do
    dQ[# dQ + 1] ={dT, dT}
    for dU, dV in ipairs(cE) do
        if dV.rname == dT then
            dO, dU, dS = cx(dV.cat) dR[dT] = dS
            break
        end
    end
end
df.raritySeg = c0.segmented(dP,{options = dQ, value = df.rarity, pos = UDim2.fromOffset(14, 22), size = UDim2.new(1, - 28, 0, 30), onChange =
function(dU) df.rarity = dU df.refresh()
end
})
for dU, dV in pairs(df.raritySeg.buttons) do
    local dW = dR[dU]
    if dW then
        local dX = dV.setActive dV.setActive =
        function(dY) dX(dY)
        if not dY then
            dV.label.TextColor3 = dW
        end
    end
end
end
df.raritySeg.set(df.rarity, false)
local dW = Instance.new('Frame') dW.BackgroundTransparency = 1 dW.Position = UDim2.fromOffset(14, 56) dW.Size = UDim2.new(1, - 28, 0, 28) dW.Parent = dP df.sortSeg = c0.segmented(dW,
{options ={{'value', 'Best value'},{'weight', 'Best weight'},{'rarity', 'Rarity'}}, value = df.sort, size = UDim2.new(1, - 90, 1, 0), onChange =
function(dX) df.sort = dX df.refresh()
end
})
local dX = c0.button(dW,{text = 'Clear', icon = 'x', onClick =
function() df.picked ={} df.paintRows()
end
}) dX.inst.AnchorPoint = Vector2.new(1, 0.5) dX.inst.Position = UDim2.new(1, 0, 0.5, 0) c0.text(dP,{text = 'Move', style = 'label', color = cl.muted, pos = UDim2.fromOffset(16,
92), size = UDim2.fromOffset(44, 20)}) df.modeSeg = c0.segmented(dP,{options = dM, value = dN(), pos = UDim2.fromOffset(58, 88), size = UDim2.new(1, - 72,
0, 28), onChange =
function(dY)
if type(b3.setStealMode) == 'function' then
    b3.setStealMode(dY)
end
end
})
local dY = c0.scroller(dP, UDim2.fromOffset(14, 124), UDim2.new(1, - 28, 1, - 184)) df.emptyLbl = c0.empty(dY, 'No eggs on the field right now.') df.rows ={} df.view = c0.list({build =
function()
local dZ = c0.assetrow(dY, 96,
function(dZ) dZ.frame.Size = UDim2.new(1, - 6, 0, 54)
local d0 = Instance.new('Frame') d0.BackgroundColor3 = cl.accent d0.BackgroundTransparency = 0.86 d0.BorderSizePixel = 0 d0.Position = UDim2.fromOffset(10,
16) d0.Size = UDim2.fromOffset(22, 22) d0.Parent = dZ.frame Instance.new('UICorner', d0).CornerRadius = UDim.new(0, 6)
local d1 = Instance.new('UIStroke', d0) d1.Color = cl.accent d1.Transparency = 0.5
local d2 = c0.image(d0, 'check', 14, Color3.fromRGB(255, 255, 255)) d2.AnchorPoint = Vector2.new(0.5, 0.5) d2.Position = UDim2.fromScale(0.5, 0.5) d2.Visible = false dZ.tick = d0 dZ.check = d2 dZ.stroke = dZ.frame:FindFirstChildOfClass('UIStroke') dZ.icon.Position = UDim2.fromOffset(40,
9) dZ.icon.Size = UDim2.fromOffset(36, 36) dZ.name.Position = UDim2.fromOffset(84, 6) dZ.name.Size = UDim2.new(1, - 194, 0, 19) dZ.name.TextSize = 15 dZ.sub.Position = UDim2.fromOffset(84,
27) dZ.sub.Size = UDim2.new(1, - 194, 0, 20) dZ.sub.TextSize = 13 dZ.sub.RichText = true dZ.rate = c0.text(dZ.right,{style = 'body', color = Color3.fromRGB(126,
224, 151), align = Enum.TextXAlignment.Right, size = UDim2.fromScale(1, 1)}) dZ.rate.Font = b6 dZ.rate.TextSize = 15
local d3 = Instance.new('TextButton') d3.AutoButtonColor = false d3.BackgroundTransparency = 1 d3.Size = UDim2.fromScale(1, 1) d3.Text = '' d3.ZIndex = 3 d3.Parent = dZ.frame
local function d4()
if dZ.uid == nil then
    return
end
local d5 = tostring(dZ.uid)
local d6 = df.picked
local d7 = df.picked[d5] d6[d5] =
if d7 then
    nil
    else
    not d7 df.paintRows()
end
d3.MouseButton1Click:Connect(d4)
end
) df.rows[# df.rows + 1] = dZ
return dZ
end
, bind =
function(dZ, d0) dZ.uid = d0.uid c0.bindasset(dZ, d0.icon, d0.color, d0.name, string.format('%s  \194\183  %s%s  \194\183  <b>x%.2f</b>', tostring(d0.rarity or '?'),
tostring(d0.area), d0.kg and '  \194\183  <b>'..df.fmtKg(d0.kg)..'</b>' or '', d0.scale or 1)) dZ.name.TextSize = 15 dZ.sub.TextSize = 13 dZ.rate.Text = ct(d0.rate)..'/s'
end
})
local dZ = Instance.new('Frame') dZ.BackgroundTransparency = 1 dZ.Position = UDim2.new(0, 14, 1, - 52) dZ.Size = UDim2.new(1, - 28, 0, 34) dZ.Parent = dP c0.button(dZ,
{text = 'Refresh', icon = 'refresh-cw', h = 34, onClick =
function() pcall(
function() ca.SyncFieldEggs()
end
) df.refresh()
end
}).inst.Position = UDim2.fromOffset(0, 0) df.statusBtn = c0.button(dZ,{text = 'Steal selected', kind = 'primary', icon = 'hand', h = 34, onClick =
function()
if df.running then
    return
end
local d0 ={}
for d1, d2 in pairs(df.picked) do
    table.insert(d0, d1)
end
if # d0 == 0 then
    df.statusBtn.setText('Pick an egg first') task.delay(1.5,
    function()
    if df.statusBtn and not df.running then
        df.paintRows()
    end
end
)
return
end
local d3 = l.__SenaV4EggRuntime
if d3 and type(d3.queueManual) == 'function' then
    local d4 = d3:queueManual(d0) df.picked ={} df.statusBtn.setText('Queued '..tostring(d4)) task.delay(1.5,
    function()
    if df.statusBtn and not df.running then
        df.paintRows()
    end
end
) df.refresh()
else
df.statusBtn.setText('Runtime not ready') task.delay(1.5,
function()
if df.statusBtn and not df.running then
    df.paintRows()
end
end
)
end
end
}) df.statusBtn.inst.AutomaticSize = Enum.AutomaticSize.None df.statusBtn.inst.AnchorPoint = Vector2.new(1, 0) df.statusBtn.inst.Position = UDim2.fromScale(1,
0) df.statusBtn.inst.Size = UDim2.new(1, - 116, 1, 0) df.statusBtn.label.TextTruncate = Enum.TextTruncate.AtEnd df.paintChips() df.refresh()
end
local function dO(dP)
if dP then
    if type(dP) ~= 'string' then
        return 'unknown'
    end
    else
    return 'unknown'
end
local dQ = dP:lower()
if dQ:find('kong') then
    return 'gorillaking'
    elseif
    dQ:find('gorilla') then
        return 'gorillaking'
    end
    if dQ:find('phoenix') then
        return 'phoenix'
    end
    if dQ:find('lunar') then
        return 'lunardragon'
        elseif
        dQ:find('dragon.-lunar') then
            return 'lunardragon'
        end
        if dQ:find('mosa') then
            return 'mosasaurus'
        end
        if dQ:find('tiger') then
            return 'onitiger'
            elseif
            dQ:find('oni') then
                return 'onitiger'
            end
            if dQ:find('kitsune') then
                return 'kitsune'
            end
            if dQ:find('unicorn') then
                return 'unicorn'
            end
            if dQ:find('godzilla') then
                return 'godzilla'
            end
            if dQ:find('pegasus') then
                return 'pegasus'
            end
            if dQ:find('archangel') then
                return 'archangel'
            end
            if dQ:find('ice.-dragon') then
                return 'icedragon'
            end
            if dQ:find('lava.-dragon') then
                return 'lavadragon'
                elseif
                dQ:find('dragon') then
                    return 'lavadragon'
                end
                if dQ:find('cosmic.-dragon') then
                    return 'cosmicdragon'
                    elseif
                    dQ:find('ember') then
                        return 'cosmicdragon'
                    end
                    if dQ:find('trex') then
                        return 'trex'
                        elseif
                        dQ:find('tyranno') then
                            return 'trex'
                            elseif
                            dQ:find('t%-rex') then
                                return 'trex'
                            end
                            if dQ:find('gargoyle') then
                                return 'gargoyle'
                            end
                            if dQ:find('cerberus') then
                                return 'cerberus'
                            end
                            if dQ:find('yeti') then
                                return 'yeti'
                            end
                            if dQ:find('dreadscale') then
                                return 'dreadscale'
                            end
                            if dQ:find('el.-maja') then
                                return 'elmaja'
                            end
                            return(dQ:gsub('eternal', ''):gsub('ascended', ''):gsub('vermilion', ''):gsub('divine', ''):gsub('secret', ''):gsub('egg', ''):gsub('[^%a%d]', ''))
                        end
                        local function dP(dQ)
                        if dQ then
                            if dQ <= 0 then
                                return 0
                            end
                            else
                            return 0
                        end
                        return math.floor((dQ + 150) / 300) * 300
                    end
                    local function dQ(dR, dS)
                    if dR then
                        if dR <= 0 then
                            return '--:--'
                        end
                        else
                        return '--:--'
                    end
                    local dU = os.time()
                    local dV = os.date('*t', dU)
                    local dW = os.date('*t', dR)
                    local dX =
                    if dW.year == dV.year and dW.yday == dV.yday then
                        'Today'
                        else
                        if dW.year == dV.year and dW.yday == dV.yday - 1 then
                            'Yesterday'
                            else
                            if dW.year == dV.year and dW.yday == dV.yday + 1 then
                                'Tomorrow'
                                else
                                string.format('%02d/%02d', dW.month, dW.day)
                                if dS then
                                    return string.format('%s %02d:%02d:%02d', dX, dW.hour, dW.min, dW.sec)
                                    else
                                    return string.format('%s %02d:%02d', dX, dW.hour, dW.min)
                                end
                            end
                            local function dR(dS)
                            if dS then
                                if dS <= 0 then
                                    return ''
                                end
                                else
                                return ''
                            end
                            local dU = os.time() - dS
                            if dU < 0 then
                                local dV = - dU
                                if dV < 60 then
                                    return 'in <1m'
                                end
                                if dV < 3600 then
                                    return string.format('in %dm', math.floor(dV / 60))
                                end
                                return string.format('in %.1fh', dV / 3600)
                            end
                            if dU < 60 then
                                return 'Just now'
                            end
                            if dU < 3600 then
                                return string.format('%dm ago', math.floor(dU / 60))
                            end
                            if dU < 86400 then
                                return string.format('%.1fh ago', dU / 3600)
                            end
                            return string.format('%.1fd ago', dU / 86400)
                        end
                        local function dS(dU, dV) dU, dV = dP(dU), dP(dV)
                        local dW = os.time()
                        local dX = os.date('*t', dW)
                        local dY = os.date('*t', dU)
                        local dZ = os.date('*t', dV)
                        local function d0(d1)
                        if d1.year == dX.year and d1.yday == dX.yday then
                            return 'Today'
                            elseif
                            d1.year == dX.year and d1.yday == dX.yday + 1 then
                                return 'Tomorrow'
                                elseif
                                d1.year == dX.year and d1.yday == dX.yday - 1 then
                                    return 'Yesterday'
                                    else
                                    return string.format('%02d/%02d', d1.month, d1.day)
                                end
                            end
                            local d1 = d0(dY)
                            local d2 = d0(dZ)
                            if d1 == d2 then
                                return string.format('%s %02d:%02d - %02d:%02d', d1, dY.hour, dY.min, dZ.hour, dZ.min)
                                else
                                return string.format('%s %02d:%02d - %s %02d:%02d', d1, dY.hour, dY.min, d2, dZ.hour, dZ.min)
                            end
                        end
                        local dU ={Mosasaurus = 'rbxassetid://124293259998827',['Oni Tiger'] = 'rbxassetid://109908891899435',['Eternal Lunar Dragon'] = 'rbxassetid://93762296316916',
                        ['Lunar Dragon'] = 'rbxassetid://93762296316916',['King Kong'] = 'rbxassetid://135650224014044',['Gorilla King'] = 'rbxassetid://135650224014044',['Ice Dragon'] = 'rbxassetid://101397684798718',
                        Phoenix = 'rbxassetid://118067990008425',['Ascended Vermilion Phoenix'] = 'rbxassetid://118067990008425', Dragon = 'rbxassetid://78935088838538',['Lava Dragon'] = 'rbxassetid://78935088838538',
                        ['Dragon (Lava)'] = 'rbxassetid://78935088838538', Pegasus = 'rbxassetid://112830316982322',['El Maja'] = 'rbxassetid://77518688092604', Kitsune = 'rbxassetid://107842067813602',
                        Unicorn = 'rbxassetid://70463817382627', Godzilla = 'rbxassetid://102979882140882', ArchAngel = 'rbxassetid://113289118499426',['Cosmic Dragon'] = 'rbxassetid://107923370723949',
                        TRex = 'rbxassetid://124293259998827', Gargoyle = 'rbxassetid://137949993315884',['King Snake'] = 'rbxassetid://77518688092604'}
                        local dV ={}
                        local function dW(dX)
                        if not dX then
                            return ''
                        end
                        if dU[dX] then
                            return dU[dX]
                        end
                        if dV[dX] ~= nil then
                            return dV[dX]
                        end
                        dV[dX] = cz(dX) or ''
                        return dV[dX]
                    end
                    local function dX(dY)
                    local dZ = syn and syn.request or http and http.request or request or http_request
                    if dZ then
                        local d0
                        if pcall(
                        function() d0 = dZ(dY)
                    end
                    ) and d0 then
                        return d0
                    end
                end
                if dY.Method == 'GET' and game and game.HttpGet then
                    local d0
                    if pcall(
                    function() d0 = game:HttpGet(dY.Url, true)
                end
                ) and d0 then
                    return{StatusCode = 200, Body = d0}
                end
            end
            return nil
        end
        local dY ={{id = 'eternal_fast', title = 'Eternal', cycleLabel = '45 - 90m', rarity = 'Eternal', windowMin = 45, windowMax = 90, priority = 1, color = Color3.fromRGB(255,
        215, 0), candidates ={{name = 'Mosasaurus', area = 'Prehistoric', chance = '10.85%', icon = 'rbxassetid://124293259998827'},{name = 'Oni Tiger', area = 'Cherry Blossom',
        chance = '10.85%', icon = 'rbxassetid://109908891899435'},{name = 'Lunar Dragon', area = 'Cosmic', chance = '10.85%', icon = 'rbxassetid://93762296316916'},
        {name = 'Gorilla King', area = 'Titan Temple', chance = '10.85%', icon = 'rbxassetid://135650224014044'},{name = 'Ice Dragon', area = 'Snow', chance = '10.85%',
        icon = 'rbxassetid://101397684798718'},{name = 'Phoenix', area = 'Volcano', chance = '10.85%', icon = 'rbxassetid://118067990008425'}}},{id = 'divine_fast',
        title = 'Divine', cycleLabel = '1.5 - 3h', rarity = 'Divine', windowMinH = 1.5, windowMaxH = 3, priority = 2, color = Color3.fromRGB(255, 255, 255), candidates ={{name = 'Kitsune',
        area = 'Cherry Blossom', chance = '20%', icon = 'rbxassetid://107842067813602'},{name = 'ArchAngel', area = 'Heaven', chance = '20%', icon = 'rbxassetid://113289118499426'},
        {name = 'Godzilla', area = 'Prehistoric', chance = '20%', icon = 'rbxassetid://102979882140882'},{name = 'Pegasus', area = 'Fantasy', chance = '20%', icon = 'rbxassetid://112830316982322'},
        {name = 'Unicorn', area = 'Magical Forest', chance = '20%', icon = 'rbxassetid://70463817382627'}}}}
        local function dZ(d0)
        if d0 then
            if not d0.name then
                return false
            end
            else
            return false
        end
        local d1 = tonumber(d0.ts) or os.time() d0.ts = d1
        local d2 =(d0.rarity or ''):lower()
        if d2 ~= 'eternal' and d2 ~= 'divine' then
            return false
        end
        local d3 = dO(d0.name)
        for d4, d5 in ipairs(dh.history) do
            if d5.uid and(d0.uid and d5.uid == d0.uid) then
                return false
            end
            if dO(d5.name) == d3 and math.abs((d5.ts or 0) - d1) < 600 then
                return false
            end
        end
        table.insert(dh.history, d0) table.sort(dh.history,
        function(d6, d7)
        return(d6.ts or 0) >(d7.ts or 0)
    end
    )
    if d2 == 'eternal' then
        if dh.lastEternal then
            if d1 >=(dh.lastEternal.ts or 0) then
                dh.lastEternal = d0
            end
            else
            dh.lastEternal = d0
        end
        elseif
        d2 == 'divine' then
            if dh.lastDivine then
                if d1 >=(dh.lastDivine.ts or 0) then
                    dh.lastDivine = d0
                end
                else
                dh.lastDivine = d0
            end
        end
        return true
    end
    dh.getLatestSpawn =
    function(d0, d1)
    for d2, d3 in ipairs(dh.history) do
        if
        if d0 then
            d3.rarity and d3.rarity:lower() == d0:lower()
            else
            not d0 then
                if d1 and # d1 > 0 then
                    local d4 = dO(d3.name)
                    for d5, d6 in ipairs(d1) do
                        if dO(d6.name) == d4 then
                            return d3
                        end
                    end
                    else
                    return d3
                end
            end
        end
        return nil
    end
    for d0, d1 in ipairs({{uid = 'afad935fc39f4ad0a28d83d74dad60f8', name = 'Ice Dragon', area = 'Snow', rarity = 'Eternal', ts = 1789738200, reporter = 'Server Alert'},
    {uid = 'aac1107e3c3a428c93ecc8d5c4c03296', name = 'Mosasaurus', area = 'Prehistoric', rarity = 'Eternal', ts = 1789735200, reporter = 'Server Alert'},{uid = '2f08670c03054614b5c088092e0eab9e',
    name = 'Eternal Lunar Dragon', area = 'Cosmic', rarity = 'Eternal', ts = 1789733400, reporter = 'Server Alert'},{uid = 'd2c1c02c35224ca78eddeda7128643a6',
    name = 'Skeleton Horse', area = 'Light Dark', rarity = 'Eternal', ts = 1789731600, reporter = 'Server Alert'},{uid = 'a9f84b4645bd4d23a2a8887923febe6e',
    name = 'Gorilla King', area = 'Titan Temple', rarity = 'Eternal', ts = 1789729800, reporter = 'Server Alert'},{uid = 'seed_divine_1', name = 'Kitsune',
    area = 'Cherry Blossom', rarity = 'Divine', ts = 1789678800, reporter = 'Server Alert'}}) do
        dZ(d1)
    end
    local function d2(d3)
    if d3 then
        if type(d3) ~= 'string' then
            return nil
        end
        else
        return nil
    end
    if not d3:find('spawned in') then
        return nil
    end
    local d4 = d3:gsub('<[^>]+>', ''):gsub('[%c]', '')
    local d5, d6, d7 = d4:match('A%s+(%a+)%s+(.-)%s+Egg%s+spawned%s+in%s+([^!]+)')
    if d5 and d6 and d7 then
        else
        d6, d5, d7 = d4:match('([%w%s]+)%s*%((%a+)%)%s+has%s+spawned%s+in%s+([^!]+)')
    end
    if d5 and(d6 and d7) then
        local d8 = d7:gsub('%s+$', ''):gsub('^%s+', '')
        local d9 = d6:gsub('%s+$', ''):gsub('^%s+', '')
        return d5:gsub('%s+$', ''):gsub('^%s+', ''), d9, d8
    end
    return nil
end
local function d3(d4)
local d5, d6, d7 = d2(d4)
if d5 then
    if d6 then
        if not d7 then
            return
        end
        else
        return
    end
    else
    return
end
local d8 = os.time()
local d9 = dO(d6)
local ea = math.floor(d8 / 300)
local eb = string.format('alert_%s_%s_%d', d9, d7:lower(), ea)
if dh.reportedUids[eb] then
    return
end
dh.reportedUids[eb] = d8 dh.lastAlert ={pet = d6, area = d7, rarity = d5, ts = d8, norm = d9}
if dZ({uid = eb, name = d6, area = d7, rarity = d5, ts = d8, reporter = 'Server Alert'}) then
    pcall(dh.paint)
end
end
dh.reportSpawn =
function(d4, d5, d6, d7, d8)
if d4 then
    if dh.reportedUids[d4] then
        return
    end
    else
    return
end
local d9 = os.time()
local ea = tonumber(d8) or d9
if d9 - dh.lastReportTime < 3 then
    return
end
dh.reportedUids[d4] = ea dh.lastReportTime = d9
local eb = g and g.Name or 'Player'
if dZ({uid = tostring(d4), name = d5, area = d6, rarity = d7, ts = ea, reporter = eb}) then
    pcall(dh.paint)
end
end
dh.syncBackend =
function()
local d4 = os.time()
if d4 - dh.lastSync < 10 then
    return
end
dh.lastSync = d4 task.spawn(
function()
local d5 = getgenv and getgenv().SenaBackend or{}
local d6 = d5.Api or 'https://senahub.xyz/api'
local d7 = d5.Key or ''
local d8 = g and tostring(g.UserId) or '0'
local d9 = dX({Url = d6..'/egg/latest?key='..tostring(d7)..'&uid='..tostring(d8)..'&t='..tostring(d4), Method = 'GET'})
if d9 and(d9.StatusCode == 200 or d9.Status == 200) and d9.Body then
    local ea = game:GetService('HttpService') d6, d8 = pcall(
    function()
    return ea:JSONDecode(d9.Body)
end
)
if d6 and type(d8) == 'table' and d8.ok then
    if d8.last_eternal and(type(d8.last_eternal) == 'table' and d8.last_eternal.name) then
        dZ(d8.last_eternal)
    end
    if d8.last_divine and(type(d8.last_divine) == 'table' and d8.last_divine.name) then
        dZ(d8.last_divine)
    end
    if type(d8.recent_spawns) == 'table' then
        for eb, ec in ipairs(d8.recent_spawns) do
            dZ(ec)
        end
    end
    pcall(dh.paint)
end
end
end
)
end
dh.scanField =
function()
local d4 pcall(
function() d4 = ca.ReadFieldEggs()
end
)
if not d4 or not d4.Records then
    return
end
local d5 = os.time()
if not dh._fieldInitialized then
    dh._fieldInitialized = true
    for d6, d7 in ipairs(d4.Records) do
        if d7.Uid then
            dh.knownFieldUids[d7.Uid] = true
        end
    end
    return
end
for d6, d7 in ipairs(d4.Records) do
    if d7.Uid and not dh.knownFieldUids[d7.Uid] then
        dh.knownFieldUids[d7.Uid] = true
        if d7.State ~= 'Claimed' and d7.BottomCFrame then
            local d8 = d7.AssetCategory
            local d9, ea = cx(d8)
            if ea == 'Divine' or ea == 'Eternal' then
                local eb = d8 == 'King Kong' and 'Gorilla King' or(d8 == 'Ascended Vermilion Phoenix' and 'Phoenix' or d8)
                local ec =
                if dh.lastAlert then
                    if d5 -(dh.lastAlert.ts or 0) <= 60 then
                        if dO(dh.lastAlert.pet) == dO(eb) then
                            if dh.lastAlert.area:lower() ==(d7.AreaId or ''):lower() then
                                dh.lastAlert.ts
                                else
                                d5
                                else
                                d5
                                else
                                d5
                                else
                                d5 dh.reportSpawn(d7.Uid, eb, d7.AreaId or 'Field', ea, ec)
                            end
                        end
                    end
                end
            end
            dh.paint =
            function() cr()
            if dh.list then
                if not dh.list.Parent then
                    return
                end
                else
                return
            end
            for d4, d5 in ipairs(dh.list:GetChildren()) do
                if d5:IsA('Frame') then
                    d5:Destroy()
                end
            end
            local d6 = os.time()
            local d7 = dh.getLatestSpawn('eternal')
            local d8 = dh.getLatestSpawn('divine')
            local d9 = d7 and d7.ts or 1789738200
            local ea = d8 and d8.ts or 1789678800
            if dh.catSeg then
                dh.catSeg.set(dh.category, false)
            end
            if dh.chipSeg then
                dh.chipSeg.set(dh.filter, false)
            end
            if dh.noticeBox then
                dh.noticeBox.Visible = dh.category == 'targets'
            end
            if dh.summaryBox then
                dh.summaryBox.Visible = dh.category == 'history'
                if dh.summaryText and dh.category == 'history' then
                    local eb = d7 and d7.name or 'Phoenix'
                    local ec = d7 and d7.area or 'Volcano'
                    local ed = d7 and d7.ts or d9
                    local ee = dQ(ed, true)
                    local ef = dR(ed)
                    local eg = d8 and d8.name or 'Kitsune'
                    local eh = d8 and d8.area or 'Cherry Blossom'
                    local ei = d8 and d8.ts or ea
                    local ej = dQ(ei, true)
                    local ek = dR(ei) dh.summaryText.Text = string.format([[<b>LAST ETERNAL:</b> <font color='#ffd700'><b>%s</b></font> (%s) - %s <font color='#8899aa'>(%s)</font>
<b>LAST DIVINE:</b> <font color='#ffffff'><b>%s</b></font> (%s) - %s <font color='#8899aa'>(%s)</font>]],
                    eb, ec, ee, ef, eg, eh, ej, ek)
                end
            end
            if dh.refreshBtn then
                dh.refreshBtn.setText(dh.category == 'targets' and 'Refresh targets' or 'Refresh history')
            end
            if dh.category == 'targets' then
                local eb = 0
                for ec, ed in ipairs(dY) do
                    if dh.filter == 'All' or dh.filter == ed.rarity then
                        eb += 1
                        local ee = dh.getLatestSpawn(ed.rarity, ed.candidates) or d7
                        local ef =
                        if ed.rarity == 'Divine' then
                            dh.getLatestSpawn('divine') or d8
                            else
                            ee
                            local eg = ef and ef.ts or(ed.rarity == 'Divine' and ea or d9)
                            local eh = ed.windowMinH and ed.windowMinH * 3600 or(ed.windowMin or 45) * 60
                            local ei = ed.windowMaxH and ed.windowMaxH * 3600 or(ed.windowMax or 90) * 60
                            local ej = ei - eh
                            local ek = eg + eh
                            local el = eg + ei
                            if ed.rarity == 'Eternal' and d6 - el > eh * 0.75 then
                                ei = el eg = ek
                                while true do
                                    if not(d6 - ei > eh * 0.75) then
                                        break
                                    end
                                    eg = ei + eh ei = eg + ej
                                end
                                ek = eg el = ei
                            end
                            ek, el = dP(ek), dP(el) eg = 'UPCOMING' ei = Color3.fromRGB(100, 200, 255)
                            if d6 > el then
                                local em = math.ceil((d6 - el) / 60) eg = em >= 60 and string.format('OVERDUE +%.1fh', em / 60) or string.format('OVERDUE +%dm', em) ei = Color3.fromRGB(255,
                                0, 128)
                                else
                                if d6 >= ek and d6 <= el then
                                    eg = 'IN WINDOW' ei = Color3.fromRGB(0, 255, 136)
                                    else
                                    ej = math.ceil((ek - d6) / 60)
                                    if ej > 0 and ej < 60 then
                                        eg = string.format('IN %dm', ej) ei = Color3.fromRGB(80, 210, 255)
                                        else
                                        if ej >= 60 then
                                        eg = string.format('IN %.1fh', ej / 60) ei = Color3.fromRGB(80, 210, 255)
                                    end
                                end
                            end
                        end
                        eh = Instance.new('Frame') eh.Size = UDim2.new(1, - 6, 0, 136) eh.BackgroundColor3 = cl.surface eh.BackgroundTransparency = 0.15 eh.BorderSizePixel = 0 eh.LayoutOrder = ec eh.Parent = dh.list Instance.new('UICorner',
                        eh).CornerRadius = UDim.new(0, 8)
                        local em = Instance.new('UIStroke', eh) em.Color = ed.color or cl.accent em.Thickness = 1 em.Transparency = 0.78
                        local en = Instance.new('Frame') en.Size = UDim2.new(0, 4, 1, - 12) en.Position = UDim2.fromOffset(0, 6) en.BorderSizePixel = 0 en.BackgroundColor3 = ed.color or cl.accent en.Parent = eh Instance.new('UICorner',
                        en).CornerRadius = UDim.new(1, 0)
                        local eo = Instance.new('TextLabel') eo.BackgroundTransparency = 1 eo.Position = UDim2.fromOffset(12, 6) eo.Size = UDim2.new(1, - 120, 0, 16) eo.Font = b6 eo.TextSize = 13 eo.TextTruncate = Enum.TextTruncate.AtEnd eo.TextXAlignment = Enum.TextXAlignment.Left eo.TextColor3 = ed.color or Color3.fromRGB(255,
                        255, 255) eo.Text = string.format('%s Window (%s)', ed.title, ed.cycleLabel) eo.Parent = eh
                        local ep = Instance.new('TextLabel') ep.Position = UDim2.new(1, - 12, 0, 6) ep.AnchorPoint = Vector2.new(1, 0) ep.AutomaticSize = Enum.AutomaticSize.X ep.Size = UDim2.fromOffset(0,
                        18) ep.BackgroundColor3 = ei ep.BackgroundTransparency = 0.2 ep.Font = b6 ep.TextSize = 10 ep.TextColor3 = Color3.fromRGB(255, 255, 255) ep.Text = eg ep.Parent = eh Instance.new('UICorner',
                        ep).CornerRadius = UDim.new(0, 4)
                        local eq = Instance.new('UIPadding', ep) eq.PaddingLeft = UDim.new(0, 8) eq.PaddingRight = UDim.new(0, 8)
                        local er = Instance.new('TextLabel') er.BackgroundTransparency = 1 er.Position = UDim2.fromOffset(12, 24) er.Size = UDim2.new(1, - 24, 0, 14) er.Font = b7 er.TextSize = 11 er.TextXAlignment = Enum.TextXAlignment.Left er.TextColor3 = Color3.fromRGB(150,
                        180, 220) er.Text = string.format('Window: %s', dS(ek, el)) er.Parent = eh
                        local es = Instance.new('ScrollingFrame') es.Position = UDim2.fromOffset(12, 42) es.Size = UDim2.new(1, - 24, 0, 86) es.BackgroundTransparency = 1 es.BorderSizePixel = 0 es.ScrollBarThickness = 2 es.ScrollBarImageColor3 = ed.color or cl.accent es.ScrollingDirection = Enum.ScrollingDirection.X es.CanvasSize = UDim2.new(0,
                        0, 0, 0) es.AutomaticCanvasSize = Enum.AutomaticSize.X es.Parent = eh ej = Instance.new('UIListLayout', es) ej.FillDirection = Enum.FillDirection.Horizontal ej.Padding = UDim.new(0,
                        6)
                        for et, eu in ipairs(ed.candidates) do
                            local ev = Instance.new('Frame') ev.Size = UDim2.fromOffset(72, 80) ev.BackgroundColor3 = Color3.fromRGB(22, 26, 36) ev.BackgroundTransparency = 0.3 ev.BorderSizePixel = 0 ev.Parent = es Instance.new('UICorner',
                            ev).CornerRadius = UDim.new(0, 6)
                            local ew = Instance.new('UIStroke', ev) ew.Color = ed.color or cl.strokeCol ew.Thickness = 1 ew.Transparency = 0.75
                            local ex = Instance.new('ImageLabel') ex.Position = UDim2.fromOffset(22, 5) ex.Size = UDim2.fromOffset(28, 28) ex.BackgroundColor3 = Color3.fromRGB(30,
                            34, 46) ex.BackgroundTransparency = 0.4 ex.BorderSizePixel = 0 ex.ScaleType = Enum.ScaleType.Fit ex.Image = eu.icon or dW(eu.name) ex.Parent = ev Instance.new('UICorner',
                            ex).CornerRadius = UDim.new(0, 4)
                            local ey = Instance.new('TextLabel') ey.Position = UDim2.new(0, 3, 0, 36) ey.Size = UDim2.new(1, - 6, 0, 13) ey.BackgroundTransparency = 1 ey.Font = b6 ey.TextSize = 10 ey.TextTruncate = Enum.TextTruncate.AtEnd ey.TextColor3 = Color3.fromRGB(230,
                            235, 245) ey.TextXAlignment = Enum.TextXAlignment.Center ey.Text = eu.name ey.Parent = ev
                            local ez = Instance.new('TextLabel') ez.Position = UDim2.new(0, 3, 0, 50) ez.Size = UDim2.new(1, - 6, 0, 12) ez.BackgroundTransparency = 1 ez.Font = b7 ez.TextSize = 9 ez.TextTruncate = Enum.TextTruncate.AtEnd ez.TextColor3 = cl.muted ez.TextXAlignment = Enum.TextXAlignment.Center ez.Text = eu.area ez.Parent = ev
                            local eA = Instance.new('TextLabel') eA.Position = UDim2.new(0, 3, 0, 63) eA.Size = UDim2.new(1, - 6, 0, 13) eA.BackgroundTransparency = 1 eA.Font = b6 eA.TextSize = 10 eA.TextColor3 = Color3.fromRGB(255,
                            185, 0) eA.TextXAlignment = Enum.TextXAlignment.Center eA.Text = eu.chance eA.Parent = ev
                        end
                    end
                end
                dh.list.CanvasSize = UDim2.new(0, 0, 0, eb * 142 + 10)
                else
                local eb ={}
                for ec, ed in ipairs(dh.history) do
                    if dh.filter == 'All' or dh.filter == ed.rarity then
                        local ee, ef, eg = cx(ed.name) table.insert(eb,{name = ed.name, area = ed.area, rarity = ed.rarity, subText1 = string.format('[%s] - %s',(ed.rarity or 'Eternal'):upper(),
                        ed.area or 'Field'), subText2 = string.format('Source: %s', ed.reporter or 'Server Alert'), rateText = dQ(ed.ts, false), badge = dR(ed.ts), badgeColor = Color3.fromRGB(0,
                        255, 136), color = eg or(ed.rarity == 'Divine' and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 215, 0)), icon = dW(ed.name), order = 10000000000 -(ed.ts or 0)})
                    end
                end
                for ee, ef in ipairs(eb) do
                    local eg = Instance.new('Frame') eg.Size = UDim2.new(1, - 6, 0, 54) eg.BackgroundColor3 = cl.surface eg.BackgroundTransparency = 0.15 eg.BorderSizePixel = 0 eg.LayoutOrder = ee eg.Parent = dh.list Instance.new('UICorner',
                    eg).CornerRadius = UDim.new(0, 8)
                    local eh = Instance.new('UIStroke', eg) eh.Color = ef.color or cl.accent eh.Thickness = 1 eh.Transparency = 0.78
                    local ei = Instance.new('Frame') ei.Size = UDim2.new(0, 4, 1, - 12) ei.Position = UDim2.fromOffset(0, 6) ei.BorderSizePixel = 0 ei.BackgroundColor3 = ef.color or cl.accent ei.Parent = eg Instance.new('UICorner',
                    ei).CornerRadius = UDim.new(1, 0)
                    local ej = Instance.new('ImageLabel') ej.Position = UDim2.fromOffset(10, 8) ej.Size = UDim2.fromOffset(38, 38) ej.BackgroundColor3 = Color3.fromRGB(25,
                    28, 38) ej.BackgroundTransparency = 0.4 ej.BorderSizePixel = 0 ej.ScaleType = Enum.ScaleType.Fit ej.Image = ef.icon or '' ej.Parent = eg Instance.new('UICorner',
                    ej).CornerRadius = UDim.new(0, 6)
                    local ek = Instance.new('TextLabel') ek.BackgroundTransparency = 1 ek.Position = UDim2.fromOffset(56, 6) ek.Size = UDim2.new(1, - 165, 0, 16) ek.Font = b6 ek.TextSize = 12 ek.TextXAlignment = Enum.TextXAlignment.Left ek.TextTruncate = Enum.TextTruncate.AtEnd ek.TextColor3 = cl.text ek.Text = ef.name ek.Parent = eg
                    local el = Instance.new('TextLabel') el.BackgroundTransparency = 1 el.Position = UDim2.fromOffset(56, 22) el.Size = UDim2.new(1, - 165, 0, 14) el.Font = b7 el.TextSize = 11 el.TextXAlignment = Enum.TextXAlignment.Left el.TextTruncate = Enum.TextTruncate.AtEnd el.TextColor3 = cl.muted el.Text = ef.subText1 el.Parent = eg
                    local em = Instance.new('TextLabel') em.BackgroundTransparency = 1 em.Position = UDim2.fromOffset(56, 36) em.Size = UDim2.new(1, - 165, 0, 13) em.Font = b7 em.TextSize = 10 em.TextXAlignment = Enum.TextXAlignment.Left em.TextTruncate = Enum.TextTruncate.AtEnd em.TextColor3 = Color3.fromRGB(150,
                    180, 220) em.Text = ef.subText2 em.Parent = eg
                    local en = Instance.new('Frame') en.BackgroundTransparency = 1 en.AnchorPoint = Vector2.new(1, 0.5) en.Position = UDim2.new(1, - 8, 0.5, 0) en.Size = UDim2.fromOffset(105,
                    38) en.Parent = eg
                    local eo = Instance.new('TextLabel') eo.BackgroundTransparency = 1 eo.Size = UDim2.new(1, 0, 0, 18) eo.Font = b6 eo.TextSize = 11 eo.TextXAlignment = Enum.TextXAlignment.Right eo.TextTruncate = Enum.TextTruncate.AtEnd eo.TextColor3 = ef.badgeColor eo.Text = string.format('[%s]',
                    ef.badge) eo.Parent = en
                    local ep = Instance.new('TextLabel') ep.BackgroundTransparency = 1 ep.Position = UDim2.new(0, 0, 0, 18) ep.Size = UDim2.new(1, 0, 0, 16) ep.Font = b7 ep.TextSize = 11 ep.TextXAlignment = Enum.TextXAlignment.Right ep.TextTruncate = Enum.TextTruncate.AtEnd ep.TextColor3 = Color3.fromRGB(170,
                    185, 210) ep.Text = ef.rateText ep.Parent = en
                end
                dh.list.CanvasSize = UDim2.new(0, 0, 0, # eb * 58 + 10)
            end
        end
        dh.build =
        function(d4)
        local d5 = Instance.new('Frame') d5.Size = UDim2.fromScale(1, 1) d5.BackgroundTransparency = 1 d5.BorderSizePixel = 0 d5.Parent = d4 dh.headLbl = c0.text(d5,
        {text = 'Global Egg Data & History', style = 'body', color = cl.accent, pos = UDim2.fromOffset(14, 2), size = UDim2.new(1, - 28, 0, 18)}) dh.headLbl.Font = b6 dh.catSeg = c0.segmented(d5,
        {options ={{'targets', 'Egg Data (targets)'},{'history', 'Egg History'}}, value = dh.category, h = 28, pos = UDim2.fromOffset(14, 22), size = UDim2.new(1,
        - 28, 0, 32), onChange =
        function(d6) dh.category = d6 dh.filter = 'All' dh.paint()
    end
    })
    local d6 = Instance.new('Frame') d6.Position = UDim2.fromOffset(14, 58) d6.Size = UDim2.new(1, - 28, 0, 44) d6.BackgroundColor3 = Color3.fromRGB(16, 20,
    32) d6.BorderSizePixel = 0 d6.Parent = d5 Instance.new('UICorner', d6).CornerRadius = UDim.new(0, 6)
    local d7 = Instance.new('UIStroke', d6) d7.Color = Color3.fromRGB(50, 80, 130) d7.Thickness = 1 dh.noticeBox = d6
    local d8 = Instance.new('TextLabel') d8.Position = UDim2.new(0, 8, 0, 4) d8.Size = UDim2.new(1, - 16, 1, - 8) d8.BackgroundTransparency = 1 d8.Font = b7 d8.TextSize = 11 d8.TextColor3 = Color3.fromRGB(180,
    205, 235) d8.TextXAlignment = Enum.TextXAlignment.Left d8.TextWrapped = true d8.RichText = true d8.Text = [[<b>Note:</b> These are estimated spawn targets based on cycle timing, not 100% guaranteed predictions.]] d8.Parent = d6 dh.noticeText = d8
    local d9 = Instance.new('Frame') d9.Position = UDim2.fromOffset(14, 58) d9.Size = UDim2.new(1, - 28, 0, 44) d9.BackgroundColor3 = Color3.fromRGB(22, 18,
    28) d9.BorderSizePixel = 0 d9.Visible = false d9.Parent = d5 Instance.new('UICorner', d9).CornerRadius = UDim.new(0, 6)
    local ea = Instance.new('UIStroke', d9) ea.Color = Color3.fromRGB(130, 80, 40) ea.Thickness = 1 dh.summaryBox = d9
    local eb = Instance.new('TextLabel') eb.Position = UDim2.new(0, 8, 0, 4) eb.Size = UDim2.new(1, - 16, 1, - 8) eb.BackgroundTransparency = 1 eb.Font = b7 eb.TextSize = 11 eb.TextColor3 = Color3.fromRGB(240,
    220, 200) eb.TextXAlignment = Enum.TextXAlignment.Left eb.TextWrapped = true eb.RichText = true eb.Text = '' eb.Parent = d9 dh.summaryText = eb dh.chipSeg = c0.segmented(d5,
    {options ={{'All', 'All'},{'Eternal', 'Eternal'},{'Divine', 'Divine'}}, value = dh.filter, pos = UDim2.fromOffset(14, 106), size = UDim2.new(1, - 28, 0,
    28), onChange =
    function(ee) dh.filter = ee dh.paint()
end
}) dh.chips = dh.chipSeg.buttons
local ee = Instance.new('ScrollingFrame') ee.Position = UDim2.fromOffset(14, 136) ee.Size = UDim2.new(1, - 28, 1, - 180) ee.BackgroundTransparency = 1 ee.BorderSizePixel = 0 ee.ScrollBarThickness = 4 ee.ScrollBarImageColor3 = cl.accent ee.ScrollingDirection = Enum.ScrollingDirection.Y ee.CanvasSize = UDim2.new(0,
0, 0, 0) ee.Parent = d5
local ef = Instance.new('UIListLayout', ee) ef.Padding = UDim.new(0, 6) ef.SortOrder = Enum.SortOrder.LayoutOrder dh.list = ee
local eg = Instance.new('Frame') eg.Position = UDim2.new(0, 14, 1, - 40) eg.Size = UDim2.new(1, - 28, 0, 32) eg.BackgroundTransparency = 1 eg.Parent = d5 dh.refreshBtn = c0.button(eg,
{text = 'Refresh targets', icon = 'refresh-cw', h = 32, onClick =
function() dh.scanField() dh.syncBackend() dh.paint()
end
}) dh.statusLbl = c0.text(eg,{text = '\226\151\143 Online synced', style = 'meta', color = Color3.fromRGB(0, 255, 136), align = Enum.TextXAlignment.Right,
anchor = Vector2.new(1, 0), pos = UDim2.fromScale(1, 0), size = UDim2.new(0.5, - 4, 1, 0)})
if not dh.bound then
    dh.bound = true pcall(
    function()
    local eh = game:GetService('CoreGui'):FindFirstChild('ExperienceChat')
    if eh then
        for ei, ej in ipairs(eh:GetDescendants()) do
            if ej:IsA('TextLabel') and ej.Text:find('spawned in') then
                local ek, el, em = d2(ej.Text)
                if ek and(el and em) then
                    local en = dO(el)
                    local eo = string.format('init_%s_%s', en, em:lower())
                    if not dh.reportedUids[eo] then
                        dh.reportedUids[eo] = os.time() dZ({uid = eo, name = el, area = em, rarity = ek, ts = os.time() - 120, reporter = 'Server Alert'})
                    end
                end
            end
        end
        local function ek(el)
        if el:IsA('TextLabel') and el.Text:find('spawned in') then
            task.wait(0.05) d3(el.Text)
        end
    end
    eh.DescendantAdded:Connect(ek)
end
end
) pcall(
function()
local function eh(ei)
if ei and(ei.Text and ei.Text:find('spawned in')) then
    d3(ei.Text)
end
end
game:GetService('TextChatService').MessageReceived:Connect(eh)
end
)
end
dh.scanField() dh.syncBackend() dh.paint()
end
dh.refresh =
function() dh.scanField() dh.syncBackend() dh.paint()
end
local d4 ={'logs', 'eggs', 'inventory', 'checker', 'eggdata', 'stats'}
local d5 ={logs ={name = 'Egg Logs', w = 420, h = 500, build =
function(d5)
return dk(d5)
end
}, eggs ={name = 'Egg Board', w = 420, h = 500, build =
function(d5)
return dr(d5)
end
}, inventory ={name = 'Inventory & Base', w = 440, h = 510, build =
function(d5)
return dA(d5)
end
}, checker ={name = 'Egg Checker', w = 420, h = 500, build =
function(d5)
return df.build(d5)
end
}, stats ={name = 'Farm Stats', w = 440, h = 560, build =
function(d5)
return dL(d5)
end
}, eggdata ={name = 'Egg Data & History', w = 380, h = 570, build =
function(d5)
return dh.build(d5)
end
}}
local function d6(d7) cr()
local d8 = d5[d7]
if not d8 then
    return
end
local d9 = c8[d7]
if d9 and d9.conns then
    for ea, eb in ipairs(d9.conns) do
        pcall(
        function() eb:Disconnect()
    end
    )
end
end
local ea = '__SNE_Panel_'..d7
for eb, ee in ipairs({game:GetService('CoreGui'),((
function()
local eb, ee = pcall(
function()
return g:FindFirstChild('PlayerGui')
end
)
return eb and ee or nil
end
)())}) do
    if ee then
        pcall(
        function()
        for ef, eg in ipairs(ee:GetDescendants()) do
            if eg.Name == ea and eg:IsA('ScreenGui') then
                pcall(
                function() eg:Destroy()
            end
            )
        end
    end
end
)
end
end
local ef ={}
local eg = game:GetService('TweenService')
local eh = cs()
local ei = Instance.new('ScreenGui') ei.Name = ea ei.ResetOnSpawn = false ei.ZIndexBehavior = Enum.ZIndexBehavior.Sibling ei.DisplayOrder = 99999 ei.Parent = eh
local ej = 0
for ek, el in ipairs(d4) do
    if el == d7 then
        ej = ek - 1
    end
end
local em = Instance.new('Frame') em.AnchorPoint = Vector2.new(0.5, 0.5) em.Size = UDim2.fromOffset(d8.w, d8.h) em.BackgroundTransparency = 1 em.Active = true em.Parent = ei
local en = Instance.new('UIScale') en.Name = 'WindowScale' en.Scale = 1 en.Parent = em
local eo = Instance.new('Frame') eo.BackgroundTransparency = 1 eo.Size = UDim2.fromScale(1, 1) eo.Parent = em
local ep = Instance.new('UIScale') ep.Name = 'Pop' ep.Parent = eo
local eq = game:GetService('UserInputService')
local function er(es)
local et = workspace.CurrentCamera
local eu = et and et.ViewportSize or Vector2.new(1024, 768)
if eu.X <= 0 then
    return
    elseif
    eu.Y <= 0 then
        return
    end
    local ev = eq.TouchEnabled and not eq.KeyboardEnabled or eu.Y < 550
    local ew = eu.X *(ev and 0.86 or 0.94)
    local ex = eu.Y *(ev and 0.88 or 0.92)
    local ey = math.min(1, ew / d8.w, ex / d8.h)
    local ez =
    if ev then
        if ey > 0.82 then
            0.82
            else
            ey
            else
            ey en.Scale = math.clamp(ez, 0.6, 1)
            local eA = en.Scale
            local eB = d8.w * eA
            local eC = d8.h * eA
            if es then
                if ev then
                    em.Position = UDim2.fromOffset(eu.X - math.floor(eB / 2) - 14, math.floor(eu.Y / 2))
                    else
                    em.Position = UDim2.fromOffset(math.floor(eu.X / 2 + ej * 24), math.floor(eu.Y / 2 + ej * 20))
                end
            end
            local eD = eB / 2
            local eE = eC / 2
            local eF = math.min(eD + 8, eu.X / 2)
            local eG = math.max(eu.X - eD - 8, eu.X / 2)
            local eH = math.min(eE + 8, eu.Y / 2)
            local eI = math.max(eu.Y - eE - 8, eu.Y / 2)
            local eJ = em.Position.X.Scale * eu.X + em.Position.X.Offset
            local eK = em.Position.Y.Scale * eu.Y + em.Position.Y.Offset em.Position = UDim2.fromOffset(math.floor(math.clamp(eJ, eF, eG)), math.floor(math.clamp(eK,
            eH, eI)))
        end
        local es = Instance.new('ImageLabel') es.AnchorPoint = Vector2.new(0.5, 0.5) es.BackgroundTransparency = 1 es.Image = 'rbxassetid://6015897843' es.ImageColor3 = ci.shadow es.ImageTransparency = 0.52 es.Position = UDim2.fromScale(0.5,
        0.5) es.ScaleType = Enum.ScaleType.Slice es.Size = UDim2.new(1, 40, 1, 40) es.SliceCenter = Rect.new(49, 49, 450, 450) es.ZIndex = 0 es.Parent = eo
        local et = Instance.new('Frame') et.BackgroundColor3 = Color3.fromRGB(255, 255, 255) et.BorderSizePixel = 0 et.Size = UDim2.fromScale(1, 1) et.ZIndex = 1 et.Parent = eo Instance.new('UICorner',
        et).CornerRadius = UDim.new(0, 10)
        local eu = Instance.new('UIGradient', et) eu.Rotation = 16 eu.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ci.obsTop), ColorSequenceKeypoint.new(0.52,
        ci.obsMid), ColorSequenceKeypoint.new(1, ci.obsLow)})
        local ev = Instance.new('UIStroke', et) ev.Color = ci.strokeCol ev.Thickness = 1 ev.Transparency = 0.72
        local ew = Instance.new('ImageLabel') ew.AnchorPoint = Vector2.new(0, 0.5) ew.BackgroundTransparency = 1 ew.Image = cp ew.Position = UDim2.fromOffset(12,
        22) ew.ScaleType = Enum.ScaleType.Fit ew.Size = UDim2.fromOffset(20, 20) ew.Parent = et
        local ex = Instance.new('Frame') ex.BackgroundTransparency = 1 ex.Position = UDim2.fromOffset(40, 10) ex.Size = UDim2.new(1, - 86, 0, 24) ex.Parent = et
        local ey = Instance.new('UIListLayout', ex) ey.FillDirection = Enum.FillDirection.Horizontal ey.Padding = UDim.new(0, 8) ey.SortOrder = Enum.SortOrder.LayoutOrder ey.VerticalAlignment = Enum.VerticalAlignment.Center
        local ez = c0.text(ex,{text = 'LUKZ', style = 'title', order = 1, size = UDim2.new(0, 0, 1, 0)}) ez.AutomaticSize = Enum.AutomaticSize.X ez.TextTruncate = Enum.TextTruncate.None
        local eA = Instance.new('Frame') eA.AutomaticSize = Enum.AutomaticSize.X eA.BackgroundColor3 = ci.accent eA.BackgroundTransparency = 0.82 eA.BorderSizePixel = 0 eA.LayoutOrder = 2 eA.Size = UDim2.fromOffset(0,
        22) eA.Parent = ex Instance.new('UICorner', eA).CornerRadius = UDim.new(0, 6)
        local eB = Instance.new('UIStroke', eA) eB.Color = ci.accent eB.Thickness = 1 eB.Transparency = 0.45
        local eC = Instance.new('UIPadding', eA) eC.PaddingLeft = UDim.new(0, 10) eC.PaddingRight = UDim.new(0, 10)
        local eD = c0.text(eA,{text = d8.name, style = 'body', size = UDim2.new(0, 0, 1, 0)}) eD.AutomaticSize = Enum.AutomaticSize.X eD.TextTruncate = Enum.TextTruncate.None eD.Font = b6
        local eE = Instance.new('TextButton') eE.AutoButtonColor = false eE.BackgroundColor3 = ci.btnBg eE.BackgroundTransparency = 0.15 eE.Position = UDim2.new(1,
        - 38, 0, 9) eE.Size = UDim2.fromOffset(28, 28) eE.Text = '' eE.ZIndex = 5 eE.Parent = et Instance.new('UICorner', eE).CornerRadius = UDim.new(0, 6)
        local eF = Instance.new('UIStroke', eE) eF.Color = ci.strokeCol eF.Thickness = 1 eF.Transparency = 0.6
        local eG = c0.image(eE, 'x', 14, ci.btnText) eG.AnchorPoint = Vector2.new(0.5, 0.5) eG.Position = UDim2.fromScale(0.5, 0.5) eG.ZIndex = 6
        local function eH() eG.ImageColor3 = Color3.fromRGB(248, 113, 113)
    end
    eE.MouseEnter:Connect(eH)
    local function eI() eG.ImageColor3 = ci.btnText
end
eE.MouseLeave:Connect(eI)
local eJ = Instance.new('TextButton') eJ.AnchorPoint = Vector2.new(0.5, 0.5) eJ.AutoButtonColor = false eJ.AutomaticSize = Enum.AutomaticSize.X eJ.BackgroundColor3 = ci.btnBg eJ.BackgroundTransparency = 0.15 eJ.Position = UDim2.new(0.5,
0, 1, - 24) eJ.Size = UDim2.fromOffset(0, 24) eJ.Text = '' eJ.Parent = et Instance.new('UICorner', eJ).CornerRadius = UDim.new(1, 0)
local eK = Instance.new('UIStroke', eJ) eK.Color = ci.strokeCol eK.Thickness = 1 eK.Transparency = 0.6
local eL = Instance.new('UIPadding', eJ) eL.PaddingLeft = UDim.new(0, 10) eL.PaddingRight = UDim.new(0, 12)
local eM = Instance.new('UIListLayout', eJ) eM.FillDirection = Enum.FillDirection.Horizontal eM.Padding = UDim.new(0, 6) eM.SortOrder = Enum.SortOrder.LayoutOrder eM.VerticalAlignment = Enum.VerticalAlignment.Center c0.image(eJ,
'message-circle', 12, ci.accentB).LayoutOrder = 0
local eN = c0.text(eJ,{text = cq, style = 'meta', order = 1, size = UDim2.new(0, 0, 1, 0)}) eN.AutomaticSize = Enum.AutomaticSize.X eN.TextTruncate = Enum.TextTruncate.None eN.Font = b6
local function eO() pcall(
function() setclipboard('https://'..cq)
end
) eN.Text = 'Copied' task.delay(1.2,
function()
if eN.Parent then
    eN.Text = cq
end
end
)
end
eJ.MouseButton1Click:Connect(eO)
local eP = Instance.new('Frame') eP.BackgroundTransparency = 1 eP.BorderSizePixel = 0 eP.Position = UDim2.fromOffset(0, 46) eP.Size = UDim2.new(1, 0, 1,
- 86) eP.Parent = et
local eQ, eR, eS = false
local function eT(eU)
if eU.UserInputType == Enum.UserInputType.MouseButton1 or eU.UserInputType == Enum.UserInputType.Touch then
    eQ = true eR = eU.Position eS = em.Position
end
end
ex.InputBegan:Connect(eT)
local function eU(eV)
local eW = en and en.Scale or 1
if eV.Position.Y - em.AbsolutePosition.Y <= 44 * eW then
    eT(eV)
end
end
et.InputBegan:Connect(eU) ef[# ef + 1] = eq.InputChanged:Connect(
function(eV)
if eQ and(eV.UserInputType == Enum.UserInputType.MouseMovement or eV.UserInputType == Enum.UserInputType.Touch) then
    local eW = eV.Position - eR em.Position = UDim2.new(eS.X.Scale, eS.X.Offset + eW.X, eS.Y.Scale, eS.Y.Offset + eW.Y)
end
end
) ef[# ef + 1] = eq.InputEnded:Connect(
function(eV)
if(eV.UserInputType == Enum.UserInputType.MouseButton1 or eV.UserInputType == Enum.UserInputType.Touch) and eQ then
    eQ = false pcall(er, false)
end
end
) er(true)
local eV = workspace.CurrentCamera
if eV then
    ef[# ef + 1] = eV:GetPropertyChangedSignal('ViewportSize'):Connect(
    function()
    if ei and(ei.Parent and ei.Enabled) then
        pcall(er, false)
    end
end
)
end
local eW = 0
local function eX() eW += 1 ei.Enabled = true ep.Scale = 0.94 es.ImageTransparency = 1 eg:Create(ep, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{Scale = 1}):Play() eg:Create(es, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.52}):Play()
end
local function eY() eW += 1
local eZ = eW eg:Create(ep, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{Scale = 0.94}):Play() eg:Create(es, TweenInfo.new(0.12,
Enum.EasingStyle.Quad, Enum.EasingDirection.In),{ImageTransparency = 1}):Play() task.delay(0.12,
function()
if eW == eZ then
    cr() ei.Enabled = false
end
end
)
end
local function eZ() cr() eY()
end
eE.MouseButton1Click:Connect(eZ) c8[d7] ={gui = ei, page = eP, holder = em, fitScale = er, conns = ef, open = eX, close = eY} pcall(
function() d8.build(eP)
end
) pcall(
function() di(d7)
end
) eX()
end
local function d7(d8) cr()
local d9 = d8 or 'logs'
local ea = c8[d9]
if ea and(ea.gui and ea.gui.Parent) then
    if ea.open then
        ea.open()
        else
        ea.gui.Enabled = true
    end
    if ea.fitScale then
        pcall(ea.fitScale, false)
    end
    pcall(
    function() di(d9)
end
)
return
end
d6(d9)
end
local function d8()
for d9, ea in ipairs(d4) do
    d7(ea)
end
end
local function d9()
for ea, ef in pairs(c8) do
    if ef and(ef.gui and ef.gui.Enabled) then
        if ef.close then
            ef.close()
            else
            ef.gui.Enabled = false
        end
    end
end
end
task.spawn(
function()
while n() do
    pcall(
    function()
    local ea = ca.ReadFieldEggs()
    if ea and ea.Records then
        for ef, eg in ipairs(ea.Records) do
            c7(eg)
        end
    end
end
) pcall(
function()
if dh and type(dh.scanField) == 'function' then
    dh.scanField()
end
end
)
for ea, ef in ipairs({'logs', 'eggs', 'inventory', 'checker', 'eggdata'}) do
    if c9(ef) then
        pcall(di, ef)
    end
end
task.wait(2)
end
end
);
(
function()
local ea = game:GetService('TweenService')
local ef = game:GetService('GuiService')
local eg = game:GetService('UserInputService')
local eh = 380
local ei = 108
local ej = 12
local ek = 48
local em = 12
local en = Vector3.new(542.93, 71.5, - 405.58)
local eo = Color3.fromRGB(110, 231, 140)
local ep = Color3.fromRGB(248, 113, 113)
local eq = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local er ={} l.__SenaV4StealCardToken = er
local es ={{'carried by another', 'Another player took it'},{'taken by another', 'Another player took it'},{'someone else grabbed', 'Another player took it'},
{'no longer available', 'The egg is gone'},{'target unavailable', 'The egg is gone'},{'target changed', 'The egg is gone'},{'reset countdown', 'Eggs are resetting'},
{'egg reset', 'The egg reset'},{'wall closed', 'Night started'},{'character unavailable', 'You were knocked out'},{'character died', 'You were knocked out'},
{'they banked', 'They banked it first'},{'could not catch', 'Could not catch them'},{'lost sight', 'Could not catch them'},{'bank not confirmed', 'Deposit not confirmed'},
{'delivery failed', 'Deposit not confirmed'},{'not banked', 'Deposit not confirmed'},{'carry', 'Could not pick it up'},{'stopped', 'Stopped'},{'mode changed',
'Stopped'}}
local function et(eu)
local ev = string.lower(tostring(eu or ''))
for ew, ex in ipairs(es) do
    if ev:find(ex[1], 1, true) then
        return ex[2]
    end
end
return 'Steal interrupted \226\128\148 retrying'
end
local eu ={'retrying', 'could not reach', 'destination unavailable', 'steal unavailable', 'target destination', 'no target', 'steal error', 'preparing',
'searching', 'target changed', 'next egg'}
local function ev(ew)
local ex = string.lower(tostring(ew or ''))
if ex == '' then
    return true
    elseif
    ex == 'nil' then
        return true
    end
    for ey, ez in ipairs(eu) do
        if ex:find(ez, 1, true) then
            return true
        end
    end
    return false
end
local ew ={head ={'Heading', 'navigation', ci.accentB}, secure ={'Securing', 'hand', ci.accentB}, home ={'Bringing home', 'home', ci.accentB}, done ={'Stolen',
'circle-check', eo}, friend ={'Dropped', 'gift', eo}, fail ={'Failed', 'circle-x', ep}, retry ={'Retrying', 'navigation', ci.accentB}}
local ex ={}
local function ey()
local ez, eA = pcall(
function()
return gethui and gethui()
end
)
if ez and(typeof(eA) == 'Instance' and not eA:IsA('LayerCollector')) then
    return eA
end
eA, ez = pcall(
function()
return game:GetService('CoreGui')
end
)
return eA and ez or cs()
end
local function ez(eA, eB)
local eC = Instance.new('UICorner') eC.CornerRadius = eB or UDim.new(0, 10) eC.Parent = eA
end
local function eA()
if ex.gui and ex.gui.Parent then
    return true
end
cr()
local eB = ey() pcall(
function()
local eC = eB:FindFirstChild('SenaStealCard')
if eC then
    eC:Destroy()
end
end
)
local eC = Instance.new('ScreenGui') eC.Name = 'SenaStealCard' eC.ResetOnSpawn = false eC.IgnoreGuiInset = true eC.DisplayOrder = - 1 eC.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local eD = Instance.new('Frame') eD.Name = 'Card' eD.AnchorPoint = Vector2.new(0.5, 0) eD.Position = UDim2.new(0.5, 0, 0, - ei - 24) eD.Size = UDim2.fromOffset(eh,
ei) eD.BackgroundColor3 = ci.surface eD.BorderSizePixel = 0 eD.Visible = false eD.Parent = eC ez(eD)
local eE = Instance.new('UIStroke') eE.Color = ci.strokeCol eE.Thickness = 1 eE.Parent = eD
local eF = Instance.new('UIGradient') eF.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ci.obsTop), ColorSequenceKeypoint.new(0.55, ci.obsMid),
ColorSequenceKeypoint.new(1, ci.obsLow)}) eF.Rotation = 16 eF.Parent = eD
local eG = -(ej * 2 + ek + 12) ex.head = c0.text(eD,{style = 'label', text = 'Stealing', color = ci.muted, pos = UDim2.fromOffset(ej, 10), size = UDim2.new(1,
-(ej * 2 + 124), 0, 14)})
local eH = Instance.new('Frame') eH.Name = 'Chip' eH.AnchorPoint = Vector2.new(1, 0) eH.Position = UDim2.new(1, - ej, 0, 8) eH.Size = UDim2.fromOffset(0,
18) eH.AutomaticSize = Enum.AutomaticSize.X eH.BackgroundColor3 = ci.btnBg eH.BorderSizePixel = 0 eH.Parent = eD ez(eH, UDim.new(1, 0))
local eI = Instance.new('UIPadding') eI.PaddingLeft = UDim.new(0, 7) eI.PaddingRight = UDim.new(0, 8) eI.Parent = eH
local eJ = Instance.new('UIListLayout') eJ.FillDirection = Enum.FillDirection.Horizontal eJ.VerticalAlignment = Enum.VerticalAlignment.Center eJ.Padding = UDim.new(0,
4) eJ.SortOrder = Enum.SortOrder.LayoutOrder eJ.Parent = eH ex.chipIcon = Instance.new('ImageLabel') ex.chipIcon.BackgroundTransparency = 1 ex.chipIcon.Size = UDim2.fromOffset(12,
12) ex.chipIcon.LayoutOrder = 1 ex.chipIcon.Parent = eH ex.chipText = c0.text(eH,{style = 'label', text = '', order = 2, size = UDim2.fromOffset(0, 14)}) ex.chipText.AutomaticSize = Enum.AutomaticSize.X ex.chipText.TextTruncate = Enum.TextTruncate.None
local eK = Instance.new('Frame') eK.Position = UDim2.fromOffset(ej, 32) eK.Size = UDim2.fromOffset(ek, ek) eK.BackgroundColor3 = ci.surfaceHi eK.BorderSizePixel = 0 eK.Parent = eD ez(eK,
UDim.new(0, 8)) ex.img = Instance.new('ImageLabel') ex.img.BackgroundTransparency = 1 ex.img.Position = UDim2.fromOffset(4, 4) ex.img.Size = UDim2.new(1,
- 8, 1, - 8) ex.img.ScaleType = Enum.ScaleType.Fit ex.img.Parent = eK ex.title = c0.text(eD,{style = 'title', pos = UDim2.fromOffset(ej + ek + 12, 31),
size = UDim2.new(1, eG, 0, 18)}) ex.rarity = c0.text(eD,{style = 'body', pos = UDim2.fromOffset(ej + ek + 12, 50), size = UDim2.new(1, eG, 0, 16)}) ex.stats = c0.text(eD,
{style = 'meta', color = ci.muted, pos = UDim2.fromOffset(ej + ek + 12, 66), size = UDim2.new(1, eG, 0, 15)}) ex.barBack = Instance.new('Frame') ex.barBack.Position = UDim2.fromOffset(ej,
91) ex.barBack.Size = UDim2.new(1, -(ej * 2 + 84), 0, 6) ex.barBack.BackgroundColor3 = ci.btnBg ex.barBack.BorderSizePixel = 0 ex.barBack.Parent = eD ez(ex.barBack,
UDim.new(1, 0)) ex.barFill = Instance.new('Frame') ex.barFill.Size = UDim2.fromScale(0, 1) ex.barFill.BackgroundColor3 = ci.accent ex.barFill.BorderSizePixel = 0 ex.barFill.Parent = ex.barBack ez(ex.barFill,
UDim.new(1, 0)) ex.eta = c0.text(eD,{style = 'meta', color = ci.muted, align = Enum.TextXAlignment.Right, anchor = Vector2.new(1, 0), pos = UDim2.new(1,
- ej, 0, 86), size = UDim2.fromOffset(80, 16)}) ex.reason = c0.text(eD,{style = 'body', color = ep, pos = UDim2.fromOffset(ej, 86), size = UDim2.new(1,
- ej * 2, 0, 16)}) ex.reason.Visible = false ex.scale = Instance.new('UIScale') ex.scale.Parent = eD eC.Parent = eB ex.gui = eC ex.card = eD
return true
end
local function eB()
local eC = 0 pcall(
function() eC = ef:GetGuiInset().Y
end
)
local eD ={} pcall(
function()
if gethui then
    eD[# eD + 1] = gethui()
end
end
) pcall(
function() eD[# eD + 1] = game:GetService('CoreGui')
end
)
local eE = 0
for eF, eG in ipairs(eD) do
    for eH, eI in ipairs({{'AnnounceGui', 'Holder'},{'NotifyGui', 'AnnounceLayout'}}) do
        eH = eG:FindFirstChild(eI[1])
        local eJ = eH and not(eH and eH.Parent and eH.Parent:IsA('LayerCollector')) and eH:IsA('LayerCollector') and eH.Enabled and eH:FindFirstChild(eI[2])
        if eJ then
            for eK, eL in ipairs(eJ:GetChildren()) do
                if eL:IsA('GuiObject') and eL.Visible then
                    local eM = eL.AbsolutePosition.Y + eL.AbsoluteSize.Y + eC eE =
                    if eM > eE then
                        eM
                        else
                        eE
                    end
                end
            end
        end
    end
    return eE, eC
end
local function eC(eD, eE, eF)
if eD[eE] ~= eF then
    eD[eE] = eF
end
end
local function eD()
local eE = workspace.CurrentCamera
local eF = eE and eE.ViewportSize
return eF and eF.X > 0 and eF.Y > 0 and eF or Vector2.new(1280, 720)
end
local function eE()
local eF = eD()
local eG = eg.TouchEnabled and not eg.KeyboardEnabled or eF.Y < 550
local eH = math.min(1,(eF.X - 32) / eh)
if eG then
    return math.clamp(math.min(eH, 0.6, eF.Y * 0.15 / ei), 0.5, 1)
end
return math.clamp(eH, 0.62, 1)
end
local eF, eG
local eH, eI = false
local eJ ={}
local function eK(eL)
if eI == eL then
    return
end
eI = eL
local eM = ex.card
local eN ={} eN.Position = UDim2.new(0.5, 0, 0, eL) ea:Create(eM, eq, eN):Play()
end
local function eL(eM)
if eM == eH then
    return
end
eH = eM
if eM then
    eI = nil ex.card.Position = UDim2.new(0.5, 0, 0, - ei - 24) ex.card.Visible = true
    local eN = eE() ex.scale.Scale = eN * 0.94 eF = ea:Create(ex.scale, eq,{Scale = eN}) eF:Play()
    else
    eI = - ei - 24
    local eN = ea:Create(ex.card, eq,{Position = UDim2.new(0.5, 0, 0, eI)}) eN.Completed:Connect(
    function()
    if not eH then
        ex.card.Visible = false
    end
end
) eN:Play()
end
end
local function eM(eN)
local eO = ew[eN] or ew.head
if ex.chipKind == eN then
    return
end
ex.chipKind = eN ex.chipText.Text = string.upper(eO[1]) ex.chipText.TextColor3 = eO[3] ex.chipIcon.ImageColor3 = eO[3] c0.icon(ex.chipIcon, eO[2])
end
local function eN(eO)
local eP = eO and(eO.BottomCFrame or eO.BoundsCFrame)
return eP and eP.Position
end
local function eO(eP, eQ)
local eR = eP - eQ
return Vector3.new(eR.X, 0, eR.Z).Magnitude
end
local function eP(eQ, eR)
local eS = string.lower(tostring(eQ or ''))
if eR then
    return 'home'
    elseif
    eS:find('bringing', 1, true) then
        return 'home'
        elseif
        eS:find('deposit', 1, true) then
            return 'home'
            elseif
            eS:find('delivering', 1, true) then
                return 'home'
                elseif
                eS:find('carrying', 1, true) then
                    return 'home'
                    elseif
                    eS:find('validating', 1, true) then
                        return 'home'
                    end
                    if eS:find('securing', 1, true) then
                        return 'secure'
                        elseif
                        eS:find('waiting for carry', 1, true) then
                            return 'secure'
                            elseif
                            eS:find('re-steal', 1, true) then
                                return 'secure'
                                elseif
                                eS:find('re-approach', 1, true) then
                                    return 'secure'
                                    elseif
                                    eS:find('confirm', 1, true) then
                                        return 'secure'
                                        elseif
                                        eS:find('grabbing', 1, true) then
                                        return 'secure'
                                        elseif
                                        eS:find('attacking', 1, true) then
                                        return 'secure'
                                    end
                                    return 'head'
                                end
                                local eQ = 4.2
                                local eR = 0.7
                                local function eS(eT, eU, eV)
                                local eW = g.Character and g.Character:FindFirstChild('HumanoidRootPart')
                                local eX = eN(eT.record)
                                if not eW then
                                    return nil
                                end
                                if eT.boost then
                                    if eU == 'home' then
                                        return eO(eW.Position, en) / eT.back + eR
                                    end
                                    if not eX then
                                        return nil
                                    end
                                    return math.max(eQ -(os.clock() - eT.startedAt), 0) + eO(eX, en) / eT.back + eR
                                end
                                if eU == 'home' then
                                    return eO(eW.Position, en) / eT.back + 2.5
                                end
                                if eT.kind ~= 'auto' then
                                    return nil
                                    elseif
                                    eX then
                                        else
                                        return nil
                                    end
                                    local eY = eT.hold
                                    local eZ =
                                    if eU == 'secure' then
                                        tonumber(string.match(tostring(eV or ''), '%(([%d%.]+)s%)')) or math.max(eY -(os.clock() -(eT.phaseAt or os.clock())), 0.5)
                                        else
                                        eY
                                        return(eU == 'head' and not eT.boost and eO(eW.Position, eX) / eT.out or 0) + eZ + eO(eX, en) / eT.back + 4.5
                                    end
                                    local function eT(eU, eV, eW, eX, eY)
                                    local eZ pcall(
                                    function() eZ = bB.resolve(eW)
                                end
                                )
                                local e_ = eW.AssetCategory
                                local e0, e1, e2 = cx(e_)
                                local e3 ={kind = eU, uid = eV, record = eW, player = eY, startedAt = os.clock(), progress = 0, area = tostring(eW.AreaId or '?'), out = 400, back = 5000,
                                hold = 1}
                                if eX then
                                    e3.delivered = tonumber(eX.stats and eX.stats.delivered) or 0 e3.mode = eX.config and eX.config.stealMode or 'Fly' pcall(
                                    function() e3.boost = eX:_usesPortalBoost(eW) == true
                                end
                                ) pcall(
                                function() e3.walk = eX:_legitWalkSpeed()
                            end
                            )
                            if e3.mode == 'Fly' then
                                e3.out = tonumber(e3.walk) or 16 e3.hold = 1
                                else
                                e3.out = 5000 e3.hold = e3.boost and 0 or(tonumber(eX:_resolveSettleSeconds(eW)) or 8)
                            end
                        end
                        e3.key = tostring(e3.mode)..'|'..e3.area..(e3.boost and '|b' or '') eA() e3.headBase = eY and string.upper('Stealing from '..tostring(eY)) or 'STEALING' eC(ex.head,
                        'Text', e3.headBase) eC(ex.head, 'TextColor3', ci.muted) eC(ex.title, 'Text', eZ and tostring(eZ.name) or tostring(e_ or 'Egg')) eC(ex.rarity, 'Text', tostring(e1 or '?')) eC(ex.rarity,
                        'TextColor3', e2 and e2:Lerp(Color3.new(1, 1, 1), 0.35) or ci.text)
                        local e4 ={}
                        local e5 = cW(eW)
                        if e5 and e5 > 0 then
                            e4[# e4 + 1] = e5 >= 1000 and cw(e5)..' kg' or string.format('%.1f kg', e5)
                        end
                        local e6 = cR(eW)
                        if e6 and e6 > 0 then
                            e4[# e4 + 1] = '$'..cw(e6)..'/s'
                        end
                        local e7 ={}
                        for e8, e9 in ipairs(type(eW.Mutations) == 'table' and eW.Mutations or{}) do
                            if # e7 < 2 then
                                e7[# e7 + 1] = tostring(e9)
                            end
                        end
                        if # e7 > 0 then
                            e4[# e4 + 1] = table.concat(e7, ', ')
                        end
                        eC(ex.stats, 'Text', table.concat(e4, '  \194\183  '))
                        local fa = cz(e_)
                        if not fa then
                            pcall(
                            function() fa = dW(e_)
                        end
                        )
                    end
                    eC(ex.img, 'Image', fa or '') e3.color = e2 or ci.accent eC(ex.barFill, 'BackgroundColor3', e3.color) ex.barFill.Size = UDim2.fromScale(0, 1) ex.barBack.Visible,
                    ex.eta.Visible, ex.reason.Visible = true, true, false ex.chipKind = nil eM('head') eG = e3 eL(true)
                end
                local function eU(eV, eW)
                local eX = eG
                if eX then
                    if eX.endedAt then
                        return
                    end
                    else
                    return
                end
                eX.endedAt = os.clock() eX.result = eV eM(eV)
                if eV == 'fail' then
                    ex.barBack.Visible, ex.eta.Visible, ex.reason.Visible = false, false, true eC(ex.reason, 'TextColor3', ep) eC(ex.reason, 'Text', eW or 'Steal interrupted \226\128\148 retrying')
                    elseif
                    eV == 'retry' then
                        ex.barBack.Visible, ex.eta.Visible, ex.reason.Visible = false, false, true eC(ex.reason, 'TextColor3', ci.muted) eC(ex.reason, 'Text', eW or 'Retrying\226\128\166')
                        else
                        eC(ex.barFill, 'BackgroundColor3', eo)
                        local eY = ex.barFill
                        local eZ ={} eZ.Size = UDim2.fromScale(1, 1) ea:Create(eY, eq, eZ):Play() eC(ex.eta, 'Text', eV == 'friend' and 'Handed off' or 'Banked')
                        if eV == 'done' and eX.kind == 'auto' then
                            local e_ = eX.endedAt - eX.startedAt eJ[eX.key] = eJ[eX.key] and eJ[eX.key] * 0.6 + e_ * 0.4 or e_
                        end
                    end
                end
                local eV ={rt = nil, unsub = nil, result = nil, at = 0}
                local function eW(eX)
                if eV.rt == eX then
                    return
                end
                if eV.unsub then
                    pcall(eV.unsub)
                end
                eV.rt = eX eV.unsub = nil
                if eX then
                    if type(eX.onChanged) ~= 'function' then
                        return
                    end
                    else
                    return
                end
                local eY
                local eZ, e_ = pcall(eX.onChanged, eX,
                function(eZ)
                if type(eZ) ~= 'table' then
                    return
                end
                if eY and not eZ.running then
                    eV.result, eV.at = eZ.lastResult, os.clock()
                end
                eY = eZ.running
            end
            )
            if eZ and type(e_) == 'function' then
                eV.unsub = e_
            end
        end
        local function eX(eY)
        if eY then
            if eY.destroyed then
                return nil
                elseif
                eY._externalDeliver then
                    return nil
                end
                else
                return nil
            end
            local eZ = eY.primerUid
            local e_ = eY.targetUid e_ = e_ or(
            if eY.activeTarget then
                if eY.activeTarget.Uid ~= eZ then
                    eY.activeTarget.Uid
                    else
                    e_
                    else
                    e_)
                    local e0 = e_ or(
                    if eY.carry then
                        if eY.carry.active then
                            if eY.carry.uid ~= eZ then
                                eY.carry.uid
                                else
                                e_
                                else
                                e_
                                else
                                e_)
                                if e0 == eZ then
                                    return nil
                                end
                                return e0
                            end
                            local function eY(eZ)
                            local e_ = eV.at >= eG.startedAt and eV.result or eZ and eZ.stats and eZ.stats.lastResult
                            local e0 = string.lower(tostring(e_ or ''))
                            if eZ and(tonumber(eZ.stats.delivered) or 0) >(eG.delivered or 0) then
                                return 'done'
                            end
                            if e0:find('dropped for a friend', 1, true) then
                                return 'friend'
                            end
                            if e0:find('safe return complete', 1, true) then
                                return 'done'
                            end
                            if eG.sawCarry then
                                local e1 pcall(
                                function() e1 = ca.ReadFieldEgg(eG.uid)
                            end
                            )
                            if e1 == nil then
                                return 'done'
                                else
                                if e1.State == 'Claimed' then
                                    return 'done'
                                end
                            end
                        end
                        if eZ and(not eZ.enabled and not eZ._recalling) then
                            return 'fail', 'Stopped'
                        end
                        if ev(e_) then
                            return 'retry'
                        end
                        return 'fail', et(e_)
                    end
                    local eZ
                    local function e_()
                    local e0 = l.__SenaV4EggRuntime
                    local e1 = l.__SenaV4PlayerSteal eW(e0)
                    local e2, e3
                    local e4, e5, e6, e7 = false
                    if e1 and e1.running and type(e1.cardTarget) == 'table' then
                        local e8 = e1.cardTarget.uid e3 = e1.status e5 = e1.cardTarget.player e4 = e0 ~= nil and e0._externalDeliver == true e2, e7 = 'ps', e8
                        else
                        local e8 = eX(e0)
                        if e8 then
                            e3 = e0.stats and e0.stats.status e4 = e0.carry and e0.carry.active and e0.carry.uid == e8 e2 = 'auto'
                        end
                        e7 = e8
                    end
                    if eG and not eG.endedAt and(e7 ~= eG.uid or e2 ~= eG.kind) then
                        eZ = eZ or os.clock()
                        if e7 ~= nil or os.clock() - eZ >= 0.4 then
                            if eG.kind == 'ps' then
                                local e8 = e1 and e1.history and e1.history[1]
                                local fa = e8 and tostring(e8.outcome) or ''
                                if fa == 'taken' then
                                    eU('done')
                                    elseif
                                    fa == 'sniped drop' then
                                        eU('done')
                                        else
                                        eU('fail', et(fa))
                                    end
                                    else
                                    eU(eY(e0))
                                end
                            end
                            else
                            eZ = nil
                        end
                        if eG and eG.endedAt then
                            local e8 = os.clock() - eG.endedAt
                            if e7 and e8 >= 1.5 then
                                eG = nil
                                else
                                if not e7 and e8 >=(eG.result == 'fail' and 4 or 3) then
                                    eG = nil eL(false)
                                end
                            end
                        end
                        local e8
                        if e7 and not eG then
                            local fa
                            local fb, fc = e2 == 'ps'
                            if fb then
                                fc = e1.cardTarget.record
                                else
                                fc = fa
                            end
                            pcall(
                            function() fc = fc or ca.ReadFieldEgg(e7)
                        end
                        ) fc = fc or e0 and e0.records and e0.records[e7]
                        if type(fc) == 'table' then
                            eT(e2, e7, fc, e0, e5)
                        end
                    end
                    if eG then
                        if not eH then
                            return
                        end
                        else
                        return
                    end
                    e0, e1 = eB()
                    local fa = eE()
                    if not(eF and eF.PlaybackState == Enum.PlaybackState.Playing) then
                        eC(ex.scale, 'Scale', fa)
                    end
                    eC(ex.card, 'Size', UDim2.fromOffset(math.floor(math.min(eh,(eD().X - 32) / fa)), ei)) eK(math.floor(math.max(e1 + em, e0 + em)))
                    if eG.endedAt then
                        return
                    end
                    if os.clock() >=(eG.netAt or 0) then
                        eG.netAt = os.clock() + 1
                        local fb = I()
                        local fc = l.__SenaV4NetPing() e8 = fb > 0 and fb < 20 and 'LOW FPS' or nil e8 =
                        if fc > 250 then
                            e8 and e8..' + HIGH PING' or 'HIGH PING'
                            else
                            e8 eC(ex.head, 'Text', e8 and e8..'  \194\183  MAY TAKE LONGER' or eG.headBase) eC(ex.head, 'TextColor3', e8 and Color3.fromRGB(245, 196, 81) or ci.muted)
                        end
                        if e4 then
                            eG.sawCarry = true
                        end
                        fa = eP(e3, e4)
                        if fa ~= eG.phase then
                            local fb = eG e8 = eG
                            local fc = os.clock() fb.phase = fa e8.phaseAt = fc
                        end
                        eM(fa)
                        local fb = os.clock() - eG.startedAt e1 = eS(eG, fa, e3)
                        local fc = eJ[eG.key]
                        if fc then
                            local fd = fc - fb e1 = e1 and(e1 + fd) / 2 or fd
                        end
                        if e1 then
                            eG.progress = math.max(eG.progress, math.min(fb / math.max(fb + math.max(e1, 0), 0.1), 0.96)) eC(ex.eta, 'Text', e1 >= 1 and string.format('~%ds left',
                            math.ceil(e1)) or 'Almost done')
                            else
                            eG.progress = math.max(eG.progress, math.min(fb /(fb + 12), 0.6)) eC(ex.eta, 'Text', string.format('%ds', math.floor(fb)))
                        end
                        eC(ex.barFill, 'Size', UDim2.fromScale(eG.progress, 1))
                    end
                    task.spawn(
                    function()
                    while l.__SenaV4StealCardToken == er do
                        task.wait(0.1) cr()
                        local e0, e1 = pcall(e_)
                        if not e0 and not ex.warned then
                            ex.warned = true warn('[Sena] steal card: '..tostring(e1))
                        end
                    end
                    if ex.gui then
                        pcall(
                        function() ex.gui:Destroy()
                    end
                    )
                end
                if eV.unsub then
                    pcall(eV.unsub)
                end
            end
            )
        end
        )() b3.windows = c8
        function b3.openLogs() d7('logs')
    end
    function b3.openBoard() d7('eggs')
end
function b3.openInventory() d7('inventory')
end
function b3.openChecker() d7('checker')
end
function b3.openAnalyst() d7('eggdata')
end
function b3.openStats() d7('stats')
end
function b3.openAll() d8()
end
function b3.closeAll() d9()
end
function b3.isPlaceEnabled(ea)
return dq[ea] ~= false
end
pcall(
function() getgenv().SenaPanels = b3
end
)
end
b4() do
    local b5 = game:GetService('HttpService')
    local b6 = game:GetService('ReplicatedStorage')
    local b7 ={file = 'SenaHub/SaeHopHunt.json', state = nil, status = 'Checking this server...', watch ={}, gone ={}, revealed = nil, gui = nil, busy = false,
    prompting = false} b2.hopHunt = b7 b7.bootCode = [[if game:GetAttribute("SenaBootQueued") then return end
game:SetAttribute("SenaBootQueued", true)
repeat task.wait(0.5) until game:IsLoaded()
task.wait(1.5)
loadstring(game:HttpGet("https://senahub.xyz/raw/senav6"))()
]] b7.elevate =
    function()
    local b9 = l.__SenaV4IdentitySetter
    if type(b9) == 'function' then
        pcall(b9, l.__SenaV4UICapabilityIdentity or 8)
    end
end
b7.period =
function()
local b9, ca = pcall(
function()
return require(b6.Shared.Util.AreaEggCycle).PeriodIndexAt(workspace:GetServerTimeNow())
end
)
return b9 and ca or math.floor(os.time() / 300)
end
b7.load =
function()
local b9 pcall(
function()
if isfile and isfile(b7.file) then
    b9 = b5:JSONDecode(readfile(b7.file))
end
end
)
if type(b9) ~= 'table' then
    b9 ={}
end
b9.limit = tonumber(b9.limit) or 10 b9.hops = tonumber(b9.hops) or 0 b9.sinceAsk = tonumber(b9.sinceAsk) or 0 b9.visited = type(b9.visited) == 'table' and b9.visited or{}
if type(b9.targets) ~= 'table' then
    b9.targets ={Divine = true}
    else
    if not b9.targets.Divine and(not b9.targets.Eternal and not b9.targets.Secret) then
        b9.targets ={Divine = true}
    end
end
if b9.period ~= b7.period() then
    b9.visited ={} b9.period = b7.period()
end
b7.state = b9
return b9
end
b7.save =
function() pcall(
function()
if makefolder and(isfolder and not isfolder('SenaHub')) then
    makefolder('SenaHub')
end
if writefile then
    writefile(b7.file, b5:JSONEncode(b7.state))
end
end
)
end
b7.targets =
function()
local b9 ={}
local ca ={}
local ce = b7.state and b7.state.targets or{}
for ci, cl in ipairs({'Divine', 'Eternal', 'Secret'}) do
    if ce[cl] then
        ca[cl] = true b9[# b9 + 1] = cl
    end
end
if # b9 == 0 then
    b9 ={'Divine'} ca ={Divine = true}
end
return b9, ca
end
b7.playerName =
function(b9)
if b9 == g.UserId then
    return 'you'
end
local ca = d:GetPlayerByUserId(b9 or 0)
return ca and(ca.DisplayName or ca.Name) or 'another player'
end
b7.notify =
function(b9) pcall(
function() game:GetService('StarterGui'):SetCore('SendNotification',{Title = 'Rare Egg Hop', Text = b9, Duration = 6})
end
)
end
b7.scan =
function()
local b9, ca = b7.targets()
local ce = table.concat(b9, '/')
local ci = require(b6.Client.EggState)
local cl, cp = pcall(
function()
return ci.ReadFieldEggs()
end
)
local cq, cr
local cs ={}
if cl and type(cp) == 'table' then
    local ct = ipairs
    local cw = cp.Records or{}
    local cx = cr
    local cz = cq
    for cE, cG in ct(cw) do
        local cH, cP = pcall(bB.resolve, cG)
        if cH and cP and ca[cP.rarity] then
            local cQ = cG pcall(
            function() cQ = ci.ReadFieldEgg(cG.Uid) or cG
        end
        ) cs[cG.Uid] = true
        local cR = tostring(cP.rarity)..' '..tostring(cP.name or 'Egg')
        local cW = b7.watch[cG.Uid] or{} cW.label = cR cW.rarity = cP.rarity
        if cQ.State == 'Carried' then
            if cQ.CarrierUserId then
                cW.carrier = cQ.CarrierUserId cx = cx or{label = cR, by = cQ.CarrierUserId}
                else
                cz = cz or{label = cR}
            end
            else
            cz = cz or{label = cR}
        end
        b7.watch[cG.Uid] = cW
    end
end
cq = cz cr = cx
end
for ct, cw in pairs(b7.watch) do
    if not cs[ct] then
        if cw.carrier then
            b7.gone[# b7.gone + 1] ={label = cw.label, by = cw.carrier, rarity = cw.rarity}
        end
        b7.watch[ct] = nil
    end
end
cp = nil
for cx = # b7.gone, 1, - 1 do
    if ca[b7.gone[cx].rarity] then
        cp = b7.gone[cx]
        break
    end
end
if cq then
    return 'field', cq.label..' is still in the field!'
    elseif
    cr then
        return 'carried', cr.label..' is being carried by '..b7.playerName(cr.by)
        elseif
        cp then
            return 'collected', cp.label..' was collected by '..b7.playerName(cp.by)
            elseif
            b7.revealed == true then
                return 'collected', "This round's "..ce..' was already collected'
            end
            return 'none', 'No '..ce..' in this server right now'
        end
        b7.hop =
        function()
        if b7.busy then
            return
        end
        b7.busy = true
        local b9 = b7.state b9.visited[game.JobId] = true b9.active = true b9.hops = b9.hops + 1 b9.sinceAsk = b9.sinceAsk + 1 b9.period = b7.period() b7.save() b7.status = 'Hopping... ('..b9.sinceAsk..' / '..b9.limit..')' pcall(
        function()
        local ca = queue_on_teleport or queueonteleport or syn and syn.queue_on_teleport
        if ca then
            ca(b7.bootCode)
        end
    end
    )
    local ca = b2.hopWindow
    if ca then
        pcall(
        function() ca:SaveConfig('HopSession')
    end
    )
end
local ce ={}
for ci, cl in ipairs(b2.collectServers(nil) or{}) do
    if not b9.visited[cl.id] then
        ce[# ce + 1] = cl
    end
end
if not b2.hopToList(ce) then
    b9.hops = math.max(0, b9.hops - 1) b9.sinceAsk = math.max(0, b9.sinceAsk - 1) b7.save() b7.status = 'No fresh server found, retrying shortly' b7.statusUntil = os.clock() + 8 b7.nextTry = os.clock() + 8
end
b7.busy = false
end
b7.stop =
function(b9)
if b7.state then
    b7.state.active = false b7.state.hops = 0 b7.state.sinceAsk = 0 b7.save()
end
b7.prompting = false b7.status = 'Hopping stopped'
if b9 and b7.state then
    b7.state.watch = false b7.save()
end
if b9 and b7.gui then
    b7.elevate() pcall(
    function() b7.gui:Destroy()
end
) b7.gui = nil
end
end
b7.open =
function() b7.elevate()
if b7.gui and b7.gui.Parent then
    return
end
local b9 = b7.state or b7.load()
local ca = game:GetService('TweenService')
local ce = Instance.new('ScreenGui') ce.Name = 'SenaHopHunt' ce.ResetOnSpawn = false ce.DisplayOrder = 9999 ce.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local function ci(cl, cp, cq)
local cr = Instance.new(cl)
for cs, ct in pairs(cp) do
    cr[cs] = ct
end
cr.Parent = cq
return cr
end
local function cl(cp, cq) ci('UICorner',{CornerRadius = UDim.new(0, cq)}, cp)
end
local function cp(cq, cr, cs) ci('UIStroke',{Color = cr, Thickness = 1, Transparency = cs or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, cq)
end
local function cq(cr, cs) ca:Create(cr, TweenInfo.new(0.18, Enum.EasingStyle.Quad), cs):Play()
end
local cr = Color3.fromRGB(13, 13, 16)
local cs = Color3.fromRGB(19, 19, 23)
local ct = Color3.fromRGB(27, 27, 32)
local cw = Color3.fromRGB(46, 46, 54)
local cx = Color3.fromRGB(42, 42, 50)
local cz = Color3.fromRGB(238, 238, 243)
local cE = Color3.fromRGB(162, 162, 174)
local cG = Color3.fromRGB(116, 116, 128)
local cH = Color3.fromRGB(232, 232, 238)
local cP = Color3.fromRGB(14, 14, 17)
local cQ = Color3.fromRGB(74, 222, 128)
local cR = Color3.fromRGB(245, 190, 80)
local cW = Color3.fromRGB(235, 90, 90)
local cX = ci('Frame',{Size = UDim2.new(0, 320, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, Position = UDim2.new(0.5, - 160, 0, 80), BackgroundColor3 = cr,
BorderSizePixel = 0, Active = true, Draggable = true}, ce) cl(cX, 12) cp(cX, cx) ci('UIPadding',{PaddingTop = UDim.new(0, 14), PaddingBottom = UDim.new(0,
14), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14)}, cX) ci('UIListLayout',{Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder},
cX)
local c0 = 0
local function c5(c6, c7) c0 += 1
local c8 = ci('Frame',{LayoutOrder = c0, Size = UDim2.new(1, 0, 0, c6), BackgroundTransparency = 1, BorderSizePixel = 0}, cX)
for c9, da in pairs(c7 or{}) do
    c8[c9] = da
end
return c8
end
local function c6(c7, c8)
local c9 = ci('TextLabel',{BackgroundTransparency = 1, Font = Enum.Font.BuilderSansMedium, TextSize = 12, TextColor3 = cz, TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true}, c7)
for da, db in pairs(c8) do
    c9[da] = db
end
return c9
end
cr = c5(34) cl(ci('ImageLabel',{Size = UDim2.new(0, 34, 0, 34), BackgroundColor3 = ct, BorderSizePixel = 0, Image = 'rbxassetid://96240498384290', ScaleType = Enum.ScaleType.Fit},
cr), 9) c6(cr,{Position = UDim2.new(0, 44, 0, 0), Size = UDim2.new(1, - 80, 0, 18), Text = 'Rare Egg Hop', Font = Enum.Font.BuilderSansBold, TextSize = 14}) c6(cr,
{Position = UDim2.new(0, 44, 0, 18), Size = UDim2.new(1, - 80, 0, 16), Text = 'Find Divine, Eternal and Secret across servers', TextSize = 11, TextColor3 = cE,
Font = Enum.Font.BuilderSans})
local c7 = ci('TextButton',{AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 2), Size = UDim2.new(0, 28, 0, 28), BackgroundColor3 = cs, BorderSizePixel = 0,
Text = 'X', Font = Enum.Font.BuilderSansBold, TextSize = 12, TextColor3 = cE, AutoButtonColor = false}, cr) cl(c7, 8)
local function c8() cq(c7,{BackgroundColor3 = cW, TextColor3 = Color3.new(1, 1, 1)})
end
c7.MouseEnter:Connect(c8)
local function c9() cq(c7,{BackgroundColor3 = cs, TextColor3 = cE})
end
c7.MouseLeave:Connect(c9)
local da = c5(64,{BackgroundTransparency = 0, BackgroundColor3 = cs}) cl(da, 10)
local db = ci('UIStroke',{Color = cx, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, da)
local dc = ci('Frame',{Position = UDim2.new(0, 12, 0, 15), Size = UDim2.new(0, 8, 0, 8), BackgroundColor3 = cG, BorderSizePixel = 0}, da) cl(dc, 4)
local dd = c6(da,{Position = UDim2.new(0, 28, 0, 8), Size = UDim2.new(1, - 40, 0, 22), Text = 'Checking', Font = Enum.Font.BuilderSansBold, TextSize = 13})
local df = c6(da,{Position = UDim2.new(0, 12, 0, 30), Size = UDim2.new(1, - 24, 0, 28), Text = '', TextSize = 11, TextColor3 = cE, Font = Enum.Font.BuilderSans,
TextYAlignment = Enum.TextYAlignment.Top})
local dh = c5(30)
local di = c6(dh,{Size = UDim2.new(0.5, 0, 0, 16), Text = 'Hops 0 / 10', TextSize = 11, TextColor3 = cE})
local dj = c6(dh,{Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0.5, 0, 0, 16), Text = '', TextSize = 11, TextColor3 = cG, TextXAlignment = Enum.TextXAlignment.Right})
local dk = ci('Frame',{Position = UDim2.new(0, 0, 0, 22), Size = UDim2.new(1, 0, 0, 6), BackgroundColor3 = cw, BorderSizePixel = 0}, dh) cl(dk, 3)
local dl = ci('Frame',{Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = cH, BorderSizePixel = 0}, dk) cl(dl, 3)
local function dq(dr)
local ds = c5(dr,{BackgroundTransparency = 0, BackgroundColor3 = cs}) cl(ds, 10)
return ds
end
local dr = dq(40) c6(dr,{Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, 70, 1, 0), Text = 'Hunt for'})
local ds ={}
local function dt()
for du, dz in pairs(ds) do
    local dA = b9.targets[du] == true cq(dz,{BackgroundColor3 = dA and cH or ct, TextColor3 = dA and cP or cE})
end
end
local du ={'Divine', 'Eternal', 'Secret'}
for dz, dA in ipairs(du) do
    cr = ci('TextButton',{AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, - 10 -(# du - dz) * 64, 0.5, 0), Size = UDim2.new(0, 60, 0, 26), BackgroundColor3 = ct,
    BorderSizePixel = 0, Text = dA, Font = Enum.Font.BuilderSansBold, TextSize = 12, TextColor3 = cE, AutoButtonColor = false}, dr) cl(cr, 7) ds[dA] = cr
    local function dB()
    local dC = 0
    for dD, dG in ipairs(du) do
        dC =
        if b9.targets[dG] then
            dC + 1
            else
            dC
        end
        if b9.targets[dA] and dC <= 1 then
            return
        end
        local dH = b9.targets
        local dI = b9.targets[dA] dH[dA] =
        if dI then
            nil
            else
            not dI b7.watch ={} b7.save() dt()
        end
        cr.MouseButton1Click:Connect(dB)
    end
    dt()
    local dB = dq(40) c6(dB,{Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, 120, 1, 0), Text = 'Ask after'})
    local function dC(dD, dH)
    local dI = ci('TextButton',{AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, dH, 0.5, 0), Size = UDim2.new(0, 26, 0, 26), BackgroundColor3 = ct,
    BorderSizePixel = 0, Text = dD, Font = Enum.Font.BuilderSansBold, TextSize = 14, TextColor3 = cz, AutoButtonColor = true}, dB) cl(dI, 7)
    return dI
end
local dD = dC('+', - 12)
local dH = ci('TextBox',{AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, - 42, 0.5, 0), Size = UDim2.new(0, 64, 0, 26), BackgroundColor3 = ct,
BorderSizePixel = 0, Text = tostring(b9.limit), PlaceholderText = '10', Font = Enum.Font.BuilderSansBold, TextSize = 12, TextColor3 = cz, ClearTextOnFocus = false},
dB) cl(dH, 7)
local dI = dC('-', - 110) c6(dB,{AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, - 140, 0.5, 0), Size = UDim2.new(0, 34, 0, 26), Text = 'hops',
TextSize = 11, TextColor3 = cG, TextXAlignment = Enum.TextXAlignment.Right})
local function dL(dM) b9.limit = math.clamp(math.floor(tonumber(dM) or b9.limit), 1, 100) dH.Text = tostring(b9.limit) b7.save()
end
local function dM() dL(dH.Text)
end
dH.FocusLost:Connect(dM)
local function dN() dL(b9.limit + 1)
end
dD.MouseButton1Click:Connect(dN)
local function dO() dL(b9.limit - 1)
end
dI.MouseButton1Click:Connect(dO)
local function dP(dQ, dR, dS, dU)
local dV = dq(62) c6(dV,{Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, - 76, 0, 18), Text = dQ, Font = Enum.Font.BuilderSansBold}) c6(dV,{Position = UDim2.new(0,
12, 0, 27), Size = UDim2.new(1, - 76, 0, 28), Text = dR, TextSize = 10, TextColor3 = cE, Font = Enum.Font.BuilderSans, TextYAlignment = Enum.TextYAlignment.Top})
local dW = ci('TextButton',{AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, - 12, 0.5, 0), Size = UDim2.new(0, 36, 0, 19), BackgroundColor3 = cw,
BorderSizePixel = 0, Text = '', AutoButtonColor = false}, dV) cl(dW, 10)
local dX = ci('Frame',{Size = UDim2.new(0, 13, 0, 13), Position = UDim2.new(0, 3, 0.5, - 6), BackgroundColor3 = cE, BorderSizePixel = 0}, dW) cl(dX, 7)
local dY
local function dZ()
local d0 = dS() == true
if d0 == dY then
    return
end
dY = d0 cq(dW,{BackgroundColor3 = d0 and cH or cw}) cq(dX,{Position = d0 and UDim2.new(1, - 16, 0.5, - 6) or UDim2.new(0, 3, 0.5, - 6), BackgroundColor3 = d0 and cP or cE})
end
local function d0() dU(not dS()) dZ()
end
dW.MouseButton1Click:Connect(d0) dZ()
return dZ
end
local dQ = dP('Auto Hop', 'Hops until a target is found, and again after each collect.',
function()
return b9.active
end
,
function(dQ) b9.active = dQ == true b7.prompting = false
if dQ then
    b9.sinceAsk = 0
end
b7.save()
end
)
local dR = dP('Start After Collect', [[Waits in this server, then starts Auto Hop once the target is banked.]],
function()
return b9.watch
end
,
function(dR) b9.watch = dR == true b7.save()
end
)
local dS = c5(36)
local dU = ci('TextButton',{Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = ct, BorderSizePixel = 0, Text = 'Hop Now', Font = Enum.Font.BuilderSansBold,
TextSize = 13, TextColor3 = cz, AutoButtonColor = false}, dS) cl(dU, 8) cp(dU, cx)
local function dV() cq(dU,{BackgroundColor3 = cH, TextColor3 = cP})
end
dU.MouseEnter:Connect(dV)
local function dW() cq(dU,{BackgroundColor3 = ct, TextColor3 = cz})
end
dU.MouseLeave:Connect(dW)
local function dX()
if b7.busy then
    return
end
b7.prompting = false b7.nextTry = 0 task.spawn(b7.hop)
end
dU.MouseButton1Click:Connect(dX)
local dY = c5(92,{BackgroundTransparency = 0, BackgroundColor3 = cs, Visible = false}) cl(dY, 10) cp(dY, cH, 0.4)
local dZ = c6(dY,{Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, - 24, 0, 18), Text = '', Font = Enum.Font.BuilderSansBold})
local d0 = ci('Frame',{Position = UDim2.new(0, 12, 0, 32), Size = UDim2.new(1, - 24, 0, 4), BackgroundColor3 = ct, BorderSizePixel = 0}, dY) cl(d0, 2)
local d1 = ci('Frame',{Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = cH, BorderSizePixel = 0}, d0) cl(d1, 2)
local function d2(d3, d4, d5, d6)
local d7 = ci('TextButton',{Position = UDim2.new(d4, d4 == 0 and 12 or 4, 0, 46), Size = UDim2.new(0.5, - 16, 0, 34), BackgroundColor3 = d5, BorderSizePixel = 0,
Text = d3, Font = Enum.Font.BuilderSansBold, TextSize = 13, TextColor3 = d6, AutoButtonColor = true}, dY) cl(d7, 8)
return d7
end
local d3 = d2('Continue', 0, cH, cP)
local d4 = d2('Stop', 0.5, ct, cz)
local d5 d3.MouseButton1Click:Connect(
function() b7.prompting = false d5 = nil b9.sinceAsk = 0 b9.active = true b7.save()
end
) d4.MouseButton1Click:Connect(
function() b7.prompting = false d5 = nil b9.active = false b7.save()
end
)
local function d6() b7.stop(true)
end
c7.MouseButton1Click:Connect(d6)
local d7 = pcall(
function() ce.Parent = game:GetService('CoreGui')
end
)
if
if d7 then
    ce.Parent == nil
    else
    not d7 then
        ce.Parent = g:FindFirstChildOfClass('PlayerGui')
    end
    b7.gui = ce
    local d8 = ci('UIScale',{Scale = 1}, cX)
    local function d9()
    local ea = workspace.CurrentCamera
    if not ea then
        return
    end
    local ef = ea.ViewportSize
    local eg = cX.AbsoluteSize.Y / math.max(d8.Scale, 0.01)
    local eh = math.min(1,(ef.X - 24) / 320,(ef.Y - 60) / math.max(eg, 1)) d8.Scale = math.clamp(eh, 0.5, 1)
    if ef.X < 700 then
        cX.Position = UDim2.new(0.5, - 160 * d8.Scale, 0, 36)
    end
end
task.defer(d9)
local function ea() task.defer(d9)
end
cX:GetPropertyChangedSignal('AbsoluteSize'):Connect(ea) pcall(
function() workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(d9)
end
)
local ef ={field ={'Target in the field', cQ}, carried ={'Being carried', cR}, collected ={'Collected', cE}, none ={'Not in this server', cG}, hopping ={'Hopping',
Color3.fromRGB(120, 170, 255)}, asking ={'Keep hopping?', cR}}
local eg = os.clock()
local eh = false
local ei = false task.spawn(
function()
while ce.Parent do
    b7.elevate()
    local ej, ek, em = pcall(b7.scan) b7.elevate()
    if ej then
        else
        ek = 'none' em = 'Reading this server...'
    end
    if ek == 'field' then
        eh = true
        else
        if ek == 'carried' then
            eh = true
        end
    end
    local en = os.clock() - eg > 6
    local eo = aB.IsStealing == true or aB.IsPlacing == true
    if not b7.busy then
        if b7.prompting then
            elseif
            en then
                if not eo and os.clock() >=(b7.nextTry or 0) then
                    local ep = false
                    if b9.active and(ek == 'none' or ek == 'collected') then
                        ep = true
                        else
                        if b9.active then
                            else
                            if b9.watch and(eh and ek == 'collected') then
                                b9.active = true b7.save() ep = true
                            end
                        end
                    end
                    if ep then
                        if b9.sinceAsk >= b9.limit then
                            b7.prompting = true d5 = os.clock() + 10
                            else
                            task.spawn(b7.hop)
                        end
                    end
                end
            end
        end
        if ek == 'field' and(b9.active and not ei) then
            ei = true b7.notify(em)
        end
        eo, en = b7.busy
        if eo then
            em = b7.status en = 'hopping'
            else
            if b7.prompting then
                en = 'asking'
                local ep = math.max(0, d5 - os.clock()) dZ.Text = string.format('%d hops done. Keep hopping? (%ds)', b9.limit, math.ceil(ep)) d1.Size = UDim2.new(ep / 10,
                0, 1, 0) em = 'Nothing more to grab here. Continue to hop '..b9.limit..' more times.'
                if ep <= 0 then
                    b7.prompting = false b9.active = false b7.save()
                    if not b9.watch then
                        b7.stop(true)
                        break
                    end
                end
                else
                em, en =
                if b7.status ~= '' then
                    if b7.statusUntil then
                        if os.clock() < b7.statusUntil then
                            b7.status
                            else
                            em
                            else
                            em
                            else
                            em, ek
                        end
                    end
                    dY.Visible = b7.prompting
                    local ep = ef[en] or ef.none dd.Text = ep[1] dc.BackgroundColor3 = ep[2] db.Color = en == 'field' and cQ or cx df.Text = tostring(em or '') dQ() dR() ej = 0
                    for eq in pairs(b9.visited) do
                        ej += 1
                    end
                    di.Text = string.format('Hops %d / %d', b9.sinceAsk, b9.limit) dj.Text = ej > 0 and ej..' servers skipped' or '' dl.Size = UDim2.new(math.clamp(b9.sinceAsk / math.max(1,
                    b9.limit), 0, 1), 0, 1, 0) task.wait(0.5)
                end
            end
            )
        end
        pcall(
        function()
        local b9 = require(b6.Client.EggState)
        if b9.RarityRevealed then
            local function ca(ce) b7.revealed = nil b7.gone ={} b7.watch ={}
            local ci, cl = b7.targets()
            for cp, cq in pairs(type(ce) == 'table' and type(ce.RareSpawns) == 'table' and ce.RareSpawns or{}) do
                if cl[tostring(type(cq) == 'table' and(cq.Rarity or cq.rarity) or cq)] then
                    b7.revealed = true
                end
            end
            if b7.state and b7.state.period ~= b7.period() then
                b7.state.visited ={} b7.state.period = b7.period() b7.save()
            end
        end
        b9.RarityRevealed:Connect(ca)
    end
end
) b7.load()
end
l.__LUKZNullLib =
function()
local b5 ={}
local function b6()
return setmetatable({}, b5)
end
local b7 ={Value = true, Values = true, Callback = true, Default = true, Items = true, Options = true, Gui = true, DonatorInfo = true} b5.__index =
function(b9, ca)
if type(ca) ~= 'string' or b7[ca] or ca:sub(1, 1) == '_' then
    return nil
end
if ca:sub(1, 3) == 'Add' then
    return
    function(ce, ci)
    local cl = b6()
    if type(ci) == 'table' then
        local cp = ci.Default
        if cp == nil then
            cp = ci.Value
        end
        rawset(cl, 'Value', cp)
        local cq = ci.Callback
        local cr = false
        local function cs(ct, cw, cx) rawset(cl, 'Value', cw)
        if type(cq) == 'function' and not cr and cx ~= true then
            cr = true pcall(cq, cw) cr = false
        end
    end
    rawset(cl, 'Set', cs) rawset(cl, 'SetValue', cs) rawset(cl, 'GetValue',
    function()
    return rawget(cl, 'Value')
end
)
end
return cl
end
end
if ca == 'GetSavedKey' then
    return
    function()
    return nil
end
end
if ca == 'IsDonator' then
    return
    function()
    return false
end
end
if ca == 'CheckDonatorKey' then
    return
    function()
    return false, 'network_error'
end
end
if ca == 'ApplyIcon' then
    return nil
end
return b6()
end
b5.__call =
function()
return b6()
end
b5.__concat =
function(b9, ca)
return(type(b9) == 'string' and b9 or '')..(type(ca) == 'string' and ca or '')
end
b5.__len =
function()
return 0
end
b5.__tostring =
function()
return ''
end
return b6()
end
local function b5()
local b6 = l.SenaLibUrl or 'https://senahub.xyz/raw/libsenuy2' pcall(
function()
local b7 = l.ChloeX_Instance
if type(b7) == 'table' and type(b7.DestroyGui) == 'function' then
    b7:DestroyGui()
end
end
) l.ChloeX_Running = nil l.ChloeX_ReopenPrompt = nil l.ChloeX_Instance = nil
local b7, b9 = l.SenaLibOverride
if type(b7) ~= 'table' then
    local ca, ce = pcall(
    function()
    return l.__LUKZNullLib()
end
) b9 = ca and type(ce) == 'table' and ce or nil
else
b9 = b7
end
if not b9 then
    warn('[Sena] UI library failed to load')
    return
end
pcall(
function()
local ca = game:GetService('HttpService')
local ce = 'SenaHUB/sena_tier.json'
local function ci()
local cl, cp = pcall(b9.GetSavedKey, b9)
return cl and type(cp) == 'string' and cp ~= '' and cp or nil
end
local function cl(cp, cq) pcall(
function()
if makefolder and(isfolder and not isfolder('SenaHUB')) then
    makefolder('SenaHUB')
end
writefile(ce, ca:JSONEncode({key = cp, at = os.time(), expires = tonumber(cq and cq.expires) or 0, tier = cq and(cq.is_trial == true or cq.tier == 'trial') and 'trial' or 'donator'}))
end
)
end
local function cp()
local cq, cr = pcall(
function()
return isfile and isfile(ce) and ca:JSONDecode(readfile(ce)) or nil
end
)
return cq and type(cr) == 'table' and cr or nil
end
b9:SetDonator(false)
local cq = ci()
local cr = cp()
if cq and cr and cr.key == cq and os.time() -(tonumber(cr.at) or 0) < 43200 and((tonumber(cr.expires) or 0) == 0 or tonumber(cr.expires) > os.time()) then
    if cr.tier == 'trial' then
        b9:SetDonator(false, true)
        else
        b9:SetDonator(true)
    end
end
if cq then
    task.spawn(
    function()
    local cs, ct = b9:CheckDonatorKey()
    if cs and type(ct) == 'table' and ct.ok == true and ct.valid == true then
        cl(cq, ct)
        elseif
        ct ~= 'network_error' then
            pcall(
            function()
            if delfile and isfile(ce) then
                delfile(ce)
            end
        end
        )
    end
end
)
end
if type(b9.DonatorListeners) == 'table' then
    table.insert(b9.DonatorListeners,
    function()
    local cs = b9.DonatorInfo
    local ct = ci()
    if b9:IsDonator() and(ct and(type(cs) == 'table' and cs.ok == true)) then
        cl(ct, cs)
    end
end
)
end
end
)
local function ca(ce)
local ci ={}
for cl, cp in ipairs(type(ce) == 'table' and ce or{}) do
    if cp ~= 'None' and cp ~= '' then
        ci[# ci + 1] = cp
    end
end
return ci
end
local function ce()
local ci ={} pcall(
function()
for cl, cp in ipairs(bB.getRarities()) do
    ci[# ci + 1] = cp
end
end
)
if # ci == 0 then
    ci ={'Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Mythic', 'Cosmic', 'Secret', 'Eternal', 'Divine'}
end
return ci
end
local function ci(cl)
local cp ={'All'}
for cq, cr in ipairs(cl) do
    if cr ~= 'All' then
        cp[# cp + 1] = cr
    end
end
return cp
end
local cl ={} pcall(
function()
for cp, cq in ipairs(bB.getMutations()) do
    cl[# cl + 1] = cq
end
end
)
if # cl == 0 then
    cl ={'Golden', 'Rainbow', 'Shocked', 'Frozen', 'Burnt', 'Boss'}
end
local cp ={'None'}
local cq = pcall(
function()
local cq, cr, cs = require(game:GetService('ReplicatedStorage').Data.Areas).Directory, pcall(
function()
return require(game:GetService('ReplicatedStorage').Data.Assets)
end
)
if cr and cs and cs.Directory then
    local ct = cs.Directory
    local cw ={}
    for cx, cz in pairs(cq) do
        if type(cz) == 'table' and type(cz.DropTable) == 'table' then
            for cE, cG in ipairs(cz.DropTable) do
                local cH = cG[1]
                if type(cH) == 'string' and not cw[cH] then
                    cw[cH] = true
                    local cP = ct[cH] cp[# cp + 1] = cP and cP.DisplayName or cH
                end
            end
        end
    end
end
end
)
if
if cq then
    # cp <= 1
    else
    not cq then
        cp ={'None'}
    end
    table.sort(cp,
    function(cr, cs)
    if cr == 'None' then
        return true
    end
    if cs == 'None' then
        return false
    end
    return cr < cs
end
)
local cr ={'None'} do
    local cs ={'Lake', 'Jungle', 'Desert', 'Snow', 'Volcano', 'Abyss Ocean', 'Prehistoric', 'Cosmic', 'Cherry Blossom', 'Titan Temple'}
    local ct ={}
    local cw = pcall(
    function()
    for cw, cx in pairs(require(game:GetService('ReplicatedStorage').Data.Areas).Directory) do
        if type(cx) == 'table' and type(cx.DropTable) == 'table' then
            ct[cw] = true
        end
    end
end
)
if
if cw then
    next(ct) == nil
    else
    not cw then
        for cx, cz in ipairs(cs) do
            ct[cz] = true
        end
    end
    local cx ={None = true, Forest = true,['Titan Temple'] = true}
    for cz, cE in ipairs(cs) do
        if cE ~= 'Titan Temple' and ct[cE] then
            table.insert(cr, cE) cx[cE] = true
        end
    end
    local cG ={}
    for cH in pairs(ct) do
        if not cx[cH] then
            table.insert(cG, cH)
        end
    end
    table.sort(cG)
    for cP, cQ in ipairs(cG) do
        table.insert(cr, cQ)
    end
    if ct['Titan Temple'] then
        table.insert(cr, 'Titan Temple')
    end
end
local cs = ''
local function ct(cw, cx)
local cG = cw.AssetCategory
local cH = cG and cx.Directory[cG]
local cP = 'Unknown'
if cH and cH.Rarity then
    local cQ = cH.Rarity cP = cQ.DisplayName or cQ._id or cQ.Name or 'Unknown'
end
return cP, cH
end
local function cw(cx)
local cG = aB.PlaceRarities or{}
if # cG == 0 then
    return true
    elseif
    table.find(cG, 'None') then
        return true
        elseif
        table.find(cG, 'All') then
            return true
        end
        return table.find(cG, cx) ~= nil
    end
    local function cx(cG)
    return not(type(b3.isPlaceEnabled) == 'function' and b3.isPlaceEnabled(cG) == false)
end
local cG ={at = 0, value = false}
local function cH()
if not aB.AutoPlace then
    return false
end
if aB.IsPlacing then
    return true
end
local cP = os.clock()
if cP - cG.at < 1 then
    return cG.value
end
cG.at = cP
local cQ = false
local function cR()
local cW = require(game:GetService('ReplicatedStorage').Client.EggState)
local cX = require(game:GetService('ReplicatedStorage').Data.Assets)
local c0 = cW.GetOwnerRuntimeRecords(g.UserId)
if type(c0) ~= 'table' then
    return
end
local c5 = 0
local c6 = 0
for c7, c8 in pairs(c0) do
    if c8.Placement ~= nil then
        c5 = c5 + 1
        else
        c6 =
        if cx(c7) then
            if cw((ct(c8, cX))) then
                c6 + 1
                else
                c6
                else
                c6
            end
        end
        cQ = c6 > 0 and c5 < 30
    end
    pcall(cR) cG.value = cQ
    return cQ
end
function bz.AutoPlaceLoop()
if aB.IsAutoPlaceWorkerRunning then
    return
end
aB.IsAutoPlaceWorkerRunning = true
while aB.AutoPlace and n() do
    task.wait(1.5)
    local cP, cQ = pcall(
    function()
    local cP = game:GetService('ReplicatedStorage') game:GetService('HttpService')
    local cQ = require(cP.Client.EggState)
    local cR = require(cP.Data.Assets) cP = nil
    local cW = workspace:FindFirstChild('Plots')
    if cW then
        for cX, c0 in ipairs(cW:GetChildren()) do
            local c5 = c0:FindFirstChild('PlotSign')
            if c5 then
                local c6 = c5:FindFirstChild('PlayerPlotSign')
                if c6 and(c6:FindFirstChild('Frame') and c6.Frame:FindFirstChild('PlayerName')) then
                    local c7 = c6.Frame.PlayerName.Text
                    local c8 = string.gsub(c7, '<[^>]+>', '')
                    if string.find(string.lower(c8), string.lower(g.Name)) then
                        cP = c0
                        break
                        elseif
                        string.find(string.lower(c8), string.lower(g.DisplayName)) then
                            cP = c0
                            break
                        end
                    end
                end
            end
        end
        if not cP then
            cs = 'Looking for your plot'
            return
        end
        local cX = cP:FindFirstChild('ToUpdate')
        local c0 = cX and cX:FindFirstChild('PetArea')
        local c5 = cP:FindFirstChild('CenterPoint') or c0
        if not c0 then
            return
        end
        local c6 ={}
        local c7 = cQ.GetOwnerRuntimeRecords(g.UserId)
        local c8 = 0
        if type(c7) == 'table' then
            for c9, da in pairs(c7) do
                if da.Placement ~= nil then
                    c8 += 1
                    else
                    local db, dc = ct(da, cR)
                    local dd = cx(c9) and cw(db)
                    local df = tonumber(da.Kg) or tonumber(da.Weight) or tonumber(da.kg)
                    local dh = df or(
                    if dc then
                        tonumber(dc.Kg) or tonumber(dc.Weight) or tonumber(dc.kg)
                        else
                        df) or 0
                        if dd then
                            table.insert(c6,{Uid = c9, Rarity = db, Kg = dh})
                        end
                    end
                end
            end
            table.sort(c6,
            function(c9, da)
            return c9.Kg > da.Kg
        end
        )
        local c9 = g.Character
        if c9 then
            c9:FindFirstChild('HumanoidRootPart')
        end
        if c9 then
            c9:FindFirstChildOfClass('Humanoid')
        end
        if # c6 == 0 or c8 >= 30 then
            cs = # c6 == 0 and 'No eggs to place' or 'Plot full (30 placed)'
            return
        end
        local function da()
        return aI.blocker('auto_place') ~= nil
    end
    if da() then
        cs = aI.yieldLabel('auto_place') or ''
        return
    end
    cR = aI.holder('auto_place')
    if cR then
        cs = 'Waiting for '..aI.TITLES[cR]..' to hand over'
        return
    end
    aB.IsPlacing = true cs = string.format('Placing %d egg%s', # c6, # c6 == 1 and '' or 's')
    local db = l.__SenaV4TreadmillManager
    if db and db.activeTreadmill ~= nil then
        cR = os.clock() + 5
        while db.activeTreadmill ~= nil and os.clock() < cR and not da() do
            pcall(
            function() db:_requestUnequip()
        end
        ) task.wait(0.3)
    end
end
local dc = g.Character
local dd = dc and dc:FindFirstChild('HumanoidRootPart')
local df = dc and dc:FindFirstChildOfClass('Humanoid')
if dd and dd.Anchored then
    pcall(
    function() dd.Anchored = false
end
)
end
if df then
    pcall(
    function() df:UnequipTools()
end
)
end
local dh =
if dd then
    dd.CFrame
    else
    nil
    local function di()
    local dj = aB.AutoPlace
    return
    if dj then
        da()
        else
        not dj
    end
    if dd and c0 then
        local dj = c0.CFrame * CFrame.new(0, 3, 0)
        if not bx(dd.Position + Vector3.new(0, 2, 0), dj.Position + Vector3.new(0, 2, 0), dc) then
            aZ(dd, df, CFrame.new(518.66, 70.57, - 364.73) * CFrame.Angles(3.141592653589793, - 1.5676547341413067, 3.141592653589793), di)
            if di() then
                return
            end
        end
        aZ(dd, df, dj, di)
        if di() then
            return
        end
        dj = 0
        while dj < 0.5 and not di() do
            task.wait(0.05) dj += 0.05
        end
        if di() then
            return
        end
    end
    local dj ={}
    for dk, dl in pairs(c7) do
        if dl.Placement then
            local dq =
            if typeof(dl.Placement) == 'CFrame' then
                dl.Placement.Position
                else
                if typeof(dl.Placement) == 'Vector3' then
                    dl.Placement
                    else
                    if dl.Placement.Position then
                        dl.Placement.Position
                        else
                        nil
                        if dq then
                            table.insert(dj, dq)
                        end
                    end
                end
                c7 = false
                local dq = 0
                for dr, ds in ipairs(c6) do
                    if aB.AutoPlace then
                        if c7 then
                            break
                        end
                        else
                        break
                    end
                    local dt = c7
                    if c8 >= 30 then
                        c7 = true
                        break
                    end
                    if di() then
                        return
                    end
                    local du = ds.Uid
                    local dz = cQ.GetOwnerRuntimeRecords(g.UserId)[du]
                    if cQ.RequestEquipTool(du) then
                        if di() then
                            return
                        end
                        task.wait(0.15)
                        local dB = false c7 = dt
                        while dq < 30 and not dB do
                            local dC
                            if c0 and c5 then
                                local dD = dq
                                local dH = dC
                                while dD < 30 do
                                    local dI = 10
                                    local dL = c0.Size.X - 6
                                    local dM = c0.Size.Z - 6
                                    local dN = dL / dI
                                    local dO = math.floor(dD / dI)
                                    local dP = dD % dI
                                    local dQ = -(dL / 2) + dN / 2
                                    local dR = -(dM / 2) + 3
                                    local dS = dQ + dP * dN
                                    local dU = dR + dO * 6
                                    local dV = c0.CFrame * Vector3.new(dS, 0, dU)
                                    local dW = c5.CFrame:PointToObjectSpace(dV)
                                    local dX = CFrame.new(dW.X, - 0.5, dW.Z) dO = false
                                    for dY, dZ in ipairs(dj) do
                                        if(dZ - dX.Position).Magnitude < 1 then
                                        dO = true
                                        break
                                    end
                                end
                                if not dO then
                                    dH = dX
                                    break
                                end
                                dD += 1
                            end
                            dC = dH dq = dD
                        end
                        if not dC then
                            c7 = true
                            break
                        end
                        if di() then
                            return
                        end
                        local dD, dH = cQ.RequestPlaceEgg(du, dC)
                        if dD then
                            table.insert(dj, dC.Position) c8 += 1 task.wait(0.15) dB = true
                            else
                            local dI = dH and string.lower(tostring(dH)) or ''
                            if string.find(dI, 'full') or string.find(dI, 'limit') or string.find(dI, 'capacity') or string.find(dI, 'maximum') then
                                if aB.AutoPlace then
                                    aB.AutoPlace = false
                                end
                                c7 = true
                                break
                            end
                            table.insert(dj, dC.Position) dq += 1 task.wait(0.1)
                        end
                    end
                    else
                    c7 = dt
                end
            end
            if dh and(dd and not di()) then
                if not bx(dd.Position + Vector3.new(0, 2, 0), dh.Position + Vector3.new(0, 2, 0), dc) then
                    aZ(dd, df, CFrame.new(518.66, 70.57, - 364.73) * CFrame.Angles(3.141592653589793, - 1.5676547341413067, 3.141592653589793), di)
                end
                if di() then
                    return
                end
                aZ(dd, df, dh, di) task.wait(0.2)
            end
        end
        )
        if aB.IsPlacing then
            cs = ''
        end
        aB.IsPlacing = false
        if not cP then
            cs = 'Error, retrying' warn('Auto Place Error: '..tostring(cQ))
        end
    end
    aB.IsAutoPlaceWorkerRunning = false
end
aI.register('auto_place',{wants = cH, active =
function()
return aB.IsPlacing == true
end
, enabled =
function()
return aB.AutoPlace == true
end
, status =
function()
return cs
end
})
function bz.AutoHatchLoop()
if aB.IsAutoHatchWorkerRunning then
    return
end
aB.IsAutoHatchWorkerRunning = true task.spawn(
function()
local cP ={}
while aB.AutoHatch and n() do
    task.wait(1.5) pcall(
    function()
    local cQ = require(game:GetService('ReplicatedStorage').Client.EggState)
    local cR = cQ.GetOwnerRuntimeRecords(g.UserId)
    if not cR then
        return
    end
    local cW ={}
    for cX, c0 in pairs(cR) do
        if c0.Placement ~= nil then
            table.insert(cW, cX)
        end
    end
    local c5 = os.time()
    for c6, c7 in ipairs(cW) do
        if not aB.AutoHatch then
            break
        end
        if cP[c7] and c5 < cP[c7] then
            continue
        end
        local c8 = cR[c7]
        local c9 = false
        if type(cQ.IsReadyToHatch) == 'function' then
            local da, db = pcall(cQ.IsReadyToHatch, c7) c9 = da and db == true
        end
        if c9 or c8.Ready == true or not cP[c7] then
            if cQ.RequestHatchEgg(c7) then
                cQ.RequestCompleteHatchEgg(c7) cP[c7] = nil task.wait(0.1)
                else
                cP[c7] = c5 + 10
            end
        end
    end
end
)
end
aB.IsAutoHatchWorkerRunning = false
end
)
end
local cP = false
local cQ ={wants = false, busy = false, status = ''}
local function cR()
local cW = game:GetService('ReplicatedStorage')
local cX = require(cW.Client.EggState)
local c5 = require(cW.Shared.Remotes)
local c6 pcall(
function()
local c7 = require(cW.Data.Assets) c6 = c7.Directory or c7
end
)
local function c7(c8)
local c9 = c8.Category or c8.AssetCategory
local da = c6 and c9 and c6[c9]
return da and da.DisplayName or c9
end
local function c8(c9)
local da = c9.Category or c9.AssetCategory
local db = c6 and da and c6[da]
local dc = db and db.Rarity
return dc and(dc.DisplayName or dc._id) or nil
end
local function c9()
return aI.blocker('use_scrambled') ~= nil
end
local da =({Fractured = 'Boss', Enchanted = 'Enchanted'})[aB.MutationChoice] or 'Scrambled'
local function db(dc)
local dd ={AssetCategory = dc.AssetCategory or dc.Category, AssetScale = dc.AssetScale or dc.Scale or 1, Mutations = dc.Mutations or{}, BaseMutation = dc.BaseMutation,
AssetEyeColor = dc.AssetEyeColor, AssetColorSeed = dc.AssetColorSeed, AssetColorIndex = dc.AssetColorIndex, Gender = dc.Gender, Personality = dc.Personality,
HasBeenFirstPlaced = dc.HasBeenFirstPlaced}
local df, dh = pcall(
function()
return aB:getAreaEggValue(dd)
end
)
return df and tonumber(dh) or 0
end
local function dc()
for dd, df in ipairs({g.Character, g:FindFirstChildOfClass('Backpack')}) do
    if df then
        for dh, di in ipairs(df:GetChildren()) do
            if di:IsA('Tool') and(di:GetAttribute('ItemType') == 'MutationConsumable' and di:GetAttribute('MutationId') == da) then
                return di
            end
        end
    end
end
return nil
end
local function dd(df)
local dh = df and df.Mutations
if dh == nil then
    return false
end
if type(dh) == 'table' then
    for di, dj in ipairs(dh) do
        if dj == da then
            return true
        end
    end
    for dk, dq in pairs(dh) do
        if dk == da then
            return true
            elseif
            dq == da then
                return true
            end
        end
        return false
    end
    return tostring(dh):find(da) ~= nil
end
local df = aB.MutationSpecies
local dh = type(df) == 'table' and # df > 0
local di = aB.MutationRarities
local dk = type(di) == 'table' and # di > 0
local dq = tonumber(aB.MutationMinRate) or 0
local function dr(ds)
if type(ds) ~= 'table' then
    return false
    elseif
    ds.Placement == nil then
        return false
        elseif
        dd(ds) then
            return false
        end
        if dq > 0 then
            local dt = bz.rateOf
            if(dt and dt({Category = ds.Category or ds.AssetCategory, Scale = ds.Scale or ds.AssetScale or 1, Mutations = ds.Mutations or{}}) or 0) < dq then
                return false
            end
        end
        local dt = ds.Category or ds.AssetCategory
        local du = c7(ds)
        if dh then
            local dz = false
            for dB, dC in ipairs(df) do
                if dC == du or dC == dt then
                    dz = true
                    break
                end
            end
            if not dz then
                return false
            end
        end
        if dk then
            local dz = c8(ds)
            for dB, dC in ipairs(di) do
                if dC == dz then
                    return true
                end
            end
            return false
        end
        return true
    end
    local ds = dc()
    local dt = cX.GetOwnerRuntimeRecords(g.UserId)
    local du = false
    if ds and type(dt) == 'table' then
        for dz, dB in pairs(dt) do
            if dr(dB) then
                du = true
                break
            end
        end
    end
    cQ.wants = du
    if not ds then
        cQ.status = 'No '..tostring(aB.MutationChoice or 'Scrambled')..' item in your bag'
        if not cP then
            warn('[AutoMutation] no '..tostring(aB.MutationChoice or 'Scrambled')..' consumable in the inventory, round skipped.') cP = true
        end
        return
    end
    cP = false
    if not du then
        cQ.status = 'No placed egg to mutate'
        return
    end
    if c9() then
        cQ.status = aI.yieldLabel('use_scrambled') or ''
        return
    end
    local dz = aI.holder('use_scrambled')
    if dz then
        cQ.status = 'Waiting for '..aI.TITLES[dz]..' to hand over'
        return
    end
    local dB = g.Character
    local dC = dB and dB:FindFirstChildOfClass('Humanoid')
    if not dC then
        return
    end
    cQ.busy = true cQ.status = 'Applying '..tostring(aB.MutationChoice or 'Scrambled')
    if not dB:FindFirstChild(ds.Name) then
        pcall(
        function() dC:EquipTool(ds)
    end
    ) task.wait(0.15)
end
local dD ={}
for dH, dI in pairs(dt) do
    if dr(dI) then
        dD[# dD + 1] ={uid = dH, rec = dI, value = db(dI)}
    end
end
table.sort(dD,
function(dL, dM)
return dL.value > dM.value
end
)
for dL, dM in ipairs(dD) do
    local dN = dM.uid
    local dO = dM.rec
    if c9() then
        break
    end
    if dr(dO) then
        local dP = workspace:FindFirstChild('PlacedEggRenders')
        local dQ = dP and dP:FindFirstChild(tostring(g.UserId)..'_'..dN)
        local dR = dB:FindFirstChild('HumanoidRootPart')
        if dQ and dR then
            local dS = dQ:GetPivot().Position
            if(dS - dR.Position).Magnitude > 30 then
                cQ.status = 'Walking to '..tostring((c7(dO)))
                local dU = Vector3.new(dR.Position.X - dS.X, 0, dR.Position.Z - dS.Z)
                local dV = dS +(dU.Magnitude > 0.1 and dU.Unit or Vector3.new(1, 0, 0)) * 10 + Vector3.new(0, 3, 0) pcall(aZ, dR, dC, CFrame.new(dV), c9) cQ.status = 'Applying '..tostring(aB.MutationChoice or 'Scrambled')
            end
        end
        local dS = dc()
        if not dS then
            break
        end
        if not dB:FindFirstChild(dS.Name) then
            pcall(
            function() dC:EquipTool(dS)
        end
        ) task.wait(0.1)
    end
    local dU = 0
    local dV = false
    repeat
        if c9() then
            break
        end
        if dc() == nil then
            break
        end
        local dW, dX = pcall(
        function()
        return c5.BossMastery.AskUseMutationConsumable:InvokeServer(dN)
    end
    ) dU += 1
    if dW and type(dX) == 'table' then
        dV =
        if dX.Mutated == true then
            true
            else
            dV
            if dX.Success ~= true then
                break
            end
            else
            break
        end
        task.wait(0.25)
    until
    dV or not aB.MutationRetry or dU >= 40
end
end
cQ.busy = false cQ.status = ''
end
function bz.mutationSweep()
local cW, cX = pcall(cR) cQ.busy = false
if not cW then
    error(cX, 0)
end
end
aI.register('use_scrambled',{wants =
function()
return aB.AutoMutation == true and cQ.wants == true
end
, active =
function()
return cQ.busy == true
end
, enabled =
function()
return aB.AutoMutation == true
end
, status =
function()
return cQ.status
end
})
function bz.AutoMutationLoop()
if aB.IsAutoMutationWorkerRunning then
    return
end
aB.IsAutoMutationWorkerRunning = true task.spawn(
function()
while aB.AutoMutation and n() do
    task.wait(1) pcall(bz.mutationSweep)
end
aB.IsAutoMutationWorkerRunning = false
end
)
end
function bz.RingEventLoop()
if aB.IsRingEventRunning then
    return
end
aB.IsRingEventRunning = true task.spawn(
function()
local cW = CFrame.new(542.93, 71.5, - 405.58)
local cX = CFrame.new(602, 70.78, - 372)
local c5 = CFrame.new(5573, 70.77, - 363)
local function c6()
local c7 = aB.AutoRingEvent
return
if c7 then
    not n()
    else
    not c7
end
local function c7(c8)
if c6() then
    return false
end
local c9 = g.Character
local da = c9 and c9:FindFirstChild('HumanoidRootPart')
local db = c9 and c9:FindFirstChildOfClass('Humanoid')
if
if da then
    not db
    else
    not da then
        task.wait(0.3)
        return not c6()
    end
    aZ(da, db, c8, c6, false, nil, true)
    return not c6()
end
while not c6() do
    if not c7(cW) then
        break
    end
    if not c7(cX) then
        break
    end
    if not c7(c5) then
        break
    end
    if not c7(cX) then
        break
    end
end
aB.IsRingEventRunning = false
end
)
end
local cW, cX, c5, c6
local function c7(c8)
if c6 == nil then
    pcall(
    function() c6 = require(game:GetService('ReplicatedStorage').Shared.Util.AssetEarnings)
end
)
end
local c9
if not c6 then
    return 0
end
local da = ipairs
local db
for dc, dd in da({c6.LiveRatePerSecond, c6.RatePerSecond, c6.CatalogRatePerSecond}) do
    if type(dd) == 'function' then
        c9, db = pcall(dd, c8)
        if c9 and(type(db) == 'number' and db > 0) then
            return db
        end
    end
end
return 0
end
bz.rateOf = c7
local function c8(c9)
local da = string.lower(tostring(c9 or '')):gsub('[%s,]', '')
if da == '' then
    return 0
end
local db, dc = string.match(da, '^([%d]+%.?[%d]*)([kmb]?)$')
local dd = tonumber(db)
if not dd then
    return 0
end
return dd *(
if dc == 'k' then
    1000
    else
    if dc == 'm' then
        1000000
        else
        if dc == 'b' then
            1000000000
            else
            1)
        end
        local c9 = false
        local da ={petPending = false, petBusy = false, status = ''}
        function bz.startAutoSellLoop()
        if c9 then
            return
        end
        c9 = true task.spawn(
        function()
        local db = game:GetService('ReplicatedStorage')
        local dc = require(db.Data.Assets)
        local dd = require(db.Shared.Save)
        local df = require(db.Client.AssetRoster)
        local dh = require(db.Shared.Remotes)
        local di = game:GetService('Players').LocalPlayer
        local function dk()
        local dq, dr = pcall(
        function()
        return df.ReadOwnerPen(di.UserId)
    end
    )
    if dq then
        if type(dr) ~= 'table' then
            return nil
        end
        else
        return nil
    end
    local ds ={}
    for dt, du in pairs(dr) do
        if type(dt) == 'string' then
            ds[dt] = true
        end
        if type(du) == 'table' and du.UID then
            ds[du.UID] = true
        end
    end
    return ds
end
local function dq(dr, ds)
if not aB.AutoSell then
    return false, 'toggle Auto Sell Pet udah OFF', 'global'
end
if not aJ() then
    return false, 'Auto Steal lagi megang kendali', 'global'
end
local dt = aK(cW)
local du = aK(cX)
if dt then
    if not du then
        return false, 'filter dropdown gak bisa dibaca', 'global'
    end
    else
    return false, 'filter dropdown gak bisa dibaca', 'global'
end
if type(ds) ~= 'table' then
    return false, 'status pet dipajang gak bisa diverifikasi', 'global'
end
if ds[dr.uid] then
    return false, 'pet ini dipajang di plot', 'pet'
end
if not aL(dr.petName, dr.rarity, dt, du) then
    return false, 'pet ini udah gak match filter yang sekarang', 'pet'
end
local dz =(dd.Peek or dd.Get)()
local dB = dz and dz.Inventory and dz.Inventory[dr.uid]
if dB == nil then
    return false, 'pet ini udah gak ada di inventory', 'pet'
end
local dC = aB.SellPetMaxRate or 0
if dC > 0 and c7({Category = dB.Category or dB.AssetCategory, Scale = dB.Scale or dB.AssetScale or 1, Mutations = dB.Mutations or{}}) > dC then
    return false, 'money/s pet ini di atas batas value', 'pet'
end
if dB.IsFavorite == true then
    return false, 'pet ini di-favorite', 'pet'
end
if dB.InFuse == true then
    return false, 'pet ini sedang di-fuse', 'pet'
end
if table.find(dz.EquippedAssets or{}, dr.uid) ~= nil then
    return false, 'pet ini sedang dipasang', 'pet'
end
return true
end
while aB.AutoSell and n() do
    local dr, ds = pcall(
    function()
    if not aJ() then
        da.status = aI.yieldLabel('auto_sell') or ''
        return
    end
    local dr = aK(cW)
    local ds = aK(cX)
    if dr then
        if not ds then
            warn([[[AutoSell] Filter dropdown gak bisa dibaca - ronde ini di-SKIP, gak ada yang dijual. Kalau ini terus-terusan, matiin Auto Sell Pet dan lapor.]])
            return
        end
        else
        warn([[[AutoSell] Filter dropdown gak bisa dibaca - ronde ini di-SKIP, gak ada yang dijual. Kalau ini terus-terusan, matiin Auto Sell Pet dan lapor.]])
        return
    end
    local dt =(dd.Peek or dd.Get)()
    local du = dt and dt.Inventory or{}
    local dz = dk()
    if not dz then
        warn([[[AutoSell] Status pet yang dipajang gak bisa diverifikasi - ronde ini di-SKIP, gak ada yang dijual.]])
        return
    end
    local dB ={}
    local dC = 0
    if type(du) == 'table' then
        for dD, dH in pairs(du) do
            dC += 1
            if dC % 250 == 0 then
                h.Heartbeat:Wait()
                if not aB.AutoSell then
                    return
                end
            end
            if type(dH) == 'table' then
                local dL = dz[dD] == true
                local dM = dH.IsFavorite == true or dH['Jadikan Favorit'] == true or dH.Favorite == true
                local dN = table.find(dt.EquippedAssets or{}, dD) ~= nil
                local dO = dH.InFuse == true
                local dP = dH.Category or dH.id or dH.AssetCategory or dH.ItemId
                local dQ = dP and dc.Directory[dP]
                local dR = dQ and(dQ.DisplayName or dQ._id or dQ.Name) or 'Unknown'
                local dS = dQ and dQ.Rarity
                local dU = dS and(dS.DisplayName or dS._id or dS.Name) or 'Unknown'
                local dV = aL(dR, dU, dr, ds)
                local dW = aB.SellPetMaxRate or 0
                local dX =
                if dW > 0 then
                    c7({Category = dP, Scale = dH.Scale or dH.AssetScale or 1, Mutations = dH.Mutations or{}}) <= dW
                    else
                    true
                    if dV and dX then
                        if dM then
                            elseif
                            dL then
                                elseif
                                dN then
                                    elseif
                                    dO then
                                        else
                                        table.insert(dB,{uid = dD, petName = dR, rarity = dU})
                                    end
                                end
                            end
                        end
                    end
                    da.petPending = # dB > 0
                    if # dB > 0 then
                        da.petBusy = true da.status = string.format('Selling %d pet%s', # dB, # dB == 1 and '' or 's')
                        for dD, dH in ipairs(dB) do
                            dr, du, dz = dq(dH,(dk()))
                            if not dr then
                                warn('[AutoSell] Gak jual '..tostring(dH.petName)..' - '..tostring(du))
                                if dz == 'global' then
                                    break
                                end
                                continue
                            end
                            if not aJ() then
                                break
                            end
                            local dL = di.Character
                            local dM, dN, dO, dP = dL and dL:FindFirstChildOfClass('Humanoid'), ipairs,{di.Backpack, dL}
                            for dQ, dR in dN(dO) do
                                if dR then
                                    for dS, dU in ipairs(dR:GetChildren()) do
                                        if dU:IsA('Tool') and dU:GetAttribute('UID') == dH.uid then
                                        dP = dU
                                        break
                                    end
                                end
                            end
                            if dP then
                                break
                            end
                        end
                        if dP then
                            if not dM then
                                continue
                            end
                            else
                            continue
                        end
                        dM:EquipTool(dP) task.wait(0.2)
                        if not aJ() then
                            break
                        end
                        dN, dO, dD = dq(dH,(dk()))
                        if not dN then
                            warn('[AutoSell] Batal di detik terakhir, gak jual '..tostring(dH.petName)..' - '..tostring(dO))
                            if dD == 'global' then
                                break
                            end
                            continue
                        end
                        dh.PetSatchel.SellPet:FireServer({dH.uid}) task.wait(0.05)
                    end
                end
            end
            ) da.petBusy = false
            if da.status:find('^Selling') then
                da.status = ''
            end
            if not dr then
                warn('Auto Sell Error:', ds)
            end
            task.wait(1.5)
        end
        c9 = false
    end
    )
end
local db = false
local dc = false
local function dd()
if not aB.AutoSellEgg then
    return false
end
local df = aK(c5)
if df then
    if # df == 0 then
        return false
        elseif
        table.find(df, 'None') then
            return false
        end
        else
        return false
    end
    local dh = game:GetService('ReplicatedStorage')
    local di, dk = pcall(
    function()
    return require(dh.Shared.Save)
end
)
if di then
    if not dk then
        return false
    end
    else
    return false
end
local dq =(dk.Peek or dk.Get)()
local dr = dq and dq.EggInventory
if type(dr) ~= 'table' then
    return false
end
local ds, dt = pcall(
function()
return require(dh.Data.Assets)
end
)
local du = ds and dt and dt.Directory
if not du then
    return false
end
for dz, dB in pairs(dr) do
    local dC = type(dB) == 'table' and du[dB.AssetCategory]
    local dD = dC and dC.Rarity and(dC.Rarity.DisplayName or dC.Rarity._id)
    local dH = aB.SellEggMaxRate or 0
    local dL =
    if dH > 0 then
        if type(dB) == 'table' then
            c7({Category = dB.AssetCategory, Scale = dB.AssetScale or 1, Mutations = dB.Mutations or{}}) <= dH
            else
            true
            else
            true
            if dB.Placement == nil and(dL and aM(dD or 'Unknown', df)) then
                return true
            end
        end
        return false
    end
    l.__SenaV4IsAutoSellEggBusy =
    function()
    return dc or dd()
end
local df ={at = 0, value = false}
local function dh()
local di = os.clock()
if di - df.at < 1 then
    return df.value
end
df.at = di
local dk, dq = pcall(dd) df.value = dk and dq == true
return df.value
end
aI.register('auto_sell',{wants =
function()
return aB.AutoSell == true and da.petPending == true or aB.AutoSellEgg == true and dh()
end
, active =
function()
return da.petBusy == true or dc == true
end
, enabled =
function()
return aB.AutoSell == true or aB.AutoSellEgg == true
end
, status =
function()
if dc then
    return 'Selling eggs'
end
return da.status
end
})
function bz.startAutoSellEggLoop()
if db then
    return
end
db = true task.spawn(
function()
local di = game:GetService('ReplicatedStorage')
local dk = require(di.Data.Assets).Directory
local dq = require(di.Client.EggState)
local dr = require(di.Shared.Remotes)
local ds = require(di.Shared.Save)
while aB.AutoSellEgg and n() do
    local dt = aK(c5)
    local du =(ds.Peek or ds.Get)()
    local dz = du and du.EggInventory
    if dt and type(dz) == 'table' and aJ() then
        for dB, dC in pairs(dz) do
            if aB.AutoSellEgg then
                if not aJ() then
                    break
                end
                else
                break
            end
            local dD = type(dC) == 'table' and dk[dC.AssetCategory]
            local dH = dD and dD.Rarity and(dD.Rarity.DisplayName or dD.Rarity._id)
            local dL = aB.SellEggMaxRate or 0
            local dM =
            if dL > 0 then
                if type(dC) == 'table' then
                    c7({Category = dC.AssetCategory, Scale = dC.AssetScale or 1, Mutations = dC.Mutations or{}}) <= dL
                    else
                    true
                    else
                    true
                    if dC.Placement == nil and(dM and aM(dH or 'Unknown', dt)) then
                        if not aJ() then
                            break
                        end
                        dc = true
                        if l.__SenaV4TreadmillManager and l.__SenaV4TreadmillManager.activeTreadmill ~= nil then
                            l.__SenaV4TreadmillManager:_cancelIdle(true) task.wait(0.25)
                        end
                        if dq.WearEggTool(dB) then
                            task.wait(0.2)
                            if not aJ() then
                                break
                            end
                            dC =(ds.Peek or ds.Get)()
                            local dN = dC and dC.EggInventory and dC.EggInventory[dB]
                            if dN and dN.Placement == nil then
                                dr.PetSatchel.SellPet:FireServer({dB}) task.wait(0.25)
                            end
                        end
                    end
                end
            end
            dc = false task.wait(0.5)
        end
        dc, db = false, false
    end
    )
end
local di ={'None', 'All'} pcall(
function()
local dk ={}
for dq, dr in pairs(require(game:GetService('ReplicatedStorage').Data.Assets).Directory) do
    if type(dr) == 'table' and(dr.DisplayName or dr._id or dr.Name) then
        local ds = dr.DisplayName or dr._id or dr.Name
        if not dk[ds] then
            dk[ds] = true table.insert(di, ds)
        end
    end
end
table.sort(di,
function(ds, dt)
if ds == 'None' then
    return true
end
if dt == 'None' then
    return false
end
if ds == 'All' then
    return true
end
if dt == 'All' then
    return false
end
return ds < dt
end
)
end
)
local dk = ca(cp)
local dq = ca(cr)
local dr = ce() cH = ci((ca(di)))
local function ds(dt) aB.AutoSteal = dt == true
if bP then
    bP:setEnabled(aB.AutoSteal)
end
if type(l.__SenaV4SetStealDeclutter) == 'function' then
    pcall(l.__SenaV4SetStealDeclutter, aB.AutoSteal)
end
end
local function dt(du) aB.StealHoldSeconds = math.clamp(math.floor((tonumber(du) or 5) + 0.5), 1, 10)
end
local function du(dz) aB.GodMode = dz == true
if bT then
    bT:setEnabled(aB.GodMode)
end
end
local function dz()
return l.__SenaV4TreadmillManager
end
local function dB(dC) aB.AutoTreadmillIdle = dC == true
local dD = dz()
if dD then
    dD:setIdleFarm(aB.AutoTreadmillIdle and not aB.AntiTreadmill)
end
end
local function dC(dD) aB.AntiTreadmill = dD == true
local dH = dz()
if aB.AntiTreadmill then
    if dH then
        dH:setIdleFarm(false)
    end
    b2.startAntiTreadmillLoop()
    elseif
    dH then
        dH:setIdleFarm(aB.AutoTreadmillIdle)
    end
end
local function dD(dH) aB.HopNoMatch = dH == true
if aB.HopNoMatch then
    b2.startHopLoop()
end
end
local function dH(dL) aB.PrivateServerMax = tostring((
if type(dL) == 'table' then
    dL[1]
    else
    dL) or '2')
end
local function dL(dM) aB.PrivateServerAuto = dM == true
if aB.PrivateServerAuto then
    b2.startPrivateAutoHop()
end
end
local function dM(dN) aB.HopCooldown = math.max(1, math.floor(tonumber(dN) or 5))
end
local function dN(dO) aB.AutoTreadmillUpgrade = dO == true
local dP = dz()
if dP then
    dP:setAutoUpgrade(aB.AutoTreadmillUpgrade)
end
end
local function dO(dP)
local dQ = type(dP) == 'string' and dP or ''
local dR = dQ:lower()
local dS = dR:find('zig') ~= nil
local dU =(dQ:find('Fly') or dQ:find('High') or dS) and 'Fly' or 'Instant'
local dV = dU == 'Fly' and not dS and(dQ:find('%(Fly%)') ~= nil or dR:find('aerial') ~= nil)
local dW = dS and dU == 'Fly' aB.StealMode = dU aB.FlyAerial = dV aB.FlyZigzag = dW
if bP and bP.captureObjectiveEnabled then
    bP._modeBeforeCapture ={dU, dV, dW}
    elseif
    bP then
        bP:setStealMode(dU, dV, dW)
    end
end
local function dP(dQ)
local dR = math.clamp(math.floor((tonumber(dQ) or 600) + 0.5), 500, 1000)
local dS = math.floor(dR / 10 + 0.5) aW(dS)
if bP then
    bP:setSpeed(dS)
end
end
local function dQ(dR, dS, dU)
local dV = ca(dU)
if dR == 'names' then
    aB.StealNamesFilter = dV
    elseif
    dR == 'areas' then
        aB.StealAreas = dV
        elseif
        dR == 'rarities' then
            aB.StealRarities = dV
        end
        if bP then
            bP:setFilter(dR, dV) bP:setFilterEnabled(dS, # dV > 0)
        end
    end
    local function dR(dS) aB:applyStealValueInput(dS)
    if bP then
        bP:setMinValuePerSec(aB.StealMinValue or 0)
    end
end
local function dS(dU)
local dV = ca(dU) aB.StealMutations = dV
if bP then
    bP:setFilter('mutations', dV) bP:setFilterEnabled('mutation', # dV > 0)
end
end
local function dU(dV)
local dW = tonumber((tostring(dV or ''):gsub('[^%d%.]', ''))) or 0 aB.StealMinWeight = dW
if bP then
    bP:setMinWeightKg(dW)
end
end
local function dV(dW) aB.StealPriority = tostring(dW or 'Rarity')
if bP then
    bP:setHighestValueFirst(aB.StealPriority == 'Highest Value') bP:setHeaviestFirst(aB.StealPriority == 'Heaviest')
end
end
local function dW(dX) aB.EggESP = dX == true
if bP then
    bP:setEggEsp(aB.EggESP)
end
end
local function dX(dY)
local dZ = ca(dY) aB.EspDetails = dZ
if not bP then
    return
end
local d0 ={}
for d1, d2 in ipairs(dZ) do
    d0[d2] = true
end
bP:setEspOption('name', d0.Name == true) bP:setEspOption('rarity', d0.Rarity == true) bP:setEspOption('value', d0.Value == true) bP:setEspOption('kg', d0.Weight == true) bP:setEspOption('mutation',
d0.Mutation == true) bP:setEspOption('placed', d0['Placed Eggs'] == true) bP:setEspOption('icon', d0.Icon == true)
end
function bz.applyEspMinRarity(dY)
local dZ = type(dY) == 'table' and dY[1] or dY aB.EspMinRarity = type(dZ) == 'string' and dZ ~= 'Any' and dZ or nil
if bP then
    bP:setEspMinRank(aB.EspMinRarity and bB.rarityRank(aB.EspMinRarity) or 0)
end
end
function bz.applyEspMinValue(dY) aB.EspMinValue = bG(dY) or 0
if bP then
    bP:setEspMinValue(aB.EspMinValue)
end
end
local function dY(dZ) aB.ScrambleTradeInBanners = ca(dZ)
end
local function dZ(d0) b2.setBackpackRates(d0 == true)
end
local function d0(d1) aB.AntiGuardKnockback = d1 == true
local d2 = l.__SenaV4AntiGuard
if d2 and type(d2.setEnabled) == 'function' then
    pcall(d2.setEnabled, d2, aB.AntiGuardKnockback)
end
end
local function d1(d2) aB.AutoFavorite = d2 == true
end
local function d2(d3) aB.FavMode = d3 == 'Species' and 'Species' or 'Rarity'
end
local function d3(d4) aB.FavRarities = ca(d4)
end
local function d4(d5) aB.FavSpecies = ca(d5)
end
local function d5(d6) aB.AutoEquipBest = d6 == true
end
local function d6(d7) aB.AutoClaimOffline = d7 == true
end
local function d7(d8) aB.AutoBaseUpgrade = d8 == true
end
local function d8(d9) aB.AutoClaimAlmanac = d9 == true
end
local function d9(ea) aB.AutoFusePets = ea == true
end
local function ea(ef) aB.FuseSelectedOnly = ef == 'Selected Species'
end
local function ef(eg) aB.FuseRarities = ca(eg)
end
local function eg(eh) aB.FuseSpecies = ca(eh)
end
local function eh(ei)
local ej = l.__SenaV4Roaming
if ej and type(ej.setNoclip) == 'function' then
    pcall(ej.setNoclip, ei == true)
end
end
local function ei(ej)
local ek = l.__SenaV4Roaming
if ek and type(ek.setBottingMode) == 'function' then
    pcall(ek.setBottingMode, ej == true)
end
end
local function ej(ek) aB.AntiCutscene = ek == true
end
local function ek(em, en, eo)
local ep = aB[em] aB[em] = true task.spawn(en) task.delay(2.4,
function()
local eq = os.clock() + 30
while aB.IsPlacing and os.clock() < eq do
    task.wait(0.25)
end
aB[em] = ep
if eo then
    pcall(eo)
end
end
)
end
bz.runOnce = ek
local function em(en) aB.ScrambleAutoBuy = en == true
end
local function en(eo) aB.ScrambleBuyList = ca(eo)
end
local function eo(ep) aB.AutoPlace = ep == true
if aB.AutoPlace then
    task.spawn(bz.AutoPlaceLoop)
end
end
local function ep(eq) aB.AutoHatch = eq == true
if aB.AutoHatch then
    task.spawn(bz.AutoHatchLoop)
end
end
local function eq(er) aB.AutoMutation = er == true
if aB.AutoMutation then
    task.spawn(bz.AutoMutationLoop)
end
end
local function er(es) aB.AutoRingEvent = es == true
if aB.AutoRingEvent then
    bz.RingEventLoop()
end
end
local function es(et) aB.MutationChoice =(et == 'Fractured' or et == 'Enchanted') and et or 'Scrambled'
end
local function et(eu) aB.MutationSpecies = ca(eu)
end
local function eu(ev) aB.MutationRarities = ca(ev)
end
local function ev(ew) aB.MutationMinRate = c8(ew)
end
local function ew(ex) aB.MutationRetry = ex == true
end
local function ex(ey) aB.AutoSell = ey == true
if aB.AutoSell then
    bz.startAutoSellLoop()
end
end
local function ey(ez) aB.AutoSellEgg = ez == true
if aB.AutoSellEgg then
    bz.startAutoSellEggLoop()
end
end
local function ez(eA) aB.SellPetMaxRate = c8(eA)
end
local function eA(eB) aB.SellEggMaxRate = c8(eB)
end
local eB = false
local function eC(eD)
local eE = aB.StartupBoost == true aB.StartupBoost = eD == true
if not aB.StartupBoost then
    eB = false
    if eE or a6.snapshot then
        task.spawn(a6.revert)
    end
    return
end
if aB.StartupBoost and not eB then
    eB = true task.spawn(
    function() task.wait(1.5)
    if n() and aB.StartupBoost then
        bc()
    end
    task.wait(4)
    if n() and aB.StartupBoost then
        bc()
    end
end
)
end
end
local function eD(eE)
if eE == true then
    task.spawn(bu)
end
end
local function eE(eF)
local eG = l.__SenaV4SetCapFps
if type(eG) == 'function' then
    eG(eF == true and 1000 or 60)
end
end
local function eF()
return l.__SenaV4MovementExtras
end
local function eG(eH) aB.FlyForCapture = eH == true
local eI = eF()
if eI then
    eI:setFlyForCapture(aB.FlyForCapture)
end
end
local function eH(eI) aB.InstantGrab = eI == true
local eJ = eF()
if eJ then
    eJ:setInstantGrab(aB.InstantGrab)
end
end
local function eI(eJ) l.__SenaV4AdminBoost = eJ == true
if bP then
    bP:setSpeed(aB.TweenSpeedMultiplier or 60)
end
l.__SenaV4AdminBoostSpeedGen =(l.__SenaV4AdminBoostSpeedGen or 0) + 1
local eK = l.__SenaV4AdminBoostSpeedGen
if eJ == true then
    task.spawn(
    function()
    local eL = game:GetService('RunService')
    local eM
    local eN
    while l.__SenaV4AdminBoostSpeedGen == eK and n() do
        local eO = g.Character
        local eP = eO and eO:FindFirstChildOfClass('Humanoid')
        if eP then
            local eQ = eP.WalkSpeed
            if eM == nil or eN == nil or math.abs(eQ - eN) > 0.5 then
                eM = eQ > 900 and eQ / 10 or eQ
            end
            if eM and eM > 0 then
                local eR = eM * 10 eP.WalkSpeed = eR eN = eR
            end
            else
            eM = nil eN = nil
        end
        eL.Heartbeat:Wait()
    end
    local eO = g.Character
    local eP = eO and eO:FindFirstChildOfClass('Humanoid')
    if eP and eM and(eN and math.abs(eP.WalkSpeed - eN) <= 0.5) then
        pcall(
        function() eP.WalkSpeed = eM
    end
    )
end
end
)
end
end
local function eJ(eK) aB.AutoStealCapture = eK == true
if bP then
    bP:setCaptureObjective(aB.AutoStealCapture)
end
end
local function eK(eL) aB.InfiniteJump = eL == true
local eM = eF()
if eM then
    eM:setInfiniteJump(aB.InfiniteJump)
end
end
local function eL(eM) aB.AntiHitGuard = eM == true
local eN = l.__SenaV4AntiHitGuard
if eN then
    eN:setEnabled(aB.AntiHitGuard)
end
end
local function eM(eN) aB.AntiAFK = eN == true l.__SenaV4AntiAfkEnabled = aB.AntiAFK
if type(l.__SenaV4SetAntiAfkEnabled) == 'function' then
    l.__SenaV4SetAntiAfkEnabled(aB.AntiAFK)
end
end
local function eN(eO) aB.AutoReconnect = eO == true bW.autoReconnect = aB.AutoReconnect
if getgenv then
    getgenv().SNE_AutoReconnect = aB.AutoReconnect
end
end
local function eO(eP) aB.AutoExecute = eP == true bW.autoExecute = aB.AutoExecute
if getgenv then
    getgenv().SNE_AutoExecute = aB.AutoExecute
end
if eP then
    pcall(bZ)
    else
    pcall(b_)
end
end
local eP =(
function()
local eP = l.__SenaV4IdentitySetter or type(setthreadidentity) == 'function' and setthreadidentity or type(set_thread_identity) == 'function' and set_thread_identity or type(setidentity) == 'function' and setidentity or type(syn) == 'table' and type(syn.set_thread_identity) == 'function' and syn.set_thread_identity
local eQ = l.__SenaV4UICapabilityIdentity or 8
return
function()
if type(eP) == 'function' then
    pcall(eP, eQ)
end
end
end
)()
local eQ = true
local function eR(eS)
return
function(eT)
if type(eP) == 'function' then
    eP()
end
if eQ then
    return
end
if type(eS) == 'function' then
    eS(eT)
end
end
end
local eS = l.__SenaV4PlayerSteal
local function eT(eU) aB.StealPlayers = eU == true
if eS then
    eS:setEnabled(aB.StealPlayers)
end
if aB.StealPlayers and not aB.GodMode then
    du(true)
    if controls.godMode then
        pcall(
        function() controls.godMode:Set(true)
    end
    )
end
end
end
local function eU(eV) aB.StealPlayerRarities = ca(eV)
end
local function eV(eW)
local eX = string.lower(tostring(eW or '')):gsub('[%s,]', '')
if eX == '' then
    return 0
end
local eY, eZ = string.match(eX, '^([%d]+%.?[%d]*)([kmb]?)$')
local e_ = tonumber(eY)
if not e_ then
    return 0
end
if eZ == 'k' then
    return e_ * 1000
end
if eZ == 'm' then
    return e_ * 1000000
end
if eZ == 'b' then
    return e_ * 1000000000
end
return e_
end
local function eW(eX) aB.StealPlayerMinValue = eV(eX)
end
local function eX(eY) aB.AutoIndex = eY == true
if bP then
    bP:setIndexObjective(aB.AutoIndex)
end
end
local function eY(eZ) aB.WebhookEnabled = eZ == true
end
local function eZ(e_) aB.WebhookURL = type(e_) == 'string' and e_:gsub('^%s+', ''):gsub('%s+$', '') or ''
end
local function e_(e0) aB.WebhookRarities = ca(e0)
end
local function e0(e1) aB.WebhookMinValue = eV(e1)
end
local e1 ={'Set', 'SetValue', 'LoadValue', 'ResetValue', 'SetContent', 'SetTitle', 'SetOptions', 'Update', 'Refresh', 'Lock', 'Unlock', 'SetVisible', 'SetStatus',
'GetValue', 'SetSubTitle', 'SetBadge'}
local function e2(e3)
if type(e3) ~= 'table' then
    return e3
end
if rawget(e3, '__senaElevated') then
    return e3
end
for e4, e5 in ipairs(e1) do
    local e6 = rawget(e3, e5)
    if type(e6) == 'function' then
        rawset(e3, e5,
        function(...) eP()
        return e6(...)
    end
    )
end
end
rawset(e3, '__senaElevated', true)
return e3
end
local e3 ={'AddToggle', 'AddSlider', 'AddDropdown', 'AddInput', 'AddButton', 'AddParagraph', 'AddKeybind', 'AddColorPicker', 'AddActionList', 'AddPriorityList',
'AddLiveChat', 'AddSupportCard', 'AddSubSection', 'AddSection', 'AddTab', 'AddForum'}
local function e4(e5)
if type(e5) ~= 'table' then
    return e5
end
e2(e5)
if rawget(e5, '__senaFactoryGuarded') then
    return e5
end
for e6, e7 in ipairs(e3) do
    local e8 = rawget(e5, e7)
    if type(e8) == 'function' then
        rawset(e5, e7,
        function(...) eP()
        local fa = table.pack(e8(...))
        if fa.n > 0 then
            fa[1] = e4(fa[1])
        end
        return table.unpack(fa, 1, fa.n)
    end
    )
end
end
rawset(e5, '__senaFactoryGuarded', true)
return e5
end
eP()
local e5 = type(b9.ApplyIcon) == 'function'
local e6 = b9:Window({Title = 'Sena 6.2 |', Footer = 'Steal An Egg', Folder = 'SenaSAEv4', Version = 1, Color = Color3.fromRGB(232, 232, 238), Image = 'https://senahub.xyz/api/visual/sena_bg.jpg',
KeyGate = false}) e4(e6)
local e7 ={}
local e8 ={'Respawn Point'}
local fa = l.__SenaV4Roaming
if fa and type(fa.waypointList) == 'function' then
    local fb, fc = pcall(fa.waypointList) e8 =
    if fb then
        if type(fc) == 'table' then
            if # fc > 0 then
                fc
                else
                e8
                else
                e8
                else
                e8
            end
            local fb = e8[1]
            local fc ={} do
                local fd = l.__SenaV4ScrambleRuntime
                if fd and type(fd.snapshot) == 'function' then
                    pcall(
                    function()
                    local fe = fd.snapshot()
                    if fe and type(fe.Shop) == 'table' then
                        for ff, fg in pairs(fe.Shop) do
                            if fg and fg.Label then
                                fc[# fc + 1] = tostring(fg.Label)
                            end
                        end
                    end
                end
                )
            end
        end
        e7.iconCache ={} e7.gameIcon =
        function(fd,...)
        local fe ={...}
        local ff = fd..'/'..table.concat(fe, '/')
        local fg = e7.iconCache[ff]
        if fg ~= nil then
            return fg or nil
        end
        local fh, fi = pcall(
        function()
        local fh = require(e:FindFirstChild('Data') and e.Data:FindFirstChild(fd) or e:FindFirstChild(fd, true))
        for fi, fj in ipairs(fe) do
            fh = fh[fj]
        end
        return fh
    end
    )
    local fj = fh and type(fi) == 'string' and fi:find('rbxassetid://') and fi or false e7.iconCache[ff] = fj
    return fj or nil
end
e7.section =
function(fd, fe, ff)
return fd:AddSection({Title = fe, Icon = ff})
end
if e6.SetHeaderChips then
    task.spawn(
    function()
    local fd pcall(
    function() fd = require(e.Shared.Save)
end
)
local fe pcall(
function() fe = game:GetService('Stats').Network.ServerStatsItem['Data Ping']
end
)
local ff = os.clock()
local fg = e7.gameIcon('Assets', 'Directory', 'Dog', 'Egg', 'Icon')
local fh = e7.gameIcon('Currency', 'Directory', 'BossTokens', 'Icon')
local fi = e7.gameIcon('Currency', 'Directory', 'SakuraCrystals', 'Icon')
local function fj(fk)
local fl = tonumber(fk) or 0
for fm, fn in ipairs({{1000000000000000, 'Qa'},{1000000000000, 'T'},{1000000000, 'B'},{1000000, 'M'},{1000, 'K'}}) do
    if fl >= fn[1] then
        return('%.2f%s'):format(fl / fn[1], fn[2]):gsub('%.?0+([A-Za-z])', '%1')
    end
end
return tostring(math.floor(fl))
end
while n() do
    pcall(
    function()
    local fk = fd and select(2, pcall(fd.Peek))
    local fl = type(fk) == 'table' and fk or{}
    local fm = fe and math.floor(fe:GetValue() + 0.5) or 0
    local fn = math.floor(os.clock() - ff)
    local fo = l.__SenaV4EggRuntime
    local fp = l.__SenaV4PlayerSteal
    local fq ={{Icon = 'clock', Text =('%d:%02d:%02d'):format(fn // 3600, fn % 3600 // 60, fn % 60)},{Icon = fg, Text = fj((fo and fo.stats and tonumber(fo.stats.delivered) or 0) +(fp and tonumber(fp.taken) or 0))..' stolen'},
    {Icon = fh, Text = fj(fl.BossTokens)}}
    local fr = tonumber(fl.SakuraCrystals)
    if fr and fr > 0 then
        fo = # fq + 1 fn ={Icon = fi} fn.Text, fq[fo] = fj(fl.SakuraCrystals), fn
    end
    local fs = # fq + 1
    local ft ={Icon = 'wifi', Text = fm..' ms'} ft.IconColor, fq[fs] = fm < 150 and Color3.fromRGB(74, 222, 128) or(fm < 300 and Color3.fromRGB(245, 196, 81) or Color3.fromRGB(248,
    113, 113)), ft e6:SetHeaderChips(fq)
end
) task.wait(1.5)
end
end
)
end
e6:AddTab({Name = 'Donate', Icon = 'donator', LayoutOrder = - 1, StartActive = false, Gate = false}):AddSection('Support Sena', true):AddSupportCard({})
local fd = e6:AddTab({Name = 'Home', Icon = 'home', LayoutOrder = 1})
local fe = e6:AddTab({Name = 'Windows', Icon = 'app-window', LayoutOrder = 2})
local ff = e6:AddTab({Name = 'Steal', Icon = 'hand', LayoutOrder = 3})
local fg = e6:AddTab({Name = 'Eggs & Plot', Icon = 'egg', LayoutOrder = 4})
local fh = e6:AddTab({Name = 'Pets', Icon = 'sparkles', LayoutOrder = 5})
local fi = e6:AddTab({Name = 'Events', Icon = 'flame', LayoutOrder = 6})
local fj = e6:AddTab({Name = 'Farm', Icon = 'activity', LayoutOrder = 7})
local fk = e6:AddTab({Name = 'Server', Icon = 'server', LayoutOrder = 8}) e7.privateTab = fk
local fl = e6:AddTab({Name = 'Settings', Icon = 'settings', LayoutOrder = 9}) e7.autoStealCapture = e7.section(fi, 'Capture The Egg', e7.gameIcon('CaptureTheEgg',
'BroadcastIconImage')):AddToggle({Title = 'Auto Steal Capture', Content = [[For the Capture The Egg event. Steals the event egg the Low Speed User way, then holds it high up so your time keeps going. Re-steals it if you lose it.]],
Default = false, Callback = eR(eJ)})
local fm = e7.section(fi, 'Movement', e7.gameIcon('Gears', 'Directory', 'GravityDisruptor', 'Icon')) e7.adminBoost = fm:AddToggle({Title = 'Admin Abuse Boost',
Content = [[Only works during Admin Abuse: Auto Steal goes straight to each egg and straight home, at full speed. Do not use it when there is no Admin Abuse.]],
Default = false, Callback = eR(eI)}) e7.flyForCapture = fm:AddToggle({Title = 'Fly For Capture', Content = [[For the Capture The Egg event. After you pick up an egg, you fly up and stay still in the air so nobody can take it.]],
Default = false, Callback = eR(eG)}) e7.instantGrab = fm:AddToggle({Title = 'Instant Grab', Content = [[Picking up an egg only needs a quick tap instead of a long hold.]],
Default = false, Callback = eR(eH)}) e7.infiniteJump = fm:AddToggle({Title = 'Infinite Jump', Content = 'Jump again in mid-air, as often as you like.',
Default = false, Callback = eR(eK)}) e7.noclip = fm:AddToggle({Title = 'Noclip', Content = 'Walk through walls and doors.', Default = false, Callback = eR(eh)}) e7.autoRingEvent = e7.section(fi,
'Ring Event', e7.gameIcon('FallenPowerUp', 'Kinds', 'x2Rings', 'Icon')):AddToggle({Title = 'Auto Ring Event', Content = [[Starts at the safe zone, then glides Forest -> Angels & Demons -> back to Forest on a loop. Turn off Auto Steal while using this.]],
Default = false, Callback = eR(er)})
local fn = e7.section(ff, 'Auto Steal', e7.gameIcon('Assets', 'Directory', 'Dog', 'Egg', 'Icon')) e7.autoSteal = fn:AddToggle({Title = 'Auto Steal', Content = 'Steals eggs that match your filters and brings them home.',
Default = false, Callback = eR(ds)}) fn:AddButton({Title = 'Open Hop UI', Content = [[Opens the Rare Egg Hop panel. Pick Divine, Eternal or Secret, and it hops to fresh servers until one is still in the field.]],
Callback = eR(
function()
local fo = b2.hopHunt
if fo then
    task.spawn(
    function() pcall(fo.open)
end
)
end
end
)}) e7.helpFriend = fn:AddToggle({Title = 'Help Friend', Content = [[Instead of banking a stolen egg, drops it just before the safe zone line so a friend can pick it up.]],
Default = false, Callback = eR(
function(fo) aB.HelpFriend = fo == true
end
)}) e7.godMode = fn:AddToggle({Title = 'Aura Bat', Content = '', Default = false, Callback = eR(du)}) e7.stealMode = fn:AddDropdown({Title = 'Steal Mode',
Content = [[If you have good speed better use High Speed User, but if you are newbie, use Instant Steal]], Options ={'Instant Steal (Recommended)', 'High Speed User Normal',
'High Speed User (Fly)', 'Zig-Zag High Speed User'}, MaxVisible = 4, Default = 'Instant Steal (Recommended)', Multi = false, Callback = eR(
function(fo) dO(fo)
if type(b3.syncStealMode) == 'function' then
    b3.syncStealMode()
end
end
)})
function b3.getStealMode()
local fo = e7.stealMode and e7.stealMode.Value
return
if type(fo) == 'table' then
    fo[1]
    else
    fo
end
function b3.setStealMode(fo)
if e7.stealMode then
    e7.stealMode:Set(fo)
end
end
local fo = fn:AddParagraph({Title = 'Speed Advice', Content = 'Reading your speed...'}) task.spawn(
function()
while n() do
    if bP and type(bP.lowSpeedStatus) == 'function' then
        pcall(
        function()
        local fp = bP:lowSpeedStatus()
        local fq = fp.safe == fp.fast and tostring(fp.fast) or fp.safe..'\226\128\147'..fp.fast
        local fr =('Current Speed: %s (WS %d)\nRecommended Instant Steal Multiplier: %s  \194\183  yours: %d'):format(fp.speedText, fp.walkSpeed, fq, fp.level)
        local fs = fp.advice
        if fs then
            fr..=('\nSteals keep failing (%d of the last %d) - lower it to %d.'):format(fs.fails, fs.total, fs.to)
            if fs.fresh then
                fs.fresh = false b9:Notify({Title = 'Low Speed User', Content =([[Steals keep failing at %d - lower the Low Speed Multiplier to %d.]]):format(fs.from, fs.to),
                Duration = 6})
            end
            else
            fr =
            if fp.level > fp.fast then
                fr..[[

Above the recommendation - lower it if steals start failing.]]
                else
                fr
            end
            fo:SetContent(fr)
        end
        )
    end
    task.wait(2)
end
end
) e7.stealHold = fn:AddSlider({Title = 'Instant Steal Multiplier', Content = [[For Instant Steal mode. Higher = faster grab (shorter hold), lower = safer (longer). Raise it if your account speed is high; lower it if your speed is low.]],
Min = 1, Max = 10, Default = 5, Increment = 1, Callback = eR(dt)}) e7.lowSpeedBoost = fn:AddToggle({Title = 'Boost For Instant Steal', Content = [[Faster steals for Instant Steal on every area except Forest (about 6 s per egg). Keep it on when you use Instant Steal.]],
Default = true, Locked2 = false, Callback = eR(
function(fp) aB.LowSpeedBoost = fp == true
end
)})
local fp = e7.section(ff, 'Egg Filter', e7.gameIcon('Assets', 'Directory', 'Unicorn', 'Egg', 'Icon')) fp:AddSubSection('Egg') e7.names = fp:AddDropdown({Title = 'Filter By Egg Name',
Content = 'Only steal these eggs. Leave empty for any egg.', Options = dk, Multi = true, Default ={}, Callback = eR(
function(fq) dQ('names', 'name', fq)
end
)}) e7.rarities = fp:AddDropdown({Title = 'Filter By Rarity', Content = 'Only steal these rarities. Leave empty for any rarity.', Options = dr, Multi = true,
Default ={}, Callback = eR(
function(fq) dQ('rarities', 'rarity', fq)
end
)}) fp:AddSubSection('Area & Value') e7.areas = fp:AddDropdown({Title = 'Select Area', Content = 'Only steal from these areas. Leave empty for every area.',
Options = dq, Multi = true, Default ={}, Callback = eR(
function(fq) dQ('areas', 'area', fq)
end
)}) e7.value = fp:AddInput({Title = 'Steal By Value', Content = 'Minimum money per second. Supports k, m and b.', Placeholder = 'e.g. 500k, 2m, 1b', Default = '',
Callback = eR(dR)}) e7.mutations = fp:AddDropdown({Title = 'Filter By Mutation', Content = [[Only steal eggs carrying one of these mutations. Leave empty for any egg.]],
Options = cl, Multi = true, Default ={}, Callback = eR(dS)}) e7.weight = fp:AddInput({Title = 'Steal By Weight', Content = 'Minimum egg weight in kilograms. 0 accepts any weight.',
Placeholder = 'e.g. 12000', Default = '', Callback = eR(dU)}) e7.priority = fp:AddDropdown({Title = 'Steal Priority', Content = [[Which egg to go for first when more than one passes the filters.]],
Options ={'Rarity', 'Highest Value', 'Heaviest'}, Default = 'Highest Value', Callback = eR(dV)}) e7.autoIndex = fp:AddToggle({Title = 'Auto Index', Content = [[Also steal eggs whose pet is still missing from your Pet Index, in any area, on top of the filters above. An egg you already hold counts as covered until it hatches.]],
Default = false, Callback = eR(eX)})
local fq = e7.section(ff, 'Egg ESP', e7.gameIcon('Assets', 'Directory', 'Kitsune', 'Egg', 'Icon')) e7.eggEsp = fq:AddToggle({Title = 'Egg ESP', Content = [[Draws a label over every egg on the field so you can read it from across the map.]],
Default = false, Callback = eR(dW)}) e7.espDetails = fq:AddDropdown({Title = 'ESP Details', Content = [[What each label shows. Placed Eggs also labels the eggs on your plot, Icon adds the animal picture to those labels.]],
Options ={'Name', 'Rarity', 'Value', 'Weight', 'Mutation', 'Placed Eggs', 'Icon'}, Multi = true, Default ={'Name', 'Rarity', 'Value', 'Icon'}, Callback = eR(dX)}) e7.espMinRarity = fq:AddDropdown({Title = 'ESP Min Rarity',
Content = [[Only label eggs of this rarity or rarer. Any labels every egg.]], Options =(
function()
local fr ={'Any'}
for fs, ft in ipairs(dr) do
    fr[# fr + 1] = ft
end
return fr
end
)(), Multi = false, Default = 'Any', Callback = eR(bz.applyEspMinRarity)}) e7.espMinValue = fq:AddInput({Title = 'ESP Min Value', Content = [[Only label eggs making at least this much per second. Supports k, m and b.]],
Placeholder = 'e.g. 500k, 2m, 1b', Default = '', Callback = eR(bz.applyEspMinValue)}) e7.backpackRates = fq:AddToggle({Title = 'Backpack Value/s', Content = [[Shows how much money per second each egg in your backpack makes, right on its slot.]],
Default = false, Callback = eR(dZ)})
local fr = e7.section(ff, 'Steal Webhook', 'bell') e7.webhookEnabled = fr:AddToggle({Title = 'Steal Webhook', Content = [[Posts a Discord embed the moment a stolen egg is banked, with its rarity, size, weight and cash per second.]],
Default = false, Callback = eR(eY)}) e7.webhookUrl = fr:AddInput({Title = 'Webhook URL', Content = 'Paste the Discord webhook URL for the channel you want.',
Placeholder = 'https://discord.com/api/webhooks/...', Default = '', Callback = eR(eZ)}) e7.webhookDisconnect = fr:AddToggle({Title = 'Disconnect Alert',
Content = [[Posts to the same webhook when this account gets disconnected or kicked, with the reason.]], Default = false, Callback = eR(
function(fs) aB.WebhookDisconnect = fs == true
end
)}) fr:AddSubSection('Filter') e7.webhookRarities = fr:AddDropdown({Title = 'Notify Rarities', Content = 'Only post these rarities. Empty = every egg you steal.',
Options = dr, Multi = true, Default ={}, Callback = eR(e_)}) e7.webhookValue = fr:AddInput({Title = 'Notify Minimum Value', Content = [[Only post eggs worth at least this per second. Supports k, m and b.]],
Placeholder = 'e.g. 500k, 2m, 1b', Default = '', Callback = eR(e0)}) fr:AddButton({Title = 'Test Webhook', Content = 'Sends one test embed so you can confirm the URL works.',
Callback = eR(
function()
local fs = l.__SenaV4Webhook
local ft = e7.webhookUrl and e7.webhookUrl.Value
if type(ft) == 'string' and ft ~= '' then
    eZ(ft)
end
if
if fs then
    not fs.test()
    else
    not fs then
        b9:Notify({Title = 'Steal Webhook', Content = 'Enter a webhook URL first', Duration = 3})
        return
    end
    b9:Notify({Title = 'Steal Webhook', Content = 'Test embed sent', Duration = 3})
end
)}) ce = fd:AddSection('Task Order')
local fs ={auto_steal = 'hand', race = 'flag', star = 'star', mech_boss = 'swords', butterfly = 'flower', auto_place = 'egg', use_scrambled = 'flask-conical',
auto_sell = 'coins', treadmill = 'activity'}
local ft ={}
for fu, fv in ipairs(aI.DEFAULT) do
    local fw = # ft + 1
    local fx ={Id = fv, Title = aI.TITLES[fv], Icon = fs[fv], Pinned = aI.PINNED[fv] == true} fx.Sub, ft[fw] = aI.PINNED[fv] and 'Runs when every other task is idle' or nil,
    fx
end
local function fw(fx) aB.TaskOrder = aI.sanitize(fx)
end
if type(ce.AddPriorityList) == 'function' then
    e7.taskOrder = ce:AddPriorityList({Title = 'Task Order', Content = [[Higher rows get the character first. An egg you are carrying is always delivered first, and a boss fight that has started is never left.]],
    Flag = 'TaskOrder', Items = ft, Default = aI.DEFAULT, EmptyText = [[Turn on Auto Steal, Auto Place or another feature to order it here.]], Callback = eR(fw)})
    else
    ce:AddParagraph({Title = 'Task Order', Content = [[Update the Sena library to reorder tasks. Using the default order: Auto Steal, Race Rally, Shooting Star, Mech Boss, Farm Drones, Auto Place, Use Scrambled, Auto Sell, Treadmill.]]})
end
dq = e7.section(fg, 'Egg Automation', e7.gameIcon('Assets', 'Directory', 'Dragon', 'Egg', 'Icon')) dq:AddSubSection('Place') e7.autoPlace = dq:AddToggle({Title = 'Auto Place Egg',
Content = 'Places eggs from your inventory on your plot.', Default = false, Callback = eR(eo)}) e7.placeRarity = dq:AddDropdown({Title = 'Place Egg Rarity',
Content = 'Only place these rarities. Leave empty for all.', Options = dr, Multi = true, Default ={}, Callback = eR(
function(fx) aB.PlaceRarities = ca(fx)
end
)}) dq:AddSubSection('Hatch') e7.autoHatch = dq:AddToggle({Title = 'Auto Hatch Egg', Content = 'Hatches your placed eggs when they are ready.', Default = false,
Callback = eR(ep)}) dq:AddSubSection('Mutate') e7.mutationChoice = dq:AddDropdown({Title = 'Select Mutation', Content = [[Which mutation to apply to your placed eggs. Enchanted uses the Enchanted Essence from the Butterfly Bloom shrine.]],
Options ={'Scrambled', 'Fractured', 'Enchanted'}, Multi = false, Default = 'Scrambled', Callback = eR(es)}) e7.mutationSpecies = dq:AddDropdown({Title = 'Mutate Egg Name',
Content = [[Only mutate these eggs by name. Leave empty for every placed egg.]], Options = dk, Multi = true, Default ={}, Callback = eR(et)}) e7.mutationRarity = dq:AddDropdown({Title = 'Mutate Egg Rarity',
Content = [[Only mutate placed eggs of these rarities. Leave empty for every rarity.]], Options = dr, Multi = true, Default ={}, Callback = eR(eu)}) e7.mutationMinValue = dq:AddInput({Flag = 'mutationMinValue',
Title = 'Mutate Min Value (money/s)', Content = [[Only mutate placed eggs whose money per second is this or higher. Blank = no value limit. Supports k, m, b.]],
Placeholder = 'e.g. 100k, 2m', Default = '', Callback = eR(ev)}) e7.mutationRetry = dq:AddToggle({Title = 'Retry Until Mutated', Content = [[Keep applying to one egg until it mutates or charges run out (10% per use).]],
Default = true, Callback = eR(ew)}) e7.autoMutation = dq:AddToggle({Title = 'Auto Apply Mutation', Content = [[Equips the selected mutation consumable and applies it to your placed eggs.]],
Default = false, Callback = eR(eq)}) dq:AddButton({Title = 'Apply Mutation Now', Content = 'Run one mutation pass over your placed eggs right now.', Callback = eR(
function() task.spawn(
function() pcall(bz.mutationSweep)
end
)
end
)}) do
    ce = fg:AddSection({Title = 'Placed Eggs', AlwaysOpen = true, Icon = e7.gameIcon('Assets', 'Directory', 'Dragon', 'Egg', 'Icon')})
    local fx = ce.AddActionList and ce:AddActionList({Title = 'Your placed eggs', EmptyText = 'No eggs placed on your plot.', VisibleRows = 6, ButtonWidth = 64})
    if fx then
        local fy = game:GetService('ReplicatedStorage')
        local fz = l.__SenaV4IdentitySetter
        local fA, fB, fC = l.__SenaV4UICapabilityIdentity or 8 pcall(
        function() fB = require(fy.Shared.Modules.Mutations)
    end
    ) pcall(
    function() fC = require(fy.Shared.Eggs.PlacedEggGrowthPresentationPolicy)
end
)
local function fD(fE)
if typeof(fE) ~= 'Color3' then
    return 'E8E8EE'
end
return string.format('%02X%02X%02X', math.floor(fE.R * 255 + 0.5), math.floor(fE.G * 255 + 0.5), math.floor(fE.B * 255 + 0.5))
end
local fE ={Scrambled = true, Boss = true, Enchanted = true}
local function fF(fG)
if fG == 'Scrambled' then
    return 'Scrambled'
end
local fH, fI = pcall(
function()
return fB.LabelOf(fG)
end
)
return fH and type(fI) == 'string' and fI ~= '' and fI or tostring(fG)
end
local function fG(fH)
local fI = math.max(0, math.floor(fH))
local fJ = math.floor(fI / 3600)
local fK = math.floor(fI % 3600 / 60)
local fL = fI % 60
if fJ > 0 then
    return string.format('%dh %02dm', fJ, fK)
end
return string.format('%dm %02ds', fK, fL)
end
local function fH(fI)
local fJ = workspace:FindFirstChild('PlacedEggRenders')
return fJ and fJ:FindFirstChild(tostring(g.UserId)..'_'..tostring(fI))
end
local function fI(fJ)
local fK = fH(fJ)
if not fK then
    return false
end
local fL = Instance.new('Highlight') fL.FillColor = Color3.fromRGB(232, 232, 238) fL.FillTransparency = 0.55 fL.OutlineColor = Color3.fromRGB(255, 255,
255) fL.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop fL.Parent = fK task.delay(5,
function() pcall(
function() fL:Destroy()
end
)
end
)
return true
end
local function fJ()
local fK, fL, fM ={}, pcall(
function()
return require(fy.Client.EggState).ReadOwnerEggs(g.UserId)
end
)
if fL then
    if type(fM) ~= 'table' then
        return fK
    end
    else
    return fK
end
local fN = workspace:GetServerTimeNow()
for fO, fP in pairs(fM) do
    if type(fP) == 'table' and fP.Placement then
        local fQ = bB.resolve(fP)
        local fR = fP.BaseMutation
        local fS ={}
        local fT ={}
        local fU ={}
        for fV, fW in pairs(type(fP.Mutations) == 'table' and fP.Mutations or{}) do
            if not fU[fW] then
                fU[fW] = true
                if fW ~= fR or fE[fW] then
                    fS[# fS + 1] = fF(fW)
                    else
                    fT[# fT + 1] = fF(fW)
                end
            end
        end
        if fR and(fE[fR] and not fU[fR]) then
            fS[# fS + 1] = fF(fR)
        end
        fU = 0
        if fC then
            local fX, fY = pcall(fC.GetRemainingGrowthSeconds, fP, fN) fU = fX and tonumber(fY) or 0
        end
        local fX = fU > 0 and 'Hatches in '..fG(fU) or '<font color="#4ADE80">Ready to hatch</font>'
        local fY = fP.Placement.PlacedAt and os.date('%d %b %H:%M', math.floor(fP.Placement.PlacedAt)) or '?'
        local fZ = # fS > 0 and '<font color="#4ADE80">Mutated: '..table.concat(fS, ', ')..'</font>' or '<font color="#74747F">Not mutated</font>'
        local f_ =
        if # fT > 0 then
            fZ..'  <font color="#A2A2AE">['..table.concat(fT, ', ')..']</font>'
            else
            fZ fK[# fK + 1] ={id = tostring(fO), name = string.format('<font color="#%s">%s</font>', fD(fQ.rarityColor), tostring(fQ.name)), sub = string.format('<font color="#%s">%s</font>',
            fD(fQ.rarityColor), tostring(fQ.rarity)), status = f_, statusSub = fX..'  -  Placed '..fY, button = 'Find', buttonColor = 'accent', rank = fQ.rarityRank or 0,
            mutated = # fS > 0, onClick =
            function(f0, f1)
            local f2 = fI(fO) f1(f2 and 'Found' or 'Far', f2 and 'green' or 'red') task.delay(1.6,
            function() pcall(f1, 'Find', 'accent')
        end
        )
    end
    }
end
end
table.sort(fK,
function(fQ, fR)
if fQ.rank ~= fR.rank then
    return fQ.rank > fR.rank
end
if fQ.mutated ~= fR.mutated then
    return not fQ.mutated
end
return fQ.id < fR.id
end
)
return fK
end
local fK
local fL, fM = 0 fM = game:GetService('RunService').Heartbeat:Connect(
function()
if not fx:Alive() then
    fM:Disconnect()
    return
end
local fN = os.clock()
if fK and fN - fK < 5 then
    return
end
if fN - fL < 1 then
    return
end
fL = fN
local fO = fN fK = fO task.spawn(
function()
local fP, fQ = pcall(
function()
if fz then
    pcall(fz, fA)
end
local fP = fJ()
if fz then
    pcall(fz, fA)
end
if fx:Alive() then
    fx:Update(fP)
end
end
)
if not fP then
    warn('[Sena] Placed eggs list error:', fQ)
end
if fK == fO then
    fK = nil
end
end
)
end
)
end
end
local fx = e7.section(fh, 'Pet Selling', e7.gameIcon('Currency', 'Directory', 'Money', 'Icon')) e7.autoSell = fx:AddToggle({Title = 'Auto Sell Pet', Content = [[Sells pets that match a filter below. Favorite, placed and equipped pets are kept.]],
Default = false, Callback = eR(ex)}) fx:AddSubSection('Filter') cW = fx:AddDropdown({Title = 'Pet Name Filter', Content = 'Pets to sell by name. Pick All for every name.',
Options = cH, Multi = true, Default ={}, Callback = eR(
function(fy) aB.SellNames = ca(fy)
end
)}) cX = fx:AddDropdown({Title = 'Pet Rarity Filter', Content = 'Pets to sell by rarity. Pick All for every rarity.', Options = ci(dr), Multi = true, Default ={},
Callback = eR(
function(fy) aB.SellRarities = ca(fy)
end
)}) e7.sellPetValue = fx:AddInput({Flag = 'sellPetValue', Title = 'Sell By Value (max money/s)', Content = [[Only sell pets whose money per second is this or lower. Blank = no value limit. Supports k, m, b.]],
Placeholder = 'e.g. 100k, 2m', Default = '', Callback = eR(ez)})
local fy = e7.section(fg, 'Egg Selling', e7.gameIcon('Currency', 'Directory', 'Money', 'Icon')) e7.autoSellEgg = fy:AddToggle({Title = 'Auto Sell Egg',
Content = 'Sells unplaced eggs of the rarities below.', Default = false, Callback = eR(ey)}) c5 = fy:AddDropdown({Title = 'Egg Rarity Filter', Content = 'Egg rarities to sell. Pick All for every rarity.',
Options = ci(dr), Multi = true, Default ={}, Callback = eR(
function(fz) aB.SellEggRarities = ca(fz)
end
)}) e7.sellEggValue = fy:AddInput({Flag = 'sellEggValue', Title = 'Sell By Value (max money/s)', Content = [[Only sell eggs whose money per second is this or lower. Blank = no value limit. Supports k, m, b.]],
Placeholder = 'e.g. 100k, 2m', Default = '', Callback = eR(eA)}) ce = e7.section(fh, 'Pet Favorite', e7.gameIcon('Assets', 'Directory', 'Unicorn', 'Icon')) e7.autoFavorite = ce:AddToggle({Title = 'Auto Favorite',
Content = [[Marks every pet that matches the rule below as a favorite, so Auto Sell and Auto Fuse leave it alone.]], Default = false, Callback = eR(d1)}) e7.favoriteRule = ce:AddDropdown({Title = 'Favorite Rule',
Content = 'Match pets by rarity or by species.', Options ={'Rarity', 'Species'}, Default = 'Rarity', Callback = eR(d2)}) ce:AddSubSection('Only when Rule = Rarity') e7.favoriteRarities = ce:AddDropdown({Title = 'Rarities to Keep',
Content = 'Pets of these rarities get favorited.', Options = dr, Multi = true, Default ={}, Callback = eR(d3)}) ce:AddSubSection('Only when Rule = Species') e7.favoriteSpecies = ce:AddDropdown({Title = 'Species to Keep',
Content = 'Pets of these species get favorited.', Options = dk, Multi = true, Default ={}, Callback = eR(d4)}) e7.unfavoriteAll = ce:AddButton({Title = 'Unfavorite Everything',
Content = 'Clears the favorite flag on every pet you own.', Callback = eR(
function()
local fz = l.__SenaV4PetBarn b9:Notify({Title = 'Pet Favorite', Content =(
if fz then
    if type(fz.unfavoriteAll) == 'function' then
        fz.unfavoriteAll() or 0
        else
        0
        else
        0)..' pets unfavorited', Duration = 3})
    end
    )})
    local fz = e7.section(fh, 'Pet Fusion', e7.gameIcon('FallenPowerUp', 'Kinds', 'Fusion', 'Icon')) e7.autoFuse = fz:AddToggle({Title = 'Auto Fuse', Content = [[Feeds three matching pets into the Fusion machine over and over. Favorited and equipped pets are never used.]],
    Default = false, Callback = eR(d9)}) e7.fuseRule = fz:AddDropdown({Title = 'Fusion Rule', Content = [[Fuse anything that passes the rarity filter, or only the species you pick below.]],
    Options ={'Any Species', 'Selected Species'}, Default = 'Any Species', Callback = eR(ea)}) e7.fuseRarities = fz:AddDropdown({Title = 'Rarities to Fuse',
    Content = [[Only fuse pets of these rarities. Leave empty for any rarity.]], Options = dr, Multi = true, Default ={}, Callback = eR(ef)}) fz:AddSubSection('Only when Rule = Selected Species') e7.fuseSpecies = fz:AddDropdown({Title = 'Species to Fuse',
    Content = 'Only these species go into the machine.', Options = dk, Multi = true, Default ={}, Callback = eR(eg)})
    local fA = e7.section(fg, 'Equip & Collect', e7.gameIcon('Assets', 'Directory', 'Dog', 'Icon')) e7.autoEquipBest = fA:AddToggle({Title = 'Auto Equip Best',
    Content = 'Keeps your strongest pets equipped as better ones hatch.', Default = false, Callback = eR(d5)}) e7.autoClaimOffline = fA:AddToggle({Title = 'Collect Offline Income',
    Content = [[Claims the money your base earned while you were away, as soon as there is any.]], Default = false, Callback = eR(d6)}) e7.autoBaseUpgrade = fA:AddToggle({Title = 'Auto Upgrade Base',
    Content = 'Buys the next base tier the moment you can afford it.', Default = false, Callback = eR(d7)}) e7.autoClaimAlmanac = fA:AddToggle({Title = 'Auto Claim Almanac',
    Content = [[Redeems every Pet Index reward that is ready. This is the reward claim, not the steal objective.]], Default = false, Callback = eR(d8)}) e7.upgradeBaseOnce = fA:AddButton({Title = 'Upgrade Base Now',
    Content = 'Buys one base tier right away.', Callback = eR(
    function()
    local fB = l.__SenaV4Upgrades
    local fC = false
    local fD = 'Upgrades not ready'
    if fB and type(fB.upgradeBase) == 'function' then
        fC, fD = fB.upgradeBase()
    end
    b9:Notify({Title = 'Base', Content = fC and 'Base upgraded' or tostring(fD or 'Could not upgrade'), Duration = 3})
end
)}) do
    local fB = l.__SenaV4ButterflyRuntime dq = e7.section(fi, 'Wisp Event', e7.gameIcon('WispQuests', 'List', 1, 'Icon'))
    local fC = dq:AddParagraph({Title = 'Wisp Companion', Content = 'Reading your wisp progress...'}) e7.wispAutoQuest = dq:AddToggle({Title = 'Auto Wisp Quest',
    Content = [[Meets the Baby Wisp, hunts the quest eggs (Enchanted Forest eggs, an Eternal), fuses an Enchanted Forest animal, claims every reward and flies the wisp home to unlock the Enchanted Tree. Needs 50B SpeedPower.]],
    Default = false, Callback = eR(
    function(fD) aB.WispAutoQuest = fD == true
end
)}) e7.banjoAuto = dq:AddToggle({Title = 'Auto Banjo Cricket', Content = [[Goes into the Enchanted Tree, plays the Banjo Cricket's mushroom song back for all 5 stages, then claims the secret from Jitterbug. Needs the tree unlocked.]],
Default = false, Callback = eR(
function(fD) aB.BanjoAuto = fD == true
end
)})
local fD = e7.section(fi, 'Butterfly Bloom', e7.gameIcon('ButterflyCatalog', 'Icons', 'Net'))
local fE = fD:AddParagraph({Title = 'Bloom Status', Content = 'Reading the Bloom schedule...'})
local fF, fG = fD.AddIconGrid and fD:AddIconGrid({Title = 'Butterflies Caught', Note = '', Columns = 4})
local fH ={} e7.bloomAutoNet = fD:AddToggle({Title = 'Auto Claim Net', Content = [[Goes into the Enchanted Tree and claims your free Butterfly Net once.]],
Default = false, Callback = eR(
function(fI) aB.ButterflyAutoNet = fI == true
end
)}) e7.bloomAutoCatch = fD:AddToggle({Title = 'Auto Catch', Content = [[During every Bloom (every 30 min, 5 min long) flies to the Enchanted Forest, equips the net and catches with the Catch Mode below.]],
Default = false, Callback = eR(
function(fI) aB.ButterflyAutoCatch = fI == true
end
)}) ce = fB and fB.modeOptions() or{'Tween to Butterfly'} e7.bloomMode = fD:AddDropdown({Title = 'Catch Mode', Content = [[Tween to Butterfly chases one butterfly at a time. Stand waits in the thickest part of the swarm, Zigzag sweeps back and forth across the forest, Circle loops around the swarm.]],
Options = ce, Multi = false, Default = ce[1], Callback = eR(
function(fI)
if fB then
    fB.setMode(fI)
end
end
)}) e7.bloomTiers = fD:AddDropdown({Title = 'Catch Tiers', Content = [[Only swing at these butterflies. Leave empty to catch every tier.]], Options = fB and fB.tierOptions() or{'Radiant',
'Amethyst', 'Sapphire', 'Emerald'}, Multi = true, Default ={}, Callback = eR(
function(fI)
if fB then
    fB.setTiers(ca(fI))
end
end
)}) e7.bloomEsp = fD:AddToggle({Title = 'Butterfly ESP', Content = [[Shows every butterfly's tier and distance while a Bloom is live.]], Default = false,
Callback = eR(
function(fI) aB.ButterflyEsp = fI == true
end
)}) fD:AddSubSection('Trade & Craft') e7.bloomAutoTrade = fD:AddToggle({Title = 'Auto Trade Up', Content = [[After each Bloom, trades your butterflies up at the machine inside the Enchanted Tree.]],
Default = false, Callback = eR(
function(fI) aB.ButterflyAutoTrade = fI == true
end
)}) cH = fB and fB.recipeOptions() or{'All Recipes'} e7.bloomRecipe = fD:AddDropdown({Title = 'Trade Recipe', Content = [[Which trade Auto Trade Up runs. For Essence only trades up what the essence recipe is still short of.]],
Options = cH, Multi = false, Default = cH[1], Callback = eR(
function(fI)
if fB then
    fB.setRecipe(fI)
end
end
)}) e7.bloomAutoCraft = fD:AddToggle({Title = 'Auto Craft Essence', Content = [[After each Bloom, crafts Enchanted Essence at the shrine once you hold the full recipe.]],
Default = false, Callback = eR(
function(fI) aB.ButterflyAutoCraft = fI == true
end
)})
local function fI(fJ, fK, fL, fM) fD:AddButton({Title = fJ, Content = fK, Callback = eR(
function()
if not fB then
    return
end
task.spawn(
function() fB.manual = true
local fN, fO, fP = pcall(fL) fB.manual = false
if fN then
    else
    fO, fP = false, fO
end
b9:Notify({Title = 'Butterfly Bloom', Content = fO and fM(fP) or tostring(fP or 'Could not do that'), Duration = 4})
end
)
end
)})
end
fI('Claim Net Now', 'Claims the Butterfly Net right now.',
function()
return fB.claimNet()
end
,
function()
return 'Butterfly Net claimed'
end
) fI('Trade Up Now', 'Runs the trade recipe once, even with Auto Trade Up off.',
function()
return fB.tradeUp()
end
,
function(fJ)
return('Traded up %d time(s)'):format(tonumber(fJ) or 0)
end
) fI('Craft Essence Now', [[Crafts Enchanted Essence right now if you hold the full recipe.]],
function()
return fB.craft()
end
,
function(fJ)
return('Crafted %d Enchanted Essence'):format(tonumber(fJ) or 0)
end
)
local function fJ(fK)
local fL = tonumber(fK) or 0
if fL >= 1000000000000 then
    return('%.2fT'):format(fL / 1000000000000)
end
if fL >= 1000000000 then
    return('%.2fB'):format(fL / 1000000000)
end
if fL >= 1000000 then
    return('%.2fM'):format(fL / 1000000)
end
if fL >= 1000 then
    return('%.1fK'):format(fL / 1000)
end
return tostring(math.floor(fL))
end
task.spawn(
function()
while n() do
    if fB then
        local function fK()
        local fL = fB.snap
        local fM = fB.tiers() or{}
        if fL.unlocked then
            fC:SetContent('Complete - the Enchanted Tree is unlocked.')
            elseif
            fL.accepted then
                fC:SetContent(('Stage %d / %d  \194\183  %s  (%d / %d)%s'):format(fL.stage or 1, fL.stages or 4, tostring(fL.quest), fL.progress or 0, fL.target or 0, fL.readyReturn and '\nAll quests done - return the wisp to unlock the tree.' or(fL.claimable and '\nReady to claim.' or(fB.questNote and '\n'..fB.questNote or ''))))
                elseif
                (fL.speed or 0) <(fL.need or 0) then
                    fC:SetContent(('Not eligible yet: SpeedPower %s of %s.'):format(fJ(fL.speed), fJ(fL.need)))
                    else
                    fC:SetContent(([[Eligible (SpeedPower %s). The Baby Wisp waits in the Enchanted Forest.]]):format(fJ(fL.speed)))
                end
                local fN
                if fL.active then
                    local fO = math.floor(fL.left or 0) fN =('LIVE - ends in %dm %02ds'):format(math.floor(fO / 60), fO % 60)
                    else
                    if fL.enabled == false then
                        fN = 'Disabled on this server'
                        else
                        if fL.nextIn then
                            local fO = math.floor(fL.nextIn) fN =('Next in %dm %02ds'):format(math.floor(fO / 60), fO % 60)
                            else
                            fN = 'Not running'
                        end
                    end
                end
                local fO ={}
                for fP, fQ in ipairs({'Golden', 'Purple', 'Blue', 'Green'}) do
                    fO[# fO + 1] =('%s %d'):format(fM[fQ] and fM[fQ].name or fQ, fL.counts and fL.counts[fQ] or 0)
                end
                if fF then
                    local fR ={}
                    for fS, fT in ipairs({'Green', 'Blue', 'Purple', 'Golden'}) do
                        local fU = fL.counts and fL.counts[fT] or 0
                        if fG and fU >(fG[fT] or 0) then
                            fH[fT] =(fH[fT] or 0) + fU - fG[fT]
                        end
                        local fV = fM[fT] or{}
                        local fX = fH[fT] or 0 fR[# fR + 1] ={Name = fV.name or fT, Icon = fV.icon, Color = fV.color, Value = fJ(fU), Sub = fX > 0 and('+%d session'):format(fX) or(fV.rarity or ''),
                        SubColor = fX > 0 and Color3.fromRGB(74, 222, 128) or nil}
                    end
                    fG = table.clone(fL.counts or{}) fF:SetItems(fR) fF:SetNote(('Total %s  \194\183  Essence %d'):format(fJ(fL.caught), fL.essence or 0)) fO ={}
                end
                fE:SetContent((('%s\n%s  \194\183  Essence %d  \194\183  Caught %d\n%s\n%s'):format(fN, fL.net and(fL.holding and 'Net equipped' or 'Net owned') or 'No Butterfly Net',
                fL.essence or 0, fL.caught or 0, table.concat(fO, '  \194\183  '), tostring(fB.status or 'Idle')):gsub('\n\n', '\n')))
            end
            pcall(fK)
        end
        task.wait(1)
    end
end
)
end
local fB = e7.section(fi, 'Race Rally', e7.gameIcon('FallenPowerUp', 'Kinds', 'x2Rings', 'Icon')) fB:AddParagraph({Title = 'About This Event', Content = [[Race Rally opens every 30 minutes for 60 seconds. Auto Race joins from anywhere, rides the track for you and brings you back to base after the finish.]]}) e7.raceAuto = fB:AddToggle({Title = 'Auto Race',
Content = [[Joins every race, rides the track, uses power-ups and returns to base. Auto Steal pauses while you race.]], Default = false, Callback = eR(
function(fC) aB.RaceAuto = fC == true
end
)}) e7.raceClaim = fB:AddToggle({Title = 'Auto Claim & Equip Best Racer', Content = [[Claims every win milestone you reached and equips the best racer you own.]],
Default = false, Callback = eR(
function(fC) aB.RaceClaim = fC == true
end
)}) e7.raceBuy = fB:AddToggle({Flag = 'RaceAutoBuyShop', Title = 'Auto Buy Shop', Content = 'Spends race tokens on the items you pick below.', Default = false,
Callback = eR(
function(fC) aB.RaceBuy = fC == true
end
)}) e7.raceBuyList = fB:AddDropdown({Flag = 'RaceShopBuyList', Title = 'Shop Buy List', Content = 'Which race shop items Auto Buy should purchase.', Options ={'CashBooster',
'SpeedBoost', 'TreadmillBoost', 'MutationToken', 'RacingBat'}, Multi = true, Default ={}, Callback = eR(
function(fC) aB.RaceBuyList = ca(fC)
end
)})
local fC = fB:AddParagraph({Title = 'Race Status', Content = 'Waiting for the next race.'}) task.spawn(
function()
while n() do
    local fD = l.__SenaV4RaceRuntime
    if fD then
        pcall(
        function()
        local fE = fD.joinLeft()
        local fF = fE > 0 and string.format('  \194\183  Join open %ds', math.floor(fE)) or '' fC:SetContent(tostring(fD.status)..fF..'\nLast: '..tostring(fD.lastResult))
    end
    )
end
task.wait(1)
end
end
)
local fD = e7.section(fi, 'Shooting Star', 'rbxassetid://92160802930122') fD:AddParagraph({Title = 'About This Event', Content = [[Sometimes a little star falls near you and runs around for a few minutes. Hold next to it to catch it.]]}) e7.starAlert = fD:AddToggle({Title = 'Star Alert',
Content = 'Shows a notification the moment a star starts falling.', Default = true, Callback = eR(
function(fE) aB.StarAlert = fE == true
end
)}) e7.starAutoCatch = fD:AddToggle({Title = 'Auto Catch Star', Content = [[Goes to the star when it lands and catches it. Other tasks pause until it is caught.]],
Default = false, Callback = eR(
function(fE) aB.StarAutoCatch = fE == true
end
)})
local fE = fD:AddParagraph({Title = 'Star Status', Content = 'No star right now.'}) task.spawn(
function()
while n() do
    local fF = l.__SenaV4StarRuntime
    if fF then
        pcall(
        function() fE:SetContent(tostring(fF.status)..'\nLast: '..tostring(fF.lastResult))
    end
    )
end
task.wait(1)
end
end
)
local fF = e7.section(fi, 'Dr Scramble Event', e7.gameIcon('Gears', 'Directory', 'The Scrambler', 'Icon')) fF:AddParagraph({Title = 'About This Event',
Content = [[Dr Scramble only runs during the live event. The shop, trade-in and boss fight are still up; the rest of the time these toggles sit idle.]]}) e7.scrambleBuy = fF:AddToggle({Flag = 'ScrambleAutoBuyShop',
Title = 'Auto Buy Shop', Content = [[Spends samples on the shop items you pick below, as soon as you can afford them.]], Default = false, Callback = eR(em)}) e7.scrambleBuyList = fF:AddDropdown({Flag = 'ScrambleShopBuyList',
Title = 'Shop Buy List', Content = [[Which shop items Auto Buy should purchase. This list fills in once the event shop is open.]], Options = fc, Multi = true,
Default ={}, Callback = eR(en)})
local fG = fF:AddParagraph({Title = 'Scramble Telemetry', Content = 'Waiting for the event to start.'}) task.spawn(
function()
while n() do
    local fH = l.__SenaV4ScrambleRuntime
    if fH and type(fH.samples) == 'function' then
        local fI, fJ = pcall(fH.samples)
        if fI then
            pcall(
            function() fG:SetContent(string.format('Samples %d  \194\183  %s', fJ or 0, fH.status or 'Idle'))
        end
        )
    end
end
task.wait(2)
end
end
) fF:AddSubSection('Trade-In (Experimental Pets)') e7.scrambleTradeInTrade = fF:AddToggle({Title = 'Auto Trade-In', Content = [[Auto-completes the recipe: uses the required eggs you already have, and auto-adds any you're missing to the Auto Steal hunt (works even with Auto Steal off) so they get stolen off the field, then combines once all three are ready. Favorited / placed eggs are never spent.]],
Default = false, Callback = eR(
function(fH) aB.ScrambleTradeInTrade = fH == true
end
)}) e7.scrambleTradeInReroll = fF:AddToggle({Title = 'Auto Free Reroll', Content = [[When pets are missing and a free reroll is left, rerolls the recipe instead of waiting.]],
Default = false, Callback = eR(
function(fH) aB.ScrambleTradeInReroll = fH == true
end
)}) e7.scrambleTradeInBanners = fF:AddDropdown({Title = 'Target Banners', Content = [[Only work the trade-in while one of these banners is up. Leave empty to accept any banner.]],
Options ={'Biohazard Pets', 'Experimental Pets', 'Unstable DNA'}, Multi = true, Default ={}, Callback = eR(dY)}) fF:AddButton({Title = 'Trade-In Once',
Content = 'Runs one sacrifice right now, even with Auto Trade-In off.', Callback = eR(
function()
local fH = l.__SenaV4ScrambleTradeIn
local fI = false
local fJ = 'Trade-In not ready'
if fH then
    fI, fJ = fH.tradeOnce()
end
b9:Notify({Title = 'Dr Scramble', Content = fI and 'Sacrifice complete' or tostring(fJ), Duration = 4})
end
)}) fF:AddButton({Title = 'Use Free Reroll', Content = "Spends one of today's free rerolls on a new recipe.", Callback = eR(
function()
local fH = l.__SenaV4ScrambleTradeIn
local fI = false
local fJ = 'Trade-In not ready'
if fH then
    fI, fJ = fH.reroll()
end
b9:Notify({Title = 'Dr Scramble', Content = fI and 'Recipe rerolled' or tostring(fJ), Duration = 4})
end
)}) fF:AddButton({Title = 'Open Trade-In UI', Content = [[Opens Dr Scramble's Lab window so you can pick pets by hand.]], Callback = eR(
function()
if not pcall(
function() require(e.Client.Tabs).Activate('DrScrambleTradeIn')
end
) then
    b9:Notify({Title = 'Dr Scramble', Content = 'Could not open the trade-in window', Duration = 3})
end
end
)})
local fH = fF:AddParagraph({Title = 'Trade-In Status', Content = 'Turn a trade-in toggle on to start reading the recipe.'}) task.spawn(
function()
while n() do
    local fI = l.__SenaV4ScrambleTradeIn
    if fI then
        pcall(
        function() fH:SetContent(string.format('%s  \194\183  %s\nRotates in %02d:%02d  \194\183  Pity %d/%d  \194\183  Free rerolls %d  \194\183  Traded %d\nRecipe (%d/%d): %s\nHeld: %s\nMissing: %s',
        fI.banner, fI.status, math.floor(fI.rotation / 60), fI.rotation % 60, fI.pity, fI.pityMax, fI.free, fI.trades, fI.ready, fI.total, fI.demands, fI.stock,
        fI.missing))
    end
    )
end
task.wait(1)
end
end
) fF:AddSubSection('Boss Fight') e7.scrambleBossAuto = fF:AddToggle({Title = 'Auto Boss', Content = [[When Dr Scramble's boss is live, walks into the arena portal, joins the fight, hits the nearest target with your bat and breaks free from grabs. The clear reward lands automatically. While Auto Steal is on and this is off, an accidental touch on the arena portal is bounced back out so your steal is never hijacked.]],
Default = false, Callback = eR(
function(fI) aB.ScrambleBossAuto = fI == true
local fJ = l.__SenaV4ScrambleBoss
if fJ and type(fJ.setEnabled) == 'function' then
    pcall(fJ.setEnabled, fJ, fI == true)
end
if bP and type(bP._reconcileScramblePortal) == 'function' then
    pcall(bP._reconcileScramblePortal, bP)
end
end
)})
local fI = fF:AddParagraph({Title = 'Boss Status', Content = [[Turn Auto Boss on. It sits idle until the boss event goes live.]]}) task.spawn(
function()
while n() do
    local fJ = l.__SenaV4ScrambleBoss
    if fJ then
        pcall(
        function()
        local fK = type(fJ._snapshot) == 'function' and fJ:_snapshot() or nil
        if type(fK) == 'table' then
            fI:SetContent(string.format('%s\nPhase %s  \194\183  HP %d/%d%s\nSamples %d  \194\183  Reward %s', tostring(fK.status), tostring(fK.phase), math.floor((fK.health or 0) + 0.5),
            math.floor((fK.maxHealth or 0) + 0.5), fK.overheated and '  \194\183  OVERHEAT' or '', fK.samples or 0, tostring(fK.reward)))
            else
            fI:SetContent(tostring(fJ.status or 'Idle'))
        end
    end
    )
end
task.wait(1)
end
end
)
local fJ = e7.section(fj, 'Treadmill', e7.gameIcon('Treadmills', 'Directory', 'Treadmill', 'Icon')) e7.autoTreadmill = fJ:AddToggle({Title = 'Auto Treadmill',
Content = [[Walks to your treadmill and farms speed whenever nothing else is running.]], Default = false, Callback = eR(dB)}) e7.treadmillUpgrade = fJ:AddToggle({Title = 'Auto Upgrade Treadmill',
Content = [[Buys the next treadmill tier with cash as soon as you can afford it.]], Default = false, Callback = eR(dN)})
local fK = fl:AddSection('Performance') e7.startupBoost = fK:AddToggle({Title = 'Startup Boost', Content = [[Lowers graphics when the script starts. Turn it off to get the graphics back; hidden pets and eggs return after a rejoin.]],
Default = false, Callback = eR(eC)}) e7.boostFps = fK:AddToggle({Title = 'Boost FPS', Content = [[Removes extra map details and other players' plots for more FPS.]],
Default = false, Callback = eR(eD)}) e7.uncapFps = fK:AddToggle({Title = 'Uncap FPS', Content = 'Raises the FPS cap to 1000.', Default = true, Callback = eR(eE)})
local fL = fl:AddSection('Guard') e7.antiGuardKnockback = fL:AddToggle({Title = 'Anti Guard Knockback', Content = [[Cancels the knockback the Forest guard puts on you, so a hit never throws you off the lane.]],
Default = true, Callback = eR(d0)}) e7.antiHitGuard = fL:AddToggle({Title = 'Anti Hit Guard', Content = [[For eggs you pick up by hand. Pins you in the safe zone behind a look-alike clone until the guard goes back to sleep. Auto Steal has its own guard handling and always wins.]],
Default = false, Callback = eR(eL)})
local fM = fe:AddSection('Windows', true) fM:AddButton({Title = 'Egg Logs', Content = 'Live feed of every egg that spawns on the server.', Callback = eR(
function() b3.openLogs()
end
)}) fM:AddButton({Title = 'Egg Board', Content = 'Sortable list of the eggs currently up for grabs.', Callback = eR(
function() b3.openBoard()
end
)}) fM:AddButton({Title = 'Inventory & Base', Content = 'Your pets, eggs and plot status in one window.', Callback = eR(
function() b3.openInventory()
end
)}) fM:AddButton({Title = 'Egg Checker', Content = [[Pick eggs off the field by hand, then send them all to the steal queue.]], Callback = eR(
function() b3.openChecker()
end
)}) fM:AddButton({Title = 'Egg Data & History', Content = [[Drop-table values per area, plus what has actually spawned this session.]], Callback = eR(
function() b3.openAnalyst()
end
)}) fM:AddButton({Title = 'Farm Stats', Content = [[What is running now, money and income, steals, your plot and the Dr Scramble event at a glance.]], Icon = 'trending-up',
Callback = eR(
function() b3.openStats()
end
)}) fM:AddButton({Title = 'Open All Windows', SubTitle = 'Close All Windows', Content = 'Opens every window at once, or hides them again.', Callback = eR(
function() b3.openAll()
end
), SubCallback = eR(
function() b3.closeAll()
end
)}) e7.antiTreadmill = e7.section(fj, 'Blocker', e7.gameIcon('Gears', 'Directory', 'Trap', 'Icon')):AddToggle({Title = 'Anti Treadmill', Content = [[Never stay on a treadmill: any mount is dropped right away, and Auto Treadmill is held off while this is on.]],
Default = false, Callback = eR(dC)})
local fN = fk:AddSection('Server Hop') e7.hopNoMatch = fN:AddToggle({Title = 'Hop When Nothing Matches', Content = [[Hop to the emptiest server when no egg matches your filters.]],
Default = false, Callback = eR(dD)}) fN:AddSubSection('Limits') e7.hopCooldown = fN:AddSlider({Title = 'Hop Cooldown', Content = 'Seconds between auto hops and wait after rejoining.',
Min = 1, Max = 60, Default = 5, Increment = 1, Callback = eR(dM)})
local fO = e7.privateTab:AddSection('Find Private Server', true)
local fP = fO:AddParagraph({Title = 'Current Server', Content = 'Checking...'}) e7.privateServerMax = fO:AddDropdown({Title = 'Max Players', Content = [[The most players you want in your server, you included. 2 (you + 1) is the easiest to find.]],
Options ={'1', '2', '3', '4', '5'}, Default = '2', Multi = false, Callback = eR(dH)}) fO:AddButton({Title = 'Hop Server Now', Content = 'Moves you to a quieter server right away.',
Callback = eR(
function() task.spawn(
function() b2.hopPrivateOnce()
end
)
end
)}) e7.privateServerAuto = fO:AddToggle({Title = 'Auto Hop', Content = [[Keeps moving you to quieter servers until the player count is at or under your max.]],
Default = false, Callback = eR(dL)}) task.spawn(
function()
local fQ
while n() do
    local fR = 'Now: '..# d:GetPlayers()..' player(s)  \194\183  Max: '..b2.privateMax()..'\n'..tostring(b2.privateStatus or '')
    if fR ~= fQ then
        pcall(
        function() fP:SetContent(fR)
    end
    ) fQ = fR
end
task.wait(1)
end
end
)
local fQ = e7.section(fj, 'Roaming', e7.gameIcon('Trails', 'Directory', 'PurpleTrail', 'Icon')) e7.waypoint = fQ:AddDropdown({Title = 'Waypoint', Content = 'Pick a place, then hit Teleport below.',
Options = e8, Default = e8[1], Callback = eR(
function(fR) fb = fR
end
)}) fQ:AddButton({Title = 'Teleport To Waypoint', Content = 'Moves you straight to the waypoint you picked.', Callback = eR(
function()
local fR = l.__SenaV4Roaming b9:Notify({Title = 'Waypoint', Content =(
if fR then
    if type(fR.teleportWaypoint) == 'function' then
        fR.teleportWaypoint(fb) == true
        else
        false
        else
        false) and 'Moved to '..tostring(fb) or 'That waypoint is not in this server', Duration = 3})
    end
    )})
    local fR = fd:AddSection('Run Once') fR:AddButton({Title = 'Place Everything Now', Content = 'Runs one pass of Auto Place, even while the toggle is off.',
    Callback = eR(
    function() ek('AutoPlace', bz.AutoPlaceLoop)
end
)}) fR:AddButton({Title = 'Hatch Everything Ready', Content = 'Runs one pass of Auto Hatch, even while the toggle is off.', Callback = eR(
function() ek('AutoHatch', bz.AutoHatchLoop)
end
)}) fR:AddButton({Title = 'Sell Pets Now', Content = 'Runs one pass of Auto Sell Pet using the filters above.', Callback = eR(
function() ek('AutoSell', bz.startAutoSellLoop)
end
)}) fR:AddButton({Title = 'Sell Eggs Now', Content = 'Runs one pass of Auto Sell Egg using the filters above.', Callback = eR(
function() ek('AutoSellEgg', bz.startAutoSellEggLoop)
end
)})
local fS = fl:AddSection('Session') e7.bottingMode = fS:AddToggle({Title = 'Botting Mode', Content = [[Turns off 3D rendering and covers the screen in black. Everything keeps running, your GPU does not.]],
Default = false, Callback = eR(ei)}) e7.antiCutscene = fS:AddToggle({Title = 'Anti Cutscene', Content = [[Closes event cutscenes and the intro as soon as the game opens them, so nothing locks your camera.]],
Default = false, Callback = eR(ej)}) fS:AddButton({Title = 'Rejoin This Server', Content = 'Teleports you back into the exact server you are in now.', Callback = eR(
function() pcall(
function() game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, g)
end
)
end
)}) fS:AddButton({Title = 'Stop & Unload', Content = [[Turns every loop off and closes the hub. Run the script again to bring it back.]], Callback = eR(
function()
for fT, fU in ipairs({'AutoSteal', 'AutoPlace', 'AutoHatch', 'AutoSell', 'AutoSellEgg', 'StealPlayers', 'AutoFavorite', 'AutoFusePets', 'AutoEquipBest',
'AutoClaimOffline', 'AutoBaseUpgrade', 'AutoClaimAlmanac', 'Noclip', 'BottingMode', 'AntiCutscene'}) do
    aB[fU] = false
end
eh(false) ei(false)
if bP then
    pcall(bP.setEnabled, bP, false)
end
local fV = l.__SenaV4HubShutdown
if type(fV) == 'function' then
    task.delay(0.2,
    function() pcall(fV)
end
)
end
end
)})
local fT = fl:AddSection('Player') e7.antiAfk = fT:AddToggle({Title = 'Anti AFK', Content = "Blocks the game's idle kick while the script runs.", Default = true,
Callback = eR(eM)}) e7.autoReconnect = fT:AddToggle({Title = 'Auto Reconnect', Content = [[Automatically reconnects you back to the server upon kick or disconnect.]],
Default = true, Callback = eR(eN)}) e7.autoExecute = fT:AddToggle({Title = 'Auto Execute (Rejoin)', Content = [[Prepares the bootstrapper so the script runs automatically after teleport or reconnect.]],
Default = false, Callback = eR(eO)})
local fU = e7.section(ff, 'Steal From Players', e7.gameIcon('Gears', 'Directory', 'Bat', 'Icon')) e7.stealPlayers = fU:AddToggle({Title = 'Auto Steal From Players',
Content = [[Chases anyone carrying an egg in the field, bats them until the egg drops, grabs it and banks it. A carrier is only chased when the egg clears the filters below.]],
Default = false, Callback = eR(eT)}) e7.stealPlayerRarities = fU:AddDropdown({Title = 'Rarity Filter', Content = [[Only chase eggs of these rarities. Empty = uses the Auto Steal rarity filter.]],
Options = dr, Multi = true, Default ={}, Callback = eR(eU)}) e7.stealPlayerValue = fU:AddInput({Title = 'Minimum Value', Content = [[Skip carriers holding less than this per second. Supports k, m and b.]],
Placeholder = 'e.g. 500k, 2m, 1b', Default = '', Callback = eR(eW)})
local fV = ff:AddSection({Title = 'Steal From Specific Player', AlwaysOpen = true, Icon = e7.gameIcon('Gears', 'Directory', 'Katana', 'Icon')}) ci = ff:AddSection({Title = 'Steal History',
AlwaysOpen = true, Icon = e7.gameIcon('Gears', 'Directory', 'Flyswatter', 'Icon')})
local fX, fY, fZ, f_
if fV.AddActionList then
    fZ, f_ = fV:AddActionList({Title = 'Players in this server', EmptyText = 'Nobody else is in this server.', VisibleRows = 6, ButtonWidth = 76}), ci:AddActionList({Title = 'History of stolen eggs from players',
    EmptyText = 'No player steals yet.', VisibleRows = 5, ButtonWidth = 72})
    else
    fV:AddParagraph({Title = 'Update required', Content = [[This Sena UI build has no player list yet. Rejoin to pull the latest version.]]}) fZ, f_ = fX, fY
end
ci:AddButton({Title = 'Clear History', Content = 'Wipe the list above.', Callback = eR(
function()
if eS then
    eS:clearHistory()
end
end
)})
if eS and fZ then
    local f0 = l.__SenaV4IdentitySetter
    local f1 = l.__SenaV4UICapabilityIdentity or 8
    local function f2(f3)
    if f0 then
        pcall(f0, f1)
    end
    if f_ then
        if not f_:Alive() then
            return
        end
        else
        return
    end
    local f4 ={}
    for f5, f6 in ipairs(f3.history) do
        f4[f5] ={id = tostring(f5), name = f6.player, sub = string.format('<font color="#A2A2AE">%s</font>', os.date('!%H:%M:%S', f6.at)), status = f6.egg, statusSub = f6.outcome,
        button = false}
    end
    f_:Update(f4)
end
eS:onChanged(f2) f2(eS)
local f3
local f4, f5 = 0 f5 = game:GetService('RunService').Heartbeat:Connect(
function()
if l.__SenaV4PlayerSteal ~= eS then
    f5:Disconnect()
    return
    elseif
    not fZ:Alive() then
        f5:Disconnect()
        return
    end
    local f6 = os.clock()
    if f3 and f6 - f3 < 5 then
        return
    end
    if f6 - f4 < 1 then
        return
    end
    f4 = f6
    local f7 = f6 f3 = f7 task.spawn(
    function()
    local f8, f9 = pcall(
    function()
    if f0 then
        pcall(f0, f1)
    end
    local f8 = eS:listEntries()
    if f0 then
        pcall(f0, f1)
    end
    if fZ:Alive() then
        fZ:Update(f8)
    end
end
)
if not f8 then
    warn('[Sena Steal] Player list update loop error:', f9)
end
if f3 == f7 then
    f3 = nil
end
end
)
end
)
end
local f0 = e6:AddTab({Name = 'Live Chat', Icon = 'chat', LayoutOrder = 11});
(e5 and f0:AddSection({Title = 'Global Chat', Header = false}) or f0:AddSection('Global Chat', true)):AddLiveChat({Title = 'Live Chat', Fill = true, Height = 300})
if type(e6.AddForum) == 'function' then
    e6:AddForum({Name = 'Forum', Icon = 'forum', Section = 'Config Forum', LayoutOrder = 12})
end
do
    local f1 = l.__SenaV4Visual
    local f2, f3, f4 = e6:AddTab({Name = 'Visual', Icon = 'eye', LayoutOrder = 10}),{rods = nil, fish = nil}
    local function f5()
    if f4 and f1 then
        pcall(
        function() f4:SetContent(f1.status)
    end
    )
end
end
local function f6(f7)
if not f1 then
    return
end
task.spawn(
function() f1.spawn(f7, f3[f7]) f5() b9:Notify({Title = 'Visual', Content = f1.status, Duration = 3})
end
) task.delay(0.1, f5)
end
local f7 = f2:AddSection('Fish It') f7:AddSubSection('Rods')
local f8 = f7:AddDropdown({Title = 'Select Rod', Content = 'Rods and skins from Fish It. Loading list...', Options ={}, Multi = false, Default = nil, Callback = eR(
function(f8) f3.rods = f8
end
)}) f7:AddButton({Title = 'Spawn Rod', Content = [[Downloads the rod and puts it in your backpack. Equip it like a bat. Only you can see it.]], Callback = eR(
function() f6('rods')
end
)}) f7:AddSlider({Title = 'Rod Size', Content = [[1 = the size it has in Fish It. Spawned rods update right away.]], Min = 0.5, Max = 2, Default = 1, Increment = 0.1,
Callback = eR(
function(f9)
if f1 then
    if f1.rodScale == f9 then
        return
    end
    else
    return
end
f1.rodScale = f9 task.spawn(f1.respawn, 'rods')
end
)}) f7:AddSubSection('Fish')
local f9 = f7:AddDropdown({Title = 'Select Fish', Content = 'Secret and Forgotten fish from Fish It. Loading list...', Options ={}, Multi = false, Default = nil,
Callback = eR(
function(f9) f3.fish = f9
end
)}) f7:AddButton({Title = 'Spawn Fish', Content = [[Downloads the fish and puts it in your backpack under Pets. Only you can see it.]], Callback = eR(
function() f6('fish')
end
)}) f7:AddSlider({Title = 'Fish Weight', Content = [[0% = lightest catch, 100% = heaviest Big catch. Size follows Fish It: weight / min weight.]], Min = 0,
Max = 100, Default = 0, Increment = 5, Callback = eR(
function(ga)
local gb =(tonumber(ga) or 0) / 100
if f1 then
    if f1.fishWeight == gb then
        return
    end
    else
    return
end
f1.fishWeight = gb task.spawn(f1.respawn, 'fish')
end
)}) f7:AddSubSection('Manage') f4 = f7:AddParagraph({Title = 'Status', Content = 'Idle'}) f7:AddButton({Title = 'Remove All Visual Items', Content = 'Takes every spawned rod and fish out of your backpack.',
Callback = eR(
function()
if f1 then
    f1.clear()
end
f5()
end
)}) task.spawn(
function()
if not f1 then
    return
end
local ga = f1.names('rods')
local gb = f1.names('fish') pcall(
function() f8:Refresh(ga)
end
) pcall(
function() f9:Refresh(gb)
end
) f1.status = # ga > 0 and string.format('%d rods and %d fish available', # ga, # gb) or 'Could not load the item list. Try again later.' f5()
end
)
local ga = f2:AddSection('Steal an Egg')
local gb = 'Egg'
local gc = 50
local gd = l.__SenaV4VisualSAE and l.__SenaV4VisualSAE.categories('Egg') or{}
local ge = gd[1] ga:AddDropdown({Title = 'Type', Content = [[Egg shows in the Eggs tab, Pet under Pets. Both are fake and local-only.]], Options ={'Egg',
'Pet'}, Multi = false, Default = 'Egg', Callback = eR(
function(gf) gb = gf or 'Egg'
end
)}) ga:AddDropdown({Title = 'Select Egg / Pet', Content = 'Which egg or pet to spawn.', Options = gd, Multi = false, Default = gd[1], MaxVisible = 8, Callback = eR(
function(gf) ge = gf
end
)}) ga:AddSlider({Title = 'Size / Flex', Content = [[Bigger = heavier Kg & higher value (Kg = base weight x scale^3) AND a bigger egg in your hand. 50 hits the billions.]],
Min = 1, Max = 100, Default = 50, Increment = 1, Callback = eR(
function(gf) gc = tonumber(gf) or 50
end
)}) ga:AddButton({Title = 'Hold in Hand', Content = [[Spawns a model of it in your hand. Press again for more. (In-hand only - use the other button to also add it to All Items.)]],
Callback = eR(
function()
local gf = l.__SenaV4VisualSAE
if gf then
    gf.spawn(gb, ge, gc, true)
end
end
)}) ga:AddButton({Title = 'Add to Backpack (Kg)', Content = [[Drops it in All Items (eggs) or Pets with a huge Kg for the inventory flex. Press again for more.]],
Callback = eR(
function()
local gf = l.__SenaV4VisualSAE
if gf then
    gf.spawn(gb, ge, gc, false)
end
end
)}) ga:AddButton({Title = 'Remove Egg / Pet Visuals', Content = 'Takes every spawned fake egg/pet and held model out.', Callback = eR(
function()
local gf = l.__SenaV4VisualSAE
if gf then
    gf.clear()
end
end
)})
end
local function f1(f2, f3) eP()
if type(f2) == 'table' and f2.Value ~= nil then
    pcall(f3, f2.Value)
end
end
eQ = false f1(e7.speed, dP) f1(e7.stealMode, dO) f1(e7.antiTreadmill, dC) f1(e7.autoTreadmill, dB) f1(e7.treadmillUpgrade, dN) f1(e7.hopCooldown, dM) f1(e7.hopNoMatch,
dD) f1(e7.privateServerMax, dH) f1(e7.privateServerAuto, dL) f1(e7.names,
function(f2) dQ('names', 'name', f2)
end
) f1(e7.areas,
function(f2) dQ('areas', 'area', f2)
end
) f1(e7.rarities,
function(f2) dQ('rarities', 'rarity', f2)
end
) f1(e7.value, dR) f1(e7.autoIndex, eX) f1(e7.scrambleBuy, em) f1(e7.scrambleBuyList, en) f1(e7.wispAutoQuest,
function(f2) aB.WispAutoQuest = f2 == true
end
) f1(e7.banjoAuto,
function(f2) aB.BanjoAuto = f2 == true
end
) f1(e7.bloomAutoNet,
function(f2) aB.ButterflyAutoNet = f2 == true
end
) f1(e7.bloomAutoCatch,
function(f2) aB.ButterflyAutoCatch = f2 == true
end
) f1(e7.bloomEsp,
function(f2) aB.ButterflyEsp = f2 == true
end
) f1(e7.bloomAutoTrade,
function(f2) aB.ButterflyAutoTrade = f2 == true
end
) f1(e7.bloomAutoCraft,
function(f2) aB.ButterflyAutoCraft = f2 == true
end
) f1(e7.bloomTiers,
function(f2)
local f3 = l.__SenaV4ButterflyRuntime
if f3 then
    f3.setTiers(ca(f2))
end
end
) f1(e7.bloomRecipe,
function(f2)
local f3 = l.__SenaV4ButterflyRuntime
if f3 then
    f3.setRecipe(f2)
end
end
) f1(e7.bloomMode,
function(f2)
local f3 = l.__SenaV4ButterflyRuntime
if f3 then
    f3.setMode(f2)
end
end
) f1(e7.noclip, eh) f1(e7.bottingMode, ei) f1(e7.antiCutscene, ej) f1(e7.waypoint,
function(f2) fb = f2
end
) f1(e7.autoFavorite, d1) f1(e7.favoriteRule, d2) f1(e7.favoriteRarities, d3) f1(e7.favoriteSpecies, d4) f1(e7.autoFuse, d9) f1(e7.fuseRule, ea) f1(e7.fuseRarities,
ef) f1(e7.fuseSpecies, eg) f1(e7.autoEquipBest, d5) f1(e7.autoClaimOffline, d6) f1(e7.autoBaseUpgrade, d7) f1(e7.autoClaimAlmanac, d8) f1(e7.mutations,
dS) f1(e7.weight, dU) f1(e7.priority, dV) f1(e7.eggEsp, dW) f1(e7.espDetails, dX) f1(e7.espMinRarity, bz.applyEspMinRarity) f1(e7.espMinValue, bz.applyEspMinValue) f1(e7.backpackRates,
dZ) f1(e7.antiGuardKnockback, d0) f1(e7.placeRarity,
function(f2) aB.PlaceRarities = ca(f2)
end
) f1(cW,
function(f2) aB.SellNames = ca(f2)
end
) f1(cX,
function(f2) aB.SellRarities = ca(f2)
end
) f1(c5,
function(f2) aB.SellEggRarities = ca(f2)
end
) f1(e7.sellPetValue, ez) f1(e7.sellEggValue, eA) f1(e7.godMode, du) f1(e7.antiAfk, eM) f1(e7.autoReconnect, eN) f1(e7.autoExecute, eO) f1(e7.antiHitGuard,
eL) f1(e7.flyForCapture, eG) f1(e7.autoStealCapture, eJ) f1(e7.instantGrab, eH) f1(e7.infiniteJump, eK) f1(e7.uncapFps, eE) f1(e7.startupBoost, eC) f1(e7.autoPlace,
eo) f1(e7.autoHatch, ep) f1(e7.mutationChoice, es) f1(e7.mutationSpecies, et) f1(e7.mutationRarity, eu) f1(e7.mutationMinValue, ev) f1(e7.mutationRetry,
ew) f1(e7.autoMutation, eq) f1(e7.taskOrder, fw) f1(e7.stealHold, dt) f1(e7.raceClaim,
function(f2) aB.RaceClaim = f2 == true
end
) f1(e7.raceBuyList,
function(f2) aB.RaceBuyList = ca(f2)
end
) f1(e7.raceBuy,
function(f2) aB.RaceBuy = f2 == true
end
) f1(e7.raceAuto,
function(f2) aB.RaceAuto = f2 == true
end
) f1(e7.starAlert,
function(f2) aB.StarAlert = f2 == true
end
) f1(e7.starAutoCatch,
function(f2) aB.StarAutoCatch = f2 == true
end
) f1(e7.scrambleTradeInBanners, dY) f1(e7.scrambleTradeInReroll,
function(f2) aB.ScrambleTradeInReroll = f2 == true
end
) f1(e7.scrambleTradeInTrade,
function(f2) aB.ScrambleTradeInTrade = f2 == true
end
) f1(e7.scrambleBossAuto,
function(f2) aB.ScrambleBossAuto = f2 == true
local f3 = l.__SenaV4ScrambleBoss
if f3 and type(f3.setEnabled) == 'function' then
    pcall(f3.setEnabled, f3, f2 == true)
end
end
)
if e7.taskOrder and type(e7.taskOrder.SetStatus) == 'function' then
    local f2 = e7.taskOrder task.spawn(
    function()
    while n() do
        for f3, f4 in ipairs(aI.DEFAULT) do
            local f5 = aI.enabled(f4)
            if type(f2.SetVisible) == 'function' then
                pcall(f2.SetVisible, f2, f4, f5)
            end
            if f5 then
                local f6, f7 = aI.describe(f4) pcall(f2.SetStatus, f2, f4, f6, f7)
            end
        end
        task.wait(0.5)
    end
end
)
end
f1(e7.autoRingEvent, er) f1(e7.autoSell, ex) f1(e7.autoSellEgg, ey) f1(e7.stealPlayerRarities, eU) f1(e7.stealPlayerValue, eW) f1(e7.webhookUrl, eZ) f1(e7.webhookRarities,
e_) f1(e7.webhookValue, e0) f1(e7.webhookEnabled, eY) f1(e7.webhookDisconnect,
function(f2) aB.WebhookDisconnect = f2 == true
end
) f1(e7.helpFriend,
function(f2) aB.HelpFriend = f2 == true
end
) f1(e7.lowSpeedBoost,
function(f2) aB.LowSpeedBoost = f2 == true
end
) f1(e7.autoSteal, ds) f1(e7.stealPlayers, eT) b2.hopWindow = e6 do
    local f2 = b2.hopHunt
    if f2 and f2.state and(f2.state.active or f2.state.watch) then
        pcall(
        function() e6:LoadConfig('HopSession')
    end
    ) task.delay(2,
    function() pcall(f2.open)
end
)
end
end
l.__SenaV4HubShutdown =
function()
if eS then
    pcall(eS.setEnabled, eS, false)
end
for f2, f3 in ipairs({'AutoSteal', 'AutoPlace', 'AutoHatch', 'AutoMutation', 'AutoRingEvent', 'AutoSell', 'AutoSellEgg', 'StealPlayers', 'ScrambleBossAuto',
'RaceAuto', 'RaceClaim', 'RaceBuy', 'StarAutoCatch', 'ButterflyAutoCatch', 'ButterflyAutoNet', 'ButterflyAutoTrade', 'ButterflyAutoCraft'}) do
    aB[f3] = false
end
if bP then
    pcall(bP.setEnabled, bP, false)
end
local f4 = l.__SenaV4ScrambleBoss
if f4 and type(f4.setEnabled) == 'function' then
    pcall(f4.setEnabled, f4, false)
end
local f5 = e6 and rawget(e6, 'Gui') or nil
local f6 ={game:GetService('CoreGui')} pcall(
function()
if gethui then
    table.insert(f6, gethui())
end
end
)
for f7, f8 in ipairs(f6) do
    for f9, ga in ipairs(f8:GetChildren()) do
        if ga == f5 or ga:IsA('ScreenGui') and(ga.Name == 'Chloeex' or ga.Name == 'ToggleUIButton') then
            pcall(ga.Destroy, ga)
        end
    end
end
end
aw = true task.spawn(
function() task.wait(1.2) pcall(
function()
if type(aB) == 'table' then
    aB.StealPriority = 'Highest Value' aB.StealMode = 'Instant'
end
if bP then
    if type(bP.setHighestValueFirst) == 'function' then
        bP:setHighestValueFirst(true)
    end
    if type(bP.setHeaviestFirst) == 'function' then
        bP:setHeaviestFirst(false)
    end
    if type(bP.setStealMode) == 'function' then
        pcall(
        function() bP:setStealMode('Instant')
    end
    )
end
end
if type(b3) == 'table' and type(b3.setStealMode) == 'function' then
    pcall(
    function() b3.setStealMode('Instant Steal (Recommended)')
end
)
end
if e7 then
    if e7.priority and type(e7.priority.Set) == 'function' then
        pcall(
        function() e7.priority:Set('Highest Value')
    end
    )
end
if e7.stealMode and type(e7.stealMode.Set) == 'function' then
    pcall(
    function() e7.stealMode:Set('Instant Steal (Recommended)')
end
)
end
end
end
) task.spawn(
function()
local f4 = setmetatable({},{__mode = 'k'})
local function f5(f6)
local f7 = f6.Name
if f7:sub(1, 4) == 'LUKZ' then
    return false
end
local f8 = string.lower(f7)
return f7:sub(1, 5) == '__SNE' or string.find(f8, 'sena', 1, true) ~= nil or f7 == 'Chloeex' or f7 == 'ToggleUIButton'
end
local function f6(f7) pcall(
function()
if not f7:IsA('ScreenGui') or not f5(f7) then
    return
end
f7.Enabled = false
if not f4[f7] then
    f4[f7] = true f7:GetPropertyChangedSignal('Enabled'):Connect(
    function()
    if f7.Enabled then
        f7.Enabled = false
    end
end
)
end
end
)
end
local f7 ={} pcall(
function() table.insert(f7, game:GetService('CoreGui'))
end
) pcall(
function()
if gethui then
    table.insert(f7, gethui())
end
end
) pcall(
function() table.insert(f7, game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui', 10))
end
)
for f8, f9 in ipairs(f7) do
    pcall(
    function() f9.ChildAdded:Connect(
    function(ga) f6(ga) task.defer(f6, ga)
end
)
end
)
end
while true do
    for ga, gb in ipairs(f7) do
        pcall(
        function()
        for gc, gd in ipairs(gb:GetChildren()) do
            f6(gd)
        end
    end
    )
end
task.wait(1)
end
end
)
local f4, f5 = pcall(
function()
local f4 = game:GetService('TweenService')
local f5 = game:GetService('UserInputService')
local f6 = game:GetService('RunService')
local f7 = game:GetService('Players').LocalPlayer
local f8 = f7:WaitForChild('PlayerGui') pcall(
function()
local f9 = f8:FindFirstChild('LUKZTop5')
if f9 then
    f9:Destroy()
end
local ga = f8:FindFirstChild('LUKZLoading')
if ga then
    ga:Destroy()
end
end
) rawset(_G, '__LUKZ_PickUid', nil) rawset(_G, '__LUKZ_BestUid', nil)
local f9 = Color3.fromRGB(30, 144, 255)
local ga = Color3.fromRGB(0, 224, 255)
local gb = Color3.fromRGB(8, 70, 190)
local gc = Color3.fromRGB(232, 242, 255)
local gd = Color3.fromRGB(130, 158, 205)
local function ge(gf, gg, gh, gi, gj)
local gk = f4:Create(gf, TweenInfo.new(gg, gi or Enum.EasingStyle.Quad, gj or Enum.EasingDirection.Out), gh) gk:Play()
return gk
end
local function gf(gg, gh)
local gi = Instance.new('UICorner') gi.CornerRadius = UDim.new(0, gh) gi.Parent = gg
return gi
end
local function gg(gh, gi, gj, gk)
local gl = Instance.new('UIStroke') gl.Color = gi gl.Thickness = gj gl.Transparency = gk or 0 gl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border gl.Parent = gh
return gl
end
local function gh(gi, gj, gk, gl, gm, gn, go, gp, gq, gr)
local gs = Instance.new('TextLabel') gs.BackgroundTransparency = 1 gs.Text = gj gs.TextSize = gk gs.Font = gl gs.TextColor3 = gm gs.Position = UDim2.fromOffset(gn,
go) gs.Size = UDim2.fromOffset(gp, gq) gs.TextXAlignment = gr or Enum.TextXAlignment.Left gs.TextTruncate = Enum.TextTruncate.AtEnd gs.Parent = gi
return gs
end
local gi = Instance.new('ScreenGui') gi.Name = 'LUKZTop5' gi.ResetOnSpawn = false gi.DisplayOrder = 120 gi.IgnoreGuiInset = true gi.Parent = f8
local gj = f5.TouchEnabled and not f5.KeyboardEnabled
local gk = Instance.new('UIScale') gk.Parent = gi
local gl, gm = 360, 78
local gn, go = 302, 708
local gp = gn
local gq = gm + gp
local gr = gm + go
local function gs()
local gt = workspace.CurrentCamera
local gu = gt and gt.ViewportSize.Y or 720
local gv = gt and gt.ViewportSize.X or 1280
local gw = gj and 0.9 or 1.1 gk.Scale = math.max(0.45, math.min(gw,(gu - 20) / gr,(gv - 16) / gl))
end
gs() pcall(
function() workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(gs)
end
)
local gt = Instance.new('Frame') gt.AnchorPoint = Vector2.new(0.5, 0.5) gt.Position = UDim2.new(0.5, 0, 0.5, 0) gt.Size = UDim2.fromOffset(gl, gq) gt.BackgroundColor3 = Color3.fromRGB(5,
11, 26) gt.BorderSizePixel = 0 gt.ClipsDescendants = true gt.Parent = gi gf(gt, 18)
local gu = gg(gt, ga, 1.8, 0.1)
local gv = Instance.new('UIGradient') gv.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ga), ColorSequenceKeypoint.new(0.5, f9), ColorSequenceKeypoint.new(1,
ga)}) gv.Parent = gu
local gw = Instance.new('UIGradient') gw.Color = ColorSequence.new(Color3.fromRGB(7, 16, 38), Color3.fromRGB(4, 9, 22)) gw.Rotation = 90 gw.Parent = gt
local gx = Instance.new('UIScale') gx.Scale = 0.8 gx.Parent = gt gt.BackgroundTransparency = 1 gt.Visible = false
local gy task.spawn(
function()
local gz = Instance.new('Frame') gz.Size = UDim2.fromScale(1, 1) gz.BackgroundColor3 = Color3.fromRGB(2, 6, 14) gz.BackgroundTransparency = 1 gz.BorderSizePixel = 0 gz.ZIndex = 50 gz.Parent = gi ge(gz,
0.4,{BackgroundTransparency = 0.05})
local gA = Instance.new('Frame') gA.AnchorPoint = Vector2.new(0.5, 0.5) gA.Position = UDim2.fromScale(0.5, 0.5) gA.Size = UDim2.fromOffset(420, 220) gA.BackgroundTransparency = 1 gA.ZIndex = 51 gA.Parent = gz
local gB = Instance.new('UIScale') gB.Scale = 0.7 gB.Parent = gA ge(gB, 0.7,{Scale = 1}, Enum.EasingStyle.Back)
local gC = gh(gA, 'LUKZ', 84, Enum.Font.GothamBlack, Color3.new(1, 1, 1), 0, 10, 420, 96, Enum.TextXAlignment.Center) gC.TextTruncate = Enum.TextTruncate.None gC.TextTransparency = 1 gC.ZIndex = 52
local gD = Instance.new('UIGradient') gD.Color = ColorSequence.new(Color3.new(1, 1, 1), ga) gD.Rotation = 90 gD.Parent = gC
local gE = gh(gA, 'W E L C O M E   \183   V 2', 17, Enum.Font.GothamBold, ga, 0, 112, 420, 24, Enum.TextXAlignment.Center) gE.TextTransparency = 1 gE.ZIndex = 52
local gF = gh(gA, f7.DisplayName, 24, Enum.Font.GothamBlack, gc, 0, 140, 420, 30, Enum.TextXAlignment.Center) gF.TextTransparency = 1 gF.ZIndex = 52
local gG = Instance.new('Frame') gG.AnchorPoint = Vector2.new(0.5, 0) gG.Position = UDim2.new(0.5, 0, 0, 190) gG.Size = UDim2.fromOffset(280, 6) gG.BackgroundColor3 = Color3.fromRGB(20,
36, 70) gG.BorderSizePixel = 0 gG.ZIndex = 52 gG.Parent = gA gf(gG, 3)
local gH = Instance.new('Frame') gH.Size = UDim2.new(0, 0, 1, 0) gH.BackgroundColor3 = ga gH.BorderSizePixel = 0 gH.ZIndex = 53 gH.Parent = gG gf(gH, 3) ge(gC,
0.5,{TextTransparency = 0}) task.wait(0.3) ge(gE, 0.4,{TextTransparency = 0}) task.wait(0.15) ge(gF, 0.4,{TextTransparency = 0}) ge(gH, 1.3,{Size = UDim2.new(1,
0, 1, 0)}, Enum.EasingStyle.Sine) task.wait(1.45) ge(gB, 0.4,{Scale = 1.25}) ge(gz, 0.4,{BackgroundTransparency = 1}) ge(gC, 0.3,{TextTransparency = 1}) ge(gE,
0.3,{TextTransparency = 1}) ge(gF, 0.3,{TextTransparency = 1}) ge(gH, 0.3,{BackgroundTransparency = 1}) ge(gG, 0.3,{BackgroundTransparency = 1}) task.wait(0.35) gz:Destroy() gt.Visible = not(gy and gy.Enabled) ge(gx,
0.55,{Scale = 1}, Enum.EasingStyle.Back) ge(gt, 0.4,{BackgroundTransparency = 0})
end
)
local gz = Instance.new('Frame') gz.Size = UDim2.new(1, 0, 0, gm) gz.BackgroundTransparency = 1 gz.Active = true gz.Parent = gt
local gA = Instance.new('Frame') gA.Position = UDim2.fromOffset(14, 13) gA.Size = UDim2.fromOffset(52, 52) gA.BackgroundColor3 = Color3.fromRGB(8, 16, 36) gA.BorderSizePixel = 0 gA.Parent = gz gf(gA,
14)
local gB = Instance.new('UIGradient') gB.Color = ColorSequence.new(ga, gb) gB.Rotation = 45 gB.Parent = gA
local gC = Instance.new('TextLabel') gC.Size = UDim2.fromScale(1, 1) gC.BackgroundTransparency = 1 gC.Text = 'L' gC.Font = Enum.Font.GothamBlack gC.TextSize = 30 gC.TextColor3 = Color3.new(1,
1, 1) gC.Parent = gA gg(gA, ga, 1.5, 0.2)
local gD = Instance.new('ImageLabel') gD.Size = UDim2.new(1, - 6, 1, - 6) gD.Position = UDim2.fromOffset(3, 3) gD.BackgroundTransparency = 1 gD.Image = 'rbxassetid://128961717706452' gD.ScaleType = Enum.ScaleType.Fit gD.ZIndex = 3 gD.Parent = gA gf(gD,
12) task.spawn(
function() pcall(
function()
local gE = [[https://cdn.phototourl.com/member/2026-10-12-9e9dda25-3078-41e9-9057-961af63ec1f3.png]]
local gF =(syn and syn.request) or http_request or request
local gG = writefile or(syn and syn.writefile)
local gH = getcustomasset or(getgenv and getgenv().getcustomasset)
if type(gH) ~= 'function' then
    return
end
local gI = 'LukzLibrary/logo.png'
local gJ = false pcall(
function() gJ = typeof(isfile) == 'function' and isfile(gI)
end
)
if not gJ then
    if type(gF) ~= 'function' or type(gG) ~= 'function' then
        return
    end
    pcall(
    function()
    if typeof(isfolder) == 'function' and typeof(makefolder) == 'function' and not isfolder('LukzLibrary') then
        makefolder('LukzLibrary')
    end
end
)
local gK, gL = pcall(gF,{Url = gE, Method = 'GET'})
if not gK or type(gL) ~= 'table' then
    return
end
local gM = gL.Body or gL.body
if type(gM) ~= 'string' or # gM < 100 then
    return
end
pcall(gG, gI, gM)
end
local gK, gL = pcall(gH, gI)
if gK and type(gL) == 'string' and gL ~= '' and gD.Parent then
    gD.Image = gL
end
end
) task.wait(2)
if gD.Parent and gD.IsLoaded then
    gC.Visible = false
end
end
)
local gE = gh(gz, 'LUKZ SCRIPT', 21, Enum.Font.GothamBlack, gc, 78, 14, 150, 28) gE.TextTruncate = Enum.TextTruncate.None
local gF = Instance.new('UIGradient') gF.Color = ColorSequence.new(Color3.new(1, 1, 1), ga) gF.Parent = gE gh(gz, 'STEAL AN EGG', 11, Enum.Font.GothamBold,
gd, 80, 46, 160, 14)
local gG = Instance.new('TextLabel') gG.Position = UDim2.fromOffset(234, 17) gG.Size = UDim2.fromOffset(34, 20) gG.BackgroundColor3 = f9 gG.Text = 'V2' gG.Font = Enum.Font.GothamBlack gG.TextSize = 13 gG.TextColor3 = Color3.new(1,
1, 1) gG.Parent = gz gf(gG, 7) gg(gG, ga, 1, 0.4)
local function gH(gI, gJ)
local gK = Instance.new('TextButton') gK.Size = UDim2.fromOffset(30, 30) gK.Position = UDim2.new(1, gJ, 0, 24) gK.BackgroundColor3 = Color3.fromRGB(14,
32, 70) gK.Text = gI gK.TextColor3 = gc gK.Font = Enum.Font.GothamBlack gK.TextSize = 18 gK.AutoButtonColor = false gK.Parent = gz gf(gK, 9) gg(gK, f9,
1, 0.5) gK.MouseEnter:Connect(
function() ge(gK, 0.15,{BackgroundColor3 = f9})
end
) gK.MouseLeave:Connect(
function() ge(gK, 0.15,{BackgroundColor3 = Color3.fromRGB(14, 32, 70)})
end
)
return gK
end
local gI = gH('-', - 78)
local gJ = gH('X', - 42) gJ.TextSize = 14
local gK = Instance.new('Frame') gK.Position = UDim2.fromOffset(14, gm - 1) gK.Size = UDim2.new(1, - 28, 0, 1) gK.BackgroundColor3 = f9 gK.BackgroundTransparency = 0.55 gK.BorderSizePixel = 0 gK.Parent = gt do
    local gL, gM, gN gz.InputBegan:Connect(
    function(gO)
    if gO.UserInputType == Enum.UserInputType.MouseButton1 or gO.UserInputType == Enum.UserInputType.Touch then
        gL, gM, gN = true, gO.Position, gt.Position gO.Changed:Connect(
        function()
        if gO.UserInputState == Enum.UserInputState.End then
            gL = false
        end
    end
    )
end
end
) f5.InputChanged:Connect(
function(gO)
if gL and(gO.UserInputType == Enum.UserInputType.MouseMovement or gO.UserInputType == Enum.UserInputType.Touch) then
    local gP =(gO.Position - gM) / gk.Scale gt.Position = UDim2.new(gN.X.Scale, gN.X.Offset + gP.X, gN.Y.Scale, gN.Y.Offset + gP.Y)
end
end
)
end
local gL = Instance.new('Frame') gL.Position = UDim2.fromOffset(0, gm) gL.Size = UDim2.new(1, 0, 0, gp) gL.BackgroundTransparency = 1 gL.Parent = gt
local function gM(gN, gO, gP, gQ)
local gR = Instance.new('TextButton') gR.Position = UDim2.fromOffset(gO, 12) gR.Size = UDim2.fromOffset(gP, 52) gR.BackgroundTransparency = 1 gR.Text = '' gR.AutoButtonColor = false gR.BorderSizePixel = 0 gR.Parent = gL
local gS = Instance.new('Frame') gS.Size = UDim2.fromScale(1, 1) gS.BackgroundColor3 = gQ or Color3.new(1, 1, 1) gS.BorderSizePixel = 0 gS.Parent = gR gf(gS,
14)
local gT
if not gQ then
    gT = Instance.new('UIGradient') gT.Color = ColorSequence.new(ga, gb) gT.Rotation = 20 gT.Parent = gS
end
local gU = gg(gS, ga, 1.6, 0.15)
local gV = Instance.new('TextLabel') gV.Size = UDim2.fromScale(1, 1) gV.BackgroundTransparency = 1 gV.Text = gN gV.Font = Enum.Font.GothamBlack gV.TextSize = 24 gV.TextColor3 = Color3.new(1,
1, 1) gV.ZIndex = 5 gV.Parent = gR
return gR, gU, gS, gV, gT
end
local gN, gO, gP, gQ, gR = gM('AUTO STEAL', 14, 210) gQ.TextSize = 21 gQ.Size = UDim2.new(1, 0, 0, 30) gQ.Position = UDim2.fromOffset(0, 5)
local gS = Instance.new('TextLabel') gS.BackgroundTransparency = 1 gS.Size = UDim2.new(1, 0, 0, 14) gS.Position = UDim2.fromOffset(0, 33) gS.Text = 'V2' gS.Font = Enum.Font.GothamBlack gS.TextSize = 12 gS.TextColor3 = Color3.new(1,
1, 1) gS.TextStrokeTransparency = 0.6 gS.TextStrokeColor3 = Color3.fromRGB(4, 20, 60) gS.ZIndex = 5 gS.Parent = gN
local gT = Instance.new('Frame') gT.Size = UDim2.fromScale(1, 1) gT.BackgroundTransparency = 1 gT.ZIndex = 4 gT.Parent = gN
local gU = Instance.new('Frame') gU.Size = UDim2.fromScale(1, 1) gU.BackgroundColor3 = Color3.new(1, 1, 1) gU.BorderSizePixel = 0 gU.ZIndex = 4 gU.Parent = gT gf(gU,
14)
local gV = Instance.new('UIGradient') gV.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(0.5,
0.55), NumberSequenceKeypoint.new(0.6, 1), NumberSequenceKeypoint.new(1, 1)}) gV.Rotation = 20 gV.Offset = Vector2.new(- 1, 0) gV.Parent = gU task.spawn(
function()
while gT.Parent do
    gV.Offset = Vector2.new(- 1, 0) ge(gV, 0.9,{Offset = Vector2.new(1, 0)}, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) task.wait(3.2)
end
end
)
local gW, gX, gY, gZ = gM('STOP', 232, gl - 28 - 210 - 8, Color3.fromRGB(10, 22, 50)) gZ.TextColor3 = Color3.fromRGB(150, 185, 235) gZ.TextSize = 18 gX.Color = f9 gX.Transparency = 0.45
for g_, g0 in ipairs({gN, gW}) do
    local g1 = Instance.new('UIScale') g1.Parent = g0 g0.MouseButton1Down:Connect(
    function() ge(g1, 0.08,{Scale = 0.95})
end
) g0.MouseButton1Up:Connect(
function() ge(g1, 0.15,{Scale = 1}, Enum.EasingStyle.Back)
end
) g0.MouseLeave:Connect(
function() ge(g1, 0.15,{Scale = 1})
end
)
end
local g1 = gh(gL, 'STOPPED', 11, Enum.Font.GothamBold, gd, 14, 190, gl - 28, 16, Enum.TextXAlignment.Center)
local function g2()
return(type(aB) == 'table' and aB.AutoSteal == true) or(bP ~= nil and bP.enabled == true)
end
local function g3(g4) g4 = g4 == true pcall(
function()
if type(aB) == 'table' then
    aB.AutoSteal = g4 aB.StealMode = 'Instant' aB.StealPriority = 'Highest Value'
end
if bP then
    if type(bP.setHighestValueFirst) == 'function' then
        bP:setHighestValueFirst(true)
    end
    if type(bP.setHeaviestFirst) == 'function' then
        bP:setHeaviestFirst(false)
    end
    if type(bP.setStealMode) == 'function' then
        pcall(
        function() bP:setStealMode('Instant')
    end
    )
end
end
if type(b3) == 'table' and type(b3.setStealMode) == 'function' then
    pcall(
    function() b3.setStealMode('Instant Steal (Recommended)')
end
)
end
if e7 then
    if e7.stealMode and type(e7.stealMode.Set) == 'function' then
        pcall(
        function() e7.stealMode:Set('Instant Steal (Recommended)')
    end
    )
end
if e7.priority and type(e7.priority.Set) == 'function' then
    pcall(
    function() e7.priority:Set('Highest Value')
end
)
end
if e7.autoSteal and type(e7.autoSteal.Set) == 'function' then
    pcall(
    function() e7.autoSteal:Set(g4)
end
)
end
end
if bP and type(bP.setEnabled) == 'function' then
    pcall(
    function() bP:setEnabled(g4)
end
)
end
local g5 =(getgenv and getgenv()) or _G
if type(g5.__SenaV4SetAutoSteal) == 'function' then
    pcall(g5.__SenaV4SetAutoSteal, g4)
end
end
) g1.Text = g4 and 'RUNNING' or 'STOPPED' g1.TextColor3 = g4 and ga or gd
end
local function g4() pcall(
function()
if type(aB) == 'table' then
    aB.AutoSteal = false
end
if e7 and e7.autoSteal and type(e7.autoSteal.Set) == 'function' then
    pcall(
    function() e7.autoSteal:Set(false)
end
)
end
if bP and type(bP.setEnabled) == 'function' then
    pcall(
    function() bP:setEnabled(false)
end
)
end
local g5 =(getgenv and getgenv()) or _G
if type(g5.__SenaV4SetAutoSteal) == 'function' then
    pcall(g5.__SenaV4SetAutoSteal, false)
end
end
)
end
local function g5(g6) task.spawn(
function() pcall(
function()
if not bP or type(bP.queueManual) ~= 'function' then
    return
end
if type(bP.manualPending) == 'function' and bP:manualPending() > 0 and type(bP.clearManual) == 'function' then
    bP:clearManual()
end
if type(g6) ~= 'string' then
    return
end
bP:queueManual({g6})
local g7 = bP.carry and bP.carry.active
local g8 = bP.activeTarget
local g9 = type(g8) == 'table' and g8.Uid or nil
if g9 ~= nil and g9 == bP.primerUid then
    g9 = bP.targetUid
end
if bP.enabled and not g7 and bP._instantReturnToken == nil and g9 and g9 ~= g6 and type(bP._finish) == 'function' then
    bP:_finish('Retarget')
end
end
)
end
)
end
local g6, g7, g8 = Color3.fromRGB(11, 24, 52), Color3.fromRGB(14, 44, 98), Color3.fromRGB(17, 38, 80)
local function g9(ha, hb)
if ha.sel == hb and ha.painted then
    return
end
ha.sel = hb ha.painted = true ge(ha.btn, 0.18,{BackgroundColor3 = hb and g7 or g6}) ge(ha.stroke, 0.18,{Transparency = hb and 0.05 or 0.75})
end
local ha
local hb, hc, hd, he = false
local function hf() pcall(
function()
if bP and type(bP.clearManual) == 'function' and type(bP.manualPending) == 'function' and bP:manualPending() > 0 then
    bP:clearManual()
end
end
)
end
local function hg(hh) pcall(
function()
if bP and type(bP.skippedEggs) == 'table' then
    bP.skippedEggs[hh] = nil
end
end
) g3(true) task.delay(0.4,
function() g5(hh)
end
)
end
gN.MouseButton1Click:Connect(
function()
if hb then
    return
end
local hh = rawget(_G, '__LUKZ_BestUid')
if type(hh) ~= 'string' then
    g1.Text = 'NO EGGS RIGHT NOW' g1.TextColor3 = gd
    return
end
hb = true g1.Text = 'STARTING...' g1.TextColor3 = ga
local hi = rawget(_G, '__LUKZ_HW')
local hj = game:GetService('Players').LocalPlayer
local hk = false pcall(
function() hk = hj:GetAttribute('InHalloweenDimension') == true or hj:GetAttribute('HalloweenCarrying') == true
end
)
if hi and type(hi.exitDimension) == 'function' and hk then
    g1.Text = 'LEAVING THE DIMENSION...'
    if he then
        pcall(he, 'Leaving the dimension')
    end
    task.spawn(
    function()
    local hl = false pcall(
    function() hl = hi.exitDimension(
    function(hm)
    if he then
        pcall(he, hm)
    end
end
)
end
)
local hm = false pcall(
function() hm = hj:GetAttribute('InHalloweenDimension') == true
end
)
if not hl and hm then
    g1.Text = 'COULD NOT LEAVE THE DIMENSION' g1.TextColor3 = gd
    if hd then
        pcall(hd)
    end
    hb = false
    return
end
if not hb then
    return
end
local hn = rawget(_G, '__LUKZ_BestUid')
if type(hn) ~= 'string' then
    hn = hh
end
g1.Text = 'STARTING...'
if hc then
    pcall(hc, hn)
end
hg(hn)
end
)
return
end
if hc then
    pcall(hc, hh)
end
hg(hh)
end
) gW.MouseButton1Click:Connect(
function() hf() g3(false)
if hd then
    pcall(hd)
end
hb = false
end
)
local hh = gh(gL, 'BEST EGG  \183  TOP 1', 10, Enum.Font.GothamBlack, ga, 16, 72, 200, 14) hh.TextTransparency = 0.1
local hi, hj ={},{}
for hk = 1, 1 do
    local hl = Instance.new('Frame') hl.Size = UDim2.new(1, - 28, 0, 52) hl.Position = UDim2.fromOffset(14, 92 +(hk - 1) * 58) hl.BackgroundColor3 = Color3.fromRGB(11,
    24, 52) hl.BorderSizePixel = 0 hl.Parent = gL gf(hl, 12)
    local hm = gg(hl, f9, 1, 0.75)
    local hn = Instance.new('UIScale') hn.Parent = hl
    local ho = gh(hl, '#'..tostring(hk), 11, Enum.Font.GothamBlack, ga, 4, 0, 22, 52, Enum.TextXAlignment.Center)
    local hp = Instance.new('ImageLabel') hp.Size = UDim2.fromOffset(40, 40) hp.Position = UDim2.fromOffset(28, 6) hp.BackgroundColor3 = Color3.fromRGB(8, 18,
    40) hp.BorderSizePixel = 0 hp.ScaleType = Enum.ScaleType.Fit hp.Parent = hl gf(hp, 10)
    local hq = gh(hl, '-', 13, Enum.Font.GothamBold, gc, 74, 8, 150, 18)
    local hr = gh(hl, '', 10.5, Enum.Font.Gotham, gd, 74, 28, 150, 16)
    local hs = gh(hl, '-', 14, Enum.Font.GothamBlack, ga, 200, 0, 150, 52, Enum.TextXAlignment.Right) hs.Size = UDim2.new(0, 142, 1, 0) hs.Position = UDim2.new(1,
    - 150, 0, 0) hi[hk] ={btn = hl, icon = hp, name = hq, sub = hr, val = hs, stroke = hm, rank = ho}
end
ha =
function()
local hk = rawget(_G, '__LUKZ_PickUid')
for hl = 1, 1 do
    local hm, hn = hj[hl], hi[hl]
    local ho = hm and hk and hm.Uid == hk
    local hp = hm and not hk and hl == 1 g9(hn,(ho or hp) and true or false)
    if hn.baseSub then
        hn.sub.Text = hn.baseSub..(ho and ' \183 SELECTED' or(hp and ' \183 TARGET' or ''))
    end
end
end
local hk = Instance.new('Frame') hk.AnchorPoint = Vector2.new(0.5, 0) hk.Position = UDim2.new(0.5, 0, 0, 150) hk.Size = UDim2.fromOffset(gl - 28, 32) hk.BackgroundColor3 = Color3.fromRGB(10,
26, 60) hk.BorderSizePixel = 0 hk.Parent = gL gf(hk, 16) gg(hk, ga, 1.2, 0.35)
local hl = gh(hk, 'EGG ARRIVES IN 5 - 10 SECONDS', 15, Enum.Font.GothamBlack, gc, 0, 0, gl - 28, 32, Enum.TextXAlignment.Center) hl.TextTruncate = Enum.TextTruncate.None
local hm ={egg = false, monster = false, pumpkin = false, rod = false, ticket = false, fish = false, train = false, status = '', finishEgg = false, exiting = false,
paint ={}} rawset(_G, '__LUKZ_HW', hm) do
    local hn = Color3.fromRGB(255, 140, 36)
    local ho = Color3.fromRGB(255, 196, 92)
    local hp = Color3.fromRGB(34, 16, 60)
    local function hq(hr, hs) pcall(
    function() hr.FontFace = Font.new('rbxasset://fonts/families/Montserrat.json', hs or Enum.FontWeight.SemiBold)
end
)
return hr
end
local function hr(hs) pcall(
function() hs.Font = Enum.Font.Creepster
end
)
return hs
end
local function hs(ht, hu, hv, hw)
local hx = Instance.new('Frame') hx.BackgroundTransparency = 1 hx.Position = UDim2.fromOffset(hu, hv) hx.Size = UDim2.fromOffset(hw, hw) hx.Parent = ht
local function hy(hz, hA, hB, hC, hD, hE, hF)
local hG = Instance.new('Frame') hG.Position = UDim2.fromOffset(hz, hA) hG.Size = UDim2.fromOffset(hB, hC) hG.BackgroundColor3 = hD hG.BorderSizePixel = 0 hG.ZIndex = hE or 2 hG.Parent = hx
local hH = Instance.new('UICorner') hH.CornerRadius = hF or UDim.new(0.5, 0) hH.Parent = hG
return hG
end
local function hz(hA, hB, hC, hD)
local hE = Instance.new('UIGradient') hE.Color = ColorSequence.new(hB, hC) hE.Rotation = hD or 90 hE.Parent = hA
end
local hA = hy(- math.floor(hw * 0.12), math.floor(hw * 0.1), math.floor(hw * 1.24), math.floor(hw * 0.98), Color3.fromRGB(255, 120, 20), 1) hA.BackgroundTransparency = 0.82
local hB = math.floor(hw * 0.74)
local hC = hw - hB
local hD = hw
local hE ={{0, 0.4, Color3.fromRGB(196, 78, 10), Color3.fromRGB(120, 40, 4)},{0.6, 0.4, Color3.fromRGB(196, 78, 10), Color3.fromRGB(120, 40, 4)},{0.12,
0.4, Color3.fromRGB(236, 112, 22), Color3.fromRGB(160, 58, 6)},{0.48, 0.4, Color3.fromRGB(236, 112, 22), Color3.fromRGB(160, 58, 6)},{0.28, 0.44, Color3.fromRGB(255,
150, 46), Color3.fromRGB(190, 76, 8)}}
for hF, hG in ipairs(hE) do
    local hH = hy(math.floor(hD * hG[1]), hC, math.floor(hD * hG[2]), hB, hG[3], 2 + hF) hz(hH, hG[3], hG[4], 90)
    local hI = Instance.new('UIStroke') hI.Color = Color3.fromRGB(90, 30, 2) hI.Transparency = 0.55 hI.Thickness = 1 hI.Parent = hH
end
local hH = hy(math.floor(hD * 0.17), hC + math.floor(hB * 0.12), math.max(2, math.floor(hD * 0.08)), math.floor(hB * 0.3), Color3.fromRGB(255, 220, 160),
9) hH.BackgroundTransparency = 0.55
local hI = hy(math.floor(hD * 0.45), math.floor(hw * 0.02), math.max(3, math.floor(hD * 0.12)), math.floor(hw * 0.3), Color3.fromRGB(96, 120, 46), 10, UDim.new(0,
2)) hz(hI, Color3.fromRGB(140, 160, 70), Color3.fromRGB(70, 84, 30), 0) hI.Rotation = 10
local hJ = hy(math.floor(hD * 0.5), 0, math.max(3, math.floor(hD * 0.16)), math.max(2, math.floor(hw * 0.08)), Color3.fromRGB(80, 100, 36), 10, UDim.new(0,
2)) hJ.Rotation = - 25
local hK = hy(math.floor(hD * 0.58), math.floor(hw * 0.1), math.floor(hD * 0.24), math.max(3, math.floor(hw * 0.12)), Color3.fromRGB(104, 176, 64), 10) hK.Rotation = - 20
local hL = Color3.fromRGB(255, 214, 90)
local hM = math.max(3, math.floor(hD * 0.15))
local hN = hy(math.floor(hD * 0.27), hC + math.floor(hB * 0.26), hM, hM, hL, 11, UDim.new(0, 1)) hN.Rotation = 45
local hO = hy(math.floor(hD * 0.58), hC + math.floor(hB * 0.26), hM, hM, hL, 11, UDim.new(0, 1)) hO.Rotation = 45
local hP = hy(math.floor(hD * 0.26), hC + math.floor(hB * 0.6), math.floor(hD * 0.48), math.max(3, math.floor(hB * 0.14)), hL, 11, UDim.new(0.5, 0)) hz(hP,
Color3.fromRGB(255, 240, 150), Color3.fromRGB(255, 160, 40), 90) hy(math.floor(hD * 0.38), hC + math.floor(hB * 0.6), math.max(2, math.floor(hD * 0.07)),
math.max(2, math.floor(hB * 0.07)), Color3.fromRGB(196, 78, 10), 12, UDim.new(0, 0)) hy(math.floor(hD * 0.55), hC + math.floor(hB * 0.66), math.max(2, math.floor(hD * 0.07)),
math.max(2, math.floor(hB * 0.08)), Color3.fromRGB(196, 78, 10), 12, UDim.new(0, 0))
return hx
end
local ht = Instance.new('TextButton') ht.Size = UDim2.new(1, - 28, 0, 48) ht.Position = UDim2.fromOffset(14, 224) ht.BackgroundColor3 = Color3.new(1, 1,
1) ht.AutoButtonColor = false ht.Text = '' ht.Parent = gL gf(ht, 14)
local hu = Instance.new('UIGradient') hu.Color = ColorSequence.new(hp, Color3.fromRGB(14, 30, 70)) hu.Rotation = 0 hu.Parent = ht
local hv = gg(ht, hn, 1.4, 0.35) hs(ht, 10, 6, 36)
local hw = hr(gh(ht, 'HALLOWEEN EVENT', 22, Enum.Font.GothamBlack, hn, 56, 4, 210, 24))
local hx = Instance.new('UIGradient') hx.Color = ColorSequence.new(ho, hn) hx.Rotation = 90 hx.Parent = hw hq(gh(ht, '7 auto options  \183  dimension \183 quest \183 extras',
10, Enum.Font.GothamMedium, gd, 56, 28, 240, 14), Enum.FontWeight.Medium)
local hy = hq(gh(ht, '', 11, Enum.Font.GothamBlack, hn, 0, 0, 60, 48, Enum.TextXAlignment.Right), Enum.FontWeight.Bold) hy.AnchorPoint = Vector2.new(1,
0) hy.Position = UDim2.new(1, - 40, 0, 0)
local hz = gh(ht, '\u{25b6}', 14, Enum.Font.GothamBlack, hn, 0, 0, 24, 48, Enum.TextXAlignment.Center) hz.AnchorPoint = Vector2.new(1, 0) hz.Position = UDim2.new(1,
- 12, 0, 0)
local hA = 404
local hB = Instance.new('Frame') hB.BackgroundTransparency = 1 hB.Position = UDim2.fromOffset(0, 298) hB.Size = UDim2.new(1, 0, 0, 0) hB.ClipsDescendants = true hB.Parent = gL
local function hC(hD, hE)
local hF = hq(gh(hB, hE, 10, Enum.Font.GothamBlack, hn, 18, hD, 200, 14), Enum.FontWeight.Bold) hF.TextTransparency = 0.05
local hG = Instance.new('Frame') hG.Position = UDim2.fromOffset(18 + math.floor(# hE * 7.2) + 8, hD + 7) hG.Size = UDim2.new(1, -(18 + math.floor(# hE * 7.2) + 8) - 16,
0, 1) hG.BackgroundColor3 = hn hG.BackgroundTransparency = 0.7 hG.BorderSizePixel = 0 hG.Parent = hB
end
local hD = false pcall(
function()
if isfile and isfile('LukzLibrary/lukz_hw_open.txt') then
    hD = readfile('LukzLibrary/lukz_hw_open.txt') == '1'
end
end
)
local function hE(hF, hG) hD = hF gp = hF and go or gn gq = gm + gp
local hH = hG and 0.01 or 0.35 hz.Text = hF and '\u{25bc}' or '\u{25b6}' ge(hB, hH,{Size = UDim2.new(1, 0, 0, hF and hA or 0)}, Enum.EasingStyle.Quint) ge(gL,
hH,{Size = UDim2.new(1, 0, 0, gp)}, Enum.EasingStyle.Quint)
if gt.Size.Y.Offset > gm + 2 then
    ge(gt, hH,{Size = UDim2.fromOffset(gl, gq)}, Enum.EasingStyle.Quint)
end
ge(hv, 0.2,{Transparency = hF and 0.05 or 0.35}) pcall(
function()
if writefile then
    if makefolder and isfolder and not isfolder('LukzLibrary') then
        makefolder('LukzLibrary')
    end
    writefile('LukzLibrary/lukz_hw_open.txt', hF and '1' or '0')
end
end
)
end
ht.MouseButton1Click:Connect(
function() hE(not hD)
end
) task.defer(
function() hE(hD, true)
end
)
local function hF(hG, hH, hI, hJ)
local hK = Instance.new('TextButton') hK.Size = UDim2.new(1, - 28, 0, 44) hK.Position = UDim2.fromOffset(14, hG) hK.BackgroundColor3 = Color3.fromRGB(16,
18, 42) hK.AutoButtonColor = false hK.Text = '' hK.Parent = hB gf(hK, 12)
local hL = gg(hK, hn, 1, 0.8)
local hM = Instance.new('Frame') hM.Position = UDim2.fromOffset(0, 9) hM.Size = UDim2.fromOffset(3, 26) hM.BackgroundColor3 = hn hM.BackgroundTransparency = 0.75 hM.BorderSizePixel = 0 hM.Parent = hK gf(hM,
2) hq(gh(hK, hH, 13, Enum.Font.GothamBold, gc, 16, 5, 230, 18), Enum.FontWeight.SemiBold) hq(gh(hK, hJ or '', 10, Enum.Font.GothamMedium, gd, 16, 23, 240,
14), Enum.FontWeight.Regular)
local hN = Instance.new('Frame') hN.AnchorPoint = Vector2.new(1, 0.5) hN.Position = UDim2.new(1, - 12, 0.5, 0) hN.Size = UDim2.fromOffset(44, 22) hN.BackgroundColor3 = Color3.fromRGB(34,
32, 60) hN.BorderSizePixel = 0 hN.Parent = hK gf(hN, 11)
local hO = Instance.new('Frame') hO.AnchorPoint = Vector2.new(0, 0.5) hO.Position = UDim2.new(0, 3, 0.5, 0) hO.Size = UDim2.fromOffset(16, 16) hO.BackgroundColor3 = Color3.new(1,
1, 1) hO.BorderSizePixel = 0 hO.Parent = hN gf(hO, 8)
local function hP()
local hQ = hm[hI] ge(hN, 0.2,{BackgroundColor3 = hQ and hn or Color3.fromRGB(34, 32, 60)}) ge(hO, 0.25,{Position = hQ and UDim2.new(1, - 19, 0.5, 0) or UDim2.new(0,
3, 0.5, 0)}, Enum.EasingStyle.Back) ge(hK, 0.2,{BackgroundColor3 = hQ and Color3.fromRGB(48, 26, 30) or Color3.fromRGB(16, 18, 42)}) ge(hL, 0.2,{Transparency = hQ and 0.15 or 0.8}) ge(hM,
0.2,{BackgroundTransparency = hQ and 0 or 0.75})
end
hK.MouseButton1Click:Connect(
function()
if hm.exiting then
    return
end
hm[hI] = not hm[hI]
if hI == 'egg' and not hm.egg and game:GetService('Players').LocalPlayer:GetAttribute('HalloweenCarrying') == true then
    hm.finishEgg = true
end
hP()
end
) hm.paint[hI] = hP hP()
end
hC(2, 'DIMENSION') hF(20, 'Auto Egg Halloween', 'egg', 'steals Halloween eggs and delivers them') hF(68, 'Auto Monster', 'monster', 'hits the monsters with your bat') hF(116,
'Return Pumpkins', 'pumpkin', 'catches pumpkins and returns them') hC(168, 'ECHO QUEST') hF(186, 'Auto Fishing Rod', 'rod', "Echo's 4 memories  \u{2192}  Haunted Rod") hF(234,
'Auto Ticket (Train Pass)', 'ticket', 'fish chase  \u{2192}  Train Pass chest') hC(286, 'EXTRAS') hF(304, 'Auto Fishing (Perfect)', 'fish', 'perfect cast at the pier, reels in') hF(352,
'Auto Phantom Express', 'train', 'boards the train and vacuums ghosts')
local hG = gh(gL, '', 10, Enum.Font.GothamMedium, gd, 14, 277, gl - 28, 16, Enum.TextXAlignment.Center) task.spawn(
function()
while gi.Parent do
    local hH = hm.egg or hm.monster or hm.pumpkin or hm.rod or hm.ticket or hm.fish or hm.train hG.Text = hH and('Halloween: '..tostring(hm.status)) or(hD and '' or 'tap HALLOWEEN EVENT to see the options')
    local hI = 0
    for hJ, hK in ipairs({'egg', 'monster', 'pumpkin', 'rod', 'ticket', 'fish', 'train'}) do
        if hm[hK] then
            hI = hI + 1
        end
    end
    hy.Text = hI > 0 and(hI..' ON') or '' task.wait(0.25)
end
end
)
end
task.spawn(
function()
local hn = game:GetService('Players')
local ho = game:GetService('RunService')
local hp = hn.LocalPlayer
local hq = 260
local hr = Vector3.new(- 5809, - 203, - 7375)
local hs = Vector3.new(- 5516, - 196, - 6646)
local function ht(hu) hm.status = hu
end
local function hu()
local hv = hp.Character
local hw = hv and hv:FindFirstChild('HumanoidRootPart')
local hx = hv and hv:FindFirstChildOfClass('Humanoid')
if hw and hx and hx.Health > 0 then
    return hv, hw, hx
end
return nil
end
local function hv()
return hm.egg or hm.monster or hm.pumpkin or hm.rod or hm.ticket or hm.fish or hm.train or hm.finishEgg or hm.exiting
end
local function hw()
return bP ~= nil and(bP.enabled == true or(type(bP.carry) == 'table' and bP.carry.active == true))
end
local function hx()
local hy, hz = pcall(
function()
return workspace:FindFirstChild('HalloweenDimension')
end
)
return hy and hz or nil
end
local function hy()
return hp:GetAttribute('InHalloweenDimension') == true
end
local hz ={}
local function hA(hB)
local hC = hp.Character
if not hC then
    return
end
if hB then
    for hD, hE in ipairs(hC:GetDescendants()) do
        if hE:IsA('BasePart') and hE.CanCollide then
            hz[hE] = true hE.CanCollide = false
        end
    end
    else
    for hD in pairs(hz) do
        if hD.Parent then
            hD.CanCollide = true
        end
    end
    table.clear(hz)
end
end
local hB = hq
local function hC(hD, hE, hF, hG) hG = hG or hq
local hH, hI = hu()
if not hI then
    return false
end
hF = hF or 25
local hJ = os.clock() hA(true)
local hK = false
while os.clock() - hJ < hF do
    if not hv() or(hE and hE()) then
        break
    end
    local hL, hM = hu()
    if not hM then
        break
    end
    local hN = hD - hM.Position
    local hO = hN.Magnitude
    if hO < 3 then
        hK = true
        break
    end
    local hP = ho.Heartbeat:Wait()
    local hQ = math.min(hG * math.min(hP, 0.05), hO)
    local hR = hM.Position + hN.Unit * hQ
    local hS = Vector3.new(hN.X, 0, hN.Z) pcall(
    function() hM.CFrame =(hS.Magnitude > 0.1) and CFrame.lookAt(hR, hR + hS) or CFrame.new(hR) hM.AssemblyLinearVelocity = Vector3.zero
end
)
end
hA(false)
return hK
end
local function hD(hE)
if not hE or not hE.Parent then
    return
end
local hF = false pcall(
function()
if fireproximityprompt then
    fireproximityprompt(hE) hF = true
end
end
)
if hF then
    return
end
pcall(
function() hE:InputHoldBegin() task.wait((hE.HoldDuration or 0) + 0.08) hE:InputHoldEnd()
end
)
end
local function hE(hF)
local hG = hF and hF.Parent
while hG and not hG:IsA('BasePart') and not hG:IsA('Attachment') do
    hG = hG.Parent
end
if not hG then
    return nil
end
return hG:IsA('Attachment') and hG.WorldPosition or hG.Position
end
local function hF()
local hG pcall(
function()
local hH = workspace:FindFirstChild('World') hG = hH and hH:FindFirstChild('HalloweenDimensionPortal')
end
)
if not hG then
    ht('portal not found')
    return false
end
ht('going to the portal')
local hH, hI = pcall(
function()
return hG:GetPivot().Position
end
)
if not hH then
    return false
end
hC(hI + Vector3.new(0, 3, 0), hy, 20)
local hJ = os.clock()
while not hy() and os.clock() - hJ < 6 and hv() do
    local hK, hL = hu()
    if hL then
        pcall(
        function() hL.CFrame = CFrame.new(hI + Vector3.new(math.sin(os.clock() * 6) * 2, 3, 0))
    end
    )
end
task.wait(0.1)
end
if hy() then
    ht('inside the dimension') task.wait(1.2)
end
return hy()
end
local function hG()
local hH = hx()
local hI = hH and hH:FindFirstChild('WorldEggs')
local hJ, hK = hu()
if not hI or not hK then
    return nil
end
local hL, hM
for hN, hO in ipairs(hI:GetDescendants()) do
    if hO:IsA('ProximityPrompt') and hO.Name == 'StealPrompt' and hO.Enabled then
        local hP = hE(hO)
        if hP then
            local hQ =(hP - hK.Position).Magnitude
            if not hM or hQ < hM then
                hL, hM = hO, hQ
            end
        end
    end
end
return hL
end
local function hH()
local hI = hG()
if not hI then
    return false
end
local hK = hE(hI) ht('going to a Halloween egg') hC(hK + Vector3.new(0, 2, 0),
function()
return not hI.Parent or not hI.Enabled
end
, 20, hB)
if not hI.Parent or not hI.Enabled then
    return true
end
ht('stealing the egg') hD(hI)
local hL = os.clock()
while hp:GetAttribute('HalloweenCarrying') ~= true and os.clock() - hL < 2 do
    task.wait(0.05)
end
return true
end
local function hI() ht('taking the egg to the safe zone')
local hK = hp:GetAttribute('HalloweenDelivered') hC(hr,
function()
return hp:GetAttribute('HalloweenCarrying') ~= true
end
, 30, hB)
local hL = os.clock()
while hp:GetAttribute('HalloweenCarrying') == true and os.clock() - hL < 4 do
    task.wait(0.1)
end
if hp:GetAttribute('HalloweenDelivered') ~= hK then
    ht('egg delivered!')
end
end
local function hK()
local hL = hx()
local hM = hL and hL:FindFirstChild('RunawayPumpkins')
local hN, hO = hu()
if not hM or not hO then
    return nil
end
local hP, hQ
for hR, hS in ipairs(hM:GetDescendants()) do
    if hS:IsA('ProximityPrompt') and hS.Name == 'CatchPrompt' and hS.Enabled then
        local hT = hE(hS)
        if hT then
            local hU =(hT - hO.Position).Magnitude
            if not hQ or hU < hQ then
                hP, hQ = hS, hU
            end
        end
    end
end
return hP
end
local function hL()
local hM = hx()
if hM then
    for hO, hP in ipairs(hM:GetDescendants()) do
        if(hP:IsA('BasePart') or hP:IsA('Model')) and string.find(string.lower(hP.Name), 'deposit', 1, true) then
            local hQ, hR = pcall(
            function()
            return hP:IsA('Model') and hP:GetPivot().Position or hP.Position
        end
        )
        if hQ then
            return hR
        end
    end
end
end
local hO = hp:GetAttribute('HalloweenPumpkinDepositFrom')
if typeof(hO) == 'CFrame' then
    return hO.Position
end
return hs
end
local function hM()
local hO = hK()
if not hO then
    return false
end
ht('catching a pumpkin')
local hP = os.clock()
while hO.Parent and hO.Enabled and hp:GetAttribute('HalloweenPumpkinCarrying') ~= true and os.clock() - hP < 12 and hm.pumpkin do
    local hQ = hE(hO)
    if not hQ then
        break
    end
    local hR, hS = hu()
    if not hS then
        break
    end
    if(hQ - hS.Position).Magnitude > 6 then
        hC(hQ + Vector3.new(0, 2, 0),
        function()
        local hT = hE(hO)
        local hU, hV = hu()
        return not hT or not hV or(hT - hV.Position).Magnitude < 6
    end
    , 3, hB)
end
hD(hO) task.wait(0.15)
end
return true
end
local function hO() ht('returning the pumpkin') hC(hL() + Vector3.new(0, 2, 0),
function()
return hp:GetAttribute('HalloweenPumpkinCarrying') ~= true
end
, 25, hB)
local hP = os.clock()
while hp:GetAttribute('HalloweenPumpkinCarrying') == true and os.clock() - hP < 4 do
    task.wait(0.1)
end
end
local function hP()
local hQ, hR, hS = hu()
if not hQ then
    return nil
end
for hT, hU in ipairs(hQ:GetChildren()) do
    if hU:IsA('Tool') and hU:GetAttribute('IsBat') == true then
        return hU
    end
end
local hV = hp:FindFirstChildOfClass('Backpack')
if hV then
    for hW, hX in ipairs(hV:GetChildren()) do
        if hX:IsA('Tool') and hX:GetAttribute('IsBat') == true then
            pcall(
            function() hS:EquipTool(hX)
        end
        ) task.wait(0.2)
        return hX
    end
end
end
return nil
end
local function hQ()
local hS = hx()
local hT = hS and hS:FindFirstChild('Monsters')
local hU, hV = hu()
if not hT or not hV then
    return nil
end
local hW, hX
for hY, hZ in ipairs(hT:GetChildren()) do
    local h_ = hZ:FindFirstChild('Hitbox')
    local h0 = h_ and tonumber(h_:GetAttribute('Health'))
    if h_ and h_:IsA('BasePart') and h0 and h0 > 0 then
        local h1 =(h_.Position - hV.Position).Magnitude
        if not hX or h1 < hX then
            hW, hX = hZ, h1
        end
    end
end
return hW
end
local function hS()
local hT = hQ()
if not hT then
    return false
end
local hV = hT:FindFirstChild('Hitbox')
if not hV then
    return true
end
local hW = hP()
if not hW then
    ht('you need a bat (Titan Axe)') task.wait(1)
    return true
end
ht('fighting '..hT.Name)
local hX = os.clock()
local hY = 0 hA(true)
while hm.monster and hT.Parent and hV.Parent and(tonumber(hV:GetAttribute('Health')) or 0) > 0 and os.clock() - hX < 25 do
    if hp:GetAttribute('HalloweenCarrying') == true or hp:GetAttribute('HalloweenPumpkinCarrying') == true then
        break
    end
    local hZ, h_ = hu()
    if not h_ then
        break
    end
    local h0 = math.max(hV.Size.X, hV.Size.Z) / 2 + 3
    local h1 = Vector3.new(h_.Position.X - hV.Position.X, 0, h_.Position.Z - hV.Position.Z)
    if h1.Magnitude < 0.1 then
        h1 = Vector3.new(1, 0, 0)
    end
    local h2 = Vector3.new(hV.Position.X, h_.Position.Y, hV.Position.Z) + h1.Unit * h0
    if(h2 - h_.Position).Magnitude > 40 then
        hA(false) hC(h2,
        function()
        return not hV.Parent
    end
    , 10) hA(true)
    else
    pcall(
    function() h_.CFrame = CFrame.lookAt(h2, Vector3.new(hV.Position.X, h2.Y, hV.Position.Z)) h_.AssemblyLinearVelocity = Vector3.zero
end
)
end
if os.clock() - hY > 0.62 then
    hY = os.clock()
    if hW.Parent ~= hp.Character then
        hW = hP() or hW
    end
    pcall(
    function() hW:Activate()
end
)
end
ho.Heartbeat:Wait()
end
hA(false)
return true
end
local function hT()
local hV = hx()
if hV then
    for hW, hX in ipairs(hV:GetDescendants()) do
        if hX.Name == 'PortalHome' then
            local hY = hX:FindFirstChild('Portal')
            if hY and hY:IsA('BasePart') then
                return hY.Position
            end
            local hZ, h_ = pcall(
            function()
            return hX:GetPivot().Position
        end
        )
        if hZ then
            return h_
        end
    end
end
end
return Vector3.new(- 5809, - 188, - 7489)
end
hm.exitDimension =
function(hV) hm.exiting = true
for hW, hX in ipairs({'egg', 'monster', 'pumpkin', 'rod', 'ticket', 'fish', 'train'}) do
    hm[hX] = false
    if hm.paint[hX] then
        pcall(hm.paint[hX])
    end
end
local hY, hZ = pcall(
function()
if hp:GetAttribute('HalloweenCarrying') == true and hy() then
    if hV then
        hV('Claiming your Halloween egg')
    end
    hI()
end
hm.finishEgg = false
if not hy() then
    return
end
if hV then
    hV('Leaving the dimension')
end
local hY = hT() hC(hY,
function()
return not hy()
end
, 25)
local hZ = os.clock()
while hy() and os.clock() - hZ < 8 do
    local h_, h0 = hu()
    if h0 then
        pcall(
        function() h0.CFrame = CFrame.new(hY + Vector3.new(math.sin(os.clock() * 6) * 2, 0, 0))
    end
    )
end
task.wait(0.1)
end
task.wait(1.2)
end
) hm.exiting = false hm.status = ''
if not hY then
    warn('[LUKZ Halloween] exit: '..tostring(hZ))
end
return hY and not hy()
end
local hV ={Dog = Vector3.new(- 5386, - 206, - 6832), Fisher = Vector3.new(- 5307, - 204, - 6122), CastSpot = Vector3.new(- 5318, - 204, - 6129), CastTarget = Vector3.new(- 5318,
- 208, - 6157), Collar = Vector3.new(- 6730, - 205, - 6346), Bone = Vector3.new(- 6259, - 207, - 6432), Toy = Vector3.new(- 5545, - 207, - 6611), Photo = Vector3.new(- 5728,
- 207, - 5008)}
local hW ={Dog = 'DogSpot', Fisher = 'FishermanSpot', CastSpot = 'CastSpot', CastTarget = 'CastTarget', Collar = 'Artifact_Collar', Bone = 'Artifact_Bone',
Toy = 'Artifact_Toy', Photo = 'Artifact_Photo'}
local function hX(hY)
local hZ = hV[hY] pcall(
function()
local h_ = hx().GhostDogQuest.Markers:FindFirstChild(hW[hY])
if h_ then
    hZ = h_.Position +(hY == 'Dog' and Vector3.new(4, 0, 0) or(hY == 'Fisher' and Vector3.new(3, 0, 3) or Vector3.zero))
end
end
)
return hZ
end
local function hY(hZ,...)
local h_ = game:GetService('ReplicatedStorage'):FindFirstChild('Packages') h_ = h_ and h_:FindFirstChild('Networking')
local h0 = h_ and h_:FindFirstChild('RF/GhostDogQuest/'..hZ)
if not h0 then
    return nil
end
local h1 = table.pack(...)
local h2, h3 = pcall(
function()
return h0:InvokeServer(table.unpack(h1, 1, h1.n))
end
)
return h2 and h3 or nil
end
local function hZ(h_)
for h0, h1 in ipairs({hp:FindFirstChildOfClass('Backpack'), hp.Character}) do
    if h1 then
        for h2, h3 in ipairs(h1:GetChildren()) do
            if h3:IsA('Tool') and h_(h3) then
                return h3
            end
        end
    end
end
end
local function h_()
return hZ(
function(h0)
return h0:GetAttribute('GhostDogRod') == true or string.find(h0.Name, 'Haunted Rod', 1, true) ~= nil
end
)
end
local function h0()
return hZ(
function(h1)
return h1:GetAttribute('ItemType') == 'TrainPass' or string.find(h1.Name, 'Train Pass', 1, true) ~= nil
end
)
end
local function h1()
return hp:GetAttribute('GhostDogPhase')
end
local function h2()
return(hm.rod or hm.ticket or hm.fish) and not hm.exiting
end
local function h3(h4)
return hC(hX(h4) + Vector3.new(0, 3.5, 0),
function()
return not h2()
end
, 30)
end
local function h4(h5, h6) hm[h5] = false pcall(
function() hm.paint[h5]()
end
) ht(h6 or '')
end
local function h5(h6)
local h7, h8 = hu()
if h8 then
    pcall(
    function() h8.Anchored = h6
end
)
end
end
local function h6() ht('talking to Echo') h3('Dog')
if not h2() then
    return false
end
hY('Talk', 'Dog')
for h7, h8 in ipairs({'Collar', 'Bone', 'Toy', 'Photo'}) do
    if not h2() then
        return false
    end
    ht("collecting Echo's "..h8) h3(h8)
    if hY('Collect', h8) ~= true then
        task.wait(0.6) hY('Collect', h8)
    end
end
if not h2() then
    return false
end
ht('bringing the memories to Echo') h3('Dog') hY('Talk', 'Dog')
if not h2() then
    return false
end
ht('asking the Ghost Fisherman for the rod') h3('Fisher') hY('Talk', 'Fisherman') task.wait(0.5) hY('Talk', 'Rod')
local h9 = os.clock()
while not h_() and os.clock() - h9 < 5 do
    task.wait(0.2)
end
return h_() ~= nil
end
local function h7()
local h8 = h_()
if not h8 then
    return false
end
local h9, ia, ib = hu()
if h8.Parent ~= hp.Character and ib then
    pcall(
    function() ib:EquipTool(h8)
end
)
end
if h1() ~= 'Chasing' then
    ht('casting at the glowing ripples') h3('CastSpot')
    if not h2() then
        return false
    end
    pcall(
    function()
    local ic, id = hu()
    local ie = hX('CastTarget') id.CFrame = CFrame.lookAt(id.Position, Vector3.new(ie.X, id.Position.Y, ie.Z))
end
) task.wait(0.4)
if h1() ~= 'Hooked' then
    hY('Cast')
    local ic = os.clock()
    while h1() ~= 'Hooked' and os.clock() - ic < 5 do
        task.wait(0.15)
    end
end
task.wait(1) ht('diving after the fish') hY('Dive')
local ic = os.clock()
while h1() ~= 'Chasing' and os.clock() - ic < 4 do
    task.wait(0.15)
end
task.wait(1.2) h5(true)
end
local ic = os.clock()
local id = false
while h2() and os.clock() - ic < 53 do
    if h1() ~= 'Chasing' then
        break
    end
    local ie = os.clock() - ic
    if ie > 26 and not id then
        id = true
        if hY('Surface') == true then
            break
        end
    end
    ht(string.format("fish chase %d / 52 s (it's normal to float)", math.floor(ie))) task.wait(0.5)
end
if not h2() then
    h5(false) hY('Abort')
    return false
end
if h1() == 'Chasing' then
    hY('Surface') task.wait(1.5)
end
ht('opening the Train Pass chest') hY('Claim')
local ie = os.clock()
while not h0() and os.clock() - ie < 4 do
    task.wait(0.2)
end
h5(false)
return h0() ~= nil
end
local h8 = 0
local function h9()
if hm.ticket and h0() then
    h4('ticket', 'you already have the Train Pass!')
    if not h_() or not hm.rod then
        return true
    end
end
if not h_() then
    if not h6() then
        if h2() then
            h8 = h8 + 1 ht('rod not given, retrying ('..h8..')')
            if h8 >= 3 then
                h8 = 0
                if hm.rod then
                    h4('rod', 'could not get the rod')
                end
                if hm.ticket then
                    h4('ticket', 'could not get the rod')
                end
            end
        end
        return true
    end
    ht('Haunted Rod received!')
end
h8 = 0
if hm.rod then
    h4('rod', 'Haunted Rod ready!')
end
if hm.ticket then
    local ia = h7()
    if not ia and h2() then
        ht('no pass yet, trying again') hY('Abort') task.wait(1.5) ia = h7()
    end
    if ia then
        h4('ticket', 'Train Pass received!')
        elseif
        hm.ticket then
            h4('ticket', 'could not get the Train Pass')
        end
    end
    return true
end
local ia = Vector3.new(- 5326, - 200, - 6131)
local ib = Vector3.new(- 5312.6, - 207.4, - 6168.9)
local function ic(id)
local ie = game:GetService('ReplicatedStorage'):FindFirstChild('Packages') ie = ie and ie:FindFirstChild('Networking')
return ie and ie:FindFirstChild(id)
end
local id = 0
local function ie(...)
local ig, ih
for ii = 1, select('#',...) do
    local ij = select(ii,...)
    if type(ij) == 'number' then
        if ij >= 1 and ij == math.floor(ij) and not ig then
            ig = ij
            elseif
            ij > 0 and ij < 15 and not ih then
                ih = ij
            end
            elseif
            type(ij) == 'table' then
                local ik = ij.Id or ij.id or ij.CastId or ij.castId or ij.Serial or ij[1]
                if type(ik) == 'number' and not ig then
                    ig = ik
                end
                local il = ij.Bite or ij.bite or ij.BiteIn or ij.BiteAt or ij.Delay or ij.Wait
                if type(il) == 'number' and not ih then
                    ih = il
                end
            end
        end
        return ig, ih
    end
    local function ig()
    if not h_() then
        ht('getting the Haunted Rod first')
        if not h6() then
            task.wait(1)
        end
        return true
    end
    local ih, ii, ij = hu()
    if not ii then
        return false
    end
    if(ii.Position - ia).Magnitude > 6 then
        ht('going to the fishing pier') hC(ia + Vector3.new(0, 1, 0),
        function()
        return not hm.fish
    end
    , 30)
    if not hm.fish then
        return true
    end
end
local ik = h_()
if ik and ik.Parent ~= hp.Character and ij then
    pcall(
    function() ij:EquipTool(ik)
end
) task.wait(0.4)
end
pcall(
function()
local il, im = hu() im.CFrame = CFrame.lookAt(im.Position, Vector3.new(ib.X, im.Position.Y, ib.Z))
end
)
local il, im, ip = ic('RE/Fishing/Hold'), ic('RF/Fishing/Cast'), ic('RF/Fishing/Reel')
if not(il and im and ip) then
    ht('fishing not available') task.wait(2)
    return true
end
local function iq(ir) pcall(
function()
if writefile and appendfile then
    if makefolder and isfolder and not isfolder('LukzLibrary') then
        makefolder('LukzLibrary')
    end
    if not(isfile and isfile('LukzLibrary/lukz_fishing_log.txt')) then
        writefile('LukzLibrary/lukz_fishing_log.txt', '')
    end
    appendfile('LukzLibrary/lukz_fishing_log.txt', os.date('%H:%M:%S')..'  '..ir..'\n')
end
end
)
end
local function ir(...)
local is ={}
for it = 1, select('#',...) do
    local iu = select(it,...)
    if type(iu) == 'table' then
        local iv ={}
        for iw, ix in pairs(iu) do
            iv[# iv + 1] = tostring(iw)..'='..tostring(ix)
            if # iv > 8 then
                break
            end
        end
        is[# is + 1] = '{'..table.concat(iv, ',')..'}'
        else
        is[# is + 1] = tostring(iu)
    end
end
return table.concat(is, ', ')
end
ht('casting (perfect charge)') pcall(
function() il:FireServer()
end
)
local is = 1.08 + math.random() * 0.05 task.wait(is)
local it = Vector3.new(math.random(- 15, 15) / 10, 0, math.random(- 15, 15) / 10)
local iu = os.clock()
local iv = table.pack(pcall(
function()
return im:InvokeServer(is, ib + it)
end
))
local iw, ix
if iv[1] then
    iw, ix = ie(table.unpack(iv, 2, iv.n))
end
iq('CAST ok='..tostring(iv[1])..'  answer: '..ir(table.unpack(iv, 2, iv.n)))
if not iw then
    id = id + 1 ht('cast answer: '..string.sub(ir(table.unpack(iv, 2, iv.n)), 1, 60)) task.wait(2.5)
    if id >= 5 then
        id = 0 ht('fishing paused 20 s (cast not accepted)') task.wait(20)
    end
    return true
end
local iy = ix and(iu + 0.75 + math.clamp(ix, 0.5, 8)) or nil
local iz = iy and(iy + 2.4 + math.random() * 0.6) or(iu + 8.3 + math.random() * 0.6)
while os.clock() < iz do
    if not hm.fish then
        pcall(
        function()
        local iA = ic('RE/Fishing/Cancel')
        if iA then
            iA:FireServer(iw)
        end
    end
    )
    return true
end
ht(string.format('waiting for a bite %.0f s', iz - os.clock())) task.wait(0.2)
end
local iA = iy and(os.clock() - iy) or 6.5
local iB = math.ceil((0.7 + 0.1 * iA) / 0.075) + 2 iB = math.clamp(iB, 12, math.max(12, math.floor(iA * 20))) ht('reeling in!')
local iC = table.pack(pcall(
function()
return ip:InvokeServer(iw, 'Caught', iB)
end
)) iq('REEL id='..tostring(iw)..' clicks='..iB..'  ok='..tostring(iC[1])..'  answer: '..ir(table.unpack(iC, 2, iC.n)))
if iC[1] and iC[2] ~= false and iC[2] ~= nil then
    id = 0 ht('fish caught!  '..string.sub(ir(iC[2]), 1, 40))
    else
    ht('reel answer: '..string.sub(ir(table.unpack(iC, 2, iC.n)), 1, 60))
end
task.wait(2 + math.random())
return true
end
local ih ={state = nil, ghosts ={}, gtime = 0, lastStatus = 0} pcall(
function()
local ii = ic('RE/TrainEvent/State')
if ii then
    ii.OnClientEvent:Connect(
    function(ij)
    if type(ij) == 'table' then
        ih.state = ij
    end
end
)
end
local ij = ic('RE/TrainEvent/Ghosts')
if ij then
    ij.OnClientEvent:Connect(
    function(ik)
    if type(ik) == 'table' and type(ik.Ghosts) == 'table' then
        ih.ghosts = ik.Ghosts ih.gtime = os.clock()
    end
end
)
end
end
)
local ii = Vector3.new(- 6616, - 199, - 6369)
local function ij()
local ik = hp:GetAttribute('TrainEventPhase')
return ik == 'Departing' or ik == 'Town' or ik == 'Returning' or ik == 'Boarded'
end
local function ik(il)
local im = ic('RF/TrainEvent/Action')
if not im then
    return nil
end
local ip, iq = pcall(
function()
return im:InvokeServer(il)
end
)
if ip and il == 'Status' and type(iq) == 'table' then
    ih.state = iq
end
return ip and iq or nil
end
local function il(im)
for ip, iq in ipairs(workspace:GetDescendants()) do
    if iq:IsA('ProximityPrompt') and im(iq) then
        return iq
    end
end
end
local function im()
local ip, iq = pcall(
function()
return workspace:GetServerTimeNow()
end
)
return ip and iq or os.time()
end
local function ip(iq) ht('going back to the Halloween dimension by train')
local ir = il(
function(ir)
return ir:GetAttribute('TrainEventAction') == 'Return' and ir:GetAttribute('TrainEventRequiredPhase') == 'Town'
end
)
if ir then
    local is = hE(ir)
    if is then
        hC(is + Vector3.new(0, 2, 0),
        function()
        return(iq and iq()) or not ij()
    end
    , 20)
end
hD(ir)
end
task.wait(0.4)
if hp:GetAttribute('TrainEventPhase') == 'Town' then
    ik('Return')
end
local is = os.clock()
while hp:GetAttribute('TrainEventPhase') == 'Town' and os.clock() - is < 5 do
    task.wait(0.2)
end
end
local function iq()
local ir = ih.state
if type(ir) == 'table' and ir.ArrivalOpen == true then
    return true
end
local is = false pcall(
function()
for it, iu in ipairs(workspace:GetDescendants()) do
    if iu:IsA('ProximityPrompt') and iu.Enabled and iu:GetAttribute('TrainEventAction') == 'Board' and iu:GetAttribute('TrainEventRequiredPhase') == nil then
        is = true
        break
    end
end
end
)
if is then
    return true
end
pcall(
function()
local it = hp.PlayerGui:FindFirstChild('TrainEventJourney')
if it then
    for iu, iv in ipairs(it:GetDescendants()) do
        if iv:IsA('TextLabel') and iv.Visible and string.find(string.lower(iv.Text), 'boarding closes', 1, true) then
            is = true
            break
        end
    end
end
end
)
return is
end
local function ir()
local is = hZ(
function(is)
return is:GetAttribute('GhostVacuum') == true
end
)
if not is then
    local it = il(
    function(it)
    return it.Name == 'GhostVacuumPickup' or it:GetAttribute('TrainEventAction') == 'PickupVacuum'
end
)
if it then
    ht('picking up the Ghost Vacuum')
    local iu = hE(it)
    if iu then
        hC(iu + Vector3.new(0, 2, 0),
        function()
        return not hm.train
    end
    , 15)
end
hD(it)
local iv = os.clock()
while not hZ(
function(iw)
return iw:GetAttribute('GhostVacuum') == true
end
) and os.clock() - iv < 3 do
    task.wait(0.15)
end
else
ht('looking for the Ghost Vacuum') task.wait(0.5)
end
return
end
local it, iu, iv = hu()
if not iu then
    return
end
if is.Parent ~= hp.Character and iv then
    pcall(
    function() iv:EquipTool(is)
end
) task.wait(0.2)
end
local iw = ih.state and ih.state.Invasion
local ix =(type(iw) == 'table' and type(iw.EndsAt) == 'number' and im() > iw.EndsAt - 3) or(ih.state and type(ih.state.ReturnAt) == 'number' and im() > ih.state.ReturnAt - 25)
if ix then
    ip(
    function()
    return not hm.train
end
)
return
end
local iy, iz, iA
if os.clock() - ih.gtime < 3 then
    for iB, iC in pairs(ih.ghosts) do
        if type(iC) == 'table' and typeof(iC.Frame) == 'CFrame' then
            local iD =(iC.Frame.Position - iu.Position).Magnitude
            if not iz or iD < iz then
                iy, iz, iA = iC, iD, iC.Id
            end
        end
    end
end
if not iy then
    ht('waiting for ghosts  (souls: '..tostring(type(iw) == 'table' and iw.SavedSouls or '?')..')')
    if os.clock() - ih.lastStatus > 4 then
        ih.lastStatus = os.clock() task.spawn(ik, 'Status')
    end
    task.wait(0.4)
    return
end
local iB = ic('RE/TrainEvent/Suction')
local function iC()
if os.clock() - ih.gtime > 3 then
    return nil
end
for iD, iE in pairs(ih.ghosts) do
    if type(iE) == 'table' and iE.Id == iA and typeof(iE.Frame) == 'CFrame' then
        return iE.Frame.Position
    end
end
return nil
end
ht('vacuuming a '..tostring(iy.Tier or 'ghost')..'  (souls: '..tostring(type(iw) == 'table' and iw.SavedSouls or '?')..')')
local iD = os.clock()
local iE = 0 hA(true)
while hm.train and os.clock() - iD < 12 do
    local iF = iC()
    local iG, iH = hu()
    if not iF or not iH then
        break
    end
    local iI = Vector3.new(iH.Position.X - iF.X, 0, iH.Position.Z - iF.Z)
    local iJ = iI.Magnitude
    local iK =(iJ > 0.5) and(Vector3.new(iF.X, iF.Y, iF.Z) + iI.Unit * 8) or(iF + Vector3.new(8, 0, 0))
    local iL = ho.Heartbeat:Wait()
    local iM = iK - iH.Position
    local iN = iH.Position
    if iM.Magnitude > 1 then
        iN = iH.Position + iM.Unit * math.min(hq * math.min(iL, 0.05), iM.Magnitude)
    end
    pcall(
    function() iH.CFrame = CFrame.lookAt(iN, Vector3.new(iF.X, iN.Y, iF.Z)) iH.AssemblyLinearVelocity = Vector3.zero
end
)
if os.clock() - iE > 0.25 and iB then
    iE = os.clock() pcall(
    function() iB:FireServer(true)
end
)
end
end
hA(false) pcall(
function()
if iB then
    iB:FireServer(false)
end
end
)
end
local function is()
local it = hp:GetAttribute('TrainEventPhase')
if it == 'Town' then
    ir()
    return true
end
if ij() then
    ht('riding the Phantom Express') task.wait(0.5)
    return true
end
if not hy() then
    return false
end
if os.clock() - ih.lastStatus > 5 then
    ih.lastStatus = os.clock() ik('Status')
end
local iu = ih.state
if iq() then
    if type(iu) == 'table' and iu.AccessUnlocked == false and not h0() then
        ht('need the Train Pass (turn on Auto Ticket)')
        return false
    end
    ht('boarding the Phantom Express')
    local iv = il(
    function(iv)
    return iv:GetAttribute('TrainEventAction') == 'Board' and iv.Enabled
end
)
local iw =(iv and hE(iv)) or ii hC(iw + Vector3.new(0, 2, 0),
function()
return not hm.train
end
, 25)
if iv then
    hD(iv)
end
task.wait(0.4)
if not ij() then
    ik('Board')
end
local ix = os.clock()
while not ij() and os.clock() - ix < 5 do
    task.wait(0.2)
end
if not ij() then
    ht('could not board, retrying') task.wait(2)
end
return true
end
if not(hm.egg or hm.monster or hm.pumpkin or hm.fish) then
    ht('waiting for the Phantom Express') task.wait(1)
    return true
end
return false
end
while gi.Parent do
    local it, iu = pcall(
    function()
    if hm.exiting then
        task.wait(0.2)
        return
    end
    if not hv() then
        hm.status = '' task.wait(0.4)
        return
    end
    local it = hm.egg or hm.monster or hm.pumpkin or hm.rod or hm.ticket or hm.fish or hm.train
    if not it and hm.finishEgg then
        if hp:GetAttribute('HalloweenCarrying') == true and hy() and hu() then
            hI()
        end
        if hp:GetAttribute('HalloweenCarrying') ~= true then
            hm.finishEgg = false ht('')
        end
        task.wait(0.2)
        return
    end
    if hw() then
        ht('waiting (Auto Steal is busy)') task.wait(0.5)
        return
    end
    if not hu() then
        ht('waiting for your character') task.wait(0.5)
        return
    end
    if ij() then
        if hm.train then
            is()
            elseif
            hp:GetAttribute('TrainEventPhase') == 'Town' and(hm.egg or hm.monster or hm.pumpkin or hm.rod or hm.ticket or hm.fish or hm.finishEgg) then
                ip()
                else
                ht('on the Phantom Express') task.wait(0.5)
            end
            return
        end
        if not hy() then
            if not hF() then
                task.wait(1)
            end
            return
        end
        if hp:GetAttribute('HalloweenCarrying') == true then
            hI()
            return
        end
        if hp:GetAttribute('HalloweenPumpkinCarrying') == true then
            hO()
            return
        end
        if(hm.rod or hm.ticket) and h9() then
            return
        end
        if hm.train and is() then
            return
        end
        if hm.pumpkin and hM() then
            return
        end
        if hm.egg and hH() then
            return
        end
        if hm.monster and hS() then
            return
        end
        if hm.fish and ig() then
            return
        end
        ht('looking for targets...') task.wait(0.6)
    end
    )
    if not it then
        pcall(
        function()
        local iv = hp.Character and hp.Character:FindFirstChild('HumanoidRootPart')
        if iv then
            iv.Anchored = false
        end
    end
    ) hm.status = 'error, retrying' warn('[LUKZ Halloween] '..tostring(iu)) hA(false) task.wait(1)
end
task.wait()
end
end
)
local hn = Instance.new('TextButton') hn.Name = 'LUKZBubble' hn.Size = UDim2.fromOffset(52, 52) hn.Position = UDim2.new(0, 14, 0.5, - 26) hn.BackgroundColor3 = Color3.new(1,
1, 1) hn.Text = 'L' hn.TextColor3 = Color3.new(1, 1, 1) hn.Font = Enum.Font.GothamBlack hn.TextSize = 26 hn.AutoButtonColor = false hn.Visible = false hn.Parent = gi gf(hn,
26) gg(hn, ga, 1.8, 0.1)
local ho = Instance.new('UIGradient') ho.Color = ColorSequence.new(ga, gb) ho.Rotation = 45 ho.Parent = hn
local hp = Instance.new('UIScale') hp.Parent = hn
local hq, hr = false, false gI.MouseButton1Click:Connect(
function()
if hr then
    return
end
hq = not hq gI.Text = hq and '+' or '-' ge(gt, 0.3,{Size = UDim2.fromOffset(gl, hq and gm or gq)}, Enum.EasingStyle.Quint) gK.Visible = not hq
end
)
local function hs(ht)
if ht == hr then
    return
end
hr = ht
if ht then
    ge(gx, 0.25,{Scale = 0.6}, Enum.EasingStyle.Back, Enum.EasingDirection.In) ge(gt, 0.25,{BackgroundTransparency = 1}) task.delay(0.26,
    function()
    if hr then
        gt.Visible = false hn.Visible = true hp.Scale = 0.3 ge(hp, 0.4,{Scale = 1}, Enum.EasingStyle.Back)
    end
end
)
else
hn.Visible = false gt.Visible = true gx.Scale = 0.6 gt.BackgroundTransparency = 1 ge(gx, 0.45,{Scale = 1}, Enum.EasingStyle.Back) ge(gt, 0.3,{BackgroundTransparency = 0})
end
end
gJ.MouseButton1Click:Connect(
function() hs(true)
end
) hn.MouseButton1Click:Connect(
function() hs(false)
end
) f5.InputBegan:Connect(
function(ht, hu)
if not hu and ht.KeyCode == Enum.KeyCode.RightShift then
    hs(not hr)
end
end
) gy = Instance.new('ScreenGui') gy.Name = 'LUKZLoading' gy.ResetOnSpawn = false gy.DisplayOrder = 121 gy.IgnoreGuiInset = true gy.Enabled = false gy.Parent = gi.Parent
local ht = Instance.new('UIScale') ht.Parent = gy
local hu = Instance.new('Frame') hu.Size = UDim2.fromScale(1, 1) hu.BackgroundColor3 = Color3.fromRGB(3, 8, 20) hu.BackgroundTransparency = 1 hu.BorderSizePixel = 0 hu.Active = true hu.Parent = gy
local hv = Instance.new('Frame') hv.Size = UDim2.fromScale(1, 1) hv.BackgroundTransparency = 1 hv.BackgroundColor3 = Color3.new(1, 1, 1) hv.BorderSizePixel = 0 hv.Parent = hu
local hw = Instance.new('UIGradient') hw.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 40, 110)), ColorSequenceKeypoint.new(0.5,
Color3.fromRGB(3, 10, 28)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 70, 130))}) hw.Rotation = 35 hw.Parent = hv
local hx = Instance.new('Frame') hx.AnchorPoint = Vector2.new(0.5, 0.5) hx.Position = UDim2.fromScale(0.5, 0.5) hx.Size = UDim2.fromOffset(300, 290) hx.BackgroundTransparency = 1 hx.Parent = hu hx.Visible = false
local hy = Instance.new('UIScale') hy.Parent = hx
local hz = Instance.new('Frame') hz.AnchorPoint = Vector2.new(0.5, 0) hz.Position = UDim2.new(0.5, 0, 0, 0) hz.Size = UDim2.fromOffset(120, 120) hz.BackgroundColor3 = Color3.fromRGB(6,
16, 40) hz.BorderSizePixel = 0 hz.Parent = hx gf(hz, 60)
local hA = gg(hz, Color3.new(1, 1, 1), 5, 0)
local hB = Instance.new('UIGradient') hB.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ga), ColorSequenceKeypoint.new(0.5, f9), ColorSequenceKeypoint.new(1,
gb)}) hB.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.6, 0.2), NumberSequenceKeypoint.new(1, 1)}) hB.Parent = hA
local hC = Instance.new('Frame') hC.AnchorPoint = Vector2.new(0.5, 0.5) hC.Position = UDim2.fromScale(0.5, 0.5) hC.Size = UDim2.fromOffset(120, 120) hC.BackgroundTransparency = 1 hC.Parent = hz gf(hC,
70)
local hD = gg(hC, ga, 2, 0.4)
local hE = Instance.new('ImageLabel') hE.AnchorPoint = Vector2.new(0.5, 0.5) hE.Position = UDim2.fromScale(0.5, 0.5) hE.Size = UDim2.fromOffset(70, 70) hE.BackgroundTransparency = 1 hE.ScaleType = Enum.ScaleType.Fit hE.Parent = hz
local hF = gh(hz, 'EGG', 18, Enum.Font.GothamBlack, ga, 0, 0, 120, 120, Enum.TextXAlignment.Center)
local hG = gh(hx, 'STEALING EGG', 22, Enum.Font.GothamBlack, gc, 0, 134, 300, 28, Enum.TextXAlignment.Center)
local hH = gh(hx, '', 13, Enum.Font.GothamBold, ga, 0, 164, 300, 18, Enum.TextXAlignment.Center)
local hI = Instance.new('Frame') hI.Position = UDim2.fromOffset(30, 194) hI.Size = UDim2.fromOffset(240, 8) hI.BackgroundColor3 = Color3.fromRGB(12, 28,
62) hI.BorderSizePixel = 0 hI.Parent = hx gf(hI, 4)
local hK = Instance.new('Frame') hK.Size = UDim2.fromScale(0, 1) hK.BackgroundColor3 = Color3.new(1, 1, 1) hK.BorderSizePixel = 0 hK.Parent = hI gf(hK,
4)
local hL = Instance.new('UIGradient') hL.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, gb), ColorSequenceKeypoint.new(0.5, f9), ColorSequenceKeypoint.new(1,
ga)}) hL.Parent = hK
local hM = gh(hx, 'Usually 5 - 10 seconds', 11, Enum.Font.GothamMedium, gd, 0, 210, 300, 16, Enum.TextXAlignment.Center)
local hO = gh(hx, '0%', 11, Enum.Font.GothamBlack, ga, 0, 226, 300, 16, Enum.TextXAlignment.Center)
local hP = Instance.new('TextButton') hP.AnchorPoint = Vector2.new(0.5, 0) hP.Position = UDim2.new(0.5, 0, 0, 252) hP.Size = UDim2.fromOffset(120, 34) hP.BackgroundColor3 = Color3.fromRGB(10,
22, 50) hP.AutoButtonColor = false hP.Text = 'STOP' hP.TextColor3 = gc hP.Font = Enum.Font.GothamBlack hP.TextSize = 15 hP.Parent = hx gf(hP, 12)
local hQ = gg(hP, f9, 1.4, 0.3) hP.MouseEnter:Connect(
function() ge(hQ, 0.15,{Transparency = 0})
end
) hP.MouseLeave:Connect(
function() ge(hQ, 0.15,{Transparency = 0.3})
end
)
local hS, hT, hV, hW = false, false, 0, 0
local function hX()
local hY = workspace.CurrentCamera
local hZ = hY and hY.ViewportSize.Y or 720 hy.Scale = math.clamp(hZ / 560, 0.75, 1.2)
end
local function hY(hZ, h_)
if type(hZ) == 'string' and hZ ~= '' and hZ ~= '-' then
    hH.Text = hZ
end
if type(h_) == 'string' and h_ ~= '' then
    hE.Image = h_
end
hF.Visible = hE.Image == ''
if hS then
    return
end
hS, hT, hV = true, false, os.clock() hM.Text = 'Usually 5 - 10 seconds' hW = hW + 1 hX() hG.Text = 'STEALING EGG' hG.TextColor3 = gc hK.Size = UDim2.fromScale(0,
1) gy.Enabled = true
if not hr then
    gt.Visible = false
end
hx.Position = UDim2.fromScale(0.5, 0.56) hy.Scale = hy.Scale * 0.85
local h0 = hy.Scale / 0.85 hx.Visible = true ge(hu, 0.25,{BackgroundTransparency = 0}) ge(hv, 0.25,{BackgroundTransparency = 0.35}) ge(hx, 0.45,{Position = UDim2.fromScale(0.5,
0.5)}, Enum.EasingStyle.Back) ge(hy, 0.45,{Scale = h0}, Enum.EasingStyle.Back)
end
local function hZ(h_)
if not hS then
    return
end
hS = false hW = hW + 1
local h0 = hW
if h_ then
    hT = true hG.Text = 'EGG STOLEN!' hG.TextColor3 = ga hM.Text = 'Egg claimed in your base' hO.Text = '100%' ge(hK, 0.2,{Size = UDim2.fromScale(1, 1)}) ge(hy,
    0.15,{Scale = hy.Scale * 1.08})
end
task.delay(h_ and 0.9 or 0.05,
function()
if h0 ~= hW then
    return
end
ge(hu, 0.3,{BackgroundTransparency = 1}) ge(hv, 0.3,{BackgroundTransparency = 1}) ge(hy, 0.25,{Scale = 0.01}, Enum.EasingStyle.Back, Enum.EasingDirection.In) task.delay(0.32,
function()
if h0 == hW then
    gy.Enabled = false hx.Visible = false
    if not hr and not gt.Visible then
        gt.Visible = true gx.Scale = 0.85 ge(gx, 0.35,{Scale = 1}, Enum.EasingStyle.Back)
    end
end
end
)
end
)
end
local h_, h0, h1, h3, h2 = 0, false, false, 0 hc =
function(h4) h_, h0, h1, h2, h3 = os.clock(), true, false, h4, 0 hH.Text = '' hE.Image = ''
local h5 = hi[1] hY(h5 and h5.name.Text or '', h5 and h5.icon.Image or '')
end
he =
function(h4)
local h5 = hi[1] hY(h5 and h5.name.Text or '', h5 and h5.icon.Image or '')
if hM and h4 then
    hM.Text = h4
end
end
local function h4(h5) h0 = false hb = false hZ(h5)
end
hd =
function() h4(false)
end
hP.MouseButton1Click:Connect(
function() hf() g3(false) h4(false)
end
) task.spawn(
function()
local h5 pcall(
function() h5 = require(game:GetService('ReplicatedStorage').Client.EggState)
end
)
local h6
local function h7(h8)
if not h8 or not h5 or type(h5.ReadFieldEgg) ~= 'function' then
    return nil, false
end
local h9, ia = pcall(h5.ReadFieldEgg, h8)
if not h9 then
    return nil, false
end
return ia, true
end
local function h8(h9)
local ia, ib = h7(h9)
if not ib then
    return true
end
return ia == nil or tostring(ia.State) == 'Claimed'
end
local function h9(ia)
local ib, ic = h7(ia)
if not ic or type(ib) ~= 'table' then
    return false
end
local id = tostring(ib.State)
return id == 'Slot' or id == 'Dropped'
end
local function ia(ib)
if not bP or not ib then
    return false
end
if bP.primerUid == ib then
    return true
end
return type(bP.primerUids) == 'table' and bP.primerUids[ib] ~= nil
end
while gi.Parent do
    pcall(
    function()
    local ib = os.clock()
    if not h0 then
        h6 = nil
        return
    end
    local ic = bP and bP.enabled == true
    local id = bP and bP.carry
    local ie = type(id) == 'table' and id.active == true and type(id.uid) == 'string'
    local ig = bP and bP._instantReturnToken ~= nil
    local ih = bP and bP._externalDeliver ~= nil
    if ie and not ia(id.uid) then
        h6 = id.uid
    end
    if not h1 and h5 and h6 and h8(h6) then
        h1 = true g4()
    end
    local ii = bP and type(bP.stats) == 'table' and bP.stats.status
    if type(ii) == 'string' and ii ~= '' and hS then
        hM.Text = ii
    end
    if type(ii) == 'string' and string.find(string.lower(ii), 'wall', 1, true) then
        h_ = math.max(h_, ib - 50)
    end
    local ij = hi[1]
    if ij and(hH.Text == '' or hE.Image == '') and not h6 then
        hY(hH.Text == '' and ij.name.Text or '', hE.Image == '' and ij.icon.Image or '')
    end
    local ik = ie or ig or ih
    if h6 and not ik and h8(h6) then
        h6 = nil
        if not h1 then
            g4()
        end
        hf() h4(true) g1.Text = 'EGG STOLEN!' g1.TextColor3 = ga
        return
    end
    if not ic and not ik and ib - h_ > 1.5 then
        local il = h6 or h2
        if h3 < 2 and il and h9(il) then
            h3 = h3 + 1 h6, h1, h_ = nil, false, ib hM.Text = 'Retrying... ('..h3..'/2)' hg(il)
            return
        end
        h6 = nil h4(false) g1.Text = 'COULD NOT GET THE EGG' g1.TextColor3 = gd
        return
    end
    if ib - h_ > 60 and not ik then
        h6 = nil hf() g3(false) h4(false) g1.Text = 'TIMEOUT - TRY AGAIN' g1.TextColor3 = gd
    end
end
) task.wait(0.05)
end
pcall(
function() gy:Destroy()
end
)
end
)
local h5 h5 = f6.Heartbeat:Connect(
function()
if not gi.Parent then
    h5:Disconnect()
    return
end
if not gy.Enabled then
    return
end
local h6 = os.clock() hB.Rotation =(h6 * 300) % 360 hD.Transparency = 0.35 +(math.sin(h6 * 4) + 1) * 0.3 hC.Size = UDim2.fromOffset(126 +(math.sin(h6 * 4) + 1) * 6,
126 +(math.sin(h6 * 4) + 1) * 6) hE.Rotation = math.sin(h6 * 6) * 8 hF.Rotation = math.sin(h6 * 6) * 8 hw.Rotation = 35 + math.sin(h6 * 0.8) * 25
if hS and not hT then
    local h7 = 1 - math.exp(-(h6 - hV) / 3.2) h7 = math.min(h7, 0.95) hK.Size = UDim2.fromScale(h7, 1) hO.Text = tostring(math.floor(h7 * 100))..'%'
    local h8 = math.floor(h6 * 3) % 4 hG.Text = 'STEALING EGG'..string.rep('.', h8)
end
end
)
local h6 = os.clock()
local h7
local h8 = 0 h7 = f6.Heartbeat:Connect(
function(h9)
if not gi.Parent then
    h7:Disconnect()
    return
end
h8 = h8 + h9
if h8 < 0.07 then
    return
end
h8 = 0
local ia = os.clock() - h6 gv.Rotation =(ia * 60) % 360
local ib = hi[1]
if ib and ib.sel then
    ib.stroke.Transparency = 0.05 +(math.sin(ia * 3) + 1) * 0.18
end
if g2() then
    if gR then
        gR.Offset = Vector2.new(math.sin(ia * 3) * 0.25, 0)
    end
    gO.Transparency = 0.05 +(math.sin(ia * 5) + 1) * 0.12 gX.Transparency = 0.45
    if g1.Text ~= 'RUNNING' then
        g1.Text = 'RUNNING' g1.TextColor3 = ga
    end
    else
    gO.Transparency = 0.15 gX.Transparency = 0.2 +(math.sin(ia * 2) + 1) * 0.1
    if g1.Text == 'RUNNING' then
        g1.Text = 'STOPPED' g1.TextColor3 = gd
    end
end
end
)
local function h9(ia)
if type(ia) ~= 'number' or ia <= 0 then
    return '?'
end
local ib = math.abs(ia)
if ib >= 1e12 then
    return string.format('%.2fT/s', ia / 1e12)
end
if ib >= 1e9 then
    return string.format('%.2fB/s', ia / 1e9)
end
if ib >= 1e6 then
    return string.format('%.2fM/s', ia / 1e6)
end
if ib >= 1e3 then
    return string.format('%.1fK/s', ia / 1e3)
end
return string.format('%d/s', math.floor(ia + 0.5))
end
local function ia(ib,...)
if type(ib) ~= 'function' then
    return nil
end
local ic, id = pcall(ib,...)
if ic and type(id) == 'number' and id > 0 then
    return id
end
if ic and type(id) == 'table' then
    local ie = tonumber(id.Value or id.Rate or id.RatePerSecond or id[1])
    if ie and ie > 0 then
        return ie
    end
end
return nil
end
while gi.Parent do
    pcall(
    function()
    local ib, ic, id pcall(
    function() ib = require(game.ReplicatedStorage.Client.EggState)
end
) pcall(
function() ic = require(game.ReplicatedStorage.Data.Assets)
end
) pcall(
function() id = require(game.ReplicatedStorage.Shared.Util.AssetEarnings)
end
)
local function ie(ig)
local ih = ig.Rarity or ig.RarityName
if type(ih) == 'table' then
    ih = ih.Name or ih.DisplayName
end
if type(ih) == 'string' and ih ~= '' then
    return ih
end
local ii = ig.Category or ig.AssetCategory
local ij = ic and ic.Directory and ii and ic.Directory[ii]
if type(ij) == 'table' then
    local ik = ij.Rarity
    if type(ik) == 'table' then
        return ik.Name or ik.DisplayName or 'Common'
    end
    if type(ik) == 'string' then
        return ik
    end
end
return 'Common'
end
local function ig(ih)
local ii = ih.Category or ih.AssetCategory
local ij = ic and ic.Directory and ii and ic.Directory[ii]
if type(ij) == 'table' and type(ij.Icon) == 'string' then
    return ij.Icon
end
return ''
end
local function ih(ii)
local ij = ii.Category or ii.AssetCategory
local ik = ic and ic.Directory and ij and ic.Directory[ij]
if type(ik) == 'table' and type(ik.DisplayName) == 'string' then
    return ik.DisplayName
end
return tostring(ij or 'Pet')
end
local function ii(ij)
local ik = tonumber(ij.Value)
if ik and ik > 0 then
    return ik
end
local il = ij.Category or ij.AssetCategory
local im = tonumber(ij.Scale) or tonumber(ij.AssetScale) or 1
if type(id) == 'table' and il then
    local ip ={Category = il, Scale = im, Mutations = ij.Mutations or{}, BaseMutation = ij.BaseMutation, EyeColor = ij.AssetEyeColor or ij.EyeColor, ColorSeed = ij.AssetColorSeed or ij.ColorSeed,
    ColorIndex = ij.AssetColorIndex or ij.ColorIndex, Gender = ij.Gender, Personality = ij.Personality or 'Normal', HasBeenFirstPlaced = ij.HasBeenFirstPlaced == true} ik = ia(id.MutationOnlyRatePerSecond,
    ip) or ia(id.LiveRatePerSecond, ip) or ia(id.LiveRatePerSecond, il, im) or ia(id.LiveRatePerSecond, il) or ia(id.LiveRatePerSecond, ij) or ia(id.RatePerSecond,
    ip) or ia(id.RatePerSecond, il, im) or ia(id.RatePerSecond, il) or ia(id.CatalogRatePerSecond, il, im) or ia(id.CatalogRatePerSecond, il)
end
return tonumber(ik) or 0
end
local ij ={}
if ib and ib.ReadFieldEggs then
    local ik = ib.ReadFieldEggs()
    local il = type(ik) == 'table' and(ik.Records or ik) or{}
    for im, ip in pairs(il) do
        if type(ip) == 'table' and type(ip.Uid) == 'string' then
            local iq = tostring(ip.State or '')
            if iq == 'Slot' or iq == '' then
                table.insert(ij, ip)
            end
        end
    end
end
table.sort(ij,
function(ik, il)
return ii(ik) > ii(il)
end
) hj = ij rawset(_G, '__LUKZ_BestUid', ij[1] and ij[1].Uid or nil)
local ik = rawget(_G, '__LUKZ_PickUid')
if type(ik) == 'string' then
    local il = false
    for im, ip in ipairs(ij) do
        if ip.Uid == ik then
            il = true
            break
        end
    end
    if not il then
        rawset(_G, '__LUKZ_PickUid', nil) ik = nil
    end
end
for il = 1, 1 do
    local im = ij[il]
    local ip = hi[il]
    local iq = im and ik and im.Uid == ik
    local ir = im and not ik and il == 1 g9(ip,(iq or ir) and true or false)
    if not im then
        ip.icon.Image = '' ip.name.Text = '-' ip.sub.Text = '' ip.baseSub = nil ip.val.Text = '-'
        else
        ip.icon.Image = ig(im) ip.name.Text = ih(im) ip.baseSub = ie(im)..' \183 '..tostring(im.AreaId or '?') ip.sub.Text = ip.baseSub..(iq and ' \183 SELECTED' or(ir and ' \183 TARGET' or '')) ip.val.Text = h9(ii(im))
    end
end
end
) task.wait(1)
end
end
)
if not f4 then
    warn('[LUKZ] menu error: '..tostring(f5)) pcall(
    function() game:GetService('StarterGui'):SetCore('SendNotification',{Title = 'LUKZ SCRIPT', Text = 'Menu error, check console (F9)', Duration = 6})
end
)
end
end
)
end
b5()
