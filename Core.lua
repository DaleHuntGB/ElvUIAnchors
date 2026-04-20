local Private = select(2, ...)
local AddOn = LibStub("AceAddon-3.0"):NewAddon("ElvUIEnhancedAnchors")

function AddOn:OnInitialize()
    Private.DB = LibStub("AceDB-3.0"):New("ElvUIEnhancedAnchorsDB", Private:GetDefaults(), true)
end

function AddOn:OnEnable()
    Private:SetupConfig()

    if C_AddOns.IsAddOnLoaded("ElvUI_Anchors") then
        Private.E.PopupDialogs["ELVUI_ANCHORS_CONFLICT"] = {
            text = "You have two addons that provide the same functionality. Pick one to disable",
            button1 = "ElvUI Enhanced Anchors",
            button2 = "ElvUI Anchors",
            OnAccept = function() C_AddOns.DisableAddOn("ElvUIEnhancedAnchors") C_UI.ReloadUI() end,
            OnCancel = function() C_AddOns.DisableAddOn("ElvUI_Anchors") C_UI.ReloadUI() end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = false,
        }
        Private.E:StaticPopup_Show("ELVUI_ANCHORS_CONFLICT")
        return
    end

    local EventFrame = CreateFrame("Frame")
    EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    EventFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

    EventFrame:SetScript("OnEvent", function(_, event, ...) if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_SPECIALIZATION_CHANGED" then Private:SetAllMovers() end end)

    hooksecurefunc(Private.E, "ToggleMovers", function() Private:SetAllMovers() end)

end