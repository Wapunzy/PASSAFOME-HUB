-- PASSAFOME HUB V2 (MINIMIZE TO LOGO)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Limpeza de segurança
if CG:FindFirstChild("PassafomeHub_Ultra") then
    CG:FindFirstChild("PassafomeHub_Ultra"):Destroy()
end

local sg = Instance.new("ScreenGui")
sg.Name = "PassafomeHub_Ultra"
sg.Parent = CG
sg.ResetOnSpawn = false

-- [ FRAME PRINCIPAL ]
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

-- Título
local title = Instance.new("TextLabel")
title.Parent = main
title.Text = "PASSAFOME HUB ᴠ2"
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

-- [ BOTÃO DE MINIMIZAR (-) ]
local miniBtn = Instance.new("TextButton", main)
miniBtn.Text = "-"
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.BackgroundTransparency = 1
miniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
miniBtn.TextSize = 30
miniBtn.Font = Enum.Font.SourceSansBold

-- [ BOTÃO DE MAXIMIZAR (COM NOME DO HUB) ]
local openBtn = Instance.new("TextButton", sg)
openBtn.Name = "OpenButton"
openBtn.Visible = false
openBtn.Size = UDim2.new(0, 140, 0, 35) -- Ajustado para caber o nome
openBtn.Position = UDim2.new(0.5, -70, 0, 15)
openBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
openBtn.Text = "PASSAFOME HUB" -- Texto solicitado
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 13
openBtn.Draggable = true
Instance.new("UICorner", openBtn)
Instance.new("UIStroke", openBtn).Color = Color3.fromRGB(255, 255, 255)

-- Lógica Minimizar/Maximizar
miniBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn
