-- "addons\\spawnprotection\\lua\\autorun\\cl_spawn_protect.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if SERVER then return end

net.Receive("spawn_protect_say", function()
	local data = net.ReadString()
	chat.AddText(Color(0,255,0), "[libre] ",Color(255,255,255),data)
end)

net.Receive("spawn_protect_say_error", function()
	local data = net.ReadString()
	chat.AddText(Color(0,255,0), "[libre] ",Color(255,0,0),data)
end)
local Spawns = {}
net.Receive("spawn_protect_update_spawns", function()
	Spawns = net.ReadTable()
end)

local function DrawSpawns(b1, b2)
	for key,val in pairs(Spawns) do 
		render.SetColorMaterial()
		render.DrawSphere( val[1], val[2], 10, 10, Color( 0, 175, 0, 25 ) )
		--print(val[1])
		--print(val[2])
	end
end


hook.Add("PostDrawOpaqueRenderables", "Draw Spawns", DrawSpawns)

