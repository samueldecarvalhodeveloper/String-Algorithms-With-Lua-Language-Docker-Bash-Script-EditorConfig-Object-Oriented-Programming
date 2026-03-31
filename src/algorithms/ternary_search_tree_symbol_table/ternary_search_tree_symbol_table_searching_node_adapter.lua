local TernarySearchTreeSymbolTableSearchingNodeAdapter = {}

function TernarySearchTreeSymbolTableSearchingNodeAdapter.get_node_with_key(
  key,
  current_key_character_index,
  current_tree_root_node
)
  local current_key_character = key:sub(current_key_character_index, current_key_character_index)

  if current_key_character < current_tree_root_node.key then
    return TernarySearchTreeSymbolTableSearchingNodeAdapter.get_node_with_key(
      key,
      current_key_character_index,
      current_tree_root_node.left
    )
  elseif current_key_character > current_tree_root_node.key then
    return TernarySearchTreeSymbolTableSearchingNodeAdapter.get_node_with_key(
      key,
      current_key_character_index,
      current_tree_root_node.right
    )
  else
    if current_key_character_index < #key then
      return TernarySearchTreeSymbolTableSearchingNodeAdapter.get_node_with_key(
        key,
        current_key_character_index + 1,
        current_tree_root_node.middle
      )
    else
      return current_tree_root_node.value
    end
  end
end

return TernarySearchTreeSymbolTableSearchingNodeAdapter
