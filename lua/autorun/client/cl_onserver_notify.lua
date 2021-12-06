-- "lua\\autorun\\client\\cl_onserver_notify.lua"
-- Retrieved by https://github.com/c4fe/glua-steal

--[[
-- Notify you when you're on the server. May annoy or scare some people lol
timer.Simple(10, function() if LocalPlayer():IsValid() then sound.PlayURL("http://libbyssandbox.com/sound/welcometohell.wav", "mono noblock", function(station) if ( IsValid( station ) ) then ClientStation = station station:Play() station:SetVolume( 2 ) end end) end end)
]]--

iamdefinitelyresponding = 0
irespond = 0

hook.Add( "Think", "amiloading", function()
local fps2 = math.Round( 1 / FrameTime() )
realfps = fps2
--print("" .. realfps .. "")
if realfps > 10 then
irespond = irespond + 1
end
end)

timer.Create("checks", 1, 60, function()
if irespond > 500 then
print("I am responding.")
iamdefinitelyresponding = 1
hook.Remove("Think","amiloading")
timer.Remove("checks")
end
end)



timer.Create("IGOTTALOADTHIS", 0.25, 0, function()
if iamdefinitelyresponding == 1 then
sound.PlayURL("http://libbyssandbox.com/sound/welcometohell.wav", "mono noblock", function(station) if ( IsValid( station ) ) then ClientStation = station station:Play() station:SetVolume( 1 ) end end)
timer.Remove("IGOTTALOADTHIS")
end
end)



