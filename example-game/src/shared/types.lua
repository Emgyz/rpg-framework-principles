

--[[
	this is where the types for all the content in the game
	are defined. They are separated in "Action", "Item", "Entity", "Recipe" and "Objective"
	
	Actions are bound to items
	Items are things in an itemstorage
	Entities are things in the workspace, such as cows, walls, etc.
	Recipes are for the crafting and building system
	Objectives are for quests / missions

	these types only contains the immutable properties,
	the mutable properties are in the ecs entities
	
	if a type is not one that will be bound to ecs entities,
	then mutable properties are just not relevant...
]]


export type Action = {
	chargeTime			: number ?,
	actionHandler		: "Melee" | "RangedFBF" | "RangedPB" | string, --string that points to a util handler function
	
	kb					: number ?,
	vkb					: number ?,
	ragdollChance		: number ?,
	hitboxOffset		: CFrame ?,
	hitboxSize			: Vector3 ?,
	
	attackDamage		: number ?,
	mineDamage			: number ?,
	chopDamage			: number ?,
	
	cooldown			: number,
}



export type ItemTemplate = {
	name : string,
	templateType		: "Item" ?,
	itemType			: "Armor" | "Tool" | "Material" | "Food" | "Storage" | "Misc",
	
	modelTemplate		: Model ?, --3d model template
	
	droppability		: true ?, --whether or not the item can be dropped (some items should be player specific)
	usability			: {Action} ?, --actions that can be executed by an entity with the weapon
	equipability			: {
		[string] : { --entity name
			[number] : { --equipslot: cenum.Equipslot
				["effects"] : {},
				["attachables"] : {
					{
						["attachableModel"]	: Model,
						["bodyPartName"]	: string,	
						["C0"]				: CFrame, --don't know yet if it should be cframe or vector3
					}
				}
			}
		},
	} ?,
	
	--default ecs entity values (health upon spawning, etc.)
	defaultEntityValues	: {[string] : any} ?, --use Jecs components as indexes (they are numbers) (UPDATE: DO NOT DO THAT BECAUSE OF DATASTORES, THEY WILL F*CK UP IF THE COMPONENTS ARE LOADED IN THE WRONG ORDER EVEN ONCE)
}


export type EntityTemplate = {
	name				: string ?,
	templateType		: "Item" | "Entity" | "Recipe" | "Objective" ?,
	entityType 			: "Mob" | "Player" | "Static" | "Misc" ?,
	
	modelTemplate		: Model ?, --3d model template
	behaviourHandler	: string ?, --pathfinding ai, animated windmills, etc.
	
	
	--things with health (killable / minable / chopable things)
	maxHealth			: number ?,
	maxRegeneration		: number ?, --hp / s
	maxSaturation		: number ?, --saturation goes down over time,
	
	static				: true ?, --whether this entity is supposed to be a static thing (ex. wall) or a moving thing (ex. cow)
	collectability		: true ?, --whether the entity can be picked by the player (maybe also other entities, dunno yet)
	
	--default ecs entity values (health upon spawning, etc.)
	defaultEntityValues	: {
		public : {[string] : any},
		private : {[string] : any},
	} ?, --use Jecs components as indexes (they are numbers) (UPDATE: DO NOT DO THAT FOR DATASTORES, THEY WILL F*CK UP IF THE COMPONENTS ARE LOADED IN THE WRONG ORDER EVEN ONCE)
}


export type RecipeTemplate = {
	name				: string ?,
	templateType		: "Recipe" ?,
	
	requirements	: {}, --required level etc.
	ingredients		: {}, --ingredient items
	result			: {}, --resulting items
	handler			: ((...any) -> ())? --function that handles additional effects upon crafting
}


--still not sure if objective should have a container type (like "Quest"), so one quest can have multiple objectives
export type ObjectiveTemplate = {
	name				: string ?,
	templateType		: "Objective" ?,
	
	rewards : {}, --what the player gets when completing the objective
	
	--default ecs entity values (health upon spawning, etc.)
	defaultEntityValues	: {[string] : any} ?, --use Jecs components as indexes (they are numbers) (UPDATE: DO NOT DO THAT FOR DATASTORES, THEY WILL F*CK UP IF THE COMPONENTS ARE LOADED IN THE WRONG ORDER EVEN ONCE)
}


export type ItemData		= {[string] : ItemTemplate}
export type EntityData		= {[string] : EntityTemplate}
export type RecipeData		= {[string] : RecipeTemplate}
export type ObjectiveData	= {[string] : ObjectiveTemplate}


return true