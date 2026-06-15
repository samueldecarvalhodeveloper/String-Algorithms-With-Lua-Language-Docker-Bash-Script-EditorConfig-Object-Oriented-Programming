local MostSignificantDigitSortExecutor =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort_executor")

local MostSignificantDigitSort = {}

function MostSignificantDigitSort.execute(list_to_be_sorted)
  MostSignificantDigitSortExecutor.execute(list_to_be_sorted, 1, #list_to_be_sorted, 1)
end

return MostSignificantDigitSort

