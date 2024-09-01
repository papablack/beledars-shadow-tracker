local addonName, addonTable = ...
addonTable.debug_bag = {}

local debug_bag = addonTable.debug_bag

function debug_bag.ProcessDebug(addonName, addonTable, isEnabled)
    addonTable.debug_enabled = isEnabled

    if addonTable.debug_enabled then
        SLASH_RELOADUI1 = "/rl"
        SlashCmdList.RELOADUI = ReloadUI

        SLASH_FRAMESTK1 = "/fs"
        SlashCmdList.FRAMESTK = function()
            LoadAddOn('Blizzard_DebugTools')
            FrameStackTooltip_Toggle()
        end

        for i = 1, NUM_CHAT_WINDOWS do
            _G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode(false)
        end
    end
end    