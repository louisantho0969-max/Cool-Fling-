local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "CustomCommandsGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 180)
frame.Position = UDim2.new(0.5, -110, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Commandes Rapides"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Bouton Infinite Yield
local btnIY = Instance.new("TextButton")
btnIY.Size = UDim2.new(0.9, 0, 0, 35)
btnIY.Position = UDim2.new(0.05, 0, 0, 40)
btnIY.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
btnIY.Text = "Load Infinite Yield"
btnIY.TextColor3 = Color3.new(1, 1, 1)
btnIY.TextScaled = true
btnIY.Font = Enum.Font.GothamSemibold
btnIY.Parent = frame

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0, 6)
corner1.Parent = btnIY

-- Bouton /unfly
local btnUnfly1 = Instance.new("TextButton")
btnUnfly1.Size = UDim2.new(0.9, 0, 0, 35)
btnUnfly1.Position = UDim2.new(0.05, 0, 0, 85)
btnUnfly1.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
btnUnfly1.Text = "/unfly"
btnUnfly1.TextColor3 = Color3.new(1, 1, 1)
btnUnfly1.TextScaled = true
btnUnfly1.Font = Enum.Font.GothamSemibold
btnUnfly1.Parent = frame

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0, 6)
corner2.Parent = btnUnfly1

-- Bouton ;unfly
local btnUnfly2 = Instance.new("TextButton")
btnUnfly2.Size = UDim2.new(0.9, 0, 0, 35)
btnUnfly2.Position = UDim2.new(0.05, 0, 0, 130)
btnUnfly2.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
btnUnfly2.Text = ";unfly"
btnUnfly2.TextColor3 = Color3.new(1, 1, 1)
btnUnfly2.TextScaled = true
btnUnfly2.Font = Enum.Font.GothamSemibold
btnUnfly2.Parent = frame

local corner3 = Instance.new("UICorner")
corner3.CornerRadius = UDim.new(0, 6)
corner3.Parent = btnUnfly2

-- Fonctions des boutons
btnIY.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

btnUnfly1.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat("/unfly")
end)

btnUnfly2.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat(";unfly")
end)

print("✅ Menu avec Infinite Yield + /unfly + ;unfly ajouté !")
