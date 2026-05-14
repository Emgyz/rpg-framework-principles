--!strict

local rs = game:GetService("ReplicatedStorage")

local world = require(rs.ECS.World)

return {
	
	--marker components, some do have values, a lot of them are empty
	is = {
		--empty
		WorldChunk	= world:component(),
		ChunkTile	= world:component(),
		Player		= world:component(),
		
		--with value
		DoDamage	= world:component(),
	},
	
	
	--templates are just the static data, so systems can grab static data for things
	templateType = world:component(),
	templateName = world:component(),
	
	--workspace things 
	Model		= world:component(),
	NeedsModel	= world:component(),
	
	--things with health and things that can be destroyed
	Dead				= world:component(),
	Health				= world:component(),
	MaxHealth			= world:component(),
	Regeneration		= world:component(),
	ChopableResistance	= world:component(),
	MinableResistance	= world:component(),
	KillableResistance	= world:component(),
	dropsOnDeath		= world:component(), --drop item entities on death

	--terrain (chunks)
	Position2D	= world:component(),
	Height		= world:component(),
	
	--things that can store things
	Slots			= world:component(),
	EquipmentSlots	= world:component(),
	
	--things that can performs actions
	ActionInfo = world:component(),
	
	--player
	EXP = world:component(),
	Renderdistance = world:component(), --in chunks, not studs
	
	--things that can store things
	ItemStorage = world:component(),
	
	--physical things that can be collected (remove this. it should be moved to the static template data)
	Collectible = world:component(),
}

