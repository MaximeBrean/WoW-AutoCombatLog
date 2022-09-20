local event_manager = CreateFrame("Frame")

function event_manager:Event_ZONE_CHANGED_NEW_AREA()
    local _, zone_type = GetInstanceInfo()
    local is_logging = LoggingCombat()
    local should_log = (zone_type == "raid")
    
    if should_log and not is_logging then
        print("Start combat log.")
        LoggingCombat(true)
    elseif is_logging and not should_log then
        print("Stop combat log.")
        LoggingCombat(false)
    end
end


-- Also ensure that advance combat log is enabled
C_CVar.SetCVar("AdvancedCombatLogging", 1)

event_manager:SetScript("OnEvent",function(self,event,...) self["Event_" .. event](self,...) end)
event_manager:RegisterEvent("ZONE_CHANGED_NEW_AREA")
