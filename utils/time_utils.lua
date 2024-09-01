local addonName, addonTable = ...
_G[addonName] = addonTable
addonTable.time_utils = {}

local zone_detect = addonTable.zone_detect;
local time_utils = addonTable.time_utils;

function time_utils.StartTimer(timer)
    if timer then
        timer:Cancel()
    end
    timer = C_Timer.NewTicker(60, function()
        if zone_detect.IsInHallowfall() then
            hallowfall.CheckBeledarsShadow()
        else
            print("You've left Hallowfall. Stopping Beledar's Shadow tracking.")
            if timer then
                timer:Cancel()
                timer = nil
            end
        end
    end)
end

function time_utils.GetFormattedTime()
    return date("%H:%M:%S")
end