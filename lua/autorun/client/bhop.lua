-- "lua\\autorun\\client\\bhop.lua"
-- Retrieved by https://github.com/c4fe/glua-steal

-- 12/5/2021 11:53 AM now... auto bunnyhop disables if you're moving fast!
CreateClientConVar("ms_bhop", "1", true, false)

local function ms_bhop()
  if GetConVarNumber ("ms_bhop") == 1 then
    if gui.IsGameUIVisible() or gui.IsConsoleVisible() or LocalPlayer():IsTyping() or LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP or LocalPlayer():GetVelocity():Length() > 1500 then return end
  if input.IsKeyDown(KEY_SPACE) and LocalPlayer():IsOnGround() then
    RunConsoleCommand("+jump")
  else
    RunConsoleCommand("-jump")
  end
 end
end

hook.Add("Think", "ms_bhop", ms_bhop)

RunConsoleCommand("r_WaterDrawReflection", 1)
RunConsoleCommand("r_WaterDrawRefraction", 1) 
RunConsoleCommand("r_waterforceexpensive", 1)
RunConsoleCommand("r_waterforcereflectentities", 1)




