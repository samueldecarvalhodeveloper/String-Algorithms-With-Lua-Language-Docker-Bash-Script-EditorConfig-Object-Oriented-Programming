local MostSignificantDigitSortListCopier = {}

function MostSignificantDigitSortListCopier.execute(
  list_to_be_sorted,
  sorted_list,
  list_starting_index,
  list_ending_index
)
  for current_list_index = list_starting_index, list_ending_index do
    list_to_be_sorted[current_list_index] = sorted_list[current_list_index]
  end
end

return MostSignificantDigitSortListCopier
