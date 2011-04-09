local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["datatext"].battlenet == true then
	-- Battle.Net Bar
	local battlenet = CreateFrame("Frame", "TukuiBattleNet", UIParent)
	battlenet:CreatePanel(battlenet, 235, 23, "TOPLEFT", UIParent, "TOPLEFT", 20, -77)
	battlenet:SetClampedToScreen(true)
	battlenet:CreateShadow(battlenet)
	battlenet:SetFrameLevel(2)
	battlenet:SetFrameStrata("BACKGROUND")
	battlenet:SetBackdrop({
	bgFile = C["media"].battlenetl, 
	edgeFile = C["media"].blank, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	battlenet:SetBackdropBorderColor(unpack(C["media"].bordercolor))

	-- Toggle Button
	local battletoggle = CreateFrame("Button", "BattlenetToggle", UIParent)
	local battletext = battletoggle:CreateFontString(nil, "OVERLAY", nil)
	battletext:SetFont(C.media.pixelfont, C["datatext"].fontsize)
	battletext:SetText(T.StatColor.."Hide")
	battletext:SetPoint("CENTER", 2, 1)
	battletoggle:CreatePanel(battletoggle, battletext:GetWidth() + 20, battletext:GetWidth(), "RIGHT", battlenet, "RIGHT", -3, 0)
	battletoggle:SetFrameLevel(battlenet:GetFrameLevel() + 1)
	

	-- Frame Holder
	local battleframe = CreateFrame("Frame", "BattlenetHolder", UIParent)
	battleframe:CreatePanel(battleframe, 235, 102, "TOPLEFT", battlenet, "BOTTOMLEFT", 0, -2)
	battleframe:SetFrameLevel(1)
	battleframe:CreateShadow(battleframe)
	battleframe:SetFrameStrata("BACKGROUND")
	battleframe:SetBackdropColor(unpack(C["media"].backdropcolor))
	battleframe:SetBackdropBorderColor(unpack(C["media"].bordercolor))

	-- Battle.net image
	local bimage = CreateFrame("Frame", nil, battleframe)
	bimage:CreatePanel(bimage, 58, 48, "TOPLEFT", battleframe, "TOPLEFT", 1, -2)
	bimage:SetFrameLevel(2)
	bimage:SetFrameStrata("BACKGROUND")
	bimage:SetBackdrop({
	bgFile = C["media"].battlenet,
	edgeFile = C["media"].blank,
	tile = false, tileSize = 0, edgeSize = 1,
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	bimage:SetBackdropBorderColor(unpack(C["media"].bordercolor))

	-- Battlenet Datatext placeholder
	-- Top
	local battletopstat = CreateFrame("Frame", "BattleStatTop", battleframe)
	battletopstat:CreatePanel(battletopstat, (battleframe:GetWidth() -60), ((bimage:GetHeight() / 2)), "TOPLEFT", bimage, "TOPRIGHT", 0, 0)
	battletopstat:SetFrameLevel(2) 
	battletopstat:SetFrameStrata("BACKGROUND")

	-- Bottom
	local battlebottomstat = CreateFrame("Frame", "BattleStatBottom", battleframe)
	battlebottomstat:CreatePanel(battlebottomstat, (battleframe:GetWidth() -60), ((bimage:GetHeight() / 2)), "BOTTOMLEFT", bimage, "BOTTOMRIGHT", 0, 0)
	battlebottomstat:SetFrameLevel(2)
	battlebottomstat:SetFrameStrata("BACKGROUND")
	
	-- Gold image
	local gimage = CreateFrame("Frame", nil, battleframe)
	gimage:CreatePanel(gimage, 58, 48, "TOPLEFT", bimage, "BOTTOMLEFT", 0, -2)
	gimage:SetFrameLevel(2)
	gimage:SetFrameStrata("BACKGROUND")
	gimage:SetBackdrop({
	bgFile = C["media"].gold,
	edgeFile = C["media"].blank,
	tile = false, tileSize = 0, edgeSize = 1,
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	gimage:SetBackdropBorderColor(unpack(C["media"].bordercolor))
	
	-- Currency Datatext placeholder
	-- Top
	local currencytopstat = CreateFrame("Frame", "CurrencyStatTop", battleframe)
	currencytopstat:CreatePanel(currencytopstat, (battleframe:GetWidth() -60), ((gimage:GetHeight() / 2)), "TOPLEFT", gimage, "TOPRIGHT", 0, 0)
	currencytopstat:SetFrameLevel(2)
	currencytopstat:SetFrameStrata("BACKGROUND")
	
	-- Bottom
	local currencybottomstat = CreateFrame("Frame", "CurrencyStatBottom", battleframe)
	currencybottomstat:CreatePanel(currencybottomstat, (battleframe:GetWidth() -60), ((gimage:GetHeight() / 2)), "BOTTOMLEFT", gimage, "BOTTOMRIGHT", 0, 0)
	currencybottomstat:SetFrameLevel(2)
	currencybottomstat:SetFrameStrata("BACKGROUND")
	
	local on = 0
	
	-- Make Button Toggle Main Frame On/Off
	battletoggle:HookScript("OnEnter", function(self) battletoggle:SetBackdropBorderColor(unpack(C["media"].statcolor)) end)
	battletoggle:HookScript("OnLeave", function(self) battletoggle:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
	battletoggle:RegisterForClicks("AnyUp") 
	
	battletoggle:SetScript("OnClick", function()
		if battleframe:IsShown() then
			battleframe:Hide()
			battleframe:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 500)
			battletext:SetText(T.StatColor.."Show")
		else
			battleframe:Show()
			UIFrameFadeIn(battleframe, 0.6, 0, 1)
			battleframe:Point("TOPLEFT", battlenet, "BOTTOMLEFT", 0,-1)
			battleframe:SetAlpha(1)
			battletext:SetText(T.StatColor.."Hide")
		end
	end)
end