# Problems

__This is where I describe unsolved problems of my current state of the framework.__

## Replication

On Roblox, traditionally, replication is done with remote events and remote functions. When heavily using ECS though, that becomes impractical very quickly. That is why in chapter about the stack, there is something called "Replecs", a library that replicates ECS entities and their components. 


## Profilestore and Jecs not being synced

As mentioned before, the Profilestore library is awesome, but syncing it to an ECS library is not that easy. Especially when a player leaves, it is not simple to feed Profilestore with the newest player data from the players ECS components BEFORE Profilestore saves old data to the datastore and abandons all right after.