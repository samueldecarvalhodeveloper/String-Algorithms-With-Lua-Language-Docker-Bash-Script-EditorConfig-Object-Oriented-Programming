local HuffmanCompressionExpansionNodeSortingStrategy = {}

function HuffmanCompressionExpansionNodeSortingStrategy.execute(current_node, next_node)
  if current_node.character_frequency_on_text == next_node.character_frequency_on_text then
    return
    current_node.character_frequency_on_text_index and
      next_node.character_frequency_on_text_index and
      current_node.character_frequency_on_text_index:byte()
        < next_node.character_frequency_on_text_index:byte()
  end

  return current_node.character_frequency_on_text < next_node.character_frequency_on_text
end

return HuffmanCompressionExpansionNodeSortingStrategy
