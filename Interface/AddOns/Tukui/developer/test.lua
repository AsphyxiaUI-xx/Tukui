local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

SLASH_TEST1 = "/test"
SlashCmdList["TEST"] = function()
	for _, frames in pairs({"TukuiPet", "TukuiFocus", "TukuiFocusTarget", "TukuiBoss1", "TukuiBoss2", "TukuiBoss3", "TukuiBoss4"}) do
        _G[frames].Hide = function() end
        _G[frames]:Show()
        _G[frames].unit = "player"
	end
end

SLASH_TESTARENA1 = "/testarena"
SlashCmdList["TESTARENA"] = function()
	for _, frames in pairs({"TukuiArena1", "TukuiArena2", "TukuiArena3", "TukuiArena4"}) do
        _G[frames].Hide = function() end
        _G[frames]:Show()
        _G[frames].unit = "player"
	end
end

local mes = function(msg)
	print("|cff0066FF-|r", tostring(msg))
end

SLASH_CHANGELOG1 = "/changelog"
SlashCmdList["CHANGELOG"] = function(msg)
	print("|cff0066FFTukui Asphyxia's Edit|r version 1.1.1"..T.asphyxiarelease.." - Changes:")
	mes("Some changes in |cff00FFFF/changelog|r command")
	mes("Right actionbar changed to horizontal with mouse over show/hide function")
	mes("Added Hydra/Safturento's fps, ms, and memory datatext")
	mes("Added ui control panel")
	mes("Changed bags keyring and close buttons")
	mes("Added option to enable extended pet frame")
	mes("Petbar positioned horizontally below main actionbar")
	mes("Added Smelly's Altpowerbar for Cho'gall & Atramedes fight") 
	mes("RaidBuffReminder config added")

	print("|cff0066FFTukui Asphyxia's Edit|r version 1.1.2"..T.asphyxiarelease.." - Changes:")
	mes("Fixed ConfigUI error")
	mes("Added class colored datatext option")
	mes("Fixed default TinyDPS anchor position")
	
	print("|cff0066FFTukui Asphyxia's Edit|r version 1.1.3"..T.asphyxiarelease.." - Changes:")
	mes("Added two layout styles")
	mes("Added elv's raidutility")
	mes("Implemented battlenet frame toggle show/hide")
end
