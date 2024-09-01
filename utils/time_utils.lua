local addonName, addonTable = ...
_G[addonName] = addonTable
addonTable.time_utils = {}

local zone_detect = addonTable.zone_detect
local time_utils = addonTable.time_utils
local colors = addonTable.colors
local print_utils = addonTable.print_utils

local timer = nil

function time_utils.StartTimer()

    if timer then
        timer:Cancel()
    end
    timer = C_Timer.NewTicker(1800, function()
        if C_Map.GetBestMapForUnit("player") == 2215 then
            -- print_utils.PrintMessage("%s Checking Beledar's Shadow tracking.", colors.yellow("[DEBUG]"))            

            local a = (GetQuestResetTime() + 3660) % 10800
            local message = format("\124cffa060ffBeledar's Shadow in\124r \124cffffffff%s%s%ds\124r",
                a > 3600 and floor(a / 3600) .. "h " or "",
                a > 60 and floor(a / 60 % 60) .. "m " or "",
                a % 60
            )

            print_utils.PrintMessage(message)
        else
            print_utils.PrintMessage("You've left Hallowfall. Stopping Beledar's Shadow tracking.")
            if timer then
                timer:Cancel()
                timer = nil
            end
        end
    end)
end