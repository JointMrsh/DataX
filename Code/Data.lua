-- Create a Folder in ServerScriptService named "PlayerManager", create a regular script, and lastly copy and paste this code!
-- Authored by Zeedy_Roblox / JointMrsh

local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("PlayerData")

local function onPlayerJoin(player) 
    local leaderstats = player:WaitForChild("leaderstats")
    local Coins = leaderstats.Coins
    local XP = leaderstats.XP

    local playerUserId = "Player_" .. player.UserId  
    local data = playerData:GetAsync(playerUserId) 
    if data then
        Coins.Value = data['Coins']
	    XP.Value = data['XP']
    else
	    Coins.Value = 0
	    XP.Value = 0
    end
end

local function create_table(player)
	local player_stats = {}
	for _, stat in pairs(player.leaderstats:GetChildren()) do
	    player_stats[stat.Name] = stat.Value
	end
	return player_stats
end



local function onPlayerExit(player)
    local player_stats = create_table(player)
    local success, err = pcall(function()
        local playerUserId = "Player_" .. player.UserId
        playerData:SetAsync(playerUserId, player_stats)
    end)
    if not success then
        warn('Could not save data!')
    end
end

game.Players.PlayerAdded:Connect(onPlayerJoin)
game.Players.PlayerRemoving:Connect(onPlayerExit)
