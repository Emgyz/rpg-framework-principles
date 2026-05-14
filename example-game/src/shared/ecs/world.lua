--services
local rs = game:GetService("ReplicatedStorage")

--lib
local Jecs = require(rs.Lib.Jecs)

--setup
return Jecs.World.new()