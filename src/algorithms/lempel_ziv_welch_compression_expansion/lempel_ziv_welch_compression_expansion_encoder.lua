local texts = require("src.constants.texts")

local LempelZivWelchCompressionExpansionEncoder = {}

function LempelZivWelchCompressionExpansionEncoder.execute(
  text_to_be_compressed,
  dictionary_of_ascii_characters,
  list_of_dictionary_character_ascii
)
  local next_available_character_in_ascii = texts["EXTENDED_ASCII_VALUES_SIZE"]
  local current_character_sequence_being_processed = ""

  for current_text_to_be_compressed_character_index = 1, #text_to_be_compressed do
    local current_text_to_be_compressed_character = text_to_be_compressed:sub(
      current_text_to_be_compressed_character_index,
      current_text_to_be_compressed_character_index
    )
    local candidate_text_to_be_check_on_characters_dictionary =
      current_character_sequence_being_processed .. current_text_to_be_compressed_character

    if dictionary_of_ascii_characters[candidate_text_to_be_check_on_characters_dictionary] then
      current_character_sequence_being_processed = candidate_text_to_be_check_on_characters_dictionary
    else
      table.insert(
        list_of_dictionary_character_ascii,
        dictionary_of_ascii_characters[current_character_sequence_being_processed]
      )

      dictionary_of_ascii_characters[candidate_text_to_be_check_on_characters_dictionary] =
        next_available_character_in_ascii

      next_available_character_in_ascii = next_available_character_in_ascii + 1

      current_character_sequence_being_processed = current_text_to_be_compressed_character
    end
  end

  if current_character_sequence_being_processed ~= "" then
    table.insert(
      list_of_dictionary_character_ascii,
      dictionary_of_ascii_characters[current_character_sequence_being_processed]
    )
  end
end

return LempelZivWelchCompressionExpansionEncoder
