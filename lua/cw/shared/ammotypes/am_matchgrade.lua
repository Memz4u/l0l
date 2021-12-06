-- "lua\\cw\\shared\\ammotypes\\am_matchgrade.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local att = {}
att.name = "am_matchgrade"
att.displayName = "Match grade rounds"
att.displayNameShort = "Match"

att.statModifiers = {AimSpreadMult = -0.3}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)

