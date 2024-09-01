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
    local mapID = 0

    local success, error_message = pcall(function()        
         mapID = C_Map.GetBestMapForUnit("player")
    end)    
        
    if not success then
        print(error_message)     
    else
        return mapID == 2215
    end    
end