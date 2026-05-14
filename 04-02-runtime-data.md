# Structure -> Runtime data

## notes
- the runtime data is (mostly) stored as ECS entities (with components of course)
- For things like terrain, it makes sense to not use entities, because it can be very efficiently stored in arrays.
- Objects: enti