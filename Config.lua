local Private = select(2, ...)
local ACH = Private.ACH
local ACR = Private.ACR

local function BuildFrameLayoutSection(FrameDB, MoverName, GroupName, TabOrder)
    local Section = ACH:Group(GroupName, nil, TabOrder, nil)
    local function IsDisabled() return not FrameDB.Enabled end

    local function UpdateLayout()
        Private:UpdateMover(FrameDB.Enabled, MoverName, table.concat(FrameDB.Layout, ","))
        if ACR then ACR:NotifyChange("ElvUI") end
    end

    Section.name = GroupName

    Section.args.Enabled = ACH:Toggle("Enable |cFF8080FFEnhanced|r Anchors", nil, 1, nil, nil, "full", function() return FrameDB.Enabled end, function(_, value) FrameDB.Enabled = value UpdateLayout() end)

    Section.args.LayoutHeader = ACH:Header("Anchoring", 2)

    Section.args.AnchorFrom = ACH:Select("Anchor From", nil, 3, Private.ANCHOR_POINTS, nil, "full", function() return FrameDB.Layout[1] end, function(_, value) FrameDB.Layout[1] = value UpdateLayout() end, IsDisabled)
    Section.args.AnchorParent = ACH:Input("Anchor Parent", nil, 5, nil, "full", function() return FrameDB.Layout[2] end, function(_, value) FrameDB.Layout[2] = value UpdateLayout() end, IsDisabled)
    Section.args.AnchorTo = ACH:Select("Anchor To", nil, 6, Private.ANCHOR_POINTS, nil, "full", function() return FrameDB.Layout[3] end, function(_, value) FrameDB.Layout[3] = value UpdateLayout() end, IsDisabled)
    Section.args.XOffset = ACH:Range("X Offset", nil, 7, { min = -3000, max = 3000, step = 0.1 }, "full", function() return FrameDB.Layout[4] end, function(_, value) FrameDB.Layout[4] = value UpdateLayout() end, IsDisabled)
    Section.args.YOffset = ACH:Range("Y Offset", nil, 8, { min = -3000, max = 3000, step = 0.1 }, "full", function() return FrameDB.Layout[5] end, function(_, value) FrameDB.Layout[5] = value UpdateLayout() end, IsDisabled)

    return Section
end

function Private:SetupConfig()
	Private.Config = ACH:Group(format("%s", "|cFF8080FFEnhanced|r |cFFFFFFFFAnchors|r"), nil, 20, "tree")

    Private.Config.args.Description = ACH:Description(Private.ADDON_NAME .. " is not affiliated with |cff1784d1ElvUI|r.\n\n" .. Private.ADDON_NAME .. " will update the |cff1784d1ElvUI|r movers and save these to the same profile as your current |cff1784d1ElvUI|r Profile.\n\n", 0)

    Private.Config.args.Player = BuildFrameLayoutSection(Private.DB.global.Player, "ElvUF_PlayerMover", "Player", 1)
    Private.Config.args.PlayerCastBar = BuildFrameLayoutSection(Private.DB.global.PlayerCastBar, "ElvUF_PlayerCastbarMover", "Player Cast Bar", 2)
    Private.Config.args.Target = BuildFrameLayoutSection(Private.DB.global.Target, "ElvUF_TargetMover", "Target", 3)
    Private.Config.args.TargetCastBar = BuildFrameLayoutSection(Private.DB.global.TargetCastBar, "ElvUF_TargetCastbarMover", "Target Cast Bar", 4)
    Private.Config.args.TargetTarget = BuildFrameLayoutSection(Private.DB.global.TargetTarget, "ElvUF_TargetTargetMover", "Target of Target", 5)
    Private.Config.args.Focus = BuildFrameLayoutSection(Private.DB.global.Focus, "ElvUF_FocusMover", "Focus", 6)
    Private.Config.args.FocusCastBar = BuildFrameLayoutSection(Private.DB.global.FocusCastBar, "ElvUF_FocusCastbarMover", "Focus Cast Bar", 7)
    Private.Config.args.FocusTarget = BuildFrameLayoutSection(Private.DB.global.FocusTarget, "ElvUF_FocusTargetMover", "Focus Target", 8)
    Private.Config.args.Pet = BuildFrameLayoutSection(Private.DB.global.Pet, "ElvUF_PetMover", "Pet", 9)

    Private.Config.args.ActionBars = ACH:Group("Action Bars", nil, 10, "tab")
    Private.Config.args.ActionBars.args.ActionBar1 = BuildFrameLayoutSection(Private.DB.global.ActionBar1, "ElvAB_1", "Action Bar 1", 11)
    Private.Config.args.ActionBars.args.ActionBar2 = BuildFrameLayoutSection(Private.DB.global.ActionBar2, "ElvAB_2", "Action Bar 2", 12)
    Private.Config.args.ActionBars.args.ActionBar3 = BuildFrameLayoutSection(Private.DB.global.ActionBar3, "ElvAB_3", "Action Bar 3", 13)
    Private.Config.args.ActionBars.args.ActionBar4 = BuildFrameLayoutSection(Private.DB.global.ActionBar4, "ElvAB_4", "Action Bar 4", 14)
    Private.Config.args.ActionBars.args.ActionBar5 = BuildFrameLayoutSection(Private.DB.global.ActionBar5, "ElvAB_5", "Action Bar 5", 15)
    Private.Config.args.ActionBars.args.ActionBar6 = BuildFrameLayoutSection(Private.DB.global.ActionBar6, "ElvAB_6", "Action Bar 6", 16)
    Private.Config.args.ActionBars.args.ActionBar7 = BuildFrameLayoutSection(Private.DB.global.ActionBar7, "ElvAB_7", "Action Bar 7", 17)
    Private.Config.args.ActionBars.args.ActionBar8 = BuildFrameLayoutSection(Private.DB.global.ActionBar8, "ElvAB_8", "Action Bar 8", 18)
    Private.Config.args.ActionBars.args.ActionBar9 = BuildFrameLayoutSection(Private.DB.global.ActionBar9, "ElvAB_9", "Action Bar 9", 19)
    Private.Config.args.ActionBars.args.ActionBar10 = BuildFrameLayoutSection(Private.DB.global.ActionBar10, "ElvAB_10", "Action Bar 10", 20)
    Private.Config.args.ActionBars.args.ActionBar13 = BuildFrameLayoutSection(Private.DB.global.ActionBar13, "ElvAB_13", "Action Bar 13", 21)
    Private.Config.args.ActionBars.args.ActionBar14 = BuildFrameLayoutSection(Private.DB.global.ActionBar14, "ElvAB_14", "Action Bar 14", 22)
    Private.Config.args.ActionBars.args.ActionBar15 = BuildFrameLayoutSection(Private.DB.global.ActionBar15, "ElvAB_15", "Action Bar 15", 23)

    if Private.E then
        Private.E.Options.args.ElvUIAnchors = Private.Config
    end
end
