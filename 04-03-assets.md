# Structure -> Assets

__This chapter is about how the assets are stored. Although asset storage seems like possibly the easiest thing about game dev, I found that if you want to make a complex game with tons of content, where anything can be anything, it quickly becomes a nightmare to keep the folder structure extendable, maintainable and reusable... Here I discuss the seamingly easy way to do it, why it fails on a larger scale and what I do instead.__

## The simple way
In theory you just ploink everything in a folder called assets, like this:

    - assets
        - boat
            - boatModel
            - rowSound
            - splashVFX
        - zombie
            - zombieModel
            - groanSound
            - attackSound
            - hurtSound
            - deathSound
        - ironSword
            - etc.

The first thing to add to the example above is to differentiate between game objects/templates and other stuff:

    - assets
        - templates
            - boat
                - boatModel
                - rowSound
                - splashVFX
            - zombie
                - etc.
        - misc
            - sound (round ended sound)
            - animation (dancing statue in the lobby)
            - image (loading screen)
            - model (3D particles)
            - gui

This is because, even though I'm trying to fit the whole game into a universal system, there is always going to be assets that just don't fit in with the rest, aka; having a misc folder is always nice. There is two main reasons the easy and simple ways discussed above fail:

- reused assets
- complexity

Additionaly, I just don't like the idea of doing asset storage in a data oriented project in an object oriented way. It's like writing a great book with a terrible ending.

## Reused assets
When all the swords or even all the items in a game use the same unequip sound, there is a problem with the asset storage above, because it requires duplicated assets, which is a bad practice. One way to fix that is to separate private and shared assets:


    - assets
        - templates
            - public (shared & reused assets)
                - gui
                - sound
                    - sword_equip
                    - sword_unequip
                - model
                - image           
                - animation
                    - attack_quick
                    - attack_heavy
            - private (per object assets)
                - "Ghost Sword"
                    - model
                    - usability
                        - player
                            - sword_attack_quick
                            - sword_attack_heavy
                            - ghost_sword_sound_attack_main
                            - ghost_sword_sound_attack_secondary
                        - zombie
                        - etc.
        - misc (ex: 3D particles)
            - gui
            - sound
            - model
            - image
            - animation

In the example above, the "Ghost Sword" has no animation tracks for it's attacks. Those come from the assets.templates.public.animation directory. the ghost sword also does not have any equiping or unequiping sound; those also come from the public assets.

Personally, I don't like this approach. It does solve some problems, but only up to a certain point and there are trade-offs. For example, you make a game with one single sword. Your game blows up, so you want to add more content to keep the players happy. You want to push out "The sword update", which adds 4 new swords. Up until now all of the sword assets belonged to "sword", but now you will have to find them and move them to the public assets container. You will then also have to readjust the paths to the assets for the original sword. It becomes a pain in the *** rather quickly.


## Complex objects

When I say complex objects. I mainly mean all the different things a single object could be and all the assets that could be necessary to make that happen. For example, a simple iron sword could:
- be a projectile when used in a throwing attack
- be a lifeless model laying on the ground
- be equiped by a player
- be equiped by a zombie
- be used by a player
- be used by a zombie
- be equiped by a zombie, with
    - different animation
    - different model (iron sword looks a lot beefier on a zombie boss than on a player)
    - different attacks, with
        - different VFX
        - 


That would either look like this, which is a chaotic mess:

    - Iron sword assets
        - iron_sword_model

        - iron_sword_model_equiped_player
        - iron_sword_model_equiped_zombie
        - iron_sword_model_equiped_zombie_boss

        - iron_sword_sound_equip_player
        - iron_sword_sound_equip_zombie
        - iron_sword_sound_equip_zombie_boss

        - iron_sword_sound_unequip_player
        - iron_sword_sound_unequip_zombie
        - iron_sword_sound_unequip_zombie_boss

        - iron_sword_sound_player_action_main
        - iron_sword_sound_player_action_secondary
        - iron_sword_sound_player_action_tertiary
        - iron_sword_sound_zombie_action_main
        - iron_sword_sound_zombie_boss_action_main
        - iron_sword_sound_zombie_boss_action_secondary

        - iron_sword_animation_player_action_main
        - iron_sword_animation_player_action_secondary
        - iron_sword_animation_player_action_tertiary
        - iron_sword_animation_zombie_action_main
        - iron_sword_animation_zombie_boss_action_main
        - iron_sword_animation_zombie_boss_action_secondary


Or it would look like this, which makes the explorer absolutely unusable due to the amount of layers and folders:

    - Iron sword assets
        - model

        - equipability
            - player
                - model
                - sound_equip
                - sound_unequip
            - zombie
                - model
                - sound_equip
                - sound_unequip
            - zombie boss
                - model
                - sound_equip
                - sound_unequip
        - usability
            - player
                - main action
                    - sound
                    - animation
                - secondary action
                    - sound
                    - animation
                - teriary action
                    - sound
                    - animation
                - etc.
            - zombie
                - main action
                    - sound
                    - animation
            - zombie_boss
                - main action
                    - sound
                    - animation
                - secondary action
                    - sound
                    - animation

Reusing assets this way is still a pain.

## ...I want it... thaaaat way!!!
I don't know a perfect way of organizing assets and I doubt there is one: it will always be a bit messy, especially when you are making a big game where one object can have multiple functionalities and assets based on context. Either way, I first separate my assets based on type:
- model
- sound
- animation
- image/texture/sprite/icon

After you have done that, the world is your oister. Separate assets in any way you prefer, for example, you could separate models like this:

    - models
        - mobs
            - zombie
            - player
            - sheep
        - statics
            - tree
            - wall
            - chest
        - mountables
            - plane
            - boat
        - equiped
            - armor
                - helmet
                - chestplate
            - food
                - carrot
                - bread
                - beer
            - materials
                - stone
                - log
                - plank
                - iron ore
            - storage
                - bundle
                - backpack
                - bottle
            - tools
                - sword
                    - player
                    - zombie
                    - zombie_boss
                - pickaxe
                - axe
                - shovel
                - bow
            - misc
                - flower

        - dropped (some things might look different when on the ground compared to when equiped)
            - armor
                - chestplate
                - helmet
            - food
            - materials
            - storage (backpack)
            - tools
            - misc
        - projectiles
        - misc

In the example above, the sword can be equiped by the player, zombie and the zombie boss. If I wanted to make the chestplate equipable by all three as well, I would make the chestplate a folder with three separate models inside. Obviously this is not perfect, since it does not show from the start what the chestplat can be equiped by. Some of the clearity is traded for less layers of folders and asset reusability. If the zombie has mostly the same model as the player, the chestplate model can be reused without needing to worry much.

Since players will probably be able to have, hold and use most if not all of the items in a game, the most logical choice is to assume a model is ment for the player unless specified or made clear by the name of the mode.

Please do note that any and all categories below the "type" categories are soft and organizational only. They are only there to help navigate the big amount of assets. They are not there because there is a fundamental difference between the categories.

For example, there is no hard border between a horse and a plane. In fact, the only difference is that a horse has wandering behaviour when a player nobody is riding it, while a plane has no behaviour when nobody is flying it.

If you wanted to make it so players can have mobs or walls in their inventory, you'd just add "mobs" and "statics" to the "equiped" folder and add some smaller models in there, so a wall doesn't look absolutely when equiped in a players hands. Alternatively, you don't and just use the models in the already existing folders.

## Data orientation
The reason I do my asset storage this way, is that it soothes my brain. The more my scope creep leads me into trying to make more and more complex things, the more I realise everything should be centered around data, even the assets.

There is no other way. If you try another way, you will get stuck when your game reaches a certain size. It will be a giant blob of immovable code and assets, whereas a data oriented game, although big, will still be workable.

I do realise that sadly not everything can be data oriented. Games are just a prime example of something that CAN be data oriented. Maybe that is why I like making them so much...