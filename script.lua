-- PASSAFOME HUB V2 (WHITE TEXT & PARENT FIX)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

if CG:FindFirstChild("PassafomeHub_Ultra") then
    CG:FindFirstChild("PassafomeHub_Ultra"):Destroy()
end

local sg = Instance.new("ScreenGui")
sg.Name = "PassafomeHub_Ultra"
sg.Parent = CG
sg.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 280, 0, 260)
main.Position = UDim2.new(0.5, -140, 0.5, -130)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Text = "PASSAFOME HUB ᴠ2"
title.Size = UDim2.new(1, -70, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- BRANCO
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- CONTROLES
local btnContainer = Instance.new("Frame", main)
btnContainer.Size = UDim2.new(0, 75, 0, 30)
btnContainer.Position = UDim2.new(1, -80, 0, 5)
btnContainer.BackgroundTransparency = 1

local mini = Instance.new("TextButton", btnContainer)
mini.Text = "-" 
mini.Size = UDim2.new(0, 30, 0, 30)
mini.BackgroundTransparency = 1
mini.TextColor3 = Color3.fromRGB(255, 255, 255) -- BRANCO
mini.TextSize = 30
mini.Font = Enum.Font.SourceSansBold

local close = Instance.new("TextButton", btnContainer)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(0, 40, 0, 0)
close.BackgroundTransparency = 1
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 22
close.Font = Enum.Font.SourceSansBold

-- [ JANELA DE CONFIRMAÇÃO CORRIGIDA ]
local confirmFrame = Instance.new("Frame")
confirmFrame.Name = "ConfirmFrame"
confirmFrame.Parent = sg
confirmFrame.Size = UDim2.new(0, 220, 0, 110)
confirmFrame.Position = UDim2.new(0.5, -110, 0.5, -55)
confirmFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
confirmFrame.Visible = false
confirmFrame.ZIndex = 20
Instance.new("UICorner", confirmFrame)
local confirmStroke = Instance.new("UIStroke", confirmFrame)
confirmStroke.Color = Color3.fromRGB(255, 255, 255)

local confirmText = Instance.new("TextLabel")
confirmText.Parent = confirmFrame -- FIX: Definindo o pai
confirmText.Text = "FECHAR SCRIPT?"
confirmText.Size = UDim2.new(1, 0, 0, 50)
confirmText.TextColor3 = Color3.fromRGB(255, 255, 255) -- BRANCO
confirmText.BackgroundTransparency = 1
confirmText.Font = Enum.Font.GothamBold
confirmText.TextSize = 16
confirmText.ZIndex = 21

local btnSim = Instance.new("TextButton")
btnSim.
