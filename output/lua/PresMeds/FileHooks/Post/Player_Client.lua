
local oldSendKeyEvent = Player.SendKeyEvent
function Player:SendKeyEvent(key, down)
	local oldReturn = oldSendKeyEvent(self, key, down)
	
	if not oldReturn and self:isa("Marine") then
		
		if not ChatUI_EnteringChatMessage() and not MainMenu_GetIsOpened() then
			
			if GetIsBinding(key, "RequestHealth") then
                Client.SendNetworkMessage("RequestTech", {techId = kTechId.MedPack}, true)
			end
			
			if GetIsBinding(key, "RequestAmmo") then
                Client.SendNetworkMessage("RequestTech", {techId = kTechId.AmmoPack} , true)
			end
			
		end
		
	end
	
	return oldReturn
end