local CompressedTextToByteStreamConverter = {}

function CompressedTextToByteStreamConverter.get_converted_compressed_text_to_byte_stream(
  list_of_dictionary_character_ascii
)
  local compressed_text = ""

  for _, current_character in ipairs(list_of_dictionary_character_ascii) do
    compressed_text = compressed_text .. string.pack(">I4", current_character)
  end

  return compressed_text
end

return CompressedTextToByteStreamConverter
