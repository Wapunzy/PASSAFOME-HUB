-- PASSAFOME HUB V2 ULTRA ELITE (HABILIDADE UPDATE)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Limpeza de segurança
if CG:FindFirstChild("PassafomeHub_Ultra") then
    CG:FindFirstChild("PassafomeHub_Ultra"):Destroy()
end

-- Interface Principal (Ajustada para caber 2 botões)
local sg = Instance.new("ScreenGui")
sg.Name = "PassafomeHub_Ultra"
sg.Parent = CG
sg.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 280, 0, 240) -- Aumentei a altura de 180 para 240
main.Position = UDim2.new(0.5, -140, 0.5, -120)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BackgroundTransparency = 0.1
main.Active = true
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 35, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
})
grad.Rotation = 45

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2.5

local title = Instance.new("TextLabel")
title.Text = "PASSAFOME HUB ᴠ2"
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = main

local close = Instance.new("TextButton")
close.Text = "✕"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundTransparency = 1
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 16
close.Parent = main
close.MouseButton1Click:Connect(function() sg:Destroy() end)

-- ==========================================
-- FUNÇÃO DE CRIAR BOTÕES (OTIMIZADA)
-- ==========================================
local function CriarBotao(nome, posicaoY, idRecompensa)
    local ativo = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 220, 0, 50)
    btn.Position = UDim2.new(0.5, -110, 0, posicaoY)
    btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    btn.Text = nome .. ": OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = main
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    -- Loop de Execução para este botão
    task.spawn(function()
        while true do
            if ativo then
                pcall(function()
                    local remote = RS:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonService"):WaitForChild("RF"):WaitForChild("RequestRankedReward")
                    remote:InvokeServer(idRecompensa)
                end)
                
                -- Feedback visual rápido
                stroke.Color = Color3.fromRGB(0, 255, 0)
                task.wait(0.1)
                stroke.Color = Color3.fromRGB(255, 0, 0)
                
                -- Anti-Ban Delay
                task.wait(3.5 + (math.random(0, 500) / 1000))
            else
                task.wait(0.5)
            end
        end
    end)

    -- Evento de Clique
    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        local goal = {BackgroundColor3 = ativo and Color3.fromRGB(0, 160, 0) or Color3.fromRGB(180, 0, 0)}
        TweenService:Create(btn, TweenInfo.new(0.3), goal):Play()
        btn.Text = ativo and nome .. ": ON" or nome .. ": OFF"
    end)
end

-- Criando os botões com as IDs corretas
CriarBotao("LUCKY SPIN", 60, 1)
CriarBotao("SPIN HABILIDADE", 120, 4)
CriarBotao("AUTO YEN", 180, 2)

-- ==========================================
-- SISTEMAS DE MOVIMENTAÇÃO (ARRASTAR)
-- ==========================================
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.Insert then
        main.Visible = not main.Visible
    end
end)
