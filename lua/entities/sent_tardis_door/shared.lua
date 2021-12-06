-- "lua\\entities\\sent_tardis_door\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
ENT.Type = "anim"
if WireLib then
	ENT.Base 			= "base_wire_entity"
else
	ENT.Base			= "base_gmodentity"
end 
ENT.PrintName		= "Door"
ENT.Author			= "Dr. Matt"
ENT.Spawnable		= false
ENT.AdminSpawnable	= false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Category		= "Doctor Who"
ENT.tardis_part		= true

