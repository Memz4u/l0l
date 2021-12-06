-- "lua\\entities\\cw_grenade_thrown\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

function ENT:Initialize()
	self.Entity.Emitter = ParticleEmitter(self.Entity:GetPos())
	self.Entity.ParticleDelay = 0
end

function ENT:Draw()
	self.Entity:DrawModel()
end

