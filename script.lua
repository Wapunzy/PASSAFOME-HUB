-- Versão definitiva: a mensagem fica na tela e não some sozinha
local sg = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local label = Instance.new("TextLabel")
local corner = Instance.new("UICorner")

sg.Name = "AvisoFixo"
sg.Parent = game:GetService("CoreGui")
sg.ResetOnSpawn = false -- Garante que não suma se o personagem morrer

frame.Size = UDim2.new(0, 200, 0, 50)
frame.Position = UDim2.new(0.5, -100, 0.5, -25) 
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2
frame.Parent = sg

corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "script encerrado"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 18
label.Font = Enum.Font.GothamBold
label.Parent = frame
