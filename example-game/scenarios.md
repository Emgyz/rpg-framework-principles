# Scenarios
__A scenario is a set of steps to be gone through. It gives (me) a very clear path to develop along. This is not part of the RPG framework, but relevant for the game I was trying to make with it.__

## Feature list
Here are all the features to be implemented for a minimal, yet acceptable version of the game:
- items (in inventory)
- objects
- actions
- leveling system
- procedural terrain generation

Here are features that might improve the fun factor, but are not functionally necessary for the MVP:
- automatic combat (like in My Little Universe)
- ingame tutorial and docs
- storyline (quests and cutscenes)
- lore

## Scenario 1 (objects, items & actions)
1. The player spawns
2. The player sees some pebbles laying on the ground
3. The player picks up the pebbles
4. The player sees a tree.
5. The player cuts down the tree with the pebble(s) (stackable or not??)
6. The tree shakes when getting hit
7. The player makes a stone tool with the pebbles and the wood from tree
8. A zombie spawns
9. The player attacks the zombie with the stone tool
10. An attack animation plays
11. The zombie takes knockback

Well done, if all these steps are possible, there are now:
- objects
- inventory & hotbar 
- crafting system & recipes
- a simple zombie spawner system
- a mob AI handler
- actions

What's left to do:
- Terrain generation
- Day / night cycle
- Leveling system
- Automatic combat
- ALL THE GAME DESIGN

## Scenario 2 (world building)
- terrain
- day/night cycle

## Scenario 3 (quests & storyline)
- A new player joins
- The game recognizes the player is new
- The game assigns the tutorial questline
- The things described in scenario 1 happen, but in a controlled environment (the zombie only spaws once the player has crafted the tool etc.)