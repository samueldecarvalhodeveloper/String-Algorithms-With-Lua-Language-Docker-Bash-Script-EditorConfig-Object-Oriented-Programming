local texts = require("src.constants.texts")

local CompressedBytesUnpacker = {}

function CompressedBytesUnpacker.execute(text_binary_representation, list_of_ascii_characters)
  for current_text_byte_index = 1, #text_binary_representation, texts["COMPRESSED_BYTE_SIZE"] do
    local current_text_byte = string.unpack(
      ">I4",
      text_binary_representation:sub(
        current_text_byte_index,
        current_text_byte_index + texts["NEXT_BYTE_PADDING"]
      )
    )

    table.insert(list_of_ascii_characters, current_text_byte)
  end
end

return CompressedBytesUnpacker
