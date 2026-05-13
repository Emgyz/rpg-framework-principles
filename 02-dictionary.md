# Dictionary

__This repo contains lots of words and terms which I don't want to forget the meaning of, so I will write them down here. Some of these I made up myself, like "objects". Sure these are English words, but they might mean something else in this repo than they usually do.__

__ECS__: entities, components, systems, composition over inheritance

__Entity:__ see ECS

__Component:__ see ECS

__System:__ see ECS

__Templates__: Templates is a different word for static data. It's the game content registry, a big JSON (or JSON-like) file, possibly split up into multiple files for organization purposes. It defines all of the properties and functionality that things in the game will have at runtime. Below is an example:

    local templates = {
        Sword = {
            name			= "Sword",
            objectType		= "Item",
            itemType		= "Tool",
            modelTemplate	= models.Items.Tools.Sword,

            collectability = {
                Player = {
                    maxStack = 1
                }
            },
            droppability = {
                Player = {
                    {item = "Sword", quantity = 1},
                    {item = "Orange", quantity = 3}
                    --you could make 3 oranges drop when a player
                    --throws out a sword, your imagination is the limit
                }
            },

            usability = {
                Player = {
                    [1] = {
                        actionHandler = "Melee",
                        attackDamage	= 20,
                        cooldown		= 0.2,
                        kb				= 15,
                        vkb				= 25,
                        ragdollChance	= 0.3,
                        hitboxSize		= Vector3.new(2,4,6),
                        hitboxOffset	= CFrame.new(0,0,-3),
                    },
                    [2]	= {
                        actionHandler	= "Melee",
                        attackDamage	= 40,
                        chargeTime		= 0.5,
                        cooldown		= 1,
                        kb				= 15,
                        vkb				= 25,
                        ragdollChance	= 0.3,
                        hitboxSize		= Vector3.new(2,4,6),
                        hitboxOffset	= CFrame.new(0,0,-3),
                    }
                }
            },

            equipability		= {
                Player = {
                    [Cenum.EquipSlot.Hand.value] = {
                        effects = {},
                        attachables = {
                            {
                                attachableModel	= models.Items.Tools.Sword,
                                bodyPartName	= "Right Arm",
                                C0				= CFrame.new()
                            }
                        }
                    }
                }
            }
        },

        Crate			= {
            name			= "Crate",
            objectType 		= "Entity",
            entityType		= "Misc",
            modelTemplate	= models.Entities.Crate,
            defaultEntityValues = {
                [c.Slots] = {}, --its a storage crate :D
            }
        }
    }

__Objects__: while usually the word object refers to OOP, classes and objects, etc. In this repo it refers to the combination of a template and an entity. A car is an ECS entity which uses the car template as a template.