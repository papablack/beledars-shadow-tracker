local addonName, addonTable = ...
_G[addonName] = addonTable


local zone_detect = addonTable.zone_detect;
local time_utils = addonTable.time_utils;
local bst_events = addonTable.bst_events;
local print_utils = addonTable.print_utils;
local debug_bag = addonTable.debug_bag;
local colors = addonTable.colors;

local DEBUG_MODE = true;

if DEBUG_MODE then
    local success, error_message = pcall(function()
        debug_bag.ProcessDebug(addonName, addonTable, DEBUG_MODE)
        print_utils.PrintMessage("%s Debug mode: " .. colors.red(tostring(addonTable.debug_enabled == true)), colors.yellow(""))
    end)

    if not success then    
        print_utils.PrintMessage("%s in %s: %s", colors.red("[DEBUG ERROR]"), addonName,error_message)        
    else            
        print_utils.PrintMessage(colors.yellow("Debug mode intialized"))

    end
end

local timer = nil

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local function MainActionsWrapper()
    if event == "PLAYER_ENTERING_WORLD" then
        bst_events.OnWorldEnter(event)
    end

    if zone_detect.IsInHallowfall() then
        print("Entered Hallowfall. Starting %s.", addonName)
        time_utils.StartTimer()
    end
end

frame:SetScript("OnEvent", function(self, event)
    local success, error_message = pcall(function()        
        MainActionsWrapper()        
    end)
    
    if not success then
        print_utils.PrintMessage("%s in %s: %s", colors.red("[FATAL ERROR]"), addonName,error_message)        
    else
        print_utils.PrintMessage(colors.green("Addon started"))
    end
end)