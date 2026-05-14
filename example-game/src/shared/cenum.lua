return {
	ObjectFlags = { --properties that anything in the game can have
		Collectable	= 0,
		Craftable	= 1,
		
		LandPlacable	= 5,
		WaterPlacable	= 6,
		SkyPlacable		= 7,
	},
	
	EquipSlot = { --used for equipability
		Hand		= {name = "Hand",		value = 0},
		Back		= {name = "Back",		value = 1},
		Head		= {name = "Head",		value = 2},
		Legs		= {name = "Legs",		value = 3},
		Torso		= {name = "Torso",		value = 4},
		LeftHip		= {name = "LeftHip",	value = 5},
		RightHip	= {name = "RightHip",	value = 6},
		LeftFoot	= {name = "LeftFoot",	value = 7},
		RightFoot	= {name = "RightFoot",	value = 8},
	},
	
	ActionPriority = {
		Main		= 0,
		Secondary	= 1,
		Tertiary	= 2,
		Quaternary	= 3,
		Quinary		= 4,
	},
	
	ObjectType = {
		Structure = 0,
		Action = 1,
		Item = 2,
		Mob = 3,
	},
	
	InputState = {
		InputBegan = 0,
		InputEnded = 1,
	},
	
	playerSignals = {
		playerDied		= 0,
		playerAdded		= 1,
		playerRemoving	= 2,
		characterAdded	= 3,
		
		unbindInput		= 5,
		bindInput		= 4,
	},
}
