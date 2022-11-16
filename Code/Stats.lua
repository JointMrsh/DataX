-- Create a Folder in ServerScriptService named "GameManager", create a regular script, and lastly copy and paste this code!
-- Authored by Zeedy_Roblox / JointMrsh

local function onPlayerJoin(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local Coins = Instance.new("IntValue")
    Coins.Name = "Coins"
    Coins.Parent = leaderstats

    local XP = Instance.new("IntValue")
    XP.Name = "XP"
    XP.Parent = leaderstats
end

game.Players.PlayerAdded:Connect(onPlayerJoin)
