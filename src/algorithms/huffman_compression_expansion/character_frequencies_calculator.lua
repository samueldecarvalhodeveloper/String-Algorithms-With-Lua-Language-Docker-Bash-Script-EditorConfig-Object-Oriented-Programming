local CharacterFrequenciesCalculator = {}

function CharacterFrequenciesCalculator.execute(text_to_be_compressed, list_of_character_frequencies_on_text)
  for current_text_to_be_compressed_character = 1, #text_to_be_compressed do
    local current_text_to_be_compressed_character_index = text_to_be_compressed:sub(
      current_text_to_be_compressed_character,
      current_text_to_be_compressed_character
    )

    list_of_character_frequencies_on_text[current_text_to_be_compressed_character_index] =
      (list_of_character_frequencies_on_text[current_text_to_be_compressed_character_index] or 0) + 1
  end
end

return CharacterFrequenciesCalculator
