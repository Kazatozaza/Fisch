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
    b = Window:AddTab({ Title = "Boost FPS", Icon = "rocket" }),
    S = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    R = Window:AddTab({ Title = "Rod", Icon = "radio" }),
    p = Window:AddTab({ Title = "Script Help", Icon = "codesandbox" }),
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


     Tabs.p:AddButton({
        Title = "script infinite yield",
        Description = "Very script op",
        Callback = function()
            Window:Dialog({
                Title = "Run script ?",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                        end
                    }
                }
            })
        end
    })

    Tabs.p:AddButton({
        Title = "script Dex",
        Description = "Very script op",
        Callback = function()
            Window:Dialog({
                Title = "Run script ?",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/RezWare-SoftWare/Dex/refs/heads/main/Dex.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/RezWare-SoftWare/Dex/refs/heads/main/Dex.lua"))()
                        end
                    }
                }
            })
        end
    })


    

    Tabs.R:AddParagraph({
        Title = "Rod",
        Content = "This is a paragraph.\nSecond line!"
    })


    
    local Dropdown = Tabs.R:AddDropdown("Dropdown", {
    Title = "Teleport To Rod",
    Values = {"Aurora Rod", "King Rod", "Magma Rod", "Phoenix Rod", "Stone Rod", "Lost Rod", "Magnet Rod", "Fortune,Steady,Rapid Rod", "Nocturmal Rod", "Scurvy Rod", "Summit Rod"},
    Multi = false,
    Default = 1,
    Callback = function(selectedIsland)
        _G.SelectIsland = selectedIsland  -- Store selected island
    end})
    
    
    
    
    Tabs.R:AddButton({
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

Tabs.T:AddButton({
        Title = "ancientarchives",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3155.02197265625, -754.818115234375, 2193.138916015625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3155.02197265625, -754.818115234375, 2193.138916015625)
                        end
                    }
                }
            })
        end
    })


    Tabs.T:AddButton({
        Title = "crafting",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3159.9951171875, -745.614013671875, 1684.16796875)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3159.9951171875, -745.614013671875, 1684.16796875)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "enchant",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1296.3192138671875, -805.292236328125, -298.9383239746094)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1296.3192138671875, -805.292236328125, -298.9383239746094)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "arch",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(998.9667358398438, 131.3202362060547, -1237.1358642578125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(998.9667358398438, 131.3202362060547, -1237.1358642578125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "deepshop",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-979.1965942382812, -244.91102600097656, -2699.8720703125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-979.1965942382812, -244.91102600097656, -2699.8720703125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "skike",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1254.6361083984375, 137.58041381835938, 1554.234130859375)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1254.6361083984375, 137.58041381835938, 1554.234130859375)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "mushgrove",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2501.437744140625, 131.00003051757812, -720.5362548828125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2501.437744140625, 131.00003051757812, -720.5362548828125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "snow",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2648.763671875, 142.28382873535156, 2521.136474609375)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2648.763671875, 142.28382873535156, 2521.136474609375)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "ancientarchivesentranc",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5948.79052734375, 154.9259033203125, 482.23583984375)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5948.79052734375, 154.9259033203125, 482.23583984375)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "leverpuzzle",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19955.671875, 586.853759765625, 5571.53564453125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19955.671875, 586.853759765625, 5571.53564453125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "merlin",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-949.0145874023438, 222.05545043945312, -985.9754028320312)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-949.0145874023438, 222.05545043945312, -985.9754028320312)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "thedepthsobby",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(66.99270629882812, -704.9685668945312, 1230.847900390625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(66.99270629882812, -704.9685668945312, 1230.847900390625)

                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "snowcap",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2649.062255859375, 142.2838134765625, 2521.463134765625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2649.062255859375, 142.2838134765625, 2521.463134765625)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "archive",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3157.53515625, -754.8175659179688, 2214.502197265625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3157.53515625, -754.8175659179688, 2214.502197265625)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "ancient",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6056.05322265625, 192.17486572265625, 278.5668029785156)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6056.05322265625, 192.17486572265625, 278.5668029785156)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "campl",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20208.041015625, 208.42010498046875, 5278.67578125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20208.041015625, 208.42010498046875, 5278.67578125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "icepuzzle",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19232.732421875, 395.87213134765625, 6010.345703125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19232.732421875, 395.87213134765625, 6010.345703125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "forsaken",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2468.62890625, 133.00001525878906, 1558.064697265625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2468.62890625, 133.00001525878906, 1558.064697265625)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "northglider",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20256.119140625, 756.5258178710938, 5762.79931640625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20256.119140625, 756.5258178710938, 5762.79931640625)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "depthsmazeend",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1699.4168701171875, -902.5270385742188, 1434.3133544921875)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1699.4168701171875, -902.5270385742188, 1434.3133544921875)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "camp2",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19756.58984375, 415.43707275390625, 5406.69970703125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19756.58984375, 415.43707275390625, 5406.69970703125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "wilson",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2939.0634765625, 277.43341064453125, 2567.221923828125)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2939.0634765625, 277.43341064453125, 2567.221923828125)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "moosewood",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(382.2232666015625, 134.50051879882812, 243.6979217529297)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(382.2232666015625, 134.50051879882812, 243.6979217529297)
                        end
                    }
                }
            })
        end
    })


        Tabs.T:AddButton({
        Title = "vertigo",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-112.00727844238281, -515.2993774414062, 1040.327880859375) 
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-112.00727844238281, -515.2993774414062, 1040.327880859375) 
                        end
                    }
                }
            })
        end
    })

















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


SaveManager:LoadAutoloadConfig()





 Tabs.S:AddParagraph({
        Title = "Shop",
        Content = "This is a buy.\nSecond line!"
    })




Tabs.S:AddButton({
        Title = "mirror Area",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1626.30712890625, -206.72792053222656, -2791.191162109375)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1626.30712890625, -206.72792053222656, -2791.191162109375)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Clarence",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1625.3936767578125, -231.0738525390625, -2903.8525390625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1625.3936767578125, -231.0738525390625, -2903.8525390625)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Inn Keeper DesolateDee",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1651.9581298828125, -214.18551635742188, -2833.086669921875)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1651.9581298828125, -214.18551635742188, -2833.086669921875)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Desolate Skin Merchant",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1566.3424072265625, -285.0821533203125, -2964.137451171875)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1566.3424072265625, -285.0821533203125, -2964.137451171875)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Sleeper",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1498.0302734375, -234.7189178466797, -2852.490478515625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1498.0302734375, -234.7189178466797, -2852.490478515625)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Mel Merchant",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1658.434326171875, -213.48670959472656, -2819.473388671875)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1658.434326171875, -213.48670959472656, -2819.473388671875)
                        end
                    }
                }
            })
        end
    })

        Tabs.S:AddButton({
        Title = "Roddy",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1004.0133056640625, -244.9102783203125, -2737.48291015625)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1004.0133056640625, -244.9102783203125, -2737.48291015625)
                        end
                    }
                }
            })
        end
    })



        Tabs.S:AddButton({
        Title = "Maverick Merchant",
        Description = "NPC",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-982.96435546875, -244.22897338867188, -2692.517333984375)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-982.96435546875, -244.22897338867188, -2692.517333984375)
                        end
                    }
                }
            })
        end
    })



    Tabs.b:AddButton({
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

























