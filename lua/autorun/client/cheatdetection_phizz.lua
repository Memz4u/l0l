-- "lua\\autorun\\client\\cheatdetection_phizz.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- WORLDS FINEST LENN IDIOTBOX DETECTOR CLIENTSIDE IN 7 LINES

timer.Create("idiotbox_detect", 0.5, 0, function()
if ( timer.Exists( "ChatPrint" ) ) then
timer.Simple(0.1, function() RunConsoleCommand("say","I chew 5 gum. I all out of gum. (Phizz Cheat detection)") end)
timer.Simple(0.1, function() timer.Remove("idiotbox_detect") end)
else
end
end)

