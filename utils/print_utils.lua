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

local function print_utils.ShowBigText(message, duration)
    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetSize(UIParent:GetWidth(), 200)
    frame:SetPoint("TOP", 0, 0)
    
    local text = frame:CreateFontString(nil, "OVERLAY", "ZoneTextFont")
    text:SetPoint("CENTER", frame, "CENTER")
    text:SetText(message)
    
    frame:Show()
    C_Timer.After(duration or 5, function() frame:Hide() end)
end