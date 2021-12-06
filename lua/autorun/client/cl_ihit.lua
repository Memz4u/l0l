-- "lua\\autorun\\client\\cl_ihit.lua"
-- Retrieved by https://github.com/c4fe/glua-steal

-- dumb retarded anti killing spree build mode check by lenn
-- :O


chat.AddText("No more killing people in build mode initalized")



tracerTable = {}
hitmarkerTable = {}
hit = 0

hook.Add("PreDrawOpaqueRenderables", "DrawTracerBeam", function ()
        for k,v in next, tracerTable do
        if(v[3] <= 0) then
            table.remove(tracerTable, k);
            continue;
        end

        tracerTable[k][3] = tracerTable[k][3] - FrameTime();
        local pos1, pos2 = v[1], v[2];
        --cam.Start3D();
        hit = hit + 1
        if hit > 10 then      
        hit = 0
if LocalPlayer():GetNWBool("BuildMode") then 
        chat.AddText( Color(255,0,0), "[Libby]: Hey. you're in build mode! You can't just be shooting people in build mode! (set to pvp mode)")
        RunConsoleCommand("say","!pvp")
        --render.SetMaterial(Material( "cable/redlaser" ))
        --render.DrawBeam(v[1], v[2], 4, 1, 1, v[4])
        --cam.End3D();
        else
        if hit > 10 then      
        hit = 0
        --render.SetMaterial(Material( "cable/redlaser" ))
        --render.DrawBeam(v[1], v[2], 4, 1, 1, v[4])
        --cam.End3D();
    end
end
end
end
end)

timer.Create("resethitdelayevery30seconds", 30, 0, function()
hit = 0
end)

--[[
hook.Add("HUDPaint", "DrawTracer",function ()
end)
]]--

hook.Add("PlayerTraceAttack", "BulletTracer", function (ent, dmg, dir, trace)
if LocalPlayer():GetNWBool("BuildMode") then 
    if(!IsFirstTimePredicted()) then return; end

    local vHitPos, vSrc;
    vHitPos = trace.HitPos;
    vSrc = trace.StartPos;

    table.insert(tracerTable, {vHitPos, vSrc, 0.001, Color(0, 255, 0), LocalPlayer():EyeAngles()});
    table.insert(hitmarkerTable, {vHitPos, 0.001})
end
end)



