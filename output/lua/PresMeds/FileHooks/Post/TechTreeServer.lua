local targetedActivationToRemove = {
    [kTechId.MedPack] = {kTechId.MedPack, kTechId.None},
    [kTechId.AmmoPack] = {kTechId.AmmoPack, kTechId.None}
}

local oldAddTargetedActivation = TechTree.AddTargetedActivation
function TechTree:AddTargetedActivation(techId, prereq1, prereq2)
    if targetedActivationToRemove[techId] then
        return
    else
        oldAddTargetedActivation(self, techId, prereq1, prereq2)
    end
end