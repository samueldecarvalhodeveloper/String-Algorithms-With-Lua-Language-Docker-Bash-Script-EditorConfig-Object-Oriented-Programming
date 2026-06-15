local MostSignificantDigitSortCharacterFrequenciesCount =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort_character_frequencies_counter")
local MostSignificantDigitSortListCopier =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort_list_copier")
local MostSignificantDigitSortRadixExecutor =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort_radix_executor")
local MostSignificantDigitSortInitialSortingIndexesRetriever =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort_initial_sorting_indexes_retriever")
local texts = require("src.constants.texts")

local MostSignificantDigitSortExecutor = {}

function MostSignificantDigitSortExecutor.execute(
  list_to_be_sorted,
  list_starting_index,
  list_ending_index,
  current_list_positions_index
)
  local current_list_starting_index
  local character_frequencies_count
  local list_of_initial_indexes
  local sorted_list

  if list_starting_index >= list_ending_index then
    return
  end

  current_list_starting_index = list_starting_index

  character_frequencies_count = MostSignificantDigitSortCharacterFrequenciesCount.get_character_frequencies_count(
    list_to_be_sorted,
    list_starting_index,
    list_ending_index,
    current_list_positions_index
  )
  list_of_initial_indexes = MostSignificantDigitSortInitialSortingIndexesRetriever.get_list_of_initial_sorting_indexes(
    character_frequencies_count,
    list_starting_index
  )
  sorted_list = MostSignificantDigitSortRadixExecutor.get_sorted_list(
    list_to_be_sorted,
    list_starting_index,
    list_ending_index,
    current_list_positions_index,
    list_of_initial_indexes
  )

  MostSignificantDigitSortListCopier.execute(list_to_be_sorted, sorted_list, list_starting_index, list_ending_index)

  for current_character_frequencies_count_index = 0, texts["HIGHEST_ASCII_CHARACTER_CODE"] do
    if character_frequencies_count[current_character_frequencies_count_index] > 0 then
      MostSignificantDigitSortExecutor.execute(
        list_to_be_sorted,
        current_list_starting_index,
        current_list_starting_index + character_frequencies_count[current_character_frequencies_count_index] - 1,
        current_list_positions_index + 1
      )

      current_list_starting_index =
        current_list_starting_index + character_frequencies_count[current_character_frequencies_count_index]
    end
  end
end

return MostSignificantDigitSortExecutor

