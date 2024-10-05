-- ui.lua

-- Создаем основной GUI элемент
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

-- Присваиваем GUI родителю, чтобы он отображался
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Настройки для синего квадрата (Frame)
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 255)  -- Синий цвет
Frame.Size = UDim2.new(0, 200, 0, 200)  -- Размер квадрата (200x200 пикселей)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)  -- Центрируем квадрат по экрану
Frame.AnchorPoint = Vector2.new(0.5, 0.5)  -- Центрируем квадрат по оси

-- Дополнительно, можно сделать квадрат полупрозрачным (необязательно)
Frame.BackgroundTransparency = 0.2  -- Уровень прозрачности (0 - полностью видимый, 1 - невидимый)

-- Возвращаем ScreenGui для возможности взаимодействия с ним
return ScreenGui
