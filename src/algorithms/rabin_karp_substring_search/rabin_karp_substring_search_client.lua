local texts = require("src.constants.texts")
local RabinKarpSubstringSearch =
  require("src.algorithms.rabin_karp_substring_search.rabin_karp_substring_search")

local RabinKarpSubstringSearchClient = {}

function RabinKarpSubstringSearchClient.execute()
  local list_of_positions_of_pattern =
    RabinKarpSubstringSearch.get_list_of_positions_of_pattern(texts["TEXT"], texts["PATTERN"])

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

return RabinKarpSubstringSearchClient
