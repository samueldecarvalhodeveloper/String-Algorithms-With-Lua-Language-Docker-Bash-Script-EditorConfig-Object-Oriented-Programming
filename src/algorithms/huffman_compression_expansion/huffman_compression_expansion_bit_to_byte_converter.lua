local texts = require("src.constants.texts")

local HuffmanCompressionExpansionBitToByteConverter = {}

function HuffmanCompressionExpansionBitToByteConverter.execute(padding_characters, list_of_text_encoded_bytes)
  for current_padding_characters_index = 1, #padding_characters, texts["BYTE_SIZE"] do
    local current_byte_character = padding_characters:sub(
      current_padding_characters_index,
      current_padding_characters_index + 7
    )
    local current_byte_size = 0

    for current_byte_index = 1, texts["BYTE_SIZE"] do
      current_byte_size = current_byte_size * 2

      if current_byte_character:sub(current_byte_index, current_byte_index) == texts["ONE_BIT"] then
        current_byte_size = current_byte_size + 1
      end
    end

    table.insert(list_of_text_encoded_bytes, string.char(current_byte_size))
  end
end

return HuffmanCompressionExpansionBitToByteConverter
