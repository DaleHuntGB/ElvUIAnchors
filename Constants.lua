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
    ["ElvUF_PetMover"] = "Pet"
}

Private.SUPPORTED_ANCHORS = {
    ["EssentialCooldownViewer"] = "|TInterface\\AddOns\\ElvUIEnhancedAnchors\\Media\\Blizzard_Logo.png:16:16|t |cFF009AE4Essential|r Cooldown Viewer",
    ["UtilityCooldownViewer"] = "|TInterface\\AddOns\\ElvUIEnhancedAnchors\\Media\\Blizzard_Logo.png:16:16|t |cFF009AE4Utility|r Cooldown Viewer",
    ["BuffIconCooldownViewer"] = "|TInterface\\AddOns\\ElvUIEnhancedAnchors\\Media\\Blizzard_Logo.png:16:16|t |cFF009AE4Buff|r Cooldown Viewer",
    ["ElvUIParent"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Parent",
    ["ElvUF_Player"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Player",
    ["ElvUF_Target"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Target",
    ["ElvUF_TargetTarget"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Target of Target",
    ["ElvUF_Focus"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Focus",
    ["ElvUF_FocusTarget"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Focus Target",
    ["ElvUF_Pet"] = "|TInterface\\AddOns\\ElvUI\\Game\\Shared\\Media\\Textures\\LogoAddon:16:16|t |cff1784d1ElvUI|r Pet",
}

Private.ANCHORS = {
    ["ElvUF_PlayerMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_PlayerCastbarMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_TargetMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_TargetCastbarMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_TargetTargetMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_FocusMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_FocusCastbarMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_FocusTargetMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_Pet"] = Private.SUPPORTED_ANCHORS["ElvUF_Pet"]
    },
    ["ElvUF_PetMover"] = {
        ["EssentialCooldownViewer"] = Private.SUPPORTED_ANCHORS["EssentialCooldownViewer"],
        ["UtilityCooldownViewer"] = Private.SUPPORTED_ANCHORS["UtilityCooldownViewer"],
        ["BuffIconCooldownViewer"] = Private.SUPPORTED_ANCHORS["BuffIconCooldownViewer"],
        ["ElvUIParent"] = Private.SUPPORTED_ANCHORS["ElvUIParent"],
        ["ElvUF_Player"] = Private.SUPPORTED_ANCHORS["ElvUF_Player"],
        ["ElvUF_Target"] = Private.SUPPORTED_ANCHORS["ElvUF_Target"],
        ["ElvUF_TargetTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_TargetTarget"],
        ["ElvUF_Focus"] = Private.SUPPORTED_ANCHORS["ElvUF_Focus"],
        ["ElvUF_FocusTarget"] = Private.SUPPORTED_ANCHORS["ElvUF_FocusTarget"]
    }
}

Private.ORDERED_ANCHORS = {
    ["ElvUF_PlayerMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_PlayerCastbarMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_TargetMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_TargetCastbarMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_TargetTargetMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_Focus",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_FocusMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_FocusCastbarMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_FocusTarget",
        "ElvUF_Pet",
    },
    ["ElvUF_FocusTargetMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_Pet",
    },
    ["ElvUF_PetMover"] = {
        "EssentialCooldownViewer",
        "UtilityCooldownViewer",
        "BuffIconCooldownViewer",
        "ElvUIParent",
        "ElvUF_Player",
        "ElvUF_Target",
        "ElvUF_TargetTarget",
        "ElvUF_Focus",
        "ElvUF_FocusTarget"
    }
}

function Private:RegisterAnchors(addOnName, anchorName, anchorDisplayName)
    if C_AddOns.IsAddOnLoaded(addOnName) then
        Private.SUPPORTED_ANCHORS[anchorName] = anchorDisplayName
        Private.ANCHORS["ElvUF_PlayerMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_PlayerCastbarMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_TargetMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_TargetCastbarMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_TargetTargetMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_FocusMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_FocusCastbarMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_FocusTargetMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ANCHORS["ElvUF_PetMover"][anchorName] = Private.SUPPORTED_ANCHORS[anchorName]
        Private.ORDERED_ANCHORS["ElvUF_PlayerMover"][#Private.ORDERED_ANCHORS["ElvUF_PlayerMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_PlayerCastbarMover"][#Private.ORDERED_ANCHORS["ElvUF_PlayerCastbarMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_TargetMover"][#Private.ORDERED_ANCHORS["ElvUF_TargetMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_TargetCastbarMover"][#Private.ORDERED_ANCHORS["ElvUF_TargetCastbarMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_TargetTargetMover"][#Private.ORDERED_ANCHORS["ElvUF_TargetTargetMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_FocusMover"][#Private.ORDERED_ANCHORS["ElvUF_FocusMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_FocusCastbarMover"][#Private.ORDERED_ANCHORS["ElvUF_FocusCastbarMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_FocusTargetMover"][#Private.ORDERED_ANCHORS["ElvUF_FocusTargetMover"] + 1] = anchorName
        Private.ORDERED_ANCHORS["ElvUF_PetMover"][#Private.ORDERED_ANCHORS["ElvUF_PetMover"] + 1] = anchorName
    end
end

function Private:LoadSCMAnchors()
    if not SCMAPI then return end
    local SCMAnchors = SCMAPI.FetchAnchors()
    local anchorName = "|cFF4080FFSCM|r: Group Anchor"
    for anchorIndex in pairs(SCMAnchors) do
        if anchorIndex > 100 then anchorName = "|cFF8080FFGlobal|r |cFF4080FFSCM|r: Group Anchor" end
        if anchorIndex > 200 then anchorName = "|cFF8080FFGlobal|r |cFF4080FFSCM|r: Group Anchor" end
        Private:RegisterAnchors("SkironCooldownManager", "SCM_GroupAnchor_" .. anchorIndex, "|A:icon_cooldownmanager:16:16|a " .. anchorName .. " #" .. anchorIndex)
    end
end

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
        }
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
    Private.E:LoadMovers()
end

function Private:PrettyPrint(MSG)
    print(Private.ADDON_NAME .. ": " .. MSG)
end

function Private:IsElementEnabled(element, isCastBar)
    local ElementDB = Private.E.db.unitframe.units
    local CastBarDB = ElementDB[element] and ElementDB[element].castbar

    if isCastBar then
        if CastBarDB and CastBarDB.enable then
            return true
        else
            return false
        end
    else
        if ElementDB[element] and ElementDB[element].enable then
            return true
        else
            return false
        end
    end
end

Private.E.PopupDialogs.ANCHOR_CONFLICT = {
    text = "You have both |cff1784d1ElvUI|r|cFF8080FFEnhanced|r|cFFFFFFFFAnchors|r and |cff1784d1ElvUI|r Anchor.\n\nSelect which one you would like to keep |cFF40FF40enabled|r.",
    button1 = "|cff1784d1ElvUI|r|cFF8080FFEnhanced|r|cFFFFFFFFAnchors|r",
    button2 = "|cff1784d1ElvUI|r Anchor",
    OnAccept = function() C_AddOns.DisableAddOn("ElvUI_Anchors") C_UI.ReloadUI() end,
    OnCancel = function() C_AddOns.DisableAddOn("ElvUIEnhancedAnchors") C_UI.ReloadUI() end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
}