local texts = require("src.constants.texts")

local LempelZivWelchCompressionExpansionDecompressor = {}

function LempelZivWelchCompressionExpansionDecompressor.get_uncompressed_text(
  list_of_ascii_characters,
  dictionary_of_ascii_characters
)
  local next_available_character_in_ascii = texts["EXTENDED_ASCII_VALUES_SIZE"]
  local current_ascii_character = list_of_ascii_characters[1]
  local decompressed_text = dictionary_of_ascii_characters[current_ascii_character]

  for current_ascii_characters_index = 2, #list_of_ascii_characters do
    local current_ascii_characters = list_of_ascii_characters[current_ascii_characters_index]
    local current_decompressed_character

    if dictionary_of_ascii_characters[current_ascii_characters] then
      current_decompressed_character = dictionary_of_ascii_characters[current_ascii_characters]
    elseif current_ascii_characters == next_available_character_in_ascii then
      current_decompressed_character = dictionary_of_ascii_characters[current_ascii_character] ..
        dictionary_of_ascii_characters[current_ascii_character]:sub(1, 1)
    end

    decompressed_text = decompressed_text .. current_decompressed_character

    dictionary_of_ascii_characters[next_available_character_in_ascii] =
      dictionary_of_ascii_characters[current_ascii_character] .. current_decompressed_character:sub(1, 1)
    next_available_character_in_ascii = next_available_character_in_ascii + 1

    current_ascii_character = current_ascii_characters
  end

  return decompressed_text
end

return LempelZivWelchCompressionExpansionDecompressor
