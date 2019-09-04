local oldTriggerAlert = MarineTeam.TriggerAlert
function MarineTeam:TriggerAlert(techId, entity, force)
	if techId == kTechId.MarineAlertNeedMedpack or  techId == kTechId.MarineAlertNeedAmmo then
		-- do nothing
	else
	
		oldTriggerAlert(self, techId, entity, force)
	
	end
end
