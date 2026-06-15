local ThreeWayQuickStringSortExecutingAdapter =
  require("src.algorithms.three_way_string_quick_sort.three_way_string_quick_sort_executing_adapter")

local ThreeWayQuickStringSort = {}

function ThreeWayQuickStringSort.execute(array_to_be_sorted)
  ThreeWayQuickStringSortExecutingAdapter.execute(array_to_be_sorted, 1, #array_to_be_sorted, 1)
end

return ThreeWayQuickStringSort
