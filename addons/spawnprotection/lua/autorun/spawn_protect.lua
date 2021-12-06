-- "addons\\spawnprotection\\lua\\autorun\\spawn_protect.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if CLIENT then return end
include('lang.lua')
util.AddNetworkString("spawn_protect_say")
util.AddNetworkString("spawn_protect_say_error")
util.AddNetworkString("spawn_protect_update_spawns")

local SP_enabled = CreateConVar("spawn_protect_enabled", 1, FCVAR_ARCHIVE, SP_LANG.SP_enabled)
local SP_radius = CreateConVar("spawn_protect_radius", 120, FCVAR_ARCHIVE, SP_LANG.SP_radius)
local SP_setspawn = CreateConVar("spawn_protect_setspawn", 1, FCVAR_ARCHIVE, SP_LANG.SP_setspawn)
local SP_recoil = CreateConVar("spawn_protect_setsp_recoil", 60, FCVAR_ARCHIVE, SP_LANG.SP_recoil)
local SP_block = CreateConVar("spawn_protect_block", 1, FCVAR_ARCHIVE, SP_LANG.SP_block)
local SP_anti_back_spawn = CreateConVar("sp_anti_back_spawn", 1, FCVAR_ARCHIVE, SP_LANG.SP_anti_back_spawn)
local SP_render_spawns = CreateConVar("sp_render_spawns", 1, FCVAR_ARCHIVE, SP_LANG.SP_render_spawns)
SP={}

local AllPosition = nil
local AllRadius = 0
local Players_spawns = {}

function SP.UpdateSpawnsPlayer(ply)
	if(SP_enabled:GetInt() == 0) then return end
	if(SP_render_spawns:GetInt() == 0) then return end
	local All_Spawns = {}
	local radius_protect = SP_radius:GetInt()
	if AllPosition == nil then
		for key,val in pairs(ents.FindByClass( "info_player_start" )) do 
			table.insert(All_Spawns,{val:GetPos(),radius_protect})
		end
	else
		table.insert(All_Spawns,{AllPosition,AllRadius+radius_protect})
	end
	net.Start("spawn_protect_update_spawns")
		net.WriteTable(All_Spawns)
	net.Send(ply)
end



-- hey man just received your message man
-- here is your expected code in man

function SP.SetupMove(ply, _, cmd)
    if not cmd:IsForced() and not ply.sp_init then
        SP.UpdateSpawnsPlayer(ply)
        ply.sp_init = true
    end
end
hook.Add("SetupMove", "Spawn Protect Player Spawn", SP.SetupMove)

--[[
function SP.PlayerInitSpawn( ply )
	SP.UpdateSpawnsPlayer(ply)
end
hook.Add( "PlayerInitialSpawn", "Spawn Protect Player Spawn", SP.PlayerInitSpawn )
]]--

function SP.UpdateSpawnsAllPlayers()
	for key,val in pairs(player.GetAll()) do 
		SP.UpdateSpawnsPlayer(val)
	end
end

SP.UpdateSpawnsAllPlayers()

function SP.TakeDamage( vic, ply )
	if(SP_enabled:GetInt() == 0) then return end
	if ply == vic then
		return true
	end 
	if ply:IsPlayer() then
		local PlyInSpawn = SP.InSpawn(ply)
		if (SP_anti_back_spawn:GetInt() == 0) then
			if PlyInSpawn then
				SP.SendToChatError( SP_LANG.AttackPlyInSpawn,ply)
				hook.Call( "SpawnProtectAttackPlyInSpawn", GAMEMODE, ply )
				hook.Call( "SpawnProtectTakingDamage", GAMEMODE, vic )
				return false
			end
		else
			local PlySpawned = tonumber(ply:GetPData("Spawned", 0 ))
			if PlyInSpawn and PlySpawned==1 then
				SP.SendToChatError( SP_LANG.AttackPlyInSpawn,ply)
				hook.Call( "SpawnProtectAttackPlyInSpawn", GAMEMODE, ply )
				hook.Call( "SpawnProtectTakingDamage", GAMEMODE, vic )
				return false
			elseif not PlyInSpawn and PlySpawned == 1 then
				ply:SetPData("Spawned", 0 )
			end
		end
	end
	if vic:IsPlayer()  then
		local VicInSpawn = SP.InSpawn(vic)
		if (SP_anti_back_spawn:GetInt() == 0) then
			if VicInSpawn and ply:IsPlayer() then
				SP.SendToChatError( SP_LANG.AttackPlyInSpawn2,ply)
				hook.Call( "SpawnProtectAttackPlyInSpawn", GAMEMODE, ply )
				hook.Call( "SpawnProtectTakingDamage", GAMEMODE, vic )
				return false
			end
		else
			local VicSpawned = tonumber(vic:GetPData("Spawned", 0 ))
			if VicInSpawn and VicSpawned==1 and ply:IsPlayer() then
				SP.SendToChatError( SP_LANG.AttackPlyInSpawn2,ply)
				hook.Call( "SpawnProtectAttackPlyInSpawn", GAMEMODE, ply )
				hook.Call( "SpawnProtectTakingDamage", GAMEMODE, vic )
				return false
			elseif not VicInSpawn and VicSpawned == 1 then
				vic:SetPData("Spawned", 0 )
			end
		end
	end
end
hook.Add("PlayerShouldTakeDamage", "Spawn Protect", SP.TakeDamage)

function SP.InSpawn(ply)
	local spawns = ents.FindByClass( "info_player_start" )
	local radius_protect = SP_radius:GetInt()
	for key,val in pairs(spawns) do 
		local distanse = ply:GetPos():Distance(val:GetPos())
		if (distanse <= radius_protect) then 
			return true 
		end
	end
	if AllPosition != nil then
		local distanse = ply:GetPos():Distance(AllPosition)
		if (distanse <= (AllRadius+radius_protect)) then 
			return true 
		end
	end
	return false
end

function SP.SetAllSpawn(ply,radius)
	if(SP_enabled:GetInt() == 0) then return end
	if not ply:IsValid() then return end
	if not (ply:IsAdmin() or ply:IsSuperAdmin()) then
		SP.SendToChatError( SP_LANG.NoPermissions,ply)
		return
	end
	AllRadius = radius
	AllPosition = ply:GetPos()
	AllPosition.z = AllPosition.z+10
	SP.SendToAllChat( SP_LANG.CreatedAllSpawn)
	SP.UpdateSpawnsAllPlayers()
end

function SP.UnSetAllSpawn(ply)
	if(SP_enabled:GetInt() == 0) then return end
	if not ply:IsValid() then return end
	if not (ply:IsAdmin() or ply:IsSuperAdmin()) then
		SP.SendToChatError( SP_LANG.NoPermissions,ply)
		return
	end
	if AllPosition != nil then
		AllPosition = nil
		SP.SendToAllChat( SP_LANG.DeletedAllSpawn)
		SP.UpdateSpawnsAllPlayers()
	else
		SP.SendToChatError( SP_LANG.NotCreatedSpawn,ply)
	end
end

function SP.SetSpawn(ply)
	if(SP_enabled:GetInt() == 0) then return end
	if(SP_setspawn:GetInt() == 0) then return end
	if not ply:IsValid() then return end
	if tonumber(ply:GetPData("SetSpawn", 0 )) < (os.time()-SP_recoil:GetInt()) then
		Players_spawns[ply] = ply:GetPos()
		Players_spawns[ply].z = Players_spawns[ply].z + 10
		ply:SetPData("SetSpawn", os.time() )
		SP.SendToChat( SP_LANG.CreatedSpawn,ply)
	else
		local ost =  tonumber(ply:GetPData("SetSpawn", 0 )) - (os.time()-SP_recoil:GetInt())
		SP.SendToChatError( string.format(SP_LANG.RecoilSpawn2,SP_recoil:GetInt()),ply)
		SP.SendToChatError( string.format(SP_LANG.RecoilSpawn,ost),ply)
	end
end

function SP.UnSetSpawn(ply)
	if(SP_enabled:GetInt() == 0) then return end
	if(SP_setspawn:GetInt() == 0) then return end
	if Players_spawns[ply] != nil then
		Players_spawns[ply] = nil
		SP.SendToChat( SP_LANG.DeletedSpawn,ply)
	else
		SP.SendToChatError( SP_LANG.NotCreatedSpawn,ply)
	end
end

function SP.AllSpawn(ply)
	if(SP_enabled:GetInt() == 0) then return end
	if Players_spawns[ply] != nil then
		ply:SetPos(Players_spawns[ply])
	end
	if AllPosition != nil then
		local x = math.random(0,AllRadius) - (AllRadius/2)
		local y = math.random(0,AllRadius) - (AllRadius/2)
		while (x^2) + (y^2) > (AllRadius^2) do
			x = math.random(0,AllRadius) - (AllRadius/2)
			y = math.random(0,AllRadius) - (AllRadius/2)
		end
		local pos = Vector(AllPosition.x-x,AllPosition.y-y,AllPosition.z)
		ply:SetPos(pos)
	end
	if (SP_anti_back_spawn:GetInt() == 1) then
		ply:SetPData("Spawned", 1 )
	end
end
hook.Add("PlayerSpawn", "All Spawn", SP.AllSpawn)

function PropInPlayer(ply,mv)
	if(SP_enabled:GetInt() == 0) then return end
	if(SP_block:GetInt() == 0) then return end
	local trace = { start = ply:GetPos(), endpos = ply:GetPos(), filter = ply }
	local tr = util.TraceEntity( trace, ply )
	if ( tr.Hit ) then
		if SP.InSpawn(ply) and not tr.Entity:CreatedByMap() then
			SP.SendToChat( string.format(SP_LANG.PropInPlayer,tr.Entity:GetClass()),ply)
			tr.Entity:Remove()
		end
	end
end
hook.Add("PlayerTick", "Prop in player", PropInPlayer)
--В вас был предмет: %s, он был удалён.
function SP.SendToAllChat(text)
	net.Start("spawn_protect_say")
		net.WriteString(text)
	net.Broadcast()
end

function SP.SendToChat(text,ply)
	net.Start("spawn_protect_say")
		net.WriteString(text)
	net.Send(ply)
end

function SP.SendToAllChatError(text)
	net.Start("spawn_protect_say_error")
		net.WriteString(text)
	net.Broadcast()
end

function SP.SendToChatError(text,ply)
	net.Start("spawn_protect_say_error")
		net.WriteString(text)
	net.Send(ply)
end

concommand.Add( "setallspawn", function( ply, cmd, args )
	if args[1] == nil  then
		SP.SendToChatError( SP_LANG.NoRangeAllSpawn,ply)
		SP.SetAllSpawn(ply,500)
	elseif tonumber(args[1])<500 then
		SP.SendToChatError( SP_LANG.SmallRangeAllSpawn,ply)
		SP.SetAllSpawn(ply,500)
	else
		SP.SetAllSpawn(ply,tonumber(args[1]))
	end
end )

concommand.Add( "unsetallspawn", function( ply, cmd, args )
	SP.UnSetAllSpawn(ply)
end )

concommand.Add( "setspawn", function( ply, cmd, args )
	SP.SetSpawn(ply)
end )

concommand.Add( "unsetspawn", function( ply, cmd, args )
	SP.UnSetSpawn(ply)
end )

hook.Add('PlayerSay', 'Spawn Protect Commands', function(ply, text)
	local prefix = text:sub( 1,1 )
	if prefix != "!" and prefix != "/" then return end
	local argsandcmd = string.Split( string.sub(text,2,string.len(text)), " " )
	local command = string.lower(argsandcmd[1])
	if command == "setallspawn" then
		if argsandcmd[2] == nil  then
			SP.SendToChatError( SP_LANG.NoRangeAllSpawn,ply)
			SetAllSpawn(ply,500)
		elseif tonumber(rgsandcmd[2])<500 then
			SP.SendToChatError( SP_LANG.SmallRangeAllSpawn,ply)
			SetAllSpawn(ply,500)
		else
			SetAllSpawn(ply,tonumber(argsandcmd[2]))
		end
		return false
	elseif command == "unsetallspawn" then
		SP.UnSetAllSpawn(ply)
		return false
	elseif command == "setspawn" then
		SP.SetSpawn(ply)
		return false
	elseif command == "unsetspawn" then
		SP.UnSetSpawn(ply)
		return false
	end
end)



