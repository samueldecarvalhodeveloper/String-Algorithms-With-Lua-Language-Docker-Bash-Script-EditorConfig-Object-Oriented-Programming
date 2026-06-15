local texts = require("src.constants.texts")

local DictionaryOfAsciiCharactersInitializer = {}

function DictionaryOfAsciiCharactersInitializer.initialize_compression_dictionary(dictionary_of_ascii_characters)
  for current_character_index = 0, texts["HIGHEST_ASCII_CHARACTER_CODE"] do
    dictionary_of_ascii_characters[string.char(current_character_index)] = current_character_index
  end
end

function DictionaryOfAsciiCharactersInitializer.initialize_decompression_dictionary(dictionary_of_ascii_characters)
  for current_character_index = 0, texts["HIGHEST_ASCII_CHARACTER_CODE"] do
    dictionary_of_ascii_characters[current_character_index] = string.char(current_character_index)
  end
end

return DictionaryOfAsciiCharactersInitializer
