function (self, unitId, unitFrame, envTable, modTable)
  local color = "white"

  envTable.AddBorder = function(self, frameToBorder, condition)
    if (not frameToBorder.extraTargetGlow_MOD) then
      local glow = frameToBorder.healthBar:CreateTexture(nil, "background", nil, -8)
      glow:SetTexture([[Interface\AddOns\Plater\images\nameplate_glow2]])
      glow:SetBlendMode("ADD")
      glow:SetVertexColor(DetailsFramework:ParseColors(color or "white"))
      glow:SetTexCoord(34 / 256, 20 / 64, 34 / 256, 44 / 64, 222 / 256, 20 / 64, 222 / 256, 44 / 64)
      frameToBorder.extraTargetGlow_MOD = glow
    end

    if (condition()) then
      frameToBorder.extraTargetGlow_MOD:Show()

      local PixelUtil = PixelUtil or DFPixelUtil
      local width, height = frameToBorder.healthBar:GetSize()
      local bsize = frameToBorder.healthBar.border:IsShown() and frameToBorder.healthBar.border.borderSize or 0
      local widthOffset = (4 + bsize or 0) * width / 188 --frameToBorder.healthBar:GetWidth() / 0.1
      local heightOffset = (4 + bsize or 0) * height / 28 --frameToBorder.healthBar:GetHeight() / 0.1

      frameToBorder.extraTargetGlow_MOD:ClearAllPoints()
      frameToBorder.extraTargetGlow_MOD:SetParent(frameToBorder.healthBar)

      PixelUtil.SetPoint(
        frameToBorder.extraTargetGlow_MOD,
        "topleft",
        frameToBorder.healthBar,
        "topleft",
        -widthOffset,
        heightOffset
      )
      PixelUtil.SetPoint(
        frameToBorder.extraTargetGlow_MOD,
        "bottomright",
        frameToBorder.healthBar,
        "bottomright",
        widthOffset,
        -heightOffset
      )
      PixelUtil.SetPoint(
        frameToBorder.extraTargetGlow_MOD,
        "bottomleft",
        frameToBorder.healthBar,
        "bottomleft",
        -widthOffset,
        -heightOffset
      )
      PixelUtil.SetPoint(
        frameToBorder.extraTargetGlow_MOD,
        "topright",
        frameToBorder.healthBar,
        "topright",
        widthOffset,
        heightOffset
      )
    else
      frameToBorder.extraTargetGlow_MOD:Hide()
    end
  end
end
