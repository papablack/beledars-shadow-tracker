local addonName, addonTable = ...
_G[addonName] = addonTable
addonTable.bst_events = {}

local print_utils = addonTable.print_utils;
local colors = addonTable.colors;
local bst_events = addonTable.bst_events;

local function bst_events.OnWorldEnter(event)    
    print_utils.PrintMessage("Level: %d", GetMapID())
end