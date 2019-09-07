

local kMaxPacks = 256

local function SortPacksByAge(entities)
	local function compareAge(a, b)
		local age1 = a.expireTime
		local age2 = b.expireTime

		return age1 > age2
	end
	table.sort(entities, compareAge)
end
	

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
			
				local pack_list = GetEntitiesForTeam("DropPack", player:GetTeamNumber())
				local total = #pack_list
				if total >= kMaxPacks then
				
					local packs = {}
					for _, pack in ipairs(pack_list) do 
						table.insert(packs, pack)
					end
					
					SortPacksByAge(packs)
					while total >= kMaxPacks do
						total = total - 1
						local pack = table.remove(packs)
						DestroyEntity(pack)
					end
				end
				
				CreateEntity(mapName, position, player:GetTeamNumber())
				
			end
			
		end
		
	end
	
end

Server.HookNetworkMessage("RequestTech", OnRequestTech)