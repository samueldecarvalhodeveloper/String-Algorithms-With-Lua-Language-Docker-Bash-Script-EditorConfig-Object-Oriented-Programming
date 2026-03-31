local TernarySearchTreeSymbolTableDeletingNodeAdapter = {}

function TernarySearchTreeSymbolTableDeletingNodeAdapter.get_trie_without_key(
  key,
  current_key_character_index,
  current_tree_root_node
)
  local current_key_character = key:sub(current_key_character_index, current_key_character_index)

  if current_key_character < current_tree_root_node.key then
    current_tree_root_node.left = TernarySearchTreeSymbolTableDeletingNodeAdapter.get_trie_without_key(
      key,
      current_key_character_index,
      current_tree_root_node.left
    )
  elseif current_key_character > current_tree_root_node.key then
    current_tree_root_node.right = TernarySearchTreeSymbolTableDeletingNodeAdapter.get_trie_without_key(
      key,
      current_key_character_index,
      current_tree_root_node.right
    )
  else
    if current_key_character_index < #key then
      current_tree_root_node.middle = TernarySearchTreeSymbolTableDeletingNodeAdapter.get_trie_without_key(
        key,
        current_key_character_index + 1,
        current_tree_root_node.middle
      )
    else
      current_tree_root_node.value = nil
    end
  end

  return current_tree_root_node
end

return TernarySearchTreeSymbolTableDeletingNodeAdapter
