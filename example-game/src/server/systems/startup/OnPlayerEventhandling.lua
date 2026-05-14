--!strict
--[[this script handles players joining, spawning, dying, leaving]]

--services
local sss = game:GetService("ServerScriptService")
local rs = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

--lib
local Signal = require(rs.Lib.Signal)
local Cenum = require(rs.Cenum)

--ECS
local world				= require(rs.ECS.World)
local c					= require(rs.ECS.Components)
local playerEntities	= require(rs.ECS.PlayerEntities) --vars--playerEntities[player.userId] = entityId

--data
local dataTemplates = require(rs.Data.Templates)
local characterAddedEvents = {}
local playerDiedEvents = {}


--functions
local function onPlayerAdded(plr)
	--1. load player data / player entity
	local playerData = --[[replace with datastore stuff ... or ...]] dataTemplates.entity.PlayerR6.defaultEntityValues
	local playerEntity = world:entity()
	
	
	--set all the players ECS component values
	world:set(playerEntity, c.templateName, dataTemplates.entity.PlayerR6.name)
	world:set(playerEntity, c.EquipmentSlots, playerData[c.EquipmentSlots])
	world:set(playerEntity, c.ActionInfo, playerData[c.ActionInfo])
	world:set(playerEntity, c.Slots, playerData[c.Slots])
	world:set(playerEntity, c.EXP, playerData[c.EXP])
	
	--put the players entity reachable with their user id
	playerEntities[plr.UserId] = playerEntity	
	
	--2. fire the playeradded signal
	Signal:Fire(Cenum.playerSignals.playerAdded, plr)

	--3. connect the characterAdded event
	characterAddedEvents[plr.UserId] = plr.CharacterAdded:Connect(function(char)
		Signal:Fire(Cenum.playerSignals.characterAdded, char)
		
		--put the players character into the ECS
		world:set(playerEntity, c.Model, char)

		--connect the playerDied event
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		playerDiedEvents[plr.UserId] = humanoid.Died:Connect(function()
			
			--remove players character from the ECS
			world:set(playerEntity, c.Model, nil)

			--remove playerDied event on death (because the same humanoid only dies once)
			if playerDiedEvents[plr.UserId] then
				playerDiedEvents[plr.UserId]:Disconnect()
				playerDiedEvents[plr.UserId] = nil
			end

			Signal:Fire(Cenum.playerSignals.playerDied, plr)
		end)
	end)
	
	--4. send the player their data
    --and keep sending it until they accept it
    --[unfinished]
	--[[
    local accepted = false
	while not accepted do
		local result = rs.Remotes.SendClientData:InvokeClient(plr, playerData)
		if result == true then
			accepted = true
		end
	end
    ]]
end

local function onPlayerRemoving(plr)
	--1. save player data 
	local playerEntity = playerEntities[plr.UserId]
	--do datastore things here

	--2. remove player data
	local playerEntity = playerEntities[plr.UserId]
	world:clear(playerEntity)
	world:delete(playerEntity)
	playerEntities[plr.UserId] = nil

	--3. remove playerDied event
	if playerDiedEvents[plr.UserId] then
		playerDiedEvents[plr.UserId]:Disconnect()
		playerDiedEvents[plr.UserId] = nil
	end

	--4. remove characterAdded event
	if characterAddedEvents[plr.UserId] then
		characterAddedEvents[plr.UserId]:Disconnect()
		characterAddedEvents[plr.UserId] = nil
	end

	--5. fire the playerRemoving event
	Signal:Fire(Cenum.playerSignals.playerRemoving, plr)
end


--event bindings & logic
players.PlayerAdded:Connect(function(plr)		onPlayerAdded(plr)		end)
for _, plr in players:GetPlayers() do			onPlayerAdded(plr)		end
players.PlayerRemoving:Connect(function(plr)	onPlayerRemoving(plr)	end)

return true