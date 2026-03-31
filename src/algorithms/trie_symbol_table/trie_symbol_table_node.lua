local TrieSymbolTableNode = { children = {}, value = nil }

TrieSymbolTableNode.__index = TrieSymbolTableNode

function TrieSymbolTableNode.new()
  return setmetatable({ children = {}, value = nil }, TrieSymbolTableNode)
end

return TrieSymbolTableNode
