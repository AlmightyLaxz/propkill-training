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

hook.Add("KeyPress", "speccontrols", function(ply, key)
	if ply:GetObserverMode() != 0 then
      if key == IN_ATTACK then
         ply:Spectate( OBS_MODE_ROAMING )
         ply:SpectateEntity( nil )
         local alive = GetAlivePlayers()
         if #alive < 1 then return end
         local target = table.Random( alive )
         if IsValid( target ) then
            ply:SetPos( target:EyePos() )
         end
      elseif key == IN_ATTACK2 then
         local target = GetNextAlivePlayer( ply:GetObserverTarget() )
         if IsValid( target ) then
            ply:Spectate(OBS_MODE_CHASE)
            ply:SpectateEntity( target )
         end
      elseif key == IN_DUCK then
         local pos = ply:GetPos()
         local ang = ply:EyeAngles()
         local target = ply:GetObserverTarget()
         if IsValid( target ) and target:IsPlayer() then
            pos = target:EyePos()
            ang = target:EyeAngles()
         end
         ply:Spectate( OBS_MODE_ROAMING )
         ply:SpectateEntity( nil )
         ply:SetPos( pos )
         ply:SetEyeAngles( ang )
         return true
      elseif key == IN_JUMP then
         if not ( ply:GetMoveType() == MOVETYPE_NOCLIP ) then
            ply:SetMoveType( MOVETYPE_NOCLIP )
         end
      elseif key == IN_RELOAD then
         local tgt = ply:GetObserverTarget()
         if not IsValid( tgt ) or not tgt:IsPlayer() then return end
            ply:SetObserverMode(OBS_MODE_IN_EYE)
         elseif ply:GetObserverMode() == OBS_MODE_IN_EYE then
            ply:SetObserverMode(OBS_MODE_CHASE)
         end
   end
end)