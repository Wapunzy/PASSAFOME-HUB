

-- PASSAFOME HUB V2 (ULTRA STABLE VERSION)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local CG = game:GetService("CoreGui")

-- Limpeza para evitar erros de execução duplicada
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
main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true 
main.Parent = sg

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(200, 0, 0)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel")
title.Parent = main
title.Text = "PASSAFOME HUB V2"
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

-- [ BOTÃO MINIMIZAR ]
local miniBtn = Instance.new("TextButton", main)
miniBtn.Name = "Minimize"
miniBtn.Text = "-"
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.BackgroundTransparency = 1
miniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
miniBtn.TextSize = 35
miniBtn.Font = Enum.Font.SourceSansBold

-- [ BOTÃO PARA REABRIR - VERSÃO DARK FOSCA ]
local openBtn = Instance.new("TextButton", sg)
openBtn.Name = "OpenButton"
openBtn.Visible = false
openBtn.Size = UDim2.new(0, 150, 0, 38)
openBtn.Position = UDim2.new(0.5, -75, 0, 20)

-- CORES FOSCAS (Sem efeito neon):
openBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30) -- Fundo quase preto
openBtn.TextColor3 = Color3.fromRGB(200, 200, 200)   -- Texto cinza claro

openBtn.BackgroundTransparency = 0.1
openBtn.Text = "PASSAFOME HUB"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 13
openBtn.Draggable = true

-- Arredondamento suave
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 6)

-- Borda vermelha escura e sutil (apenas para detalhe)
local bordinha = Instance.new("UIStroke", openBtn)
bordinha.Color = Color3.fromRGB(120, 0, 0) -- Vermelho escuro, não brilha
bordinha.Thickness = 1.8


-- Lógica de Esconder/Mostrar
miniBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn.Visible = false
end)

-- [ FUNÇÃO DOS BOTÕES DE FARM ]
local function CriarBotao(nome, posicaoY, idRecompensa)
    local ativo = false
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 230, 0, 45)
    btn.Position = UDim2.new(0.5, -115, 0, posicaoY)
    btn.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
    btn.Text = nome .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.ZIndex = 5
    btn.Parent = main
    Instance.new("UICorner", btn)

    task.spawn(function()
        -- Procura o RemoteEvent de forma segura
        local remote = nil
        pcall(function()
            remote = RS:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonService"):WaitForChild("RF"):WaitForChild("RequestRankedReward")
        end)
        
        while true do
            if ativo and remote then
                pcall(function() remote:InvokeServer(idRecompensa) end)
                task.wait(3.6)
            else
                task.wait(0.5)
            end
        end
    end)

    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        btn.BackgroundColor3 = ativo and Color3.fromRGB(0, 130, 0) or Color3.fromRGB(160, 0, 0)
        btn.Text = ativo and nome .. ": ON" or nome .. ": OFF"
    end)
end

-- Chamadas da função
CriarBotao("LUCKY SPIN", 65, 1)
CriarBotao("SPIN HABILIDADE", 125, 4)
CriarBotao("AUTO YEN", 185, 2)
