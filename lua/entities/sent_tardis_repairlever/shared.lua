-- "lua\\entities\\sent_tardis_repairlever\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
ENT.Type = "anim"
if WireLib then
	ENT.Base 			= "base_wire_entity"
else
	ENT.Base			= "base_gmodentity"
end 
ENT.PrintName		= "TARDIS Repair Lever"
ENT.Author			= "Dr. Matt"
ENT.Contact			= "mattjeanes23@gmail.com"
ENT.Instructions	= "Don't spawn this!"
ENT.Purpose			= "Time and Relative Dimension in Space's Repair Lever"
ENT.Spawnable		= false
ENT.AdminSpawnable	= false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Category		= "Doctor Who"
ENT.tardis_part		= true

function ENT:SetupDataTables()
	self:NetworkVar( "Bool",	0,	"On" );
	self:NetworkVar( "Bool",	1,	"IsToggle" );

	self:SetOn( false )
	self:SetIsToggle( true );
end

