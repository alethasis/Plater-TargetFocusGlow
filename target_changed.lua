function (self, unitId, unitFrame, envTable, modTable)
  local isTarget = function()
    return unitFrame.IsTarget
  end

  envTable.AddBorder(self, unitFrame, isTarget)
end
