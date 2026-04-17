local Private = select(2, ...)
Private.E = unpack(ElvUI)

Private.Movers = {}

Private.Movers = {
    ["Player"] = "ElvUF_PlayerMover",
    ["PlayerCastBar"] = "ElvUF_PlayerCastbarMover",
    ["Target"] = "ElvUF_TargetMover",
    ["TargetCastBar"] = "ElvUF_TargetCastbarMover",
    ["TargetTarget"] = "ElvUF_TargetTargetMover",
    ["Focus"] = "ElvUF_FocusMover",
    ["FocusCastBar"] = "ElvUF_FocusCastbarMover",
    ["FocusTarget"] = "ElvUF_FocusTargetMover",
    ["Pet"] = "ElvUF_PetMover"
}

function Private:SetMovers(isEnabled, moverName, moverLayout)
    EventUtil.ContinueOnAddOnLoaded("ElvUI", function()
        if isEnabled then
            Private.E.db.movers[moverName] = moverLayout
            Private.E:SaveMoverPosition(moverName)
        end
    end)
end