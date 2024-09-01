local addonName, addonTable = ...
addonTable.print_utils = {}

local colors = addonTable.colors
local print_utils = addonTable.print_utils

local function GetFormattedTime()
    return date("%H:%M:%S")
end

function print_utils.PrintMessage(text, ...)
    local formatted_text = format(text, ...)
    local message = format("[%s] %s %s",
    GetFormattedTime(),
        colors.violet("[Beledar's Shadow Tracking]"),
        formatted_text
    )
    print(message)
end