-- "lua\\dronesrewrite\\weapons\\empty.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DRONES_REWRITE.Weapons["Empty"] = {
	Initialize = function(self, pos, ang)
		return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
	end
}

