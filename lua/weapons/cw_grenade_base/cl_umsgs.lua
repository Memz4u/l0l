-- "lua\\weapons\\cw_grenade_base\\cl_umsgs.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function CW_Flashbanged(data)
	local intensity = data:ReadFloat()
	local duration = data:ReadFloat()
	
	LocalPlayer():cwFlashbang(intensity, duration)
end

usermessage.Hook("CW_FLASHBANGED", CW_Flashbanged)

