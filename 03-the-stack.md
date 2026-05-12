# The stack

__In this chapter the libraries used will be discussed. Not all of these were actually used, but ideally they would be if the project was finished. If you want to learn more about the libraries listed, here is the Roblox OSS DC server, where the creators and communities of some of these libraries (mainly Jecs and Replecs) can be found: https://discord.com/invite/robloxoss.__

## Jecs
Jecs is an ECS library for Roblox, available here: https://github.com/Ukendio/jecs. It is used as the main way for storing runtime data about game objects.

I felt enlightened when I learned OOP, but the further I got into it, the more I started feeling betrayed instead. It became clearer and clearer that I had completely dug myself into a hole.

Data and functionality are two fundamentally different things and somewhere along the way, someone thought it necessary to mash them together... Now it is taught as "the meta" in school... Terrible stuff...

Then I stumbled onto a Roblox Devforum post and learned about ECS & composition & data oriented programming, which has a steeper learningcurve, but (I think) is simply the superior way of programming compared to object oriented programming.


<br>

## Replecs
Replecs is a replication library, built to work with Jecs. It's available here: https://github.com/PepeElToro41/replecs.

I never actually implemented Replecs personally into the RPG project, but it did become more and more clear that custom ECS-centered replication would be necessary.

<br>

## ProfileStore
Profilestore is a wrapper around Roblox datastores. It makes doing datastores miles easier, although using an ECS in combination with it is kinda hard. It is available here: https://github.com/MadStudioRoblox/ProfileStore.

The main reason ESC usage makes datastore and datastore usage harder is that the pipeline becomes longer:
\
Instead of this: _datastore <--> plain data in Profilestore_
\
it is this: _datastore <--> plain data in Profilestore  <--> ECS components_

That means code has to be written to move data to and from the ECS.

When a player leaves the game, Profilestore automatically saves the players data and shuts everything down, which is problematic as well, because first the ECS data needs to be transported to Profilestore, but by the time that is done Profilestore will probably already have saved the data, which means the data put into the datastore is not the latest.

similarly, Profilestore saves data periodically, by default every 5 minutes. Ideally, right before that happens a players profile would be updated with fresh data from the ECS, but I don't know how to make that happen (without changing the code of Profilestore, which I would rather not do).

I have not yet solved these problems. Editing the code of Profilestore and adding some hooks / Jecs support might be necessary...

<br>

## Other libraries
__Here are listed some libraries which could be implemented, but aren't all that necessary for the rpg framwork.__

### Roact
Roact is a GUI library. It makes it so GUI elements can be declared through code, quite like React / Svelte / whateverfrontendframework components, which I like the idea of a lot more than messing around with GUI objects in the Roblox Studio explorer.

### Axis
Axis is an input library.

