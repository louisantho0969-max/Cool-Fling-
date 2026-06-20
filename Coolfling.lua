local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "CustomCommandsGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- === PANEL PRINCIPAL ===
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 260)
frame.Position = UDim2.new(0.5, -120, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Multicolore (Gradient stylé)
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 150)),   -- Rose
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 170, 255)), -- Bleu
    ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))   -- Violet
}
gradient.Rotation = 45
gradient.Parent = frame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Transparency = 0.7
uiStroke.Parent = frame

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "⚡ Commandes Rapides"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- === DRAGGER (Bouger le panel) ===
local dragging = false
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateInput(input)
    end
end)

-- === CHARGEMENT STYLÉ ===
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundTransparency = 1
loadingFrame.Visible = false
loadingFrame.ZIndex = 10
loadingFrame.Parent = gui

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(0.8, 0, 0, 50)
loadingLabel.Position = UDim2.new(0.1, 0, 0.5, -60)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Chargement..."
loadingLabel.TextColor3 = Color3.new(1, 1, 1)
loadingLabel.TextScaled = true
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.Parent = loadingFrame

local spinner = Instance.new("TextLabel")
spinner.Size = UDim2.new(0, 40, 0, 40)
spinner.Position = UDim2.new(0.5, -20, 0.5, 0)
spinner.BackgroundTransparency = 1
spinner.Text = "⟳"
spinner.TextColor3 = Color3.fromRGB(0, 170, 255)
spinner.TextScaled = true
spinner.Font = Enum.Font.GothamBold
spinner.Parent = loadingFrame

-- Animation de chargement
spawn(function()
    while loadingFrame.Visible do
        spinner.Rotation = spinner.Rotation + 12
        wait(0.03)
    end
end)

-- === BOUTONS ===
local yOffset = 50
local function createButton(text, posY, color, special)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = frame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    if special then
        local btnGradient = Instance.new("UIGradient")
        btnGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 20, 147)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
        }
        btnGradient.Parent = btn
    end

    return btn
end

-- Boutons
local btnIY = createButton("Load Infinite Yield", yOffset, Color3.fromRGB(0, 170, 255))
yOffset += 48

local btnUnfly1 = createButton("/unfly", yOffset, Color3.fromRGB(255, 80, 80))
yOffset += 48

local btnUnfly2 = createButton(";unfly", yOffset, Color3.fromRGB(255, 80, 80))
yOffset += 48

local btnFlyfling1 = createButton("/flyfling", yOffset, Color3.fromRGB(255, 80, 80), true)  -- Special
yOffset += 48

local btnFlyfling2 = createButton(";flyfling", yOffset, Color3.fromRGB(255, 80, 80), true)  -- Special

-- === FONCTIONS ===
local function showLoading()
    loadingFrame.Visible = true
    wait(1.2)
    loadingFrame.Visible = false
end

btnIY.MouseButton1Click:Connect(function()
    showLoading()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

btnUnfly1.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat("/unfly")
end)

btnUnfly2.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat(";unfly")
end)

btnFlyfling1.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat("/flyfling")
end)

btnFlyfling2.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Chat(";flyfling")
end)

print("✅ Panel multicolore + draggable + chargement stylé + /flyfling ;flyfling ajouté !")
