local NumberOfCharacterFrequenciesOfTextParser = {}

function NumberOfCharacterFrequenciesOfTextParser.get_number_of_character_frequencies_of_text(
  list_of_character_frequencies_on_text
)
  local number_of_character_frequencies_of_text = 0

  for _ in pairs(list_of_character_frequencies_on_text) do
    number_of_character_frequencies_of_text = number_of_character_frequencies_of_text + 1
  end

  return number_of_character_frequencies_of_text
end

return NumberOfCharacterFrequenciesOfTextParser
