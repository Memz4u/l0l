-- "lua\\autorun\\client\\lostconnectioncheck.lua"
-- Retrieved by https://github.com/c4fe/glua-steal



-- Lenn's clientside lost connection to server checker
-- Yes, the code structure is retarded
-- but. it has to work. right?

print("Lenn's lost connection check is loading")

-- set up dumb values
await = 0
serverresponded = 0
times = 0
theservernotrespond = 0
serverdownwat = 0
thetime = 0
dudealreadyopened = 0
noconnectwarning = 0

-- usually when we lose connection to the server this timer just stops working for some reason
-- so we can use this to see if we lost connection to the server
timer.Create("lostconnectioncheck", 0, 0, function()
--print("Server responded! " .. serverresponded .. "")
serverresponded = serverresponded + 1
end)

hook.Add("Think","lostconnectioncheck", function()
await = await + 1
thetime = thetime + 1
-- stuff

-- same server responded number? woah
if await > 6 and await < 8 then
if serverresponded == serverresponded then
theservernotrespond = theservernotrespond + 1
--print("received same server responded number " .. serverresponded .. "")
lol = serverresponded 
-- check like 2 ticks and see if the server responded number is still the same. if it is. looks like we lost connection to the server!
end
end

-- if we receive the same server responded number chances of us losing connection to the server is likely
if await > 2 and await < 4 then
if serverresponded == lol then
-- we can conclude we probably lost connection to the server. now we just need to add how many times we lost connection to the server to make sure that we REALLY did actually lose connection to the server
-- if the server down time is like over 20 then i guess we really did lose connection to the server
serverdownwat = serverdownwat + 1
print("received same server responded number again previous [" .. lol .. "] latest " .. serverresponded .. " server down times: " .. serverdownwat .. "")
end
end


if await > 400 then
if serverdownwat > 24 then
--print("[LIBBY] wtf lost connection " .. serverdownwat .. "")
end
end

if await > 28 then
--print("resetting down counter [" .. serverdownwat .. "] [" .. await .. "] [" .. times .. "]")
--serverdownwat = 0
await = 0
times = 0
end

if thetime > 700 then 

-- If server down time exceeds 23 then we probably lost connection to the server
if serverdownwat > 22 then
if noconnectwarning == 1 then return end
print("[LIBBY] Lost connection to the server. Server responded number is the same: " .. serverdownwat .. "")
chat.AddText("[LIBBY] Lost connection to the server.")
chat.AddText("[LIBBY] If you're tired of seeing this run lenn_noconnectwarning in console")
serverdownwat = 0


-- With the new "oh you can talk to other people when you lost connection to the server or the server its down" thing
-- You probably won't have enough time to really stay and talk while the server is down as the server might as well reconnect you :/


function chatbox()

--if alreadyopened == 1 then print("ALREADY OPENED THE CHATBOX YOU FAGGOT DON'T NEED TO OPEN AGAIN") return end
if dudealreadyopened == 1 then return end
-- Don't remove this code ^ this could in return give you bad results and problems

-- Feel free to close the window whenever you like. I don't like making it automatically close the window right as the server isn't down
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "We might have lost connection to the server. So this chatbox was brought up" )
frame:Center()
frame:SetPos( 725, 600 )
frame:SetSize( 480, 350 )
frame:MakePopup()

-- Open the URL (or well the chatroom)
-- Even make it so mouse and keyboard input is available!
local html = vgui.Create( "DHTML", frame )
html:Dock( FILL )
html:OpenURL( "http://libbyssandbox.chatovod.com/" )


end

        chatbox()
        -- Start the chatbox function duh we're gonna need that
        dudealreadyopened = 1
        -- Set alreadyopened to 1 so that we don't have to fucking run the function again "because then we would be opening chatbox constantly every like 5 seconds!"


          








else
--print("resetting server down counter")
serverdownwat = 0
timer.Create("adazawadzawewaz", 0.75, 1, function()
-- set alreadyopened back to 0 so when we lose connection to the server next time chatbox will show up again
dudealreadyopened = 0
end)
end

thetime = 0
end





end)

concommand.Add("lenn_noconnectwarning", function()
print("[LIBBY] ignoring the lost connection to server warnings for now")
noconnectwarning = 1
end)

print("Lenn's lost connection check is functioning as expected without any lua errors so far")

-- please ignore this and please leave commented out

--[[

require("bsendpacket")
-- some shit ^

-- allow me to keep sending packets first
bsendpacket = true

timer.Simple(5, function()
bsendpacket = false
-- stop sending packets
end)

timer.Simple(25, function()
print("send packet")
bsendpacket = true
end)

]]--


--[[
await = 0
serverresponded = 0

timer.Create("lostconnectioncheck", 0, 0, function()
print("Server responded! " .. serverresponded .. "")
serverresponded = serverresponded + 1
end)

hook.Add("Think","lostconnectioncheck", function()
await = await + 1

if await > 25 then
if serverresponded == serverresponded then
print("received same server responded number " .. serverresponded .. "")
timer.Simple(0.05, function()
lol = serverresponded
end)
timer.Simple(0.1, function()
if serverresponded == lol then
print("received same server responded number again! server is down! " .. serverresponded .. "")
chat.AddText("wtf server is down " .. serverresponded .. "")
await = 0
end
end)

end
end
end)
]]--



