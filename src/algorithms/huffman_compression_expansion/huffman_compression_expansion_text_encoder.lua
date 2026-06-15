local HuffmanCompressionExpansionTextEncoder = {}

function HuffmanCompressionExpansionTextEncoder.execute(
  text_to_be_compressed,
  list_of_byte_encoded_characters,
  list_of_character_codes
)
  for current_text_to_be_compressed_character_index = 1, #text_to_be_compressed do
    table.insert(
      list_of_byte_encoded_characters,
      list_of_character_codes[
        text_to_be_compressed:sub(
          current_text_to_be_compressed_character_index,
          current_text_to_be_compressed_character_index
        )
      ]
    )
  end
end

return HuffmanCompressionExpansionTextEncoder
