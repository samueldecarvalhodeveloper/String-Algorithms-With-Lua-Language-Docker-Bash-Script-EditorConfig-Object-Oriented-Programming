local EncodedDataToBitStreamConverter = {}

function EncodedDataToBitStreamConverter.get_text_compressed_byte_stream(compressed_text, text_compressed_byte_stream)
  for current_compressed_text_character_index = 1, #compressed_text do
    local current_character_byte = compressed_text:byte(current_compressed_text_character_index)
    local character_decoded_bit = ""

    for current_character_decoded_bit_index = 7, 0, -1 do
      character_decoded_bit =
        character_decoded_bit .. ((current_character_byte >> current_character_decoded_bit_index) & 1)
    end

    text_compressed_byte_stream = text_compressed_byte_stream .. character_decoded_bit
  end

  return text_compressed_byte_stream
end

return EncodedDataToBitStreamConverter
