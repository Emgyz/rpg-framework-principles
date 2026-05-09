# Structure | Assets

__This chapter is about how the assets are stored. Although asset storage seems like possibly the easiest thing about game dev, I found that if you want to make a complex game with tons of content, where anything can be anything, it quickly becomes a nightmare to keep it extendable, maintainable and reusable... Here I discuss the seamingly easy way to do it, why it fails on a larger scale and better alternatives.__

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

The first thing I have to add to the example above is to differentiate between game objects and other stuff:

- assets
    - objects
        - boat
            - boatModel
            - rowSound
            - splashVFX
        - zombie
            - etc.
    - misc
        - gui
        - sound (round ended sound)
        - animation (dancing statue in the lobby)
        - model (ex: 3D particles)
        - image

There is two main reasons the easy and simple way(s) discussed above fails:
- complexity
- reused assets

## Reused assets
When all the swords or even all the items in a game use the same unequip sound, there is a problem with the asset storage above, because it requires duplicated assets, which is a bad practice.

One way to fix that is to separate private and shared assets:
- assets

## Complex objects

When I say complex objects. I mainly mean all the different things a single object could be. For example, a simple iron sword could:
- be a projectile when used in a throwing attack
- be a lifeless model laying on the ground
- be equiped by a player
- be equiped by a zombie, with
    - different animation
    - different model (iron sword looks a lot beefier on a zombie boss than on a player)
    - different attacks, with
        - different VFX
        - 


Flip, even the attacks themselves have could have