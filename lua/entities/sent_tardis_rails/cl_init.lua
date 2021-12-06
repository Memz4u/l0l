-- "lua\\entities\\sent_tardis_rails\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include('shared.lua')

function ENT:Draw()
	if LocalPlayer().tardis==self:GetNWEntity("TARDIS", NULL) and LocalPlayer().tardis_viewmode and not LocalPlayer().tardis_render then
		self:DrawModel()
	end
end

