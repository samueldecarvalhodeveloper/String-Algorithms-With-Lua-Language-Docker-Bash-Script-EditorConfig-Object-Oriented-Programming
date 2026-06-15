local texts = require("src.constants.texts")
local ThreeWayStringQuickSort = require("src.algorithms.three_way_string_quick_sort.three_way_string_quick_sort")

local ThreeWayStringQuickSortClient = {}

function ThreeWayStringQuickSortClient.execute()
  print("List To Be Sorted: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  print("")

  ThreeWayStringQuickSort.execute(texts["LIST_OF_NAMES"])

  print("Sorted List: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  texts.restore_list_of_names_unsorted_order()
end

return ThreeWayStringQuickSortClient
