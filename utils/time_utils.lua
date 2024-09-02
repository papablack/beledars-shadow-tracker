local addonName, addonTable = ...
_G[addonName] = addonTable
addonTable.time_utils = {}

local zone_detect = addonTable.zone_detect
local time_utils = addonTable.time_utils
local colors = addonTable.colors
local print_utils = addonTable.print_utils

local timer = nil

function time_utils.getQuestTime()
    return (GetQuestResetTime() + 3660) % 10800;
end    

function time_utils.TimerNightMessage()
    local secondsToShadow = time_utils.getQuestTime()
    local message = format("\124cffa060ffBeledar turns shadow in\124r \124cffffffff%s%s%ds\124r",
        secondsToShadow > 3600 and floor(secondsToShadow / 3600) .. "h " or "",
        secondsToShadow > 60 and floor(secondsToShadow / 60 % 60) .. "m " or "",
        secondsToShadow % 60
    )

    print_utils.PrintMessage(message)
end

function time_utils.IsShardKilled()
    return (C_QuestLog.IsQuestFlaggedCompleted(81763))
end    

function time_utils.StartTimer()
    if timer then
        timer:Cancel()
    end
    timer = C_Timer.NewTicker(120, function()
        if C_Map.GetBestMapForUnit("player") == 2215 then            
            time_utils.TimerNightMessage()

            if not time_utils.IsShardKilled() then
                print_utils.ShowBigText("SHARD NOT KILLED")
            end
            
        else
            print_utils.PrintMessage("You've left Hallowfall. Stopping Beledar's Shadow tracking.")

            if timer then
                timer:Cancel()
                timer = nil
            end
        end
    end)
end