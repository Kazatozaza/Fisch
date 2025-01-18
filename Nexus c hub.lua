local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(unpack(args))

workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Moosewood Shipwright"):WaitForChild("shipwright"):WaitForChild("giveUI"):InvokeServer()




local Player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer
local Char = LocalPlayer.Character
local Humanoid = Char.Humanoid
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HR = Char:WaitForChild("HumanoidRootPart")
local StandHR = HR.CFrame

-- Initialize global variables
_G.AutoCast = false
_G.AutoShake = false
_G.AutoReel = false

-- Equip item function
equipitem = function(v)
    if LocalPlayer.Backpack:FindFirstChild(v) then
        local Eq = LocalPlayer.Backpack:FindFirstChild(v)
        LocalPlayer.Character.Humanoid:EquipTool(Eq)
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
if not Fluent then
    warn("Unable to load Fluent library")
    return
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fisch " .. Fluent.Version,
    SubTitle = "Nexus c Hub (BETA)",
    TabWidth = 160,
    Size = UDim2.fromOffset(550, 320),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})


local Tabs = {
    h = Window:AddTab({ Title = "Home", Icon = "home" }),
    m = Window:AddTab({ Title = "Main", Icon = "layers" }),
    T = Window:AddTab({ Title = "Teleport", Icon = "map" }),
    S = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options
    Fluent:Notify({
        Title = "Welcome in Nexus c Hub",
        Content = "This is a Good",
        SubContent = "Enjoin",
        Duration = 5
    })


 Tabs.h:AddParagraph({
        Title = "Discord Nexus c Hub",
        Content = "https://discord.gg/ZBnfCJGjpS"
    })


    Tabs.h:AddParagraph({
        Title = "Welcome in Nexus c Hub",
        Content = "ยินดีต้อนรับสู่ Nexus c Hub"
    })

    Tabs.h:AddParagraph({
        Title = "Our script is good, has many functions, and is very abundant.",
        Content = "สคริปต์ของเรานั้นดี มีฟังก์ชั่นมากมาย และมีมากมาย"
    })

    Tabs.h:AddSection("Updates:")

    Tabs.h:AddParagraph({Title = "🟢 Make the strip in English"})
    Tabs.h:AddParagraph({Title = "🟢 Status"})
    Tabs.h:AddParagraph({Title = "🟢 Thai people's camp"})
    Tabs.h:AddParagraph({Title = "🟢 Both Thai and English"})




    

    Tabs.T:AddParagraph({
        Title = "Rod",
        Content = "This is a paragraph.\nSecond line!"
    })


    
    local Dropdown = Tabs.T:AddDropdown("Dropdown", {
    Title = "Teleport To Rod",
    Values = {"Aurora Rod", "King Rod", "Magma Rod", "Phoenix Rod", "Stone Rod", "Lost Rod", "Magnet Rod", "Fortune,Steady,Rapid Rod", "Nocturmal Rod", "Scurvy Rod", "Summit Rod"},
    Multi = false,
    Default = 1,
    Callback = function(selectedIsland)
        _G.SelectIsland = selectedIsland  -- Store selected island
    end})
    
    
    
    
    Tabs.T:AddButton({
    Title = "Tp to ",
    Description = "Tp still chooses the hook",
    Callback = function()
        local teleportPositions = {

			["Aurora Rod"] = CFrame.new(-143.675491, -515.174438, 1134.36584, 1, 4.62639882e-08, -1.11728809e-13, -4.62639882e-08, 1, -1.10674003e-08, 1.11216781e-13, 1.10674003e-08, 1),
			["King Rod"] = CFrame.new(1380.64294, -807.231201, -303.966217, 0.937741578, -7.10844219e-08, 0.347333759, 9.06376698e-08, 1, -4.00487643e-08, -0.347333759, 6.90369149e-08, 0.937741578),
			["Magma Rod"] = CFrame.new(-1845.7041, 165.711121, 161.101517, 0.458963871, -4.26035207e-08, 0.888454914, 8.78610251e-08, 1, 2.56454591e-09, -0.888454914, 7.68835235e-08, 0.458963871),
			["Phoenix Rod"] = CFrame.new(5966.42041, 269.624603, 850.606506, -0.286954194, -5.93748695e-09, -0.957944274, 1.3181304e-08, 1, -1.01466417e-08, 0.957944274, -1.55385766e-08, -0.286954194),
			["Stone Rod"] = CFrame.new(5502.1001, 146.772522, -313.5, 1, 1.01134617e-07, -3.21842189e-13, -1.01134617e-07, 1, -2.89761068e-08, 3.18911699e-13, 2.89761068e-08, 1),
			["Lost Rod"] = CFrame.new(2881.84521, 138.343536, 2723.08081, 1, 3.21215765e-08, -3.05145822e-14, -3.21215765e-08, 1, -9.20087651e-09, 3.02190354e-14, 9.20087651e-09, 1),
			["Magnet Rod"] = CFrame.new(-198.589691, 132.500015, 1931.30835, -0.0117938276, 9.73190328e-09, -0.999930441, 4.9454929e-08, 1, 9.14927689e-09, 0.999930441, -4.93435834e-08, -0.0117938276),
			["Fortune,Steady,Rapid Rod"] = CFrame.new(-1514.63843, 141.534821, 764.45813, 0.320215464, 1.18174839e-08, 0.94734472, 4.97088948e-08, 1, -2.92766078e-08, -0.94734472, 5.64662805e-08, 0.320215464),
			["Nocturmal Rod"] = CFrame.new(-143.561478, -515.299377, 1142.84412, 1, -1.52688386e-08, -7.23463122e-15, 1.52688386e-08, 1, 7.28071541e-08, 6.12295045e-15, -7.28071541e-08, 1),
			["Scurvy Rod"] = CFrame.new(-2826.44922, 214.863617, 1512.73718, 0.826562762, 6.84535024e-08, -0.562844515, -1.87346512e-08, 1, 9.41079392e-08, 0.562844515, -6.72414231e-08, 0.826562762),
			["Summit Rod"] = CFrame.new(),
        }
        local targetPosition = teleportPositions[_G.SelectIsland]
        if targetPosition then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPosition
        else
            warn("Invalid island selected")
        end
    end
})


    

    


    

    

























     Tabs.m:AddParagraph({
        Title = "Auto Farm",
        Content = "This is a Farm.\nSo Pro"
    })


    





    local AutoCastToggle = Tabs.m:AddToggle("AutoCast", { Title = "AutoCast", Default = false })
AutoCastToggle:OnChanged(function(state)
    _G.AutoCast = state
    spawn(function()
        while _G.AutoCast do
            wait(0.1)
            pcall(function()
                local Rod = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if Rod and Rod:FindFirstChild("events") then
                    Rod.events.cast:FireServer(100, 1)
                end
            end)
        end
    end)
end)



    local AutoShakeToggle = Tabs.m:AddToggle("AutoShake", { Title = "AutoShake", Default = false })
AutoShakeToggle:OnChanged(function(state)
    _G.AutoShake = state
    spawn(function()
        while _G.AutoShake do
            wait(0.01)
            pcall(function()
                local GUI = LocalPlayer:WaitForChild("PlayerGui")
                local shakeui = GUI:FindFirstChild("shakeui")
                if shakeui and shakeui.Enabled then
                    local safezone = shakeui:FindFirstChild("safezone")
                    if safezone then
                        local button = safezone:FindFirstChild("button")
                        if button and button:IsA("ImageButton") and button.Visible then
                            GuiService.SelectedCoreObject = button
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end
                    end
                end
            end)
        end
    end)
end)

local AutoReelToggle = Tabs.m:AddToggle("AutoReel", { Title = "AutoReel", Default = false })
AutoReelToggle:OnChanged(function(state)
    _G.AutoReel = state
    spawn(function()
        while _G.AutoReel do
            wait(0.15)
            pcall(function()
                for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                    if v:IsA("ScreenGui") and v.Name == "reel" then
                        if v:FindFirstChild("bar") then
                            ReplicatedStorage.events.reelfinished:FireServer(100, true)
                        end
                    end
                end
            end)
        end
    end)
end)





Tabs.m:AddParagraph({
        Title = "Sell Fisch",
        Content = "This is a Sell.\nSo Pro"
    })

  Tabs.m:AddButton({
        Title = "Sell",
        Description = "Sell Fish",
        Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("Sell"):InvokeServer()
        end
})  

Tabs.m:AddButton({
        Title = "Sell All",
        Description = "Sell Fish All",
        Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("SellAll"):InvokeServer()   
        end
})


local section = Tabs.T:AddSection("Island")
local TeleportDropdown = Tabs.T:AddDropdown("Dropdown", {
    Title = "Teleport Island",
    Values = {"moosewood", "mushgrove", "Snowcap", "Terrapin", "Roslit", "Sunstone", "Statue", "Desolate", "Desolate Shop", "Brine Pool", "Forsaken", "Ancient", "Mirror", "Depths", "Vertigo", "The Arch", "Birch", "Lava Pool", "DeepOcean", "Gamma", "Lantern", "northexp", "winter", "leverpuzzle", "thedepthsobby", "icepuzzle", "altar", "ancientarehivesentra", "northglider", "finelpzzle"},
    Multi = false,
    Default = 1,
    Callback = function(selectedIsland)
        _G.SelectIsland = selectedIsland  -- Store selected island
    end
})

Tabs.T:AddButton({
    Title = "Select Island",
    Description = "วาร์ปไปยังเกาะ [ Select Island ]",
    Callback = function()
        local teleportPositions = {
            moosewood = CFrame.new(409.2667, 152.4324, 251.9602), --ใช้ได้
            mushgrove = CFrame.new(2406.70825, 138.54837, -750.51001, 0.552255571, 1.88859346e-08, 0.833674848, 2.8295954e-08, 1, -4.13980743e-08, -0.833674848, 4.64519445e-08, 0.552255571),
            Snowcap = CFrame.new(2599.12769, 135.283859, 2414.37671, 0.802532911, -8.18404118e-08, 0.596607864, 5.14819192e-08, 1, 6.7924816e-08, -0.596607864, -2.37973818e-08, 0.802532911),
            Terrapin = CFrame.new(-188.042267, 143.574158, 1921.93018, 1, -1.26847652e-08, 1.47976554e-14, 1.26847652e-08, 1, -6.80280294e-08, -1.39347355e-14, 6.80280294e-08, 1),
            Roslit = CFrame.new(-1446.406, 134.9541, 702.1841), --ใช้ได้
            Sunstone = CFrame.new(-931.006104, 131.098419, -1113.0459, -0.995250821, -1.10196893e-07, 0.0973437801, -1.08468534e-07, 1, 2.30471073e-08, -0.0973437801, 1.23789148e-08, -0.995250821),
            ["Statue"] = CFrame.new(35.43993, 144.493347, -1023.21643, 1, 3.25180274e-08, 7.12731794e-13, -3.25180274e-08, 1, 3.77578822e-08, -7.11503989e-13, -3.77578822e-08, 1),
            Desolate = CFrame.new(-1657.3175, -214.182587, -2844.28882, 1, -1.77927966e-08, -2.00143298e-14, 1.77927966e-08, 1, 7.70572655e-08, 1.86432663e-14, -7.70572655e-08, 1),
            ["Desolate Shop"] = CFrame.new(-975.452271, -244.911102, -2700.35352, 1, -2.04956923e-08, -2.86618229e-14, 2.04956923e-08, 1, 4.78872479e-08, 2.76803405e-14, -4.78872479e-08, 1),
            ["Brine Pool"] = CFrame.new(-1795.94275, -142.694168, -3309.14136, 1, -2.05508837e-08, -1.65238544e-14, 2.05508837e-08, 1, 4.80140869e-08, 1.5537122e-14, -4.80140869e-08, 1),
            Forsaken = CFrame.new(-2513.07617, 137.249985, 1558.89001, 1, 2.12126139e-09, -1.8347928e-14, -2.12126139e-09, 1, -4.95564967e-09, 1.83374163e-14, 4.95564967e-09, 1),
            Ancient = CFrame.new(6067.7998, 195.180161, 298.299988, 1, 1.3498479e-09, -1.96095327e-14, -1.3498479e-09, 1, -3.15319482e-09, 1.96052772e-14, 3.15319482e-09, 1),
            Mirror = CFrame.new(-1629.14648, -206.72789, -2784.29346, 1, 3.71187099e-08, -2.00447433e-14, -3.71187099e-08, 1, -8.66998846e-08, 1.68265551e-14, 8.66998846e-08, 1),
            Depths = CFrame.new(951.447571, -711.662109, 1228.91492, 0.0379682481, 5.89755942e-08, 0.999278963, -3.19703943e-08, 1, -5.78034154e-08, -0.999278963, -2.97526466e-08, 0.0379682481),
            Vertigo = CFrame.new(-128.429016, -515.299377, 1143.78406, 1, 6.42008047e-08, 2.42750884e-14, -6.42008047e-08, 1, 3.24002372e-08, -2.21949669e-14, -3.24002372e-08, 1),
            ["The Arch"] = CFrame.new(986.63739, 131.320236, -1232.63379, 1, -1.7053372e-08, 2.56333905e-14, 1.7053372e-08, 1, -8.60560956e-09, -2.54866352e-14, 8.60560956e-09, 1),
            ["Birch"] = CFrame.new(1749.58582, 142.719849, -2447.00928, 1, -2.12103544e-08, -1.83966696e-14, 2.12103544e-08, 1, 8.37935374e-08, 1.66193793e-14, -8.37935374e-08, 1),
            ["Lava Pool"] = CFrame.new(-1916.48511, 171.353424, 292.950073, 1, 1.31992806e-09, -1.62581643e-15, -1.31992806e-09, 1, -5.2153335e-09, 1.61893248e-15, 5.2153335e-09, 1),
            ["DeepOcean"] = CFrame.new(1447.84985, 133.499985, -7649.646, -0.993914783, -6.79947618e-08, -0.110151678, -6.69607161e-08, 1, -1.30866331e-08, 0.110151678, -5.6311622e-09, -0.993914783),
            ["Gamma"] = CFrame.new(2231.77661, -792.232239, 1010.43512, -0.997153223, 6.75005083e-08, -0.0754022002, 6.62116832e-08, 1, 1.95924645e-08, 0.0754022002, 1.45441819e-08, -0.997153223),
            ["Lantern"] = CFrame.new(-39.3259048, -246.569992, 202.68074, -0.997153461, -6.99495217e-08, -0.0753985867, -6.92824642e-08, 1, -1.14627312e-08, 0.0753985867, -6.20630258e-09, -0.997153461),
			["northexp"] = CFrame.new(19532.1426, 132.67009, 5302.52295, -0.24021855, -8.39395327e-08, -0.970718801, -6.63753355e-08, 1, -7.00459708e-08, 0.970718801, 4.76054467e-08, -0.24021855),
			["winter"] = CFrame.new(20.7549992, 364.885773, -9577.23828, 1, 5.82493769e-08, 4.03722384e-13, -5.82493769e-08, 1, 3.3086998e-08, -4.01795079e-13, -3.3086998e-08, 1),
			["leverpuzzle"] = CFrame.new(19955.6719, 586.85376, 5571.53564, -0.457844615, -6.47826326e-08, -0.889032245, -6.23825755e-08, 1, -4.07421759e-08, 0.889032245, 3.68065329e-08, -0.457844615),
			["thedepthsobby"] = CFrame.new(66.9929199, -704.968567, 1230.84851, 0.132269144, -5.66858382e-09, -0.991213858, 6.3842819e-08, 1, 2.80045676e-09, 0.991213858, -6.36523012e-08, 0.132269144),
			["icepuzzle"] = CFrame.new(19232.7324, 395.872131, 6010.3457, -0.457844615, 9.45085574e-08, -0.889032245, 9.69466711e-08, 1, 5.63782088e-08, 0.889032245, -6.03762587e-08, -0.457844615),
			["altar"] = CFrame.new(1296.3208, -805.292236, -298.940491, 0.0734660551, -1.82757343e-09, -0.997297704, 2.95960074e-08, 1, 3.47667978e-10, 0.997297704, -2.9541571e-08, 0.0734660551),
			["ancientarehivesentra"] = CFrame.new(5948.79053, 154.925903, 482.23584, 0.764405012, -2.2798103e-08, 0.64473635, 1.85266362e-08, 1, 1.33950087e-08, -0.64473635, 1.70558401e-09, 0.764405012),
			["northglider"] = CFrame.new(20240.8633, 756.525818, 5756.46631, -0.457844615, -1.65319296e-08, -0.889032245, -8.67763639e-09, 1, -1.4126508e-08, 0.889032245, 1.24695332e-09, -0.457844615),
			["finelpzzle"] = CFrame.new(19963.9727, 1137.8894, 5401.83545, -0.457844615, -7.74529418e-09, -0.889032245, -6.86526107e-08, 1, 2.66435052e-08, 0.889032245, 7.32329752e-08, -0.457844615),
        }
        local targetPosition = teleportPositions[_G.SelectIsland]
        if targetPosition then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPosition
        else
            warn("Invalid island selected")
        end
    end
	--ฟังชั้นสำหรับตัวเลือกของการวาป
})



    Tabs.Settings:AddButton({
    Title = "Boost FPS",
    Callback = function()
        local function FPSBooster()
            local decalsyeeted = true
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain

            pcall(function() sethiddenproperty(l, "Technology", 2) end)
            pcall(function() sethiddenproperty(t, "Decoration", false) end)
            
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            pcall(function() settings().Rendering.QualityLevel = "Level01" end)

            for _, v in pairs(g:GetDescendants()) do
                pcall(function()
                    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    elseif v:IsA("MeshPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                        v.TextureID = 10385902758728957
                    end
                end)
            end

            for _, e in pairs(l:GetChildren()) do
                pcall(function()
                    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                        e.Enabled = false
                    end
                end)
            end

            print("FPS Booster Applied.")
        end

        local success, errorMsg = pcall(FPSBooster)
        if not success then
            warn("Error occurred in FPSBooster: " .. errorMsg)
        end
    end
})











-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

