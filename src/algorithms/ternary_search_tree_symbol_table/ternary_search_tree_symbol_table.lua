local TernarySearchTreeSymbolTableDeletingNodeAdapter =
  require("src.algorithms.ternary_search_tree_symbol_table.ternary_search_tree_symbol_table_deleting_node_adapter")
local TernarySearchTreeSymbolTableAddingNodeAdapter =
  require("src.algorithms.ternary_search_tree_symbol_table.ternary_search_tree_symbol_table_adding_node_adapter")
local TernarySearchTreeSymbolTableSearchingNodeAdapter =
  require("src.algorithms.ternary_search_tree_symbol_table.ternary_search_tree_symbol_table_searching_node_adapter")

local TernarySearchTreeSymbolTable = { root = nil }

TernarySearchTreeSymbolTable.__index = TernarySearchTreeSymbolTable

function TernarySearchTreeSymbolTable.new()
  return setmetatable({ root = nil }, TernarySearchTreeSymbolTable)
end

function TernarySearchTreeSymbolTable:add_key(key, value)
  self.root = TernarySearchTreeSymbolTableAddingNodeAdapter.get_trie_symbol_table_with_new_node(key, value, 1, self.root)
end

function TernarySearchTreeSymbolTable:get_key(key)
  return TernarySearchTreeSymbolTableSearchingNodeAdapter.get_node_with_key(key, 1, self.root)
end

function TernarySearchTreeSymbolTable:delete_key(key)
  self.root = TernarySearchTreeSymbolTableDeletingNodeAdapter.get_trie_without_key(key, 1, self.root)
end

return TernarySearchTreeSymbolTable
