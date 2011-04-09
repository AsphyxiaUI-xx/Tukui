﻿local T, C, L = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
if not IsAddOnLoaded("TinyDPS") then return end
local TinyDPS = CreateFrame("Frame")
TinyDPS:RegisterEvent("ADDON_LOADED")
TinyDPS:SetScript("OnEvent", function(self)

	tdps.width = TukuiMinimap:GetWidth()
	tdps.barHeight = 14
	tdps.spacing = 1
	tdpsFont.name = C["media"].pixelfont
	tdpsFont.size = 10
	tdpsFont.outline = "THINOUTLINE"

	tdpsPosition = {x = 0, y = -6}

	tdpsFrame:SetHeight(tdps.barHeight + 4)
	tdpsFrame:SetTemplate("Default")
	tdpsFrame:CreateShadow("Default")

	tdpsAnchor:SetPoint('BOTTOMLEFT', TukuiMinimap, 'BOTTOMLEFT', 0, -48)

	self:UnregisterEvent("ADDON_LOADED")
end)