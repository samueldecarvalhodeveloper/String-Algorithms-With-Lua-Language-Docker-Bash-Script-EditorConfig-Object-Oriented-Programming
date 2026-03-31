local TrieSymbolTableNodeDeletingAdapter = {}

function TrieSymbolTableNodeDeletingAdapter.get_trie_without_key_node(key, current_key_character_index, current_trie_root_node)
  local current_trie_key_character

  if not current_trie_root_node or current_key_character_index > #key then
    return
  end

  current_trie_key_character = key:sub(current_key_character_index, current_key_character_index)

  current_trie_root_node.children[current_trie_key_character] =
    TrieSymbolTableNodeDeletingAdapter.get_trie_without_key_node(
      key,
      current_key_character_index + 1,
      current_trie_root_node.children[current_trie_key_character]
    )

  return current_trie_root_node
end

return TrieSymbolTableNodeDeletingAdapter
