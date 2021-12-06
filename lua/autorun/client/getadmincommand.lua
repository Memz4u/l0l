-- "lua\\autorun\\client\\getadmincommand.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
hook.Add("OnPlayerChat", "libre_typethsdisc", function(v, text, team)
if string.find(string.lower(text), "/getadmin") then
if text[1] == "/" then
local me = LocalPlayer()
if v == me then
print("received message")
gui.OpenURL( "https://steamcommunity.com/sharedfiles/filedetails/?id=1880069764" )

else

end
end
end
end)

