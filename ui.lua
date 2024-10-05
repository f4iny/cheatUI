-- Основной UI для меню
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local ESPLabel = Instance.new("TextLabel")

-- Добавляем объект для округления углов основного меню
local MainUICorner = Instance.new("UICorner")
-- Добавляем объект для округления углов верхней части
local TitleUICorner = Instance.new("UICorner")

-- Настройка ScreenGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  -- Меню всегда сверху
ScreenGui.IgnoreGuiInset = true  -- Отключение границ GUI, чтобы меню было на правильном месте

-- Настройка главного окна
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Черный цвет окна
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)  -- Начальная позиция окна
MainFrame.Size = UDim2.new(0, 480, 0, 360)  -- Новый размер окна 480x360 пикселей

-- Применение округления углов к основному фрейму
MainUICorner.CornerRadius = UDim.new(0, 16)  -- Радиус округления 16
MainUICorner.Parent = MainFrame

-- Настройка верхней части окна (Title Bar)
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Серый цвет для верхней части
TitleBar.Size = UDim2.new(0, 480, 0, 36)  -- Новый размер верхней панели 480x36 пикселей
TitleBar.Position = UDim2.new(0, 0, 0, 0)

-- Применение округления углов к верхней части (округляются все углы)
TitleUICorner.CornerRadius = UDim.new(0, 16)  -- Радиус округления 16
TitleUICorner.Parent = TitleBar

-- Дополнительный фрейм для нижней части TitleBar (создаем прямоугольник для выравнивания нижних углов)
local BottomRect = Instance.new("Frame")
BottomRect.Parent = TitleBar
BottomRect.BackgroundColor3 = TitleBar.BackgroundColor3
BottomRect.BorderSizePixel = 0
BottomRect.Position = UDim2.new(0, 0, 1, -16)  -- На границе нижних углов панели
BottomRect.Size = UDim2.new(1, 0, 0, 16)  -- Высота 16 пикселей, чтобы закрыть нижние углы

-- Настройка текстового заголовка "Eblanix"
TitleLabel.Parent = TitleBar
TitleLabel.Text = "Eblanix"
TitleLabel.Size = UDim2.new(0, 72, 0, 36)  -- Размер текста 72x36 пикселей
TitleLabel.Position = UDim2.new(0, 16, 0, 0)  -- Отступ 16 пикселей от левого края
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Белый цвет текста
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold  -- Шрифт GothamBold
TitleLabel.TextSize = 16  -- Размер шрифта 16 пунктов
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left  -- Текст выровнен по левому краю

-- Настройка текста "ESP"
ESPLabel.Parent = MainFrame
ESPLabel.Text = "ESP"
ESPLabel.Size = UDim2.new(0, 60, 0, 30)  -- Размер текста 60x30 пикселей
ESPLabel.Position = UDim2.new(0.5, -30, 0, 36 + 16)  -- 16 пикселей вниз от нижней границы верхней панели
ESPLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Белый цвет текста
ESPLabel.BackgroundTransparency = 1
ESPLabel.Font = Enum.Font.GothamBold  -- Шрифт GothamBold
ESPLabel.TextSize = 24  -- Размер шрифта 24 пункта
ESPLabel.TextXAlignment = Enum.TextXAlignment.Center  -- Текст по центру горизонтали

-- Для перетаскивания только через верхнюю часть (Title Bar)
local dragging = false
local dragInput
local dragStart
local startPos

TitleBar.InputBegan:Connect(function(input)
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

TitleBar.InputChanged:Connect(function(input)
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

-- Тоггл меню на клавишу End
local UserInputService = game:GetService("UserInputService")
local isMenuVisible = true

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.End then
        isMenuVisible = not isMenuVisible
        MainFrame.Visible = isMenuVisible
    end
end)

-- Блокировка действий игры при взаимодействии с меню
ScreenGui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        -- блокировка действий игры
        return true
    end
end)

ScreenGui.InputChanged:Connect(function(input)
    -- Это для предотвращения взаимодействий с игрой при взаимодействии с меню
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        return true
    end
end)

-- Отображение ошибок в консоли
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
    Text = "UI Loaded Successfully",
    Color = Color3.fromRGB(255, 255, 0),
    Font = Enum.Font.SourceSansBold,
    TextSize = 24
})

--// error: