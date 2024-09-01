local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local function CheckBeledarsShadow()
    local a = (GetQuestResetTime() + 3660) % 10800
    local message = format("\124cffa060ffBeledar's Shadow in\124r \124cffffffff%s%s%ds (%s Local Time)\124r",
        a > 3600 and floor(a / 3600) .. "h " or "",
        a > 60 and floor(a / 60 % 60) .. "m " or "",
        a % 60,
        date("%H:%M", a + time())
    )
    print(message)
end

local function IsInHallowfall()
    local mapID = C_Map.GetBestMapForUnit("player")
    return mapID == 2025  -- Hallowfall map ID
end

local timer = nil

local function StartTimer()
    if timer then
        timer:Cancel()
    end
    timer = C_Timer.NewTicker(60, function()
        if IsInHallowfall() then
            CheckBeledarsShadow()
        else
            print("You've left Hallowfall. Stopping Beledar's Shadow tracking.")
            timer:Cancel()
            timer = nil
        end
    end)
end

frame:SetScript("OnEvent", function(self, event)
    if IsInHallowfall() then
        print("Entered Hallowfall. Starting Beledar's Shadow tracking.")
        StartTimer()
    end
end)
