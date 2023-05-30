local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Flag Wars")

local Tab1 = Window_1:NewSection("Main")
local Tab2 = Window_1:NewSection("Gun Config")

Tab1:CreateButton("Silent Aim", function()
    local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')

    local RunService = game:GetService('RunService')
    local servTeams = game:GetService("Teams")

    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera


    getgenv().GameSettings = {
        SilentAim = {
            ["active"] = true,
            ["fov"] = 100,
            ["hitpart"] = "Head",
            ["circlevis"] = true,
            ["wallbang"] = true,
            ["circcolor"] = Color3.fromRGB(228, 9, 191)
        }
    }


    local CircleInline = Drawing.new("Circle")
    local CircleOutline = Drawing.new("Circle")
    CircleInline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleInline.Thickness = 2
    CircleInline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleInline.Transparency = 1
    CircleInline.Color = getgenv().GameSettings.SilentAim.circcolor
    CircleInline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleInline.ZIndex = 2
    CircleOutline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleOutline.Thickness = 4
    CircleOutline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleOutline.Transparency = 1
    CircleOutline.Color = Color3.new()
    CircleOutline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleOutline.ZIndex = 1


    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= servTeams["Neutral"] then
            return false
        else
            return true
        end
    end

    function isDead(player)
        if
            player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                player.Character.Humanoid.Health <= 0
        then
            return true
        else
            return false
        end
    end


        local function isClosestPlayer()
            local target
            local dist = math.huge
            for _, v in next, servPlayer:GetPlayers() do
                if
                    not isDead(v) and v ~= currPlayer and not isSameTeam(v) and v.Character:FindFirstChild("Head") and
                        getgenv().GameSettings.SilentAim.active
                then
                    local pos, visible = currCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local magnitude = (Vector2.new(currMouse.X, currMouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                    if magnitude < (getgenv().GameSettings.SilentAim.fov) then
                        if magnitude < dist then
                            if getgenv().GameSettings.SilentAim.wallbang then
                                target = v
                                dist = magnitude
                            else
                                if visible then
                                    target = v
                                    dist = magnitude
                            end
                        end
    
    
                        end
                    end
                end
            end
            return target
        end
    
    
        local target
        local gmt = getrawmetatable(game)
        setreadonly(gmt, false)
        local oldNamecall = gmt.__namecall
    
        gmt.__namecall =
            newcclosure(
            function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" then
                    target = isClosestPlayer()
                    if target then
                        Args[2]["part"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                        return self.FireServer(self, unpack(Args))
                    end
                end
                return oldNamecall(self, ...)
            end
        )
end)

Tab1:CreateButton("Trigger Bot", function()
    local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')
    local currPlayerCharacter = currPlayer.Character or currPlayer.CharacterAdded:wait()
    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera

    local RunService = game:GetService("RunService")


    function trigBot()
        local ScreenPoint = currCamera:ScreenPointToRay(currMouse.X, currMouse.Y)
        local Ray = Ray.new(ScreenPoint.Origin, ScreenPoint.Direction * 9999)
        local Target, Position = workspace:FindPartOnRayWithIgnoreList(Ray, {currPlayerCharacter,workspace.CurrentCamera})
        if Target and Position and servPlayer:GetPlayerFromCharacter(Target.Parent) and Target.Parent.Humanoid.Health > 0 or Target and Position and servPlayer:GetPlayerFromCharacter(Target.Parent.Parent) and Target.Parent.Parent.Humanoid.Health > 0 then
            local currTarget = servPlayer:GetPlayerFromCharacter(Target.Parent) or servPlayer:GetPlayerFromCharacter(Target.Parent.Parent)
            if currTarget.Team ~= currPlayer.Team and currTarget ~= currPlayer then
                mouse1click()
            end
        end
    end

    RunService.Stepped:Connect(function()
    trigBot()
    end)
end)

Tab1:CreateToggle("Kill All ( Sniper )", function(state)
    local servPlayer = game:GetService("Players")
    local currPlayer = game:GetService('Players').LocalPlayer
    
    function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Holstered"
        end
    end
    
    local currWeapon = getEquippedWeapon(currPlayer)
    
    for _, v in pairs(servPlayer:GetPlayers()) do
        if v.Name ~= currPlayer.Name then
            task.wait(1)
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character[currWeapon],
        [2] = {
            ["p"] = Vector3.new(127.24491882324219, 16.624034881591797, -84.08683776855469),
            ["pid"] = 1,
            ["part"] = v.Character.Head,
            ["d"] = 80.71643829345703,
            ["maxDist"] = 80.71429443359375,
            ["h"] = v.Character.Humanoid,
            ["m"] = Enum.Material.SmoothPlastic,
            ["sid"] = 1,
            ["t"] = 0.8510603182300679,
            ["n"] = Vector3.new(-0.20354677736759186, -0.016248714178800583, 0.9789304733276367)
        }
    }
    
    if state == true then
    game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
    end
    end
    end
end)

Tab1:CreateButton("Hitbox Expander", function()
    local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local currTeams = game:GetService("Teams")
    
    getgenv().Hitbox = {
        Settings = {
            ['hitpart'] = 'Head',
            ['hitsize'] = 5,
            ['transparency'] = 0.60,
            ['color'] =  BrickColor.new("Really blue")
        }
    }
    
    function isSameTeam(currTarget)
        if currTarget.team ~= currPlayer.team and currTarget.team ~= currTeams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    function isDead(currTarget)
        if
            currTarget == nil or currTarget.Character == nil or
                currTarget.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                currTarget.Character.Humanoid.Health <= 0
         then
            return true
        else
            return false
        end
    end
    
    RunService.Stepped:Connect(function()
    for _, v in next, servPlayer:GetPlayers() do
        if v ~= currPlayer and not isSameTeam(v) and not isDead(v) then
    
    
           
                    v.Character[getgenv().Hitbox.Settings.hitpart].Size = Vector3.new(getgenv().Hitbox.Settings.hitsize, getgenv().Hitbox.Settings.hitsize, getgenv().Hitbox.Settings.hitsize)
                    v.Character[getgenv().Hitbox.Settings.hitpart].Transparency = getgenv().Hitbox.Settings.transparency
                    v.Character[getgenv().Hitbox.Settings.hitpart].BrickColor = BrickColor.new("Really blue")
                    v.Character[getgenv().Hitbox.Settings.hitpart].Material = "Neon"
                    v.Character[getgenv().Hitbox.Settings.hitpart].CanCollide = false
        end
    end
    end)
end)

Tab1:CreateButton("ESP", function()
    local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local teams = game:GetService("Teams")
    
    
    local function numberRound(n)
        return math.floor(tonumber(n) + 0.5)
    end
    
    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= teams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    function isDead(player)
        if
            player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                player.Character.Humanoid.Health <= 0
         then
            return true
        else
            return false
        end
    end
    
    function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Holstered"
        end
    end
    
    function doESP()
        for _, v in next, servPlayer:GetPlayers() do
            if v ~= currPlayer and not isSameTeam(v) and not isDead(v) then
                for _, k in next, v.Character:GetChildren() do
                    if not isSameTeam(v) and not isDead(v) and k:IsA("BasePart") and not k:FindFirstChild("dohmESP") then
                        local dohmESP = Instance.new("BoxHandleAdornment", k)
                        dohmESP.Name = "dohmESP"
                        dohmESP.AlwaysOnTop = true
                        dohmESP.ZIndex = 10
                        dohmESP.Size = k.Size
                        dohmESP.Adornee = k
                        dohmESP.Transparency = 0.7
                        dohmESP.Color3 = Color3.new(1, 0, 0)
                    end
                    if not isDead(v) and not v.Character.Head:FindFirstChild("dohmESPTag") then
                        local dohmESPTag = Instance.new("BillboardGui", v.Character.Head)
                        dohmESPTag.Name = "dohmESPTag"
                        dohmESPTag.Size = UDim2.new(1, 200, 1, 30)
                        dohmESPTag.Adornee = v.Character.Head
                        dohmESPTag.AlwaysOnTop = true
    
                        local topTag = Instance.new("TextLabel", dohmESPTag)
                        topTag.TextWrapped = true
                        topTag.Text =
                            (v.Name ..
                            " | " ..
                                numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) ..
                                    "m" .. " | " .. getEquippedWeapon(v))
                        topTag.Size = UDim2.new(1, 0, 1, 0)
                        topTag.TextYAlignment = "Top"
                        topTag.TextColor3 = Color3.new(1, 1, 1)
                        topTag.BackgroundTransparency = 1
                    else
                        v.Character.Head.dohmESPTag.TextLabel.Text =
                            (v.Name ..
                            " | " ..
                                numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) ..
                                    "m" .. " | " .. getEquippedWeapon(v))
                    end
                end
            end
        end
    end
    
    RunService.Stepped:Connect(function()
    doESP()
    end
    )
end)

Tab1:CreateButton("Bring All ( Client Sided )", function()
    local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    
    local teams = game:GetService("Teams")
    
    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= teams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    while task.wait() do
    for _, v in next, servPlayer:GetPlayers() do
        if v ~= currPlayer and not isSameTeam(v) then
            print(v)
            v.Character.HumanoidRootPart.CFrame = currPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(2.2,0.5,-6)
        end
    end
    end
end)

Tab2:CreateButton("Gun Mods", function()
    local mt = getrawmetatable(game)
setreadonly(mt, false)
local index = mt.__index

local Mods = {
    -- Guns (Spas, Sniper, etc)
    ["RecoilMax"] = 0,
    ["RecoilMin"] = 0,
    ["MuzzleFlashSize0"] = 0,
    ["MuzzleFlashSize1"] = 0,
    ["FlashBrightness"] = 0,
    ["AmmoCapacity"] = math.huge,
    ["ShotCooldown"] = 0,
    ["CurrentAmmo"] = math.huge,
    ["BulletSpeed"] = math.huge,
    ["FireMode"] = "Automatic",
    ["GravityFactor"] = 0,
    ["MaxSpread"] = 0,
    ["MinSpread"] = 0,
    ["HitDamage"] = math.huge,
    ["NumProjectiles"] = 1,
    -- Melee (Shovel, Sword, etc)
    ["Cooldown"] = 0,
    ["Value"] = 0,
    ["DirtDamage"] = math.huge,
    ["SwingCooldown"] = 0,
    ["HitRate"] = 0,
}

mt.__index = function(a,b)
    if Mods[tostring(a)] then
        if tostring(b) == "Value" then
            return Mods[tostring(a)]
        end
    end
    return index(a,b)
end
end)
