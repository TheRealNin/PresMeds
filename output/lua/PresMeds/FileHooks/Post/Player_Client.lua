Script.Load("lua/TokenBucket.lua")


local kMedsPerSecond = 2
local kMedsInBucket = 3

local bucket = CreateTokenBucket(kMedsPerSecond, kMedsInBucket)

local oldSendKeyEvent = Player.SendKeyEvent
function Player:SendKeyEvent(key, down)
	local oldReturn = oldSendKeyEvent(self, key, down)
	
	if not oldReturn and self:isa("Marine") then
		
		if not ChatUI_EnteringChatMessage() and not MainMenu_GetIsOpened() and bucket:GetNumberOfTokens() > 0 then
			
			if GetIsBinding(key, "RequestHealth") then
                Client.SendNetworkMessage("RequestTech", {techId = kTechId.MedPack}, true)
				bucket:RemoveTokens(1)
			end
			
			if GetIsBinding(key, "RequestAmmo") then
                Client.SendNetworkMessage("RequestTech", {techId = kTechId.AmmoPack} , true)
				bucket:RemoveTokens(1)
			end
			
		end
		
	end
	
	return oldReturn
end