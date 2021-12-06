-- "addons\\wiremod\\lua\\entities\\gmod_wire_egp\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
ENT.Type           = "anim"
ENT.Base           = "base_wire_entity"

ENT.PrintName      = "Wire EGP"
ENT.Author         = "Divran"
ENT.Contact        = "Divran @ Wiremod"
ENT.Purpose        = "Bring Graphic Processing to E2"
ENT.Instructions   = "Wirelink To E2"

ENT.Spawnable      = false

ENT.RenderGroup     = RENDERGROUP_BOTH

include("lib/init.lua")
if (SERVER) then AddCSLuaFile("lib/init.lua") end


function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Translucent" )
end

