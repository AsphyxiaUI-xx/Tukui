﻿--[[	
	(C)2010 Darth Android / Telroth-Black Dragonflight
]]

Mod_AddonSkins = CreateFrame("Frame")
local Mod_AddonSkins = Mod_AddonSkins
local T, C, L = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

local function skinFrame(self, frame)
	frame:SetTemplate("Default")
end

local function skinButton(self, button)
	skinFrame(self, button)
	-- Crazy hacks which only work because self = Skin *AND* self = config
	local name = button:GetName()
	local icon = _G[name.."Icon"]
	if icon then
		icon:SetTexCoord(unpack(self.buttonZoom))
		icon:SetDrawLayer("ARTWORK")
		icon:ClearAllPoints()
		icon:SetPoint("TOPLEFT",button,"TOPLEFT",self.borderWidth, -self.borderWidth)
		icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-self.borderWidth, self.borderWidth)
	end
end

Mod_AddonSkins.SkinFrame = skinFrame
Mod_AddonSkins.SkinBackgroundFrame = skinFrame
Mod_AddonSkins.SkinButton = skinButton
Mod_AddonSkins.normTexture = C.media.normTex
Mod_AddonSkins.bgTexture = C.media.blank
Mod_AddonSkins.font = C.media.pixelfont
Mod_AddonSkins.smallFont = C.media.pixelfont
Mod_AddonSkins.fontSize = 10
Mod_AddonSkins.buttonSize = T.Scale(27,27)
Mod_AddonSkins.buttonSpacing = T.Scale(T.buttonspacing,T.buttonspacing)
Mod_AddonSkins.borderWidth = T.Scale(2,2)
Mod_AddonSkins.buttonZoom = {.09,.91,.09,.91}
Mod_AddonSkins.barSpacing = T.Scale(1,1)
Mod_AddonSkins.barHeight = T.Scale(20,20)
Mod_AddonSkins.skins = {}

-- Dummy function expected by some skins
function dummy() end

function Mod_AddonSkins:RegisterSkin(name, initFunc)
	self = Mod_AddonSkins -- Static function
	if type(initFunc) ~= "function" then error("initFunc must be a function!",2) end
	self.skins[name] = initFunc
end

Mod_AddonSkins:RegisterEvent("PLAYER_LOGIN")
Mod_AddonSkins:RegisterEvent("PLAYER_ENTERING_WORLD")
Mod_AddonSkins:SetScript("OnEvent",function(self, event, addon)
	if event == "PLAYER_LOGIN" then
		-- Initialize all skins
		for name, func in pairs(self.skins) do
			func(self,self,self,self,self) -- Mod_AddonSkins functions as skin, layout, and config.
		end
		self:UnregisterEvent("PLAYER_LOGIN")
	elseif event == "PLAYER_ENTERING_WORLD" then
		self:SetScript("OnEvent",nil)
	end
end)