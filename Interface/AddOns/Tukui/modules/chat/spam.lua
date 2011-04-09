local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["chat"].enable ~= true then return end

----------------------------------------------------------------------------------
-- Hide annoying chat text when talent switch.
----------------------------------------------------------------------------------

function T.SPELL_FILTER(self, event, arg1)
    if strfind(arg1, "Вы забыли") or strfind(arg1, "Вы выучили новое заклинание:") or strfind(arg1, "Вы приобрели новую способность:") or strfind(arg1,"Ваш питомец выучил новую способность:") or strfind(arg1,"Ваш питомец позабыл") then
        return true
    end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", T.SPELL_FILTER)

----------------------------------------------------------------------------------
-- Report AFKer's to RaidWarning
----------------------------------------------------------------------------------

function T.SPELL_FILTER(self, event, arg1)
    if strfind(arg1,"не подтверждает готовность.") or strfind(arg1,"Следующие игроки отсутствуют:") then
        SendChatMessage(arg1, "RAID_WARNING", nil ,nil)
    end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", T.SPELL_FILTER)

----------------------------------------------------------------------------------
-- I hate mages after 4.0.3a...
----------------------------------------------------------------------------------
function T.MAGE_FILTER(self, event, arg1)
	if strfind(arg1,"порталы") or strfind(arg1,"порталы") or strfind(arg1, "порт") or strfind(arg1, "портал") or strfind(arg1, "Портал") then
		return true
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", T.MAGE_FILTER)

----------------------------------------------------------------------------------
-- Raid Slack Check...
----------------------------------------------------------------------------------
function T.RSC_FILTER(self, event, arg1)
	if strfind(arg1,"RSC") then
		return true
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", T.RSC_FILTER)


