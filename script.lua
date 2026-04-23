-- PASSAFOME HUB V2 (FIX TOTAL DE TEXTO)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")

-- Deleta se já existir
if CG:FindFirstChild("PassafomeHub_Ultra") then
    CG:FindFirstChild("PassafomeHub_Ultra"):Destroy()
end

local sg = Instance.new("ScreenGui")
sg.Name = "PassafomeHub_Ultra"
sg.Parent = CG
sg.IgnoreGuiInset = true

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 280, 0, 260)
main.Position = UDim2.new(0.5, -140, 0.5, -130)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true -- Ativa movimentação nativa simples
main.Parent = sg

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

-- Título Simples
local title = Instance.new("TextLabel")
title.Text = "PASSAFOME HUB V2"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = main

-- Botões de Controle
local mini = Instance.new("TextButton", main)
mini.Text = "-"
mini.Size = UDim2.new(0, 30, 0, 30)
mini.Position = UDim2.new(1, -70, 0, 5)
mini.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.Parent = main

local close = Instance.new("TextButton", main)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Parent = main

-- Função de criar botões
local function CriarBotao(nome, posicaoY, idRecompensa)
    local ativo = false
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 220, 0, 45)
    btn.Position = UDim2.new(0.5, -110, 0, posicaoY)
    btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    
    -- CONFIGURAÇÃO FORÇADA DE TEXTO
    btn.Text = nome .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 10 -- Garante que o texto fique na frente
    
    btn.Parent = main

    -- Lógica do Farm
    task.spawn(function()
        while true do
            if ativo then
                pcall(function()
                    local remote = RS:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonService"):WaitForChild("RF"):WaitForChild("RequestRankedReward")
                    remote:InvokeServer(idRecompensa)
                end)
                task.wait(3.5 + (math.random(0, 500) / 1000))
            else
                task.wait(0.5)
            end
        end
    end)

    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        btn.BackgroundColor3 = ativo and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(180, 0, 0)
        btn.Text = ativo and nome .. ": ON" or nome .. ": OFF"
    end)
end

CriarBotao("LUCKY SPIN", 60, 1)
CriarBotao("SPIN HABILIDADE", 115, 4)
CriarBotao("AUTO YEN", 170, 2)

-- Lógica simples de fechar/minimizar
close.MouseButton1Click:Connect(function() sg:Destroy() end)
mini.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
