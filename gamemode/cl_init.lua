include("shared.lua")

function KilledByProp()
	local ply       = net.ReadEntity()
	local inflictor = net.ReadString()
	local attacker  = net.ReadEntity()

	GAMEMODE:AddDeathNotice(attacker:Name(), attacker:Team(), inflictor, ply:Name(), ply:Team())
end

net.Receive("KilledByProp", KilledByProp)