local texts = require("src.constants.texts")

local LeastSignificantDigitSort =
  require("src.algorithms.least_significant_digit_sort.least_significant_digit_sort")

local LeastSignificantDigitSortClient = {}

function LeastSignificantDigitSortClient.execute()
  print("List To Be Sorted: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  print("")

  LeastSignificantDigitSort.execute(texts["LIST_OF_NAMES"])

  print("Sorted List: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  texts.restore_list_of_names_unsorted_order()
end

return LeastSignificantDigitSortClient
