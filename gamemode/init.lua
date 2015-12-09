AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("server/player.lua")
include("server/commands.lua")

function GM:Initialize()
	serverPrint("Initializing...")
end

function serverPrint(text)
	MsgC( Color( 255, 0, 0 ), "[PK Training]: " .. text .. "\n" )
end

function ChatMsg(message)
	net.Start("chatmsg")
		net.WriteTable(message)
	net.Broadcast() 
end

// physics optimized for pk
function GM:InitPostEntity()
	local physData = physenv.GetPerformanceSettings()
	physData.MaxVelocity = 2000
	physData.MaxAngularVelocity = 3636
	physenv.SetPerformanceSettings(physData)
    game.ConsoleCommand("sv_allowcslua 1\n")
    game.ConsoleCommand("physgun_DampingFactor 0.9\n")
    game.ConsoleCommand("sv_airaccelerate 1000\n")
    game.ConsoleCommand("sv_sticktoground 0\n")
end

serverPrint("Initialized")