-- "addons\\cssweapon\\lua\\entities\\ent_explosivegrenade\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include('shared.lua')

/*---------------------------------------------------------
Draw
---------------------------------------------------------*/
function ENT:Draw()
	self.Entity:DrawModel()
end


/*---------------------------------------------------------
IsTranslucent
---------------------------------------------------------*/
function ENT:IsTranslucent()
	return true
end




