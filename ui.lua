-- Основной UI для меню
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 255)  -- Синий квадрат
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)  -- Начальная позиция окна
MainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Размер окна

-- Для перетаскивания
local dragging = false
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Изменение размера (нижний правый угол)
local Resizer = Instance.new("Frame")
Resizer.Parent = MainFrame
Resizer.BackgroundColor3 = Color3.new(1, 1, 1)
Resizer.Size = UDim2.new(0, 20, 0, 20)
Resizer.Position = UDim2.new(1, -20, 1, -20)
Resizer.AnchorPoint = Vector2.new(1, 1)
Resizer.BorderSizePixel = 0

-- Флаг для отслеживания состояния изменения размера
local resizing = false
local resizeStart
local startSize

Resizer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
        resizeStart = input.Position
        startSize = MainFrame.Size
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)

-- Логика для растягивания меню
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and resizing then
        local delta = Vector2.new(input.Position.X - resizeStart.X, input.Position.Y - resizeStart.Y)
        
        -- Обновляем размеры окна на основе движения мыши и сохраняем курсор на краю
        local newSizeX = math.max(200, startSize.X.Offset + delta.X)
        local newSizeY = math.max(150, startSize.Y.Offset + delta.Y)
        
        MainFrame.Size = UDim2.new(0, newSizeX, 0, newSizeY)
        
        -- Обновляем позицию ресайзера (чтобы он оставался на правом нижнем углу)
        Resizer.Position = UDim2.new(1, -20, 1, -20)
    end
end)

-- Тоггл меню на клавишу End
local UserInputService = game:GetService("UserInputService")
local isMenuVisible = true

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.End then
        isMenuVisible = not isMenuVisible
        MainFrame.Visible = isMenuVisible
    end
end)

--// error:
