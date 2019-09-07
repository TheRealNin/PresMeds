local oldTriggerAlert = MarineTeam.TriggerAlert
function MarineTeam:TriggerAlert(techId, entity, force)
	if techId == kTechId.MarineAlertNeedMedpack or  techId == kTechId.MarineAlertNeedAmmo then
		-- do nothing
	else
	
		oldTriggerAlert(self, techId, entity, force)
	
	end
end


local oldReplaceRespawnPlayer = MarineTeam.ReplaceRespawnPlayer

function MarineTeam:ReplaceRespawnPlayer(player, origin, angles, mapName)

    if GetWarmupActive() then
		player:SetResources(ConditionalValue(self:GetTeamNumber() == kTeam1Index, kMarineInitialIndivRes, kAlienInitialIndivRes))
	end
	
	return oldReplaceRespawnPlayer(self, player, origin, angles, mapName)
end

