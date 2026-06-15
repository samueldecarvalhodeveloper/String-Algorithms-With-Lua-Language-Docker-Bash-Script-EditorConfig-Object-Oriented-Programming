local TextParser = require("src.algorithms.boyer_moore_substring_search.text_parser")

local BoyerMooreSubstringSearch = {}

function BoyerMooreSubstringSearch.get_list_of_positions_of_pattern(text, pattern)
  local list_of_pattern_occurrences_on_text = {}
  local pattern_to_be_searched_length = #pattern
  local text_to_be_parsed_length = #text
  local current_window_of_right_end_of_text_to_be_parsed = pattern_to_be_searched_length
  local current_window_of_right_end_of_pattern_to_be_searched = pattern_to_be_searched_length

  while current_window_of_right_end_of_text_to_be_parsed <= text_to_be_parsed_length do
    current_window_of_right_end_of_pattern_to_be_searched = pattern_to_be_searched_length

    if current_window_of_right_end_of_pattern_to_be_searched == 0 then
      table.insert(
        list_of_pattern_occurrences_on_text,
        current_window_of_right_end_of_text_to_be_parsed - pattern_to_be_searched_length + 1
      )
      current_window_of_right_end_of_text_to_be_parsed = current_window_of_right_end_of_text_to_be_parsed +
        pattern_to_be_searched_length -
        pattern[
          text:sub(
            current_window_of_right_end_of_text_to_be_parsed,
            current_window_of_right_end_of_text_to_be_parsed
          )
        ]
        or pattern_to_be_searched_length
    else
      current_window_of_right_end_of_text_to_be_parsed = current_window_of_right_end_of_text_to_be_parsed +
        math.max(
          1,
          current_window_of_right_end_of_pattern_to_be_searched -
            (
              pattern[
              text:sub(
                current_window_of_right_end_of_text_to_be_parsed - pattern_to_be_searched_length +
                  current_window_of_right_end_of_pattern_to_be_searched,
                current_window_of_right_end_of_text_to_be_parsed -
                  pattern_to_be_searched_length +
                  current_window_of_right_end_of_pattern_to_be_searched
              )
              ] or 0)
        )
    end
  end

  return list_of_pattern_occurrences_on_text
end

return BoyerMooreSubstringSearch
