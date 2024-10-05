-- Получаем необходимые сервисы
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- Создаем UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyCustomUI"
ScreenGui.Parent = CoreGui  -- Перемещаем интерфейс в CoreGui для максимального приоритета
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global  -- UI всегда поверх других элементов

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 255)  -- Синий цвет
Frame.Parent = ScreenGui
Frame.ZIndex = 10  -- Устанавливаем высокий ZIndex, чтобы элемент был выше других

-- Переменная для отслеживания состояния видимости UI
local uiVisible = true

-- Функция, которая будет вызываться при нажатии клавиши
local function ToggleUI(input)
    if input.KeyCode == Enum.KeyCode.End then
        uiVisible = not uiVisible  -- Меняем состояние на противоположное
        Frame.Visible = uiVisible  -- Включаем или отключаем UI
        print("UI visibility toggled: ", uiVisible)
    end
end

-- Подключаем событие нажатия клавиши
UserInputService.InputBegan:Connect(ToggleUI)
