local texts = require("src.constants.texts")
local BoyerMooreSubstringSearch =
  require("src.algorithms.knuth_morris_pratt_substring_search.knuth_morris_pratt_substring_search")

local BoyerMooreSubstringSearchClient = {}

function BoyerMooreSubstringSearchClient.execute()
  local list_of_positions_of_pattern =
    BoyerMooreSubstringSearch.get_list_of_positions_of_pattern(texts["TEXT"], texts["PATTERN"])

  print(
    "On Text: \"" ..
      texts["TEXT"] ..
      "\"; The Positions Of Pattern \"" ..
      texts["PATTERN"] ..
      "\" Are: [ " ..
      table.concat(list_of_positions_of_pattern, ", ") ..
      " ]"
  )
end

return BoyerMooreSubstringSearchClient
