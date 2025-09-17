--[[
    Script: X6 Luck & Invisibility (Delta compatible)
    Autor: bdbsjsdhshss-art
    Repositorio: github.com/bdbsjsdhshss-art/Mi-script-
    Descripción: Multiplica tu suerte por 6 y te hace invisible en Roblox.
    Uso: Ejecuta con Delta o cualquier executor compatible en Roblox.
]]

local player = game.Players.LocalPlayer

-- Multiplica la suerte por 6 (si existe la propiedad Luck)
if player:FindFirstChild("Luck") then
    player.Luck.Value = player.Luck.Value * 6
else
    local luck = Instance.new("IntValue")
    luck.Name = "Luck"
    luck.Value = 6
    luck.Parent = player
end

-- Función para hacer invisible al jugador
local function makeInvisible(char)
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
            if part:FindFirstChildOfClass("Decal") then
                for _, decal in ipairs(part:GetChildren()) do
                    if decal:IsA("Decal") then
                        decal.Transparency = 1
                    end
                end
            end
        end
        if part:IsA("Accessory") and part:FindFirstChild("Handle") then
            part.Handle.Transparency = 1
        end
    end
end

-- Aplicar invisibilidad al personaje actual y cuando reaparezcas
if player.Character then
    makeInvisible(player.Character)
end
player.CharacterAdded:Connect(function(char)
    makeInvisible(char)
end)

-- Mensaje de confirmación en consola
print("¡Tienes X6 de suerte y eres invisible! Script por bdbsjsdhshss-art")
