-- "lua\\cw\\client\\cw_hooks.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function CustomizableWeaponry.InitPostEntity()
	local ply = LocalPlayer()

	CustomizableWeaponry.initCWVariables(ply)
end

hook.Add("InitPostEntity", "CustomizableWeaponry.InitPostEntity", CustomizableWeaponry.InitPostEntity)

