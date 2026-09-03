local Private = select(2, ...)
Private.E = unpack(ElvUI)
Private.ACH = LibStub("LibAceConfigHelper")
Private.ACR = LibStub("AceConfigRegistry-3.0")
Private.ADDON_NAME = C_AddOns.GetAddOnMetadata("ElvUIEnhancedAnchors", "Title")

Private.ANCHOR_POINTS = {
    ["TOPLEFT"] = "TOPLEFT",
    ["TOP"] = "TOP",
    ["TOPRIGHT"] = "TOPRIGHT",
    ["LEFT"] = "LEFT",
    ["CENTER"] = "CENTER",
    ["RIGHT"] = "RIGHT",
    ["BOTTOMLEFT"] = "BOTTOMLEFT",
    ["BOTTOM"] = "BOTTOM",
    ["BOTTOMRIGHT"] = "BOTTOMRIGHT"
}

Private.MOVERS = {
    ["ElvUF_PlayerMover"] = "Player",
    ["ElvUF_PlayerCastbarMover"] = "PlayerCastBar",
    ["ElvUF_TargetMover"] = "Target",
    ["ElvUF_TargetCastbarMover"] = "TargetCastBar",
    ["ElvUF_TargetTargetMover"] = "TargetTarget",
    ["ElvUF_FocusMover"] = "Focus",
    ["ElvUF_FocusCastbarMover"] = "FocusCastBar",
    ["ElvUF_FocusTargetMover"] = "FocusTarget",
    ["ElvUF_PetMover"] = "Pet",
    ["PrivateAurasMover"] = "PrivateAuras",
    ["ElvAB_1"] = "ActionBar1",
    ["ElvAB_2"] = "ActionBar2",
    ["ElvAB_3"] = "ActionBar3",
    ["ElvAB_4"] = "ActionBar4",
}

local Defaults = {
    global = {
        Player = {
            Enabled = false,
            Layout = {"RIGHT", "EssentialCooldownViewer", "LEFT", -10, 0}
        },
        PlayerCastBar = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        Target = {
            Enabled = false,
            Layout = {"LEFT", "EssentialCooldownViewer", "RIGHT", 10, 0}
        },
        TargetCastBar = {
            Enabled = false,
            Layout = {"TOP", "ElvUF_Target", "BOTTOM", 0, -1}
        },
        TargetTarget = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        Focus = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        FocusCastBar = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        FocusTarget = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        Pet = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar1 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar2 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar3 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar4 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar5 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar6 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar7 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar8 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar9 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar10 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar13 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar14 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
        ActionBar15 = {
            Enabled = false,
            Layout = {"CENTER", "ElvUIParent", "CENTER", 0, 0}
        },
    }
}

function Private:GetDefaults()
    return Defaults
end

function Private:SetMover(isEnabled, moverName, moverLayout)
    if isEnabled and moverName and moverLayout then
        Private.E.db.movers[moverName] = moverLayout
        Private.E:SetMoverPoints(moverName)
        Private.E:SaveMoverPosition(moverName)
    end
end

function Private:UpdateMover(isEnabled, moverName, moverLayout)
    if isEnabled and moverName and moverLayout then
        Private.E.db.movers[moverName] = moverLayout
        Private.E:SetMoverPoints(moverName)
        Private.E:SaveMoverPosition(moverName)
    end
    Private.E:LoadMovers()
end

local function RestrictionsAreActive()
    return C_RestrictedActions.IsAddOnRestrictionActive(0) == true or C_RestrictedActions.IsAddOnRestrictionActive(1) == true or C_RestrictedActions.IsAddOnRestrictionActive(2) == true
end

function Private:SetAllMovers()
    if InCombatLockdown() or RestrictionsAreActive() then return end
    Private:SetMover(Private.DB.global.Player.Enabled, "ElvUF_PlayerMover", table.concat(Private.DB.global.Player.Layout, ","))
    Private:SetMover(Private.DB.global.PlayerCastBar.Enabled, "ElvUF_PlayerCastbarMover", table.concat(Private.DB.global.PlayerCastBar.Layout, ","))
    Private:SetMover(Private.DB.global.Target.Enabled, "ElvUF_TargetMover", table.concat(Private.DB.global.Target.Layout, ","))
    Private:SetMover(Private.DB.global.TargetCastBar.Enabled, "ElvUF_TargetCastbarMover", table.concat(Private.DB.global.TargetCastBar.Layout, ","))
    Private:SetMover(Private.DB.global.TargetTarget.Enabled, "ElvUF_TargetTargetMover", table.concat(Private.DB.global.TargetTarget.Layout, ","))
    Private:SetMover(Private.DB.global.Focus.Enabled, "ElvUF_FocusMover", table.concat(Private.DB.global.Focus.Layout, ","))
    Private:SetMover(Private.DB.global.FocusCastBar.Enabled, "ElvUF_FocusCastbarMover", table.concat(Private.DB.global.FocusCastBar.Layout, ","))
    Private:SetMover(Private.DB.global.FocusTarget.Enabled, "ElvUF_FocusTargetMover", table.concat(Private.DB.global.FocusTarget.Layout, ","))
    Private:SetMover(Private.DB.global.Pet.Enabled, "ElvUF_PetMover", table.concat(Private.DB.global.Pet.Layout, ","))
    for i = 1, 10 do Private:SetMover(Private.DB.global["ActionBar" .. i].Enabled, "ElvAB_" .. i, table.concat(Private.DB.global["ActionBar" .. i].Layout, ",")) end
    Private:SetMover(Private.DB.global["ActionBar" .. 13].Enabled, "ElvAB_" .. 13, table.concat(Private.DB.global["ActionBar" .. 13].Layout, ","))
    Private:SetMover(Private.DB.global["ActionBar" .. 14].Enabled, "ElvAB_" .. 14, table.concat(Private.DB.global["ActionBar" .. 14].Layout, ","))
    Private:SetMover(Private.DB.global["ActionBar" .. 15].Enabled, "ElvAB_" .. 15, table.concat(Private.DB.global["ActionBar" .. 15].Layout, ","))
    Private.E:LoadMovers()
end

function Private:PrettyPrint(MSG)
    print(Private.ADDON_NAME .. ": " .. MSG)
end

Private.E.PopupDialogs.ANCHOR_CONFLICT = {
    text = "You have both |cff1784d1ElvUI|r|cFF8080FFEnhanced|r|cFFFFFFFFAnchors|r and |cff1784d1ElvUI|r Anchor.\n\nSelect which one you would like to keep |cFF40FF40enabled|r.",
    button1 = "|cff1784d1ElvUI|r|cFF8080FFEnhanced|r|cFFFFFFFFAnchors|r",
    button2 = "|cff1784d1ElvUI|r Anchor",
    OnAccept = function() C_AddOns.DisableAddOn("ElvUI_Anchors") ReloadUI() end,
    OnCancel = function() C_AddOns.DisableAddOn("ElvUIEnhancedAnchors") ReloadUI() end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
}