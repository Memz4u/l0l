-- "lua\\entities\\sent_tardis_screen\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include('shared.lua')

function ENT:Draw()
	if LocalPlayer().tardis==self:GetNWEntity("TARDIS", NULL) and LocalPlayer().tardis_viewmode and not LocalPlayer().tardis_render then
		self:DrawModel()
	end
end

function ENT:Think()
	if LocalPlayer():GetEyeTraceNoCursor().Entity==self and LocalPlayer():EyePos():Distance(self:GetPos())<60 then
		if tobool(GetConVarNumber("tardisint_tooltip"))==true then
			AddWorldTip( self:EntIndex(), "Monitor", 0.5, self:GetPos(), self.Entity  )
		end
		self.shouldglow=true
	else
		self.shouldglow=false
	end
end

