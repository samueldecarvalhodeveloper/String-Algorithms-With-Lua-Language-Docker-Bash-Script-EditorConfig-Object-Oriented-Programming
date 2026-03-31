local RollingHashGenerator = require("src.algorithms.rabin_karp_substring_search.rolling_hash_generator")

local RabinKarpSubstringSearch = {}

function RabinKarpSubstringSearch.get_list_of_positions_of_pattern(text, pattern)
  local pattern_to_be_searched_length = #pattern
  local text_to_be_parsed_length = #text
  local list_of_pattern_occurrences_on_text = {}
  local pattern_to_be_searched_rolling_hash
  local text_to_be_parsed_rolling_hash

  if pattern_to_be_searched_length > text_to_be_parsed_length then
    return list_of_pattern_occurrences_on_text
  end

  pattern_to_be_searched_rolling_hash = RollingHashGenerator.get_rolling_hash(pattern, pattern_to_be_searched_length)
  text_to_be_parsed_rolling_hash = RollingHashGenerator.get_rolling_hash(text, pattern_to_be_searched_length)

  for current_text_to_be_parsed_length = 1, text_to_be_parsed_length - pattern_to_be_searched_length + 1 do
    if pattern_to_be_searched_rolling_hash == text_to_be_parsed_rolling_hash then
      if text:sub(
        current_text_to_be_parsed_length,
        current_text_to_be_parsed_length + pattern_to_be_searched_length - 1
      ) == pattern then
        table.insert(list_of_pattern_occurrences_on_text, current_text_to_be_parsed_length)
      end
    end

    if current_text_to_be_parsed_length < text_to_be_parsed_length - pattern_to_be_searched_length + 1 then
      text_to_be_parsed_rolling_hash = RollingHashGenerator.get_updated_rolling_hash(
        text_to_be_parsed_rolling_hash,
        text:sub(current_text_to_be_parsed_length, current_text_to_be_parsed_length),
        text:sub(
          current_text_to_be_parsed_length + pattern_to_be_searched_length,
          current_text_to_be_parsed_length + pattern_to_be_searched_length
        ),
        pattern_to_be_searched_length
      )
    end
  end

  return list_of_pattern_occurrences_on_text
end

return RabinKarpSubstringSearch
