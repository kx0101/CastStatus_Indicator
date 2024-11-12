local statusFrame = CreateFrame("Frame", "CastStatusIndicatorFrame", UIParent)
statusFrame:SetSize(64, 64)
statusFrame:SetFrameStrata("TOOLTIP")

local statusTexture = statusFrame:CreateTexture(nil, "BACKGROUND")
statusTexture:SetAllPoints(statusFrame)

local ableToCastTexture = "Interface\\AddOns\\CastStatus_Indicator\\able-to-cast.tga"
local notAbleToCastTexture = "Interface\\AddOns\\CastStatus_Indicator\\not-able-to-cast.tga"

local function UpdateCastStatus()
    if GetSpellCooldown(61304) ~= 0 then
        statusTexture:SetTexture(notAbleToCastTexture)
    else
        statusTexture:SetTexture(ableToCastTexture)
    end
end

local function UpdateCursorPosition()
    local cursorX, cursorY = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()

    statusFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", cursorX / scale, cursorY / scale)
end

statusFrame:SetScript("OnUpdate", function()
    UpdateCastStatus()
    UpdateCursorPosition()
end)
