local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nexus Hub" .. Fluent.Version,
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    main = Window:AddTab({ Title = "Main", Icon = "" }),
    Main = Window:AddTab({ Title = "Event", Icon = "" }),
    Portal = Window:AddTab({ Title = "Portal", Icon = "" }),
    Teleport = Window:AddTab({ Title = "Teleport ", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "Notification",
    Content = "This is a notification",
    SubContent = "SubContent", -- Optional
    Duration = 5
})

Tabs.Main:AddParagraph({
    Title = "Auto Farm",
    Content = "รออัพเดตหน้า!!"
})

Tabs.Teleport:AddButton({
    Title = "Kung Lv.700",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-999.582397, 36.8905754, -1551.56238)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-999.582397, 36.8905754, -1551.56238)
                    end
                }
            }
        })
    end
})


Tabs.Teleport:AddButton({
    Title = "Event",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52.9493446, 243.331482, 1059.41846)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52.9493446, 243.331482, 1059.41846)
                    end
                }
            }
        })
    end
})



Tabs.Teleport:AddButton({
    Title = "Villagers Lv300",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.338684, 28.3464279, 199.77359)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.338684, 28.3464279, 199.77359)
                    end
                }
            }
        })
    end
})



Tabs.Teleport:AddButton({
    Title = "Shopping Island",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(861.83551, 18.4624214, 392.129822)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(861.83551, 18.4624214, 392.129822)
                    end
                }
            }
        })
    end
})




Tabs.Teleport:AddButton({
    Title = "Startup Village",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(368.922516, 33.775032, -573.300781)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(368.922516, 33.775032, -573.300781)
                    end
                }
            }
        })
    end
})




Tabs.Teleport:AddButton({
    Title = "Desert",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1385.73425, 20.4297142, -406.426605)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1385.73425, 20.4297142, -406.426605)
                    end
                }
            }
        })
    end
})



local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local backpack = player.Backpack -- กระเป๋าเก็บอาวุธ
local runService = game:GetService("RunService")

-- ฟังก์ชันดึงรายการอาวุธที่ตัวละครมี
local function getAvailableWeapons()
    local weapons = {}
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(weapons, item.Name)
        end
    end
    return weapons
end

-- สร้าง Dropdown เมนู
local weaponDropdown = Tabs.main:AddDropdown("weaponDropdown", {
    Title = "Select Tool",
    Values = getAvailableWeapons(),
    Multi = false,
    Default = nil,
})

-- ตัวแปรเก็บอาวุธที่เลือกและสถานะการโจมตี
local selectedWeapon
local isToggleActive = false

-- อัปเดต Dropdown เมื่ออาวุธใน Backpack เปลี่ยนแปลง
local function updateWeaponDropdown()
    weaponDropdown:SetValues(getAvailableWeapons())
end
backpack.ChildAdded:Connect(updateWeaponDropdown)
backpack.ChildRemoved:Connect(updateWeaponDropdown)

-- อัปเดตตัวเลือกเมื่อมีการเปลี่ยนแปลง
weaponDropdown:OnChanged(function(Value)
    selectedWeapon = Value
    print("เลือกอาวุธ:", selectedWeapon)
end)

-- ฟังก์ชันถืออาวุธ
local function equipWeapon(weaponName)
    local weapon = backpack:FindFirstChild(weaponName)
    if weapon and not weapon:IsDescendantOf(character) then
        weapon.Parent = character
        print("ถืออาวุธ:", weaponName)
    end
end

-- ฟังก์ชันโจมตี
local function performAttack()
    while isToggleActive do
        local weapon = character:FindFirstChild(selectedWeapon)
        if weapon and weapon:FindFirstChild("A") and weapon.A:FindFirstChild("RemoteEvent") then
            local args = {CFrame.new(0, 0, 0)} -- อัปเดตค่า CFrame ตามความต้องการ
            weapon.A.RemoteEvent:FireServer(unpack(args))
        else
            warn("ไม่พบอาวุธที่ใช้โจมตีหรือ RemoteEvent!")
            isToggleActive = false
            break
        end
        task.wait() -- ปรับความเร็วการโจมตี
    end
end

-- สร้าง Toggle สำหรับการตี
local attackToggle = Tabs.main:AddToggle("AttackToggle", {Title = "Attack", Default = false})

-- การทำงานของ Toggle
attackToggle:OnChanged(function()
    isToggleActive = attackToggle.Value
    if isToggleActive and selectedWeapon then
        equipWeapon(selectedWeapon)
        task.spawn(performAttack)
    else
        -- หยุดและเก็บอาวุธ
        isToggleActive = false
    end
end)

-- ตรวจสอบว่าอาวุธถูกถือหรือไม่
runService.RenderStepped:Connect(function()
    if isToggleActive and selectedWeapon then
        local weaponEquipped = character:FindFirstChild(selectedWeapon)
        if not weaponEquipped then
            equipWeapon(selectedWeapon)
        end
    end
end)






local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Bandit [Lv.1]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Bandit [Lv.1]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)
   



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Bandit Boss [Lv.25]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Bandit Boss [Lv.25]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)


local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Kraken [Lv.100]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Kraken [Lv.100]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Savage [Lv.150]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Savage [Lv.150]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Do [Lv.225]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Do [Lv.225]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Villagers [Lv.300]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Villagers [Lv.300]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "wade [Lv.400]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "wade [Lv.400]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Asta [Lv.450]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Asta [Lv.450]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)



local Toggle = Tabs.main:AddToggle("MyToggle", {Title = "Kung [Lv.700]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Kung [Lv.700]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)












local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Genos [Lv.450]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Genos [Lv.450]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)









local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Garou[Lv.500]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Garou[Lv.500]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)





local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Hot Cool Boss [Lv.1800]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Hot Cool Boss [Lv.1800]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)
   


local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Jio [Lv.2000]", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1  -- กำหนดระยะที่ต้องการให้เปิด/ปิดระบบการวาป (ในกรณีนี้คือ 10 studs)
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 10000
            bodyVelocity.D = 500
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.3, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
                print("เปิดระบบวาป ไปหามอนสเตอร์")
            end
        else
            if teleportEnabled then
                teleportEnabled = false
                print("ปิดระบบการวาป เพราะอยู่ใกล้มอนสเตอร์พอแล้ว")
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์ที่อยู่ใกล้ที่สุด
local function selectMonsters()
    selectedMonsters = {}
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name == "Jio [Lv.2000]" and obj.Humanoid.Health > 0 then
                table.insert(selectedMonsters, obj)
            end
        end
    end
    table.sort(selectedMonsters, function(a, b)
        local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                   (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
        end
    end)
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    print("เริ่มฟาร์ม")

    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            -- ตรวจสอบว่ามอนสเตอร์ยังไม่ตายและยังมีอยู่
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                
                -- หากไม่มีมอนสเตอร์เลย ไม่ต้องหยุดการฟาร์ม
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]  -- เลือกมอนสเตอร์ใหม่
                else
                    currentTargetMonster = nil  -- หากไม่เจอมอนสเตอร์ก็ไม่ต้องทำอะไร
                end
            end

            -- เคลื่อนที่ไปยังมอนสเตอร์หากมี
            if currentTargetMonster then
                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil

    print("หยุดการฟาร์ม")
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)










local Toggle = Tabs.Portal:AddToggle("MyToggle", {Title = "Farming", Default = false})

local selectedMonsters = {}
local currentTargetMonster = nil
local bodyVelocity = nil
local bodyGyro = nil
local farmingActive = false
local farmingCoroutine = nil

local teleportDistance = 1
local teleportEnabled = false

-- ฟังก์ชันการเคลื่อนที่
local function moveToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyPosition")
            bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
            bodyVelocity.P = 5000
            bodyVelocity.D = 1000
            bodyVelocity.Parent = humanoidRootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(500000, 500000, 500000)
            bodyGyro.D = 100
            bodyGyro.Parent = humanoidRootPart
        end

        local offsetAbove = Vector3.new(0, 4.5, 0)
        local targetPosition = monsterHRP.Position + offsetAbove

        bodyVelocity.Position = targetPosition 
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, monsterHRP.Position)

        if (humanoidRootPart.Position - targetPosition).magnitude < 1 then
            bodyVelocity.Position = humanoidRootPart.Position
        end
    end
end

-- ฟังก์ชันสำหรับการวาปไปหามอนสเตอร์
local function teleportToMonster(character, monster)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local monsterHRP = monster:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and monsterHRP then
        local distance = (humanoidRootPart.Position - monsterHRP.Position).Magnitude
        
        if distance > teleportDistance then
            if not teleportEnabled then
                teleportEnabled = true
                humanoidRootPart.CFrame = monsterHRP.CFrame
            end
        else
            if teleportEnabled then
                teleportEnabled = false
            end
        end
    end
end

-- ฟังก์ชันหยุดมอนสเตอร์
local function disableMonster(monster)
    if monster then
        local humanoid = monster:FindFirstChild("Humanoid")
        local humanoidRootPart = monster:FindFirstChild("HumanoidRootPart")

        if humanoid then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        if humanoidRootPart then
            if not monster:FindFirstChild("BodyPosition") then
                local bodyPosition = Instance.new("BodyPosition", humanoidRootPart)
                bodyPosition.MaxForce = Vector3.new(100000, 100000, 100000)
                bodyPosition.Position = humanoidRootPart.Position
            end
        end
    end
end

-- ฟังก์ชันเลือกมอนสเตอร์จากไฟล์ Monster
local function selectMonsters()
    selectedMonsters = {}
    local monsterFolder = game.Workspace:FindFirstChild("Monster")

    if monsterFolder then
        for _, obj in pairs(monsterFolder:GetChildren()) do
            if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                if obj.Humanoid.Health > 0 then
                    table.insert(selectedMonsters, obj)
                end
            end
        end

        table.sort(selectedMonsters, function(a, b)
            local charHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if charHRP then
                return (a.HumanoidRootPart.Position - charHRP.Position).Magnitude <
                       (b.HumanoidRootPart.Position - charHRP.Position).Magnitude
            end
        end)
    end
end

-- ฟังก์ชันเริ่มฟาร์ม
local function startFarming()
    farmingActive = true
    farmingCoroutine = coroutine.wrap(function()
        while farmingActive do
            if not currentTargetMonster or not currentTargetMonster:FindFirstChild("Humanoid") or currentTargetMonster.Humanoid.Health <= 0 then
                selectMonsters()
                if #selectedMonsters > 0 then
                    currentTargetMonster = selectedMonsters[1]
                else
                    currentTargetMonster = nil
                end
            end

            if currentTargetMonster then
                disableMonster(currentTargetMonster)

                if teleportEnabled then
                    teleportToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                else
                    moveToMonster(game.Players.LocalPlayer.Character, currentTargetMonster)
                end
            end
            wait(0.1)
        end
    end)

    farmingCoroutine()
end

-- ฟังก์ชันหยุดฟาร์ม
local function stopFarming()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    selectedMonsters = {}
    currentTargetMonster = nil
    farmingActive = false
    farmingCoroutine = nil
end

-- ควบคุมการทำงานเมื่อ Toggle ถูกเปลี่ยนสถานะ
Toggle:OnChanged(function()
    if Toggle.Value then
        if not farmingActive then
            startFarming()
        end
    else
        if farmingActive then
            stopFarming()
        end
    end
end)





Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
