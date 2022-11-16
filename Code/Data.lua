-- Create a Folder in ServerScriptService named "PlayerManager", create a regular script, and lastly copy and paste this code!
-- Authored by Zeedy_Roblox / JointMrsh

local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("PlayerData")

local function onPlayerJoin(player) 
    local leaderstats = player:WaitForChild("leaderstats")
    local Coins = leaderstats.Coins -- Change leaderstats.Coins to the value name you added to your leaderstats.
    local XP = leaderstats.XP -- Change leaderstats.XP to the value name you added to your leaderstats.

    local playerUserId = "Player_" .. player.UserId  
    local data = playerData:GetAsync(playerUserId) 
    if data then
        Coins.Value = data['Coins'] -- Change data['Coins'] to the value you wish to save.
	XP.Value = data['XP'] -- Change data['XP'] to the other value you wish to save.
    else
	Coins.Value = 0 -- Change Coins.Value to whatever you have in your leaderstats.
	XP.Value = 0 -- Change Coins.Value to whatever you have in your leaderstats.
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
