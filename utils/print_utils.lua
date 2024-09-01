local addonName, addonTable = ...
addonTable.print_utils = {}

local colors = addonTable.colors;
local time_utils = addonTable.time_utils;
local print_utils = addonTable.print_utils;

function print_utils.PrintMessage(text, ...)
    local formatted_text = format(text, ...)
    local message = format("[%s] %s %s",
    time_utils.GetFormattedTime(),
        colors.violet("[Beledar's Shadow Tracking]"),
        formatted_text
    )
    print(message)
end