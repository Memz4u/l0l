-- "lua\\autorun\\cl_autoreconnectlenn.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- Some auto reconnection if the server just happens to die and nobody even realizes
--  Added by lenn

local msg = "Lost connection to server. Reconnecting to server: %s seconds" -- Message displayed at center of screen upon timeout
local retry_wait = 90 
-- retry_wait can also be 100

if CLIENT then
    local last_timeout = nil

    net.Receive("libbystimeout", function()
        last_timeout = CurTime()
    end)

    hook.Add("HUDPaint", "libbystimeout", function()
        if not last_timeout then return end
        if CurTime() - last_timeout <= 30 then return end -- It is avised to keep this number at or above 15 to stop players with slow PC's from being booted and reconnected for taking too long.
        draw.SimpleText(msg:format(math.Round(((last_timeout + retry_wait) - CurTime()))), "ScoreboardDefaultTitle", ScrW() / 2, ScrH() / 2, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

        if (CurTime() - last_timeout) > retry_wait then
            chat.AddText(Color( 255, 255, 255), "[LIBBY AUTO-RECONNECT]: I try to connect to server, Hope it's up!") 
            LocalPlayer():ConCommand("retry")
        end
    end)
else
    util.AddNetworkString("libbystimeout")

    timer.Create("libbystimeout", 5, 0, function()
        net.Start("libbystimeout")
        net.Broadcast()
    end)
end

