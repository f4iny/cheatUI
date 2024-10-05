-- Основной UI для меню
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

-- Настройка главного окна
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Черный цвет окна
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)  -- Начальная позиция окна
MainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Размер окна

-- Настройка верхней части окна (Title Bar)
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Серый цвет для верхней части
TitleBar.Size = UDim2.new(1, 0, 0, 30)  -- Верхняя часть окна с заголовком
TitleBar.Position = UDim2.new(0, 0, 0, 0)

-- Настройка текстового заголовка
TitleLabel.Parent = TitleBar
TitleLabel.Text = "Eblanix"
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Белый цвет текста
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.TextSize = 20

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
