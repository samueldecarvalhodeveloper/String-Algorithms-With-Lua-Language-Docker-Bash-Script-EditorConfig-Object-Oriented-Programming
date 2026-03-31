local texts = require("src.constants.texts")

local MostSignificantDigitSortInitialSortingIndexesRetriever = {}

function MostSignificantDigitSortInitialSortingIndexesRetriever.get_list_of_initial_sorting_indexes(
  character_frequencies_count,
  list_starting_index
)
  local list_of_initial_indexes = {}

  list_of_initial_indexes[0] = list_starting_index

  for current_character_frequencies_count_index = 1, texts["HIGHEST_ASCII_CHARACTER_CODE"] do
    list_of_initial_indexes[current_character_frequencies_count_index] =
      list_of_initial_indexes[current_character_frequencies_count_index - 1] +
        character_frequencies_count[current_character_frequencies_count_index - 1]
  end

  return list_of_initial_indexes
end

return MostSignificantDigitSortInitialSortingIndexesRetriever
