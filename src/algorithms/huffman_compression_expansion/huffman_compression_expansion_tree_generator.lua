local HuffmanCompressionExpansionNode =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_node")
local HuffmanCompressionExpansionNodeSortingStrategy =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_node_sorting_strategy")

local HuffmanCompressionExpansionTreeGenerator = {}

function HuffmanCompressionExpansionTreeGenerator.generate_compression_tree(
  list_of_character_frequencies_on_text,
  list_of_tree_nodes
)
  for current_character_frequency_on_text_index, current_character_frequency_on_text
  in pairs(list_of_character_frequencies_on_text) do
    table.insert(
      list_of_tree_nodes,
      HuffmanCompressionExpansionNode.new(
        current_character_frequency_on_text,
        current_character_frequency_on_text_index
      )
    )
  end

  while #list_of_tree_nodes > 1 do
    local left_node
    local right_node

    table.sort(list_of_tree_nodes, HuffmanCompressionExpansionNodeSortingStrategy.execute)

    left_node = table.remove(list_of_tree_nodes, 1)
    right_node = table.remove(list_of_tree_nodes, 1)

    table.insert(
      list_of_tree_nodes,
      HuffmanCompressionExpansionNode.new(
        left_node.character_frequency_on_text +
          right_node.character_frequency_on_text,
        nil,
        left_node,
        right_node
      )
    )
  end
end

function HuffmanCompressionExpansionTreeGenerator.generate_decompression_tree(
  list_of_character_frequencies_on_text,
  list_of_tree_nodes
)
  for
  current_character_frequency_on_text_index,
  current_number_of_occurrences_of_character
  in pairs(list_of_character_frequencies_on_text) do
    table.insert(
      list_of_tree_nodes,
      HuffmanCompressionExpansionNode.new(
        current_number_of_occurrences_of_character,
        current_character_frequency_on_text_index
      )
    )
  end

  while #list_of_tree_nodes > 1 do
    table.sort(list_of_tree_nodes, HuffmanCompressionExpansionNodeSortingStrategy.execute)

    local left_node = table.remove(list_of_tree_nodes, 1)
    local right_node = table.remove(list_of_tree_nodes, 1)

    table.insert(
      list_of_tree_nodes,
      HuffmanCompressionExpansionNode.new(
        left_node.character_frequency_on_text + right_node.character_frequency_on_text,
        nil,
        left_node,
        right_node
      )
    )
  end
end

return HuffmanCompressionExpansionTreeGenerator
