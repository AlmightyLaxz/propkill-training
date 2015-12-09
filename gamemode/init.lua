AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function GM:Initialize()
	serverPrint("Initializing...")
end

function serverPrint(text)
	MsgC( Color( 255, 0, 0 ), "[PK Training]: " + text + "\n" )
end

serverPrint("Initialized")