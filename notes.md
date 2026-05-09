# RPG framework principles docs notes

## Basic structure:

**Docs of an RPG project that I did in Roblox Studio once. This is a collection of game dev knowledge that I learned while on Roblox. I made this to take it out of Roblox, because the platform is becoming less and less open to unverified creators and I don't want to get locked out of my (unfinished) creations...**

What does this contain?
A lot of fancy variable names, folder structures and categorization that took me way too long to figure out. Also types with properties

Table of contents:
* Introduction
* The stack
    * Jecs
    * Replecs
    * ProfileStore
    * Roact
    * Axis
* The structure
    * Assets
    * Static data (templates)
        * Static data types
    * Runtime data (ECS entities)
    * Startup systems
    * ECS systems
* Terminology



## shared/assets

The assets folder is in the shared storage (Replicated storage). It has all the assets that the game has, so basically everything other than the code. It has subfolders:

- Assets
    - "GUI" or "UI" for UI template objects
    - "Sounds" for sounds, both SFX and music
    - "Images" for images, such as icons
    - "Models" (3D models)
        - "Entities" / "Objects" (physical things, bound to an ECS entity)
            - Statics (ex: tree)
            - Entities (ex: zombie)
            - Equipables (ex: pickaxe)
        - Misc (ex: 3D particles)

### shared/assets/gui
Clarification: in Roblox, GUI objects are physical objects in the explorer, not code. Libraries like Roact can make GUI out of scriptable components, but it's not built-in.

### shared/assets/models
this structure and naming is not definite and I might change it later. The "Equipables" folder for example, could be either in "Models" or in "Objects", based on how the logic works. If the developer wants an equiped object to be its own entity and not be (directly) effected by the entity that is equiping the equipable, it might be put in the "Entities" subfolder.

If the equipability logic makes the equipable a direct child of the equiping entity (ex: binding a pickaxe model to a character with Motor6D's), it might be put in the "Models" folder, because then it would be fundamentally different from an object.

For true data oriented design it is probably better to see equipables as regular entities, because otherwise when non equipable object/entity becomes an equipable of another object, that would be problematic. Example: a player taking a seat in a plane (or no plane, the seat is sufficient). This is logically basically the same as a player equipping a tool or armor, so it should use the same logic...


Add:
* f


