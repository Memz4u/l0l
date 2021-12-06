-- "lua\\autorun\\client\\forcemic.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function ulx.forceMic( calling_ply, target_ply )
-- 11/17/2021 DON'T FUCKING DO IT. DON'T YOU FUCKING DO IT!
	--target_ply:SendLua("RunConsoleCommand(\"+voicerecord\")")
	--ulx.fancyLogAdmin( calling_ply, "#A forced #T to turn on their mic", target_ply )
end
local forceMic = ulx.command( CATEGORY_NAME, "ulx forcemic", ulx.forceMic, "!forcemic" )
forceMic:addParam{ type=ULib.cmds.PlayerArg }
forceMic:defaultAccess( ULib.ACCESS_ADMIN )
forceMic:help( "Force a players mic to be turned on." )

