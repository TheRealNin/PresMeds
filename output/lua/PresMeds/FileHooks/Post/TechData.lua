
local oldLookupTechData = LookupTechData
function LookupTechData(techId, fieldName, default)

    -- Initialize table if necessary
    if not kTechData then
        kTechData = BuildTechData()
    end
	
	-- preserve medpack cost in warmup
    if GetWarmupActive() and (techId == kTechId.MedPack and fieldName == kTechDataCostKey) then
        return GetCachedTechData(techId, fieldName) or default
    end

	return oldLookupTechData(techId, fieldName, default)
end