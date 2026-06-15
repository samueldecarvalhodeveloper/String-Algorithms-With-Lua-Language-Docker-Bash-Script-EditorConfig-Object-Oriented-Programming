local TernarySearchTreeSymbolTableNode = { key = nil, left = nil, middle = nil, right = nil, value = nil }

TernarySearchTreeSymbolTableNode.__index = TernarySearchTreeSymbolTableNode

function TernarySearchTreeSymbolTableNode.new(key)

  return setmetatable(
    { key = key, left = nil, middle = nil, right = nil, value = nil },
    TernarySearchTreeSymbolTableNode
  )
end

return TernarySearchTreeSymbolTableNode
