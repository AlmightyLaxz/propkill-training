local Player = FindMetaTable("Player")

function GM:PlayerInitialSpawn(ply)
	if (!ply:IsBot()) then
		ply:SetTeam(1)
		else
		ply:SetTeam(1)
	end
end

function GM:PlayerSpawn(ply)
	if (ply:Team() == 4) then
		ply:StripWeapons()
		ply:Spectate(OBS_MODE_ROAMING)
		return true
	else
		ply:UnSpectate()
	end
	ply:SetHealth(1)
	ply:SetJumpPower(250)
	ply:Give("weapon_physgun")
	//ply:SetModel("models/player/alyx.mdl")

	local col = ply:GetInfo("cl_playercolor")
	ply:SetPlayerColor(Vector(col))

	local col = ply:GetInfo("cl_weaponcolor")
	ply:SetWeaponColor(Vector(col))
end

// disables flatline sound
function GM:PlayerDeathSound()
	return true
end

// disables fall damage
function GM:GetFallDamage()
	return 0
end