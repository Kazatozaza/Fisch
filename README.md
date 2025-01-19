game.Players.localPlayer.PlayerGui.Main.Stats.CanvasGroup.Melee.Value.Text = 500

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Nexus Hub",
   Icon = 0,
   LoadingTitle = "Nexus Hub",
   LoadingSubtitle = "Nexus Hub",
   Theme = "Bloom",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Nexus Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Nexus Hub",
      Subtitle = "Key System",
      Note = "⁠Executor Cy xZ !⁠【💬】・𝗖𝗛𝗔𝗧",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})


local AutoFarm = Window:CreateTab("Boss", nil)

-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end


createToggle(AutoFarm, "autoClick", function(V)
    print("AutoClick Toggle: " .. tostring(V))
    if V then

    end
end)



createToggle(AutoFarm, "Six kagayno [Lv.1500]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Six kagayno [Lv.1500]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)





local AutoFarm = Window:CreateTab("Main", nil)


local function createToggle(tab, name, callback) 
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- แสดงสถานะ Toggle
            callback(Value) -- เรียกใช้ callback เพื่อจัดการสถานะ
        end,
    })
end


-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end



createToggle(AutoFarm, "Bandit [Lv.1]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Bandit [Lv.1]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)



-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end



createToggle(AutoFarm, "Bandit Boss [Lv.25]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Bandit Boss [Lv.25]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)



-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Kraken [Lv.100]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Kraken [Lv.100]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)



-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Kung [Lv.700]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Kung [Lv.700]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)




-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Savage [Lv.150]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Savage [Lv.150]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)





-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Shadow [Lv.450]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Shadow [Lv.450]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)




-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Shadow God [Lv.500]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Shadow God [Lv.500]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)




-- ฟังก์ชันสำหรับสร้าง Toggle
local function createToggle(tab, name, callback)
    return tab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = name,
        Callback = function(Value)
            print(name .. " : " .. tostring(Value)) -- จะพิมพ์ในกรณีที่คลิกเปิดหรือปิด
            callback(Value)
        end,
    })
end

createToggle(AutoFarm, "Villagers [Lv.300]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Villagers [Lv.300]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)


createToggle(AutoFarm, "Asta [Lv.450]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Asta [Lv.450]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)


createToggle(AutoFarm, "wade [Lv.400]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "wade [Lv.400]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)




createToggle(AutoFarm, "Do [Lv.225]", function(V)
    print("Melee Selective Toggle: " .. tostring(V))
    
    local farmingActive = V
    local selectedMonsters = {}
    local currentTargetMonster = nil

    if V then
        -- ฟังก์ชันเลือกมอนสเตอร์
        local function selectMonsters()
            selectedMonsters = {}
            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                    if obj.Name == "Do [Lv.225]" then
                        table.insert(selectedMonsters, obj)
                        print("เลือกมอนสเตอร์: " .. obj.Name)
                    end
                end
            end
        end

        -- ฟังก์ชันสำหรับเคลื่อนที่ไปหามอนสเตอร์และโจมตี
        local bodyPosition = nil
        local function moveToMonsterAndFloat(character, monster)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and monsterHRP then
                if not bodyPosition then
                    bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyPosition.D = 1000
                    bodyPosition.P = 10000
                    bodyPosition.Parent = humanoidRootPart
                end

                bodyPosition.Position = monsterHRP.Position + Vector3.new(0, 4, 0) -- ลอยขึ้น
                humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, monsterHRP.Position)
            end
        end

        -- เริ่มฟาร์ม
        coroutine.wrap(function()
            while farmingActive do
                if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                    -- เลือกมอนสเตอร์ใหม่
                    selectMonsters()
                    if #selectedMonsters > 0 then
                        currentTargetMonster = selectedMonsters[1]
                    else
                        print("ไม่พบมอนสเตอร์ที่จะฟาร์ม")
                        break
                    end
                end

                if currentTargetMonster then
                    moveToMonsterAndFloat(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
                wait(0.1)
            end
            if bodyPosition then bodyPosition:Destroy() end -- ลบ BodyPosition เมื่อสิ้นสุด
        end)()
    else
        farmingActive = false -- หยุดการฟาร์ม
    end
end)




local AutoFarm = Window:CreateTab("Teleport", nil)


-- ตั้งค่าการเชื่อมโยงปุ่ม Teleport
createToggle(AutoFarm, "Kung Lv.700", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-999.582397, 36.8905754, -1551.56238)
    end
end)

createToggle(AutoFarm, "Event", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52.9493446, 243.331482, 1059.41846)
    end
end)

createToggle(AutoFarm, "Villagers Lv300", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.338684, 28.3464279, 199.77359)
    end
end)

createToggle(AutoFarm, "Shopping Island", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(861.83551, 18.4624214, 392.129822)
    end
end)

createToggle(AutoFarm, "Startup Village", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(368.922516, 33.775032, -573.300781)
    end
end)

createToggle(AutoFarm, "Desert", function(V)
    if V then
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1385.73425, 20.4297142, -406.426605)
    end
end)

