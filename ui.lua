-- Основной UI для меню
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local ESPLabel = Instance.new("TextLabel")

-- Добавляем объект для округления углов основного меню
local MainUICorner = Instance.new("UICorner")
-- Добавляем объект для округления верхних углов TitleBar
local TitleUICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui

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

-- Ограничение округления только для верхних углов TitleBar
TitleUICorner.TopLeft = true
TitleUICorner.TopRight = true
TitleUICorner.BottomLeft = false
TitleUICorner.BottomRight = false

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

-- Первый CheckBox (Boxes)
local CheckBox1 = Instance.new("Frame")
CheckBox1.Parent = MainFrame
CheckBox1.BackgroundColor3 = Color3.fromHex("D9D9D9")  -- Цвет HEX:D9D9D9
CheckBox1.BackgroundTransparency = 0.6  -- Alpha канал 100
CheckBox1.Size = UDim2.new(0, 30, 0, 30)  -- Размер 30x30 пикселей
CheckBox1.Position = UDim2.new(0, 60, 0, 98)  -- Позиция 60 пикселей от левого края, 98 пикселей от верхнего

-- Текст "Boxes"
local BoxesLabel = Instance.new("TextLabel")
BoxesLabel.Parent = MainFrame
BoxesLabel.Text = "Boxes"
BoxesLabel.Size = UDim2.new(0, 48, 0, 30)  -- Размер текста 48x30 пикселей
BoxesLabel.Position = UDim2.new(0, 108, 0, 98)  -- Позиция 18 пикселей вправо от правого края первого CheckBox
BoxesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Белый цвет текста
BoxesLabel.BackgroundTransparency = 1
BoxesLabel.Font = Enum.Font.GothamBold  -- Шрифт GothamBold
BoxesLabel.TextSize = 15  -- Размер шрифта 15 пунктов
BoxesLabel.TextXAlignment = Enum.TextXAlignment.Left  -- Выровнен по левому краю

-- Добавляем элемент выбора цвета для первого CheckBox (Boxes)
local ColorPicker1 = Instance.new("Frame")
ColorPicker1.Size = UDim2.new(0, 60, 0, 30)
ColorPicker1.Position = UDim2.new(1, -120, 0, 98)  -- Позиция напротив первого CheckBox
ColorPicker1.BackgroundColor3 = Color3.fromRGB(217, 217, 217)  -- Цвет как у первого CheckBox
ColorPicker1.Parent = MainFrame

-- Второй CheckBox (Skeleton)
local CheckBox2 = Instance.new("Frame")
CheckBox2.Parent = MainFrame
CheckBox2.BackgroundColor3 = Color3.fromHex("D9D9D9")  -- Цвет HEX:D9D9D9
CheckBox2.BackgroundTransparency = 0.6  -- Alpha канал 100
CheckBox2.Size = UDim2.new(0, 30, 0, 30)  -- Размер 30x30 пикселей
CheckBox2.Position = UDim2.new(0, 60, 0, 156)  -- 28 пикселей ниже самого нижнего края первого CheckBox

-- Текст "Skeleton"
local SkeletonLabel = Instance.new("TextLabel")
SkeletonLabel.Parent = MainFrame
SkeletonLabel.Text = "Skeleton"
SkeletonLabel.Size = UDim2.new(0, 66, 0, 30)  -- Размер текста 66x30 пикселей
SkeletonLabel.Position = UDim2.new(0, 108, 0, 156)  -- На той же вертикальной позиции, что и второй CheckBox
SkeletonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Белый цвет текста
SkeletonLabel.BackgroundTransparency = 1
SkeletonLabel.Font = Enum.Font.GothamBold  -- Шрифт GothamBold
SkeletonLabel.TextSize = 15  -- Размер шрифта 15 пунктов
SkeletonLabel.TextXAlignment = Enum.TextXAlignment.Left  -- Выровнен по левому краю

-- Добавляем элемент выбора цвета для второго CheckBox (Skeleton)
local ColorPicker2 = Instance.new("Frame")
ColorPicker2.Size = UDim2.new(0, 60, 0, 30)
ColorPicker2.Position = UDim2.new(1, -120, 0, 156)  -- Позиция напротив второго CheckBox
ColorPicker2.BackgroundColor3 = Color3.fromRGB(217, 217, 217)  -- Цвет как у второго CheckBox
ColorPicker2.Parent = MainFrame

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

--// error: