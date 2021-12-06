-- "addons\\cssweapon\\lua\\entities\\ent_explosivegrenade\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
ENT.Type = "anim"
ENT.PrintName		= "EXPLOSIVE GRENADE"
ENT.Author			= "WORSHIPPER"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function ENT:OnRemove()
end

/*---------------------------------------------------------
PhysicsUpdate
---------------------------------------------------------*/
function ENT:PhysicsUpdate()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound(Sound("HEGrenade.Bounce"))
	end
	
	local impulse = -data.Speed * data.HitNormal * .4 + (data.OurOldVelocity * -.6)
	phys:ApplyForceCenter(impulse)
end


