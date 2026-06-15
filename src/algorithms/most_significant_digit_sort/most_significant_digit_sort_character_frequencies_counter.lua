local texts = require("src.constants.texts")

local MostSignificantDigitSortCharacterFrequenciesCount = {}

function MostSignificantDigitSortCharacterFrequenciesCount.get_character_frequencies_count(
  list_to_be_sorted,
  list_starting_index,
  list_ending_index,
  character_position
)
  local character_frequencies_count = {}

  for current_character_frequencies_count_index = 0, texts["HIGHEST_ASCII_CHARACTER_CODE"] do
    character_frequencies_count[current_character_frequencies_count_index] = 0
  end

  for current_character_index = list_starting_index, list_ending_index do
    local current_character_position_index =
      string.byte(list_to_be_sorted[current_character_index], character_position) or 0

    character_frequencies_count[current_character_position_index] =
      character_frequencies_count[current_character_position_index] + 1
  end

  return character_frequencies_count
end

return MostSignificantDigitSortCharacterFrequenciesCount

