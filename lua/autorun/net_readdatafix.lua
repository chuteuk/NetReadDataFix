if SERVER then AddCSLuaFile("autorun/net_readdatafix.lua") end
--Override the old net.ReadData function
local oldNetReadData = oldNetReadData or net.ReadData
function net.ReadData(len)
	return oldNetReadData(math.Clamp(len,0,65533)) --Clamp the length to the maximum size of a net message (65533 bytes)
end