-- PASSAFOME HUB V2 ULTRA ELITE (FINAL FIX)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Limpeza de segurança
if CG:FindFirstChild("PassafomeHub_Ultra") then
    CG:FindFirstChild("PassafomeHub_Ultra"):Destroy()
end

-- Interface Principal
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
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel")
title.Text = "PASSAFOME HUB ᴠ2"
title.Size = UDim2.new(1, -70, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- Botões de Controle (Minimizar e Fechar)
local btnContainer = Instance.new("Frame", main)
btnContainer.Size = UDim2.new(0, 70, 0, 30)
btnContainer.Position = UDim2.new(1, -75, 0, 5)
btnContainer.BackgroundTransparency = 1

local mini = Instance.new("TextButton", btnContainer)
mini.Text = "-"
mini.Size = UDim2.new(0, 30, 0, 30)
mini.BackgroundTransparency = 1
mini.TextColor3 = Color3.fromRGB(200, 200, 200)
mini.TextSize = 18

local close = Instance.new("TextButton", btnContainer)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(0, 35, 0, 0)
close.BackgroundTransparency = 1
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 18

-- Modal de Confirmação
local confirmFrame = Instance.new("Frame", sg)
confirmFrame.Size = UDim2.new(0, 220, 0, 100)
confirmFrame.Position = UDim2.new(0.5, -110, 0.5, -50)
confirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
confirmFrame.Visible = false
confirmFrame.ZIndex = 10
Instance.new("UICorner", confirmFrame)
Instance.new("UIStroke", confirmFrame).Color = Color3.fromRGB(255, 255, 255)

local confirmText = Instance.new("TextLabel", confirmFrame)
confirmText.Text = "Deseja fechar o script?"
confirmText.Size = UDim2.new(1, 0, 0, 40)
confirmText.TextColor3 = Color3.new(1,1,1)
confirmText.BackgroundTransparency = 1
confirmText.Font = Enum.Font.GothamMedium
confirmText.TextSize = 14

local btnSim = Instance.new("TextButton", confirmFrame)
btnSim.Text = "Sim"
btnSim.Size = UDim2.new(0, 80, 0, 30)
btnSim.Position = UDim2.new(0.1, 0, 0.6, 0)
btnSim.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
btnSim.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnSim)

local btnNao = Instance.new("TextButton", confirmFrame)
btnNao.Text = "Não"
btnNao.Size = UDim2.new(0, 80, 0, 30)
btnNao.Position = UDim2.new(0.55, 0, 0.6, 0)
btnNao.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
btnNao.TextColor3 = Color3.new(1,1,1)
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

-- Função de Botões de Farm
local function CriarBotao(nome, posicaoY, idRecompensa)
    local ativo = false
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 220, 0, 45)
    btn.Position = UDim2.new(0.5, -110, 0, posicaoY)
    btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    btn.Text = nome .. ": OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

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
        end
    end)

    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = ativo and Color3.fromRGB(0, 160, 0) or Color3.fromRGB(180, 0, 0)}):Play()
        btn.Text = ativo and nome .. ": ON" or nome .. ": OFF"
    end)
end

CriarBotao("LUCKY SPIN", 60, 1)
CriarBotao("SPIN HABILIDADE", 115, 4)
CriarBotao("AUTO YEN", 170, 2)

-- MOVIMENTAÇÃO (DRAG) - CORRIGIDO
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Tecla INSERT
UIS.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.Insert then
        main.Visible = not main.Visible
        confirmFrame.Visible = false
    end
end)
