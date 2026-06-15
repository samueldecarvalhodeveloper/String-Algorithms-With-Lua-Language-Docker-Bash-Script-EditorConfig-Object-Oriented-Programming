local LeastSignificantDigitSortRadixExecutor = {}

function LeastSignificantDigitSortRadixExecutor.get_sorted_list(
  list_to_be_sorted,
  list_starting_index,
  list_ending_index,
  character_position_index,
  list_of_initial_indexes
)
  local sorted_list = {}

  for current_list_index = list_starting_index, list_ending_index do
    local current_character_position_index =
      string.byte(list_to_be_sorted[current_list_index], character_position_index) or 0

    sorted_list[list_of_initial_indexes[current_character_position_index]] =
      list_to_be_sorted[current_list_index]

    list_of_initial_indexes[current_character_position_index] =
      list_of_initial_indexes[current_character_position_index] + 1
  end

  return sorted_list
end

return LeastSignificantDigitSortRadixExecutor

