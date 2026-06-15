local ValueWithMaximumLengthSizeExtractor =
  require("src.algorithms.least_significant_digit_sort.value_with_maximum_length_size_extractor")
local LeastSignificantDigitSortCharacterFrequenciesCount =
  require("src.algorithms.least_significant_digit_sort.least_significant_digit_sort_character_frequencies_counter")
local LeastSignificantDigitSortListCopier =
  require("src.algorithms.least_significant_digit_sort.least_significant_digit_sort_list_copier")
local LeastSignificantDigitSortRadixExecutor =
  require("src.algorithms.least_significant_digit_sort.least_significant_digit_sort_radix_executor")
local LeastSignificantDigitSortInitialSortingIndexesRetriever =
  require("src.algorithms.least_significant_digit_sort.least_significant_digit_sort_initial_sorting_indexes_retriever")

local LeastSignificantDigitSort = {}

function LeastSignificantDigitSort.execute(list_to_be_sorted)
  local value_with_maximum_length_size =
    ValueWithMaximumLengthSizeExtractor.get_value_with_maximum_length_size(list_to_be_sorted)

  for current_character_position_index = value_with_maximum_length_size, 1, -1 do
    local character_frequencies_count =
      LeastSignificantDigitSortCharacterFrequenciesCount.get_character_frequencies_count(
        list_to_be_sorted,
        1,
        #list_to_be_sorted,
        current_character_position_index
      )
    local list_of_initial_indexes =
      LeastSignificantDigitSortInitialSortingIndexesRetriever.get_list_of_initial_sorting_indexes(
        character_frequencies_count,
        1
      )
    local sorted_list = LeastSignificantDigitSortRadixExecutor.get_sorted_list(
      list_to_be_sorted,
      1,
      #list_to_be_sorted,
      current_character_position_index,
      list_of_initial_indexes
    )

    LeastSignificantDigitSortListCopier.execute(
      list_to_be_sorted,
      sorted_list,
      1,
      #list_to_be_sorted
    )
  end
end

return LeastSignificantDigitSort
