local texts = require("src.constants.texts")

local CompressedBytesStreamDecoder = {}

function CompressedBytesStreamDecoder.execute(
  text_compressed_byte_stream,
  list_of_tree_nodes,
  list_of_decompressed_characters
)
  local current_decoded_byte_node = list_of_tree_nodes[1]

  for current_text_compressed_byte_stream_index = 1, #text_compressed_byte_stream do
    current_decoded_byte_node = (
      text_compressed_byte_stream:sub(
        current_text_compressed_byte_stream_index,
        current_text_compressed_byte_stream_index) == texts["ZERO_BIT"]
    ) and
      current_decoded_byte_node.left or
      current_decoded_byte_node.right

    if current_decoded_byte_node.character_frequency_on_text_index then
      table.insert(
        list_of_decompressed_characters,
        current_decoded_byte_node.character_frequency_on_text_index
      )

      current_decoded_byte_node = list_of_tree_nodes[1]
    end
  end
end

return CompressedBytesStreamDecoder
