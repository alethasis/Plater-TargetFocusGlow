function (self, unitId, unitFrame, envTable, modTable)
  local isFocus = function()
    return unitFrame.IsFocus
  end

  envTable.AddBorder(self, unitFrame, isFocus)
end
