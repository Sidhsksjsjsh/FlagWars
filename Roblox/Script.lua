local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local mt = getrawmetatable(game)
local old = mt.__namecall
local protect = newcclosure or protect_function

if not protect then
protect = function(f) return f end
end

setreadonly(mt, false)
mt.__namecall = protect(function(self, ...)
local method = getnamecallmethod()
if method == "Kick" then
wait(9e9)
return
end
return old(self, ...)
end)
hookfunction(game:GetService("Players").LocalPlayer.Kick,protect(function() wait(9e9) end))

local Tab = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local Tab2 = Window:MakeTab({
Name = "Modded",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local Tab3 = Window:MakeTab({
Name = "Gun Mod",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local Tab4 = Window:MakeTab({
Name = "Flag",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local Tab5 = Window:MakeTab({
Name = "Script",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})
--[[
local Tab6 = Window:MakeTab({
Name = "Treasure",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})
--[[
function FuckTable(tbl,val)
	if tbl == nil then return false end
	for _,v in pairs(tbl) do
		if v == val then return true end
	end 
	return false
end

function GetTable(Table, Name)
	for i = 1, #Table do
		if Table[i] == Name then
			return i
		end
	end
	return false
end

local XrayToggle = false
local GetEspParts = {}
local GetPartEspTrigger = nil
function XrayPart(part)
	if #espParts > 0 then
		if FuckTable(GetEspParts,part.Name:lower()) then
			local a = Instance.new("BoxHandleAdornment")
			a.Name = part.Name:lower().."_PESP"
			a.Parent = part
			a.Adornee = part
			a.AlwaysOnTop = true
			a.ZIndex = 0
			a.Size = part.Size
			a.Transparency = 0.3
			a.Color = BrickColor.new("Lime green")
		end
	else
		GetPartEspTrigger:Disconnect()
		GetPartEspTrigger = nil
	end
end

local partEspName = ""
function StartXray(prototype)
if XrayToggle == true then
partEspName = prototype
	if not FuckTable(GetEspParts,partEspName) then
		table.insert(GetEspParts,partEspName)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.Name:lower() == partEspName then
				local a = Instance.new("BoxHandleAdornment")
				a.Name = partEspName.."_PESP"
				a.Parent = v
				a.Adornee = v
				a.AlwaysOnTop = true
				a.ZIndex = 0
				a.Size = v.Size
				a.Transparency = 0.3
				a.Color = BrickColor.new("Lime green")
			end
		end
	end
	if GetPartEspTrigger == nil then
		GetPartEspTrigger = game:GetService("Workspace").DescendantAdded:Connect(XrayPart)
	end
else
partEspName = prototype
		if FuckTable(GetEspParts,partEspName) then
			table.remove(GetEspParts, GetTable(GetEspParts, partEspName))
		end
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BoxHandleAdornment") and v.Name == partEspName..'_PESP' then
				v:Destroy()
			end
		end
	else
		GetPartEspTrigger:Disconnect()
		GetPartEspTrigger = nil
		GetEspParts = {}
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BoxHandleAdornment") and v.Name:sub(-5) == '_PESP' then
				v:Destroy()
			end
		end
end
end
]]

local esp_settings = { ---- table for esp settings 
    textsize = 8,
    colour = Color3.fromRGB(75, 151, 75)
}
 
local gui = Instance.new("BillboardGui")
local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel
 
 
 
gui.Name = "Cracked esp"; ---- properties of the esp
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(esp_settings.colour)
esp.BorderSizePixel = 0
esp.Font = "GothamSemibold"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = esp_settings.colour -- text colour
-- esp.Visible = false
-- game:GetService("Workspace").Core.Drops["Stranded Yacht"].Hitbox

RunService.RenderStepped:Connect(function()
    for i,v in pairs(game:GetService("Workspace").Core.Drops:GetChildren()) do
       if v:FindFirstChild("Cracked esp") == nil then
            esp.Text = "[ "..v.Name.." ]"
            gui:Clone().Parent = v
    end
end
end)
--[[
Tab6:AddToggle({
Name = "ESP Treasure",
Default = false,
Callback = function(Value)
esp.Visible = Value
end
})
]]
Tab:AddButton({
Name = "Bullet Tracker",
Callback = function()
    local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')

    local RunService = game:GetService('RunService')
    local servTeams = game:GetService("Teams")

    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera


    getgenv().GameSettings = {
        SilentAim = {
            ["active"] = true,
            ["fov"] = math.huge,
            ["hitpart"] = "Head",
            ["circlevis"] = true,
            ["wallbang"] = true,
            ["circcolor"] = Color3.fromRGB(228, 9, 191)
        }
    }

--[[
local SilentFovCircle = Drawing.new('Circle')
SilentFovCircle.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
SilentFovCircle.Radius = 100
SilentFovCircle.Color = Color3.fromRGB(228, 9, 191)
SilentFovCircle.Filled = false
SilentFovCircle.Visible = true
SilentFovCircle.Transparency = 0.5
-- SilentFovCircle.NumSides = 64
SilentFovCircle.Thickness = 1
]]

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
			-- Args[2]["p"] = Vector3.new(target.Character[getgenv().GameSettings.SilentAim.hitpart].Position)
			-- Args[2]["n"] = Vector3.new(target.Character[getgenv().GameSettings.SilentAim.hitpart].Position)
			Args[2]["h"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                        return self.FireServer(self, unpack(Args))
                    end
                end
                return oldNamecall(self, ...)
            end
        )

OrionLib:MakeNotification({
    Name = "Damage Tracker",
    Content = "Auto Damage Enabled",
    Image = "rbxassetid://0",
    Time = 5
})
end
})
--[[
Tab:AddButton({
Name = "Auto Dig Soil [ Test damage ]",
Callback = function()
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
			Args[2]["p"] = Vector3.new(target.Character[getgenv().GameSettings.SilentAim.hitpart].Position)
			Args[2]["n"] = Vector3.new(target.Character[getgenv().GameSettings.SilentAim.hitpart].Position)
			Args[2]["h"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                        return self.FireServer(self, unpack(Args))
                    end
                end
                return oldNamecall(self, ...)
            end
        )
OrionLib:MakeNotification({
    Name = "Auto dig",
    Content = "Equip shovel",
    Image = "rbxassetid://0",
    Time = 5
})
end
})
--[[
Tab:AddButton({
Name = "Silent Aim V1",
Callback = function()
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


    local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = 100
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(228, 9, 191)
FOVring.Position = currCamera.ViewportSize/2


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
end
})

--[[
local teamCheck = false
local fov = 150
local smoothing = 1

local RunService = game:GetService("RunService")

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(255, 128, 128)
FOVring.Position = workspace.CurrentCamera.ViewportSize/2

local function getClosest(cframe)
   local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
   
   local target = nil
   local mag = math.huge
   
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
           local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
           
           if magBuf < mag then
               mag = magBuf
               target = v
           end
       end
   end
   
   return target
end

loop = RunService.RenderStepped:Connect(function()
   local UserInputService = game:GetService("UserInputService")
   local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E) UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) --Enum.UserInputType.MouseButton2
   local localPlay = game.Players.localPlayer.Character
   local cam = workspace.CurrentCamera
   local zz = workspace.CurrentCamera.ViewportSize/2
   
   if pressed then
       local Line = Drawing.new("Line")
       local curTar = getClosest(cam.CFrame)
       local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
       ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
       if (ssHeadPoint - zz).Magnitude < fov then
           workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
       end
   end
   
   if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
       loop:Disconnect()
       FOVring:Remove()
   end
end)
end)
--
Tab:AddButton({
Name = "Silent Aim V2",
Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kalasthrowaway/stuff/main/flagwars.lua"))()
        -- notify.new("success","Silent Aim","Silent Aim Enabled, bullets will follow the movement of the enemy")
end
})

_G.BulletTrackT = nil
Tab:AddButton({
Name = "Silent Aim V3",
Callback = function()
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


    local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = 50
FOVring.Transparency = 0
FOVring.Color = Color3.fromRGB(228, 9, 191)
FOVring.Position = currCamera.ViewportSize/2


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
    
    
        local old
old = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    if Self.Name == "Shoot" and _G.BulletTrackT ~= nil then
        local base = _G.BulletTrackT.Character.Head
        local velocity = base.AssemblyLinearVelocity
        local aimpos = base.Position + (velocity * Vector3.new(50 / 200, 0, 50 / 200))
        Args[3] = aimpos
            Args[2] = _G.BulletTrackT.Character.Head.Position
        return old(Self, unpack(Args))
    end
    return old(Self, unpack(Args))
end)

end
})
--]]
Tab:AddButton({
Name = "Trigger Bot",
Callback = function()
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
end
})

Tab:AddButton({
Name = "Kill All (Sniper)",
Callback = function()
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
            task.wait()
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
    
    game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
    end
    end
end
})

Tab:AddButton({
Name = "Hitbox Expander",
Callback = function()
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
end
    })

Tab:AddButton({
Name = "ESP",
Callback = function()
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
                        topTag.Text = v.Name .. " | " .. numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. "m" .. " | " .. getEquippedWeapon(v) .. " | " .. tostring(v.Character.Humanoid.Health) .. "/" .. tostring(v.Character.Humanoid.MaxHealth)
                        topTag.Size = UDim2.new(1, 0, 1, 0)
                        topTag.TextYAlignment = "Top"
                        topTag.TextColor3 = Color3.new(1, 1, 1)
                        topTag.BackgroundTransparency = 1
                    else
                        v.Character.Head.dohmESPTag.TextLabel.Text = v.Name .. " | " .. numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. "m" .. " | " .. getEquippedWeapon(v)  .. " | " .. tostring(v.Character.Humanoid.Health) .. "/" .. tostring(v.Character.Humanoid.MaxHealth)
                    end
                end
            end
        end
    end
    
    RunService.Stepped:Connect(function()
    doESP()
    end
    )
end
    })

Tab:AddButton({
Name = "Bring All ( Client Sided )",
Callback = function()
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
end
    })

--[[
Tab2:CreateButton("Gun Mods", function()
      notify.new("warning","Cheat Enabled","reset to work")
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
    ["HitDamage"] = 9e9,
    ["NumProjectiles"] = 1,
    -- Melee (Shovel, Sword, etc)
    ["Cooldown"] = 0,
    ["Value"] = 0,
    ["DirtDamage"] = 9e9,
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
--]]

Tab3:AddButton({
Name = "Rapid Fire & Infinite Ammo & No-Recoil",
Callback = function()
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
    ["FireMode"] = "Automatic",
    ["GravityFactor"] = 0,
    ["MaxSpread"] = 0,
    ["MinSpread"] = 0,
    ["HitDamage"] = 9e9,
    ["NumProjectiles"] = 1,
    -- Melee (Shovel, Sword, etc)
    ["Cooldown"] = 0,
    ["Value"] = 0,
    ["DirtDamage"] = 9e9,
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
end
    })

local GetHumanPos = CFrame.new(0,0,0)
Tab4:AddButton({
Name = "Collect flag (Kick Bypass) (Tween)",
Callback = function()
GetHumanPos = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "flag" then
		TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = v.CFrame}):Play()
	 	 wait(5)
		 TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = GetHumanPos}):Play()
            end
        end
    end
end
    })

Tab4:AddButton({
Name = "Collect flag (Kick Bypass) (Teleport)",
Callback = function()
GetHumanPos = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "flag" then
		OrionLib:Teleport(v)
            end
        end
    end
end
    })
--[[
Tab6:AddButton({
Name = "ESP Treasure",
Callback = function()
for i,v in pairs(game:GetService("Workspace").Core.Drops:GetChildren()) do
        if v:IsA("BasePart") then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end
})
]]

Tab5:AddButton({
Name = "Flag Wars V2",
Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/FlagWarsScriptV2/main/CykaBlyat.lua"))()
        -- notify.new("success","Silent Aim","Silent Aim Enabled, bullets will follow the movement of the enemy")
end
})

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Mouse = LocalPlayer:GetMouse()


_G.Raven = {
    Silent = false,
    TeamC = false,
    FovC = true,
    Wallbang = false
}

Tab2:AddToggle({
Name = "Bullet Track",
Default = false,
Callback = function(Value)
     _G.Silent = Value
end
})

Tab2:AddToggle({
Name = "Team Check",
Default = false,
Callback = function(Value)
     _G.TeamC = Value
end
})

Tab2:AddToggle({
Name = "Fov Circle",
Default = false,
Callback = function(Value)
     _G.FovC = Value
end
})

Tab2:AddToggle({
Name = "Wallhack",
Default = false,
Callback = function(Value)
     _G.Wallbang = Value
end
})


_G.Slider = {
    FovRadius = 90,
    FovSides = 64,
    FovT = 5,
    FovColor = Color3.new(1, 1, 0),
    SilentHitbox = "",
    SilentDirec = 50
}

Tab2:AddSlider({
Name = "Fov Size",
Min = 5,
Max = 500,
Default = 90,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Size",
Callback = function(Value)
      _G.FovRadius = Value
end
})

Tab2:AddSlider({
Name = "Fov Sides",
Min = 5,
Max = 64,
Default = 64,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Sides",
Callback = function(Value)
      _G.FovSides = Value
end
})

Tab2:AddSlider({
Name = "Fov Circle Thickness",
Min = 0,
Max = 9,
Default = 5,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Thickness",
Callback = function(Value)
      _G.FovT = Value
end
})

Tab2:AddColorpicker({
Name = "Fov Color",
Default = Color3.fromRGB(255, 0, 0),
Callback = function(Value)
    _G.FovColor = Color3.new(Value)
end  
})

Tab2:AddDropdown({
Name = "Bullet Target",
Default = "",
Options = {'Head', 'UpperTorso', 'LowerTorso'},
Callback = function(Value)
    _G.SilentHitbox = Value
end    
})

Tab2:AddSlider({
Name = "Bullet Prediction",
Min = 0,
Max = 100,
Default = 50,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "% Prediction",
Callback = function(Value)
      _G.SilentDirec = Value
end
})

local silentFovRad = _G.FovRadius
local silentFovColor = _G.FovColor
local silentFovVisible = _G.FovC
local silentNumSides = _G.FovSides
local silentThickness = _G.FovT
local silentAimPart = _G.ilentDirec


local SilentFovCircle = Drawing.new('Circle')
SilentFovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
SilentFovCircle.Radius = silentFovRad
SilentFovCircle.Color = silentFovColor
SilentFovCircle.Filled = false
SilentFovCircle.Visible = silentFovVisible
SilentFovCircle.Transparency = 0.5
SilentFovCircle.NumSides = silentNumSides
SilentFovCircle.Thickness = silentThickness

getgenv().Target = nil
--[[
_G.Raven = {
    Silent = false,
    TeamC = false,
    FovC = false,
    Wallbang = false
}
--]]
local function silentClosetPlayer()
    local MaximumDistance = _G.FovRadius

    for _, v in next, Players:GetPlayers() do
        if v.Name ~= LocalPlayer.Name then
            if _G.TeamC == true then
                if v.Team ~= LocalPlayer.Team then
                    if v.Character ~= nil then
                        if v.Character:FindFirstChild("HumanoidRootPart") then
                            if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                local VectorDistance = (Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                    
                                if VectorDistance < MaximumDistance then
                                    getgenv().Target = v
                                end
                            end
                        end
                    end
                end
            else
                if v.Character ~= nil then
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                            local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                            local VectorDistance = (Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                            
                            if VectorDistance < MaximumDistance then
                                getgenv().Target = v
                            end
                        end
                    end
                end
            end
        end
    end
end


RunService.RenderStepped:Connect(function()
    SilentFovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    SilentFovCircle.Radius = _G.FovRadius
    SilentFovCircle.Filled = false
    SilentFovCircle.Color = _G.FovColor
    SilentFovCircle.Visible = true
    SilentFovCircle.Transparency = 0.5
    SilentFovCircle.NumSides = _G.FovSides
    SilentFovCircle.Thickness = _G.FovT
    silentClosetPlayer()
    if _G.FovC == false or _G.Silent == false then
        SilentFovCircle.Visible = false
    end
end)


--[[
    ######### ESP
]]

--[[
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Color = Color3.new(1,1,1)

ESPContainer:AddToggle('boxesTGL', {Text = 'Boxes', Default = false, Tooltip = 'Toggle the Boxes ESP'})
ESPContainer:AddToggle('tracersTGL', {Text = 'Tracers', Default = false, Tooltip = 'Toggle the Tracers ESP'})
ESPContainer:AddToggle('namesTGL', {Text = 'Names', Default = false, Tooltip = 'Toggle the Names ESP'})
_G.esp = {
    Boxes = false,
    Tracer = false,
    Name = false
    team = false
    color = false
    BoxesC = false
    espcolor = Color3.new(1, 1, 0)
}

ESPConfiguration:AddToggle('teamESPTgl', {Text = 'Team ESP', Default = false, Tooltip = 'Choose if you want ESP on your teammates aswell!'})
ESPConfiguration:AddToggle('teamcolorTgl', {Text = 'Use team color', Default = true, Tooltip = 'Choose if you want to use the team color or not.'})
ESPConfiguration:AddToggle('boxesCameraTgl', {Text = 'Boxes Face Camera', Default = true, Tooltip = 'Choose if you want the boxes to face the camera or not.'})
ESPConfiguration:AddLabel('ESP Color'):AddColorPicker('ESP_Color', {Default = Color3.new(1, 1, 0)})


Toggles.boxesTGL:OnChanged(function()
    ESP.Boxes = Toggles.boxesTGL.Value
end)

Toggles.tracersTGL:OnChanged(function()
    ESP.Tracers = Toggles.tracersTGL.Value
end)

Toggles.namesTGL:OnChanged(function()
    ESP.Names = Toggles.namesTGL.Value
end)


Toggles.teamcolorTgl:OnChanged(function()
    ESP.TeamColor = Toggles.teamcolorTgl.Value
end)

Toggles.boxesCameraTgl:OnChanged(function()
    ESP.FaceCamera = Toggles.boxesCameraTgl.Value
end)

Options.ESP_Color:OnChanged(function()
    ESP.Color = Options.ESP_Color.Value
end)

Toggles.teamESPTgl:OnChanged(function()
    ESP.TeamMates = Toggles.teamESPTgl.Value
end)


--[[
    ########## MISC ###########




local MiscLeftGroupBox = Tabs.MiscTab:AddLeftGroupbox("Misc Toggles")
local MiscRightGroupBox = Tabs.MiscTab:AddRightGroupbox("Misc Configuration")

MiscLeftGroupBox:AddToggle('WSToggle', {Text = "Walkspeed", Default = false, Tooltip = 'Modify your walkspeed.'})
MiscLeftGroupBox:AddToggle('JPToggle', {Text = "Jump Power", Default = false, Tooltip = 'Modify your jump power!' })
MiscLeftGroupBox:AddToggle('GravityToggle', {Text = 'Gravity Changer', Default = false, Tooltip = 'Changes the game gravity',})
MiscLeftGroupBox:AddToggle('infJump', {Text = 'Infinite Jump', Default = false})


MiscRightGroupBox:AddSlider('WSlider', {Text = 'WalkSpeed', Default = 24, Min = 5, Max = 1000, Rounding = 0, Compact = false,})
MiscRightGroupBox:AddSlider('JPSlider', {Text = 'JumpPower', Default = 24, Min = 5, Max = 1000, Rounding = 0, Compact = false})
MiscRightGroupBox:AddSlider('GravSlider', {Text = 'Gravity', Default = 196, Min = 5, Max = 1000, Rounding = 0, Compact = false})



Toggles.WSToggle:OnChanged(function()
    if Toggles.WSToggle.Value == false then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

Options.WSlider:OnChanged(function()
    if Toggles.WSToggle.Value == false then return end
    LocalPlayer.Character.Humanoid.WalkSpeed = Options.WSlider.Value
end)

Toggles.JPToggle:OnChanged(function()
    if Toggles.JPToggle.Value == false then
        LocalPlayer.Character.Humanoid.JumpPower = 55
    end
end)

Options.JPSlider:OnChanged(function()
    if Toggles.JPToggle.Value == false then return end
    LocalPlayer.Character.Humanoid.JumpPower = Options.JPSlider.Value
end)


Toggles.GravityToggle:OnChanged(function()
    if Toggles.GravityToggle.Value == false then
        game.Workspace.Gravity = 196.2
    end
end)

Options.GravSlider:OnChanged(function()
    if Toggles.GravityToggle.Value == false then return end
    if Toggles.GravityToggle.Value == true then
        game.Workspace.Gravity = Options.GravSlider.Value
    end
end)

UserInputService.JumpRequest:connect(function()
	if Toggles.infJump.Value then
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
	end
end)


local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('MyScriptHub')
ThemeManager:ApplyToTab(Tabs['UI Settings'])
--]]

--[[
    ###### Hooks
]]

local old
old = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    if Self.Name == "Shoot" and getgenv().Target ~= nil and _G.Silent == true then
        local base = getgenv().Target.Character[_G.SilentHitbox]
        local velocity = base.AssemblyLinearVelocity
        local aimpos = base.Position + (velocity * Vector3.new(_G.SilentDirec / 200, 0, _G.SilentDirec / 200))
        Args[3] = aimpos
        if _G.Wallbang == true then
            Args[2] = getgenv().Target.Character[_G.SilentHitbox].Position
        end
        return old(Self, unpack(Args))
    end
    return old(Self, unpack(Args))
end)
