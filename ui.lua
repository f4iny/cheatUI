-- Основной UI для меню
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 255)  -- Синий квадрат
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)  -- Начальная позиция окна
MainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Размер окна

-- Переменные для отслеживания действий
local dragging = false
local resizing = false
local dragStart, startSize, startPos, resizeStart

-- Минимальные размеры окна
local minSizeX, minSizeY = 200, 150

-- Для перетаскивания окна
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

-- Функция для определения нахождения курсора на границе окна
local function getResizeDirection(inputPos)
    local pos = MainFrame.AbsolutePosition
    local size = MainFrame.AbsoluteSize
    local borderSize = 10  -- Ширина зоны для растягивания

    local resizingDirection = {}

    if inputPos.X >= pos.X + size.X - borderSize then
        table.insert(resizingDirection, "Right")
    elseif inputPos.X <= pos.X + borderSize then
        table.insert(resizingDirection, "Left")
    end

    if inputPos.Y >= pos.Y + size.Y - borderSize then
        table.insert(resizingDirection, "Bottom")
    elseif inputPos.Y <= pos.Y + borderSize then
        table.insert(resizingDirection, "Top")
    end

    return resizingDirection
end

-- Начало растягивания
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local direction = getResizeDirection(input.Position)
        if #direction > 0 then
            resizing = true
            resizeStart = input.Position
            startSize = MainFrame.Size

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                end
            end)
        end
    end
end)

-- Логика для изменения размеров
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and resizing then
        local direction = getResizeDirection(input.Position)
        local delta = input.Position - resizeStart
        local newSizeX = startSize.X.Offset
        local newSizeY = startSize.Y.Offset

        -- Изменяем размеры в зависимости от стороны
        for _, dir in pairs(direction) do
            if dir == "Right" then
                newSizeX = math.max(minSizeX, startSize.X.Offset + delta.X)
            elseif dir == "Left" then
                newSizeX = math.max(minSizeX, startSize.X.Offset - delta.X)
                MainFrame.Position = UDim2.new(0, MainFrame.Position.X.Offset + delta.X, 0, MainFrame.Position.Y.Offset)
            elseif dir == "Bottom" then
                newSizeY = math.max(minSizeY, startSize.Y.Offset + delta.Y)
            elseif dir == "Top" then
                newSizeY = math.max(minSizeY, startSize.Y.Offset - delta.Y)
                MainFrame.Position = UDim2.new(0, MainFrame.Position.X.Offset, 0, MainFrame.Position.Y.Offset + delta.Y)
            end
        end

        MainFrame.Size = UDim2.new(0, newSizeX, 0, newSizeY)
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
