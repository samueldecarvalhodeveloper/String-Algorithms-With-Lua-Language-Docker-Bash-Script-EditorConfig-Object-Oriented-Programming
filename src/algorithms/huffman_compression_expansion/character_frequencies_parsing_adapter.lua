local CharacterFrequenciesParsingAdapter = {}

function CharacterFrequenciesParsingAdapter.get_pointer_to_current_character_position(
  pointer_to_current_character_position,
  number_of_character_frequencies_of_text,
  text_binary_representation,
  list_of_character_frequencies_on_text
)
  for _ = 1, number_of_character_frequencies_of_text do
    local current_text_character = text_binary_representation:sub(
      pointer_to_current_character_position,
      pointer_to_current_character_position
    )

    pointer_to_current_character_position = pointer_to_current_character_position + 1

    local number_of_occurrences_of_character = string.unpack(
      ">I4",
      text_binary_representation:sub(
        pointer_to_current_character_position,
        pointer_to_current_character_position + 3
      )
    )

    pointer_to_current_character_position = pointer_to_current_character_position + 4
    list_of_character_frequencies_on_text[current_text_character] = number_of_occurrences_of_character
  end

  return pointer_to_current_character_position
end

return CharacterFrequenciesParsingAdapter
