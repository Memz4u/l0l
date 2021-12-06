-- "lua\\autorun\\mkmchatsounds.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- mkm's chatsounds

-- Modified by lenn to only play 1 sound instead of multiple sounds



-- Only modification was timer.Create





hook.Add( "PlayerSay", "foolucalledlolllollllol", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "fool" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local ddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/Citadel/br_youfool.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: fool")
        return ddd
end)
    end
end )

hook.Add( "PlayerSay", "covid", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "covid" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local dddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('ambient/voices/cough2.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: coughing")
        return dddd
end)
    end
end )


hook.Add( "PlayerSay", "yea", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "yeah" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local ddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/npc/male01/yeah02.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: yeah")
        return ddddd
end)
    end
end )


hook.Add( "PlayerSay", "cuseme", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "excuse me" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local dddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/npc/male01/excuseme02.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: excuse me")
        return dddddd
end)
    end
end )




hook.Add( "PlayerSay", "sorry", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "sorry" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local ddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/npc/male01/sorry02.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: sorry")
        return ddddddd
end)
    end
end )



hook.Add( "PlayerSay", "hey", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "hey" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local dddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/canals/shanty_hey.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: hey")
        return dddddddd
end)
    end
end )


-- fk u
--[[
hook.Add( "PlayerSay", "no", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "no" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local ddddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/Citadel/br_no.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: no")
        return ddddddddd
end)
    end
end )
]]--



-- annoying ass mother fucking piece of shit
hook.Add( "PlayerSay", "haha", function( ply, text )
--[[
    local heckStart, heckEnd = string.find( text:lower(), "haha" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local dddddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/npc/Barney/ba_laugh01.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: haha")
        return dddddddddd
end)
    end
]]--
end )

hook.Add( "PlayerSay", "omg", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "omg" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local ddddddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/NovaProspekt/al_ohmygod.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: oh-my")
        return ddddddddddd
end)
    end
end )

hook.Add( "PlayerSay", "ohshit", function( ply, text )
    local heckStart, heckEnd = string.find( text:lower(), "oh shit" )
    if heckStart then
timer.Create("playthesoundonlyonetime", 0.5, 1, function()
        local dddddddddddd = RunConsoleCommand("ulx", "sendlua", "*", "surface.PlaySound('vo/npc/Barney/ba_ohshit03.wav')")
        PrintMessage(HUD_PRINTTALK, "[mkmsound]: shit")
        return dddddddddddd
end)
    end
end )

