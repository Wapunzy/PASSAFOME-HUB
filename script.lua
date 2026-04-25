-- PASSAFOME HUB V4 - COM ABA DISCORD
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configurações
local WebhookURL = "https://discord.com/api/webhooks/1497393752950571108/J2iKysUk3cBF2pXDL5vzC04YR8mQKEANDsOfQ_g552EFQCVheZPUAacj-3ue4EuKcuXB"
local MeuID = "671847842662318080"
local DiscordLink = "https://discord.gg/32m6ekBB8"

-- [1] SISTEMA DE LOGS
task.spawn(function()
    pcall(function()
        local plataforma = (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled) and "Mobile" or "PC"
        local requestFunc = syn and syn.request or http_request or request or fluxus and fluxus.request
        
        if requestFunc then
            requestFunc({
                Url = WebhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({
                    ["content"] = "<@" .. MeuID .. "> 🚨 Novo acesso!",
                    ["embeds"] = {{
                        ["title"] = "Passafome Hub V4 - Log",
                        ["color"] = 65280,
                        ["fields"] = {
                            {["name"] = "Nome", ["value"] = LocalPlayer.Name, ["inline"] = true},
                            {["name"] = "Display", ["value"] = LocalPlayer.DisplayName, ["inline"] = true},
                            {["name"] = "Plataforma", ["value"] = plataforma, ["inline"] = true},
                            {["name"] = "User ID", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = false},
                            {["name"] = "Server ID", ["value"] = game.JobId, ["inline"] = false}
                        },
                        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
                    }}
                })
            })
        end
    end)
end)

-- [2] BYPASS ANTI-KICK
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" or method == "kick" then return nil end
    return old(self, ...)
end)
setreadonly(mt, true)

-- [3] CARREGAMENTO DA RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Passafome Hub V4",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "V4 | Melhor Hub",
    ConfigurationSaving = {Enabled = false},
 KeySystem = false,
Theme = "Amethyst"
})

-- ABA FARM
local TabFarm = Window:CreateTab("Farm", 4483362458)
local Toggles = {LS = false, SH = false, AY = false}
local Remote;

pcall(function()
    Remote = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.SeasonService.RF.RequestRankedReward
end)

task.spawn(function()
    while true do 
        if Remote then
            if Toggles.LS then pcall(function() Remote:InvokeServer(1) end) task.wait(math.random(3,4)) end
            if Toggles.SH then pcall(function() Remote:InvokeServer(4) end) task.wait(math.random(3,4)) end
            if Toggles.AY then pcall(function() Remote:InvokeServer(2) end) task.wait(math.random(3,4)) end
        end
        task.wait(0.1)
    end 
end)

TabFarm:CreateToggle({Name = "Auto Token 🔄", CurrentValue = false, Callback = function(v) Toggles.LS = v end})
TabFarm:CreateToggle({Name = "Auto Ability 🔄", CurrentValue = false, Callback = function(v) Toggles.SH = v end})
TabFarm:CreateToggle({Name = "Auto Yen 💰", CurrentValue = false, Callback = function(v) Toggles.AY = v end})
TabFarm:CreateButton({Name = "DESTRUIR UI", Callback = function() Rayfield:Destroy() end})

-- [4] ABA DISCORD (ADICIONADA)
local TabDiscord = Window:CreateTab("Discord", 4483362458) -- Você pode mudar o ID do ícone se quiser

TabDiscord:CreateSection("Comunidade")

TabDiscord:CreateButton({
    Name = "Clique aqui para copiar o convite",
    Callback = function()
        setclipboard(DiscordLink)
        Rayfield:Notify({
            Title = "Discord",
            Content = "Link copiado para a área de transferência!",
            Duration = 3,
            Image = 4483362458,
        })
    end
})