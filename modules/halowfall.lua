local addonName, addonTable = ...

addonTable.hallowfall = {}

local hallowfall = addonTable.hallowfall

function hallowfall.CheckBeledarsShadow()
    local a = (GetQuestResetTime() + 3660) % 10800
    local message = format("\124cffa060ffBeledar's Shadow in\124r \124cffffffff%s%s%ds (%s Local Time)\124r",
        a > 3600 and floor(a / 3600) .. "h " or "",
        a > 60 and floor(a / 60 % 60) .. "m " or "",
        a % 60,
        date("%H:%M", a + time())
    )
    print(message)
end