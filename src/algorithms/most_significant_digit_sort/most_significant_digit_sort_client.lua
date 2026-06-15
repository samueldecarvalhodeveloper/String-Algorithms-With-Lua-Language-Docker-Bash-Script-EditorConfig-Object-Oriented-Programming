local texts = require("src.constants.texts")
local MostSignificantDigitSort =
  require("src.algorithms.most_significant_digit_sort.most_significant_digit_sort")

local MostSignificantDigitSortClient = {}

function MostSignificantDigitSortClient.execute()
  print("List To Be Sorted: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  print("")

  MostSignificantDigitSort.execute(texts["LIST_OF_NAMES"])

  print("Sorted List: [ " .. table.concat(texts["LIST_OF_NAMES"], ", ") .. " ]")

  texts.restore_list_of_names_unsorted_order()
end

return MostSignificantDigitSortClient
