# RPG framework principles docs notes






## shared/assets

The assets folder is in the shared storage (Replicated storage). It has all the assets that the game has, so basically everything other than the code. It has subfolders:


- assets
    - templates
        - public (shared / reused assets)
            - gui (UI template objects)
            - sound (SFX)
            - icon
            - model
            - etc.
        - private (per object assets)
            - "Example item"
                - model (when dropped on the ground)
                - equipability
                    - player
                        - sound_equip
                        - sound_unequip
                        - usability
                            - main (quick attack)
                                - sound
                                - animation
                                - etc.
                            - secondary (heavy attack)
                            - etc.
                        
                    - zombie
                        - etc.
                

    - misc (ex: 3D particles)
        - gui
        - sound
        - animation
        - model
        - image

### assets.gui
Clarification: in Roblox, GUI objects are physical objects in the explorer, not code. Libraries like Roact can make GUI out of scriptable components, but it's not built-in.

### assets.models
this structure and naming is not definite and I might change it later. The "Equipables" folder for example, could be either in "Models" or in "Objects", based on how the logic works. If the developer wants an equiped object to be its own entity and not be (directly) effected by the entity that is equiping the equipable, it might be put in the "Entities" subfolder.

If the equipability logic makes the equipable a direct child of the equiping entity (ex: binding a pickaxe model to a character with Motor6D's), it might be put in the "Models" folder, because then it would be fundamentally different from an object.

For true data oriented design it is probably better to see equipables as regular entities, because otherwise when non equipable object/entity becomes an equipable of another object, that would be problematic. Example: a player taking a seat in a plane (or no plane, the seat is sufficient). This is logically basically the same as a player equipping a tool or armor, so it should use the same logic...


Add:
* f


