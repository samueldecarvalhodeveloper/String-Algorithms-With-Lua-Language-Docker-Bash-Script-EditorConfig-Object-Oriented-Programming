local TrieSymbolTableNode =
  require("src.algorithms.trie_symbol_table.trie_symbol_table_node")
local TrieSymbolTableNodeDeletingAdapter =
  require("src.algorithms.trie_symbol_table.trie_symbol_table_node_deleting_adapter")

local TrieSymbolTable = { root = nil }

TrieSymbolTable.__index = TrieSymbolTable

function TrieSymbolTable.new()
  return setmetatable({ root = TrieSymbolTableNode.new() }, TrieSymbolTable)
end

function TrieSymbolTable:add_key(key, value)
  local current_trie_root_node = self.root

  if not current_trie_root_node then
    return
  end

  for i = 1, #key do
    local current_trie_key_character = key:sub(i, i)

    if not current_trie_root_node.children[current_trie_key_character] then
      current_trie_root_node.children[current_trie_key_character] = TrieSymbolTableNode.new()
    end

    current_trie_root_node = current_trie_root_node.children[current_trie_key_character]
  end

  current_trie_root_node.value = value
end

function TrieSymbolTable:get_key(key)
  local current_trie_root_node = self.root

  if not current_trie_root_node then
    return
  end

  for current_key_character_index = 1, #key do
    local current_trie_key_character = key:sub(current_key_character_index, current_key_character_index)

    current_trie_root_node = current_trie_root_node.children[current_trie_key_character]

    if not current_trie_root_node then
      return
    end
  end

  return current_trie_root_node.value
end

function TrieSymbolTable:delete_key(key)
  self.root = TrieSymbolTableNodeDeletingAdapter.get_trie_without_key_node(key, 1, self.root)
end

return TrieSymbolTable
