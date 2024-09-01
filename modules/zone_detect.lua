local addonName, addonTable = ...

addonTable.zone_detect = {}

local zone_detect = addonTable.zone_detect

function zone_detect.GetMapID()
    local mapID = C_Map.GetBestMapForUnit("player")
    if mapID then
        return mapID
    else
        PrintMessage(yellow("Unable to determine current Map ID"))
        return 0
    end
end

function zone_detect.IsInHallowfall()
    local mapID = C_Map.GetBestMapForUnit("player")
    return mapID == 2025  -- Hallowfall map ID
end