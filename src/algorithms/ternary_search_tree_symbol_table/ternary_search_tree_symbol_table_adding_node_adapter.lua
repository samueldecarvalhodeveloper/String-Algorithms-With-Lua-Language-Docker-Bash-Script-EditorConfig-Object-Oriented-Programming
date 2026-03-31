local TernarySearchTreeSymbolTableNode =
  require("src.algorithms.ternary_search_tree_symbol_table.ternary_search_tree_symbol_table_node")

local TernarySearchTreeSymbolTableAddingNodeAdapter = {}

function TernarySearchTreeSymbolTableAddingNodeAdapter.get_trie_symbol_table_with_new_node(
  key,
  value,
  current_key_character_index,
  current_tree_root_node
)
  local current_key_character = key:sub(current_key_character_index, current_key_character_index)

  if not current_tree_root_node then
    current_tree_root_node = TernarySearchTreeSymbolTableNode.new(current_key_character)
  end

  if current_key_character < current_tree_root_node.key then
    current_tree_root_node.left = TernarySearchTreeSymbolTableAddingNodeAdapter.get_trie_symbol_table_with_new_node(
      key,
      value,
      current_key_character_index,
      current_tree_root_node.left
    )
  elseif current_key_character > current_tree_root_node.key then
    current_tree_root_node.right = TernarySearchTreeSymbolTableAddingNodeAdapter.get_trie_symbol_table_with_new_node(
      key,
      value,
      current_key_character_index,
      current_tree_root_node.right
    )
  else
    if current_key_character_index < #key then
      current_tree_root_node.middle = TernarySearchTreeSymbolTableAddingNodeAdapter.get_trie_symbol_table_with_new_node(
        key,
        value,
        current_key_character_index + 1,
        current_tree_root_node.middle
      )
    else
      current_tree_root_node.value = value
    end
  end

  return current_tree_root_node
end

return TernarySearchTreeSymbolTableAddingNodeAdapter
