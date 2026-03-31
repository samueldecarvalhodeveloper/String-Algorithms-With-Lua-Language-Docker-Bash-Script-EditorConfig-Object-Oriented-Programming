local texts = require("src.constants.texts")
local KnuthMorrisPrattSubstringSearch =
  require("src.algorithms.knuth_morris_pratt_substring_search.knuth_morris_pratt_substring_search")

local KnuthMorrisPrattSubstringSearchClient = {}

function KnuthMorrisPrattSubstringSearchClient.execute()
  local list_of_positions_of_pattern =
    KnuthMorrisPrattSubstringSearch.get_list_of_positions_of_pattern(texts["TEXT"], texts["PATTERN"])

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

return KnuthMorrisPrattSubstringSearchClient
