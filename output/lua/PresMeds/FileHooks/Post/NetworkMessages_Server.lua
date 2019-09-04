
local function OnRequestTech(client, message)

    local techId = message.techId
    if client ~= nil and 
		(techId == kTechId.AmmoPack or techId == kTechId.MedPack) then
	
        local player = client:GetControllingPlayer()
        
        if player:isa("Marine") and player:GetResources() >= GetCostForTech(techId) then
		
			player:SetResources(player:GetResources() - GetCostForTech(techId))
			local mapName = LookupTechData(techId, kTechDataMapName)
			local position = player:GetOrigin() + Vector(0, 0.05, 0)
			if mapName then
				CreateEntity(mapName, position, player:GetTeamNumber())
			end
			
		end
		
	end
	
end

Server.HookNetworkMessage("RequestTech", OnRequestTech)