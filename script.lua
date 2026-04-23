-- PASSAFOME HUB V2 ULTRA ELITE (VISIBILITY FIX)
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
main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
main.BorderSizePixel = 0
main.Active = true
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Text = "PASSAFOME HUB V2"
title.Size = UDim2.new(1, -70, 0, 45)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local btnContainer = Instance.new("Frame", main)
btnContainer.Size = UDim2.new(0, 75, 0, 30)
btnContainer.Position = UDim2.new(1, -80, 0, 5)
btnContainer.BackgroundTransparency = 1

local mini = Instance.new("TextButton", btnContainer)
mini.Text = "-" 
mini.Size = UDim2.new(0, 30, 0, 30)
mini.BackgroundTransparency = 1
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
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

-- Janela de Confirmação
local confirmFrame = Instance.new("Frame", sg)
confirmFrame.Size = UDim2.new(0, 220, 0, 110)
confirmFrame.Position = UDim2.new(0.5, -110, 0.5, -55)
confirmFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
confirmFrame.Visible = false
confirmFrame.ZIndex = 20
Instance.new("UICorner", confirmFrame)

local confirmText = Instance.new("TextLabel", confirmFrame)
confirmText.Text = "Deseja fechar o script?"
confirmText.Size = UDim2.new(1, 0, 0, 50)
confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmText.BackgroundTransparency = 1
confirmText.TextSize = 14
confirmText.Parent = confirmFrame

local btnSim = Instance.new("TextButton", confirmFrame)
btnSim.Text = "Sim"
btnSim.Size = UDim2.new(0, 85, 0, 35)
btnSim.Position = UDim2.new(0.08, 0, 0.6, 0)
btnSim.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
btnSim.TextColor3 = Color3.fromRGB(255, 255, 255)
btnSim.Parent = confirmFrame
Instance.new("UICorner", btnSim)

local btnNao = Instance.new("TextButton", confirmFrame)
btnNao.Text = "Não"
btnNao.Size = UDim2.new(0, 85, 0, 35)
btnNao.Position = UDim2.new(0.55, 0, 0.6, 0)
btnNao.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
btnNao.TextColor3 = Color3.fromRGB(255, 255, 255)
btnNao.Parent = confirmFrame
Instance.new("UICorner", btnNao)

close.MouseButton1Click:Connect(function() confirmFrame.Visible = true end)
btnNao.MouseButton1Click:Connect(function() confirmFrame.Visible = false end)
btnSim.MouseButton1Click:Connect(function() sg:Destroy() end)

local minimized = false
mini.MouseButton1Click:Connect(function()
    minimized = not minimized
    main.Visible = not minimized
    confirmFrame.Visible = false
end)

-- Função de criar botões com Texto Garantido
local function CriarBotao(nome, posicaoY, idRecompensa)
    local ativo = false
    local btn = Instance.new("TextButton", main)
    btn.Name = nome
    btn.Size = UDim2.new(0, 230, 0, 45)
    btn.Position = UDim2.new(0.5, -115, 0, posicaoY)
    btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    btn.Text = nome .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Cor forçada
    btn.Font = Enum.Font.SourceSansBold -- Fonte mais visível
    btn.TextSize = 16
    btn.ZIndex = 5
    Instance.new("UICorner", btn)

    task.spawn(function()
        while true do
            if ativo then
                pcall(function()
                    local remote = RS:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonService"):WaitForChild("RF"):WaitForChild("RequestRankedReward")
                    remote:InvokeServer(idRecompensa)
                end)
                stroke.Color = Color3.fromRGB(0, 255, 0)
                task.wait(0.1)
                stroke.Color = Color3.fromRGB(255, 0, 0)
                task.wait(3.5 + (math.random(0, 500) / 1000))
            else
                task.wait(0.5)
            end
