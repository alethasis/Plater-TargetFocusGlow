function t(self, unitId, unitFrame, envTable, modTable)
  local color = "white"

  if (not unitFrame.extraTargetGlow_MOD) then
    local glow = unitFrame.healthBar:CreateTexture(nil, "background", nil, -8)
    glow:SetTexture([[Interface\AddOns\Plater\images\nameplate_glow2]])
    -- PixelUtil.SetPoint (glow, "center", unitFrame.healthBar, "center", 0, 0)
    --glow:SetSize (unitFrame.healthBar:GetWidth() + unitFrame.healthBar:GetWidth()/2.3, 36)
    glow:SetBlendMode("ADD")
    glow:SetVertexColor(DetailsFramework:ParseColors(color or "white"))
    glow:SetTexCoord(34 / 256, 20 / 64, 34 / 256, 44 / 64, 222 / 256, 20 / 64, 222 / 256, 44 / 64)
    unitFrame.extraTargetGlow_MOD = glow
  end

  if (unitFrame.IsFocus) then
    unitFrame.extraTargetGlow_MOD:Show()

    local PixelUtil = PixelUtil or DFPixelUtil
    local width, height = unitFrame.healthBar:GetSize()
    local bsize = unitFrame.healthBar.border:IsShown() and unitFrame.healthBar.border.borderSize or 0
    local widthOffset = (4 + bsize or 0) * width / 188 --unitFrame.healthBar:GetWidth() / 0.1
    local heightOffset = (4 + bsize or 0) * height / 28 --unitFrame.healthBar:GetHeight() / 0.1

    unitFrame.extraTargetGlow_MOD:ClearAllPoints()
    unitFrame.extraTargetGlow_MOD:SetParent(unitFrame.healthBar)

    PixelUtil.SetPoint(
      unitFrame.extraTargetGlow_MOD,
      "topleft",
      unitFrame.healthBar,
      "topleft",
      -widthOffset,
      heightOffset
    )
    PixelUtil.SetPoint(
      unitFrame.extraTargetGlow_MOD,
      "bottomright",
      unitFrame.healthBar,
      "bottomright",
      widthOffset,
      -heightOffset
    )
    PixelUtil.SetPoint(
      unitFrame.extraTargetGlow_MOD,
      "bottomleft",
      unitFrame.healthBar,
      "bottomleft",
      -widthOffset,
      -heightOffset
    )
    PixelUtil.SetPoint(
      unitFrame.extraTargetGlow_MOD,
      "topright",
      unitFrame.healthBar,
      "topright",
      widthOffset,
      heightOffset
    )
  else
    unitFrame.extraTargetGlow_MOD:Hide()
  end
end
