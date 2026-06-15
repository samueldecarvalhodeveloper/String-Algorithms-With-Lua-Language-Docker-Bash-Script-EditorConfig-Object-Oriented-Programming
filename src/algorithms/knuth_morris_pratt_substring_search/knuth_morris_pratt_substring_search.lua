local PartialMatchLongestPrefixSuffixTableCreator =
  require("src.algorithms.knuth_morris_pratt_substring_search.partial_match_longest_prefix_suffix_table_creator")

local KnuthMorrisPrattSubstringSearch = {}

function KnuthMorrisPrattSubstringSearch.get_list_of_positions_of_pattern(text, pattern)
  local longest_prefix_suffix =
    PartialMatchLongestPrefixSuffixTableCreator.get_partial_match_longest_prefix_suffix_table(pattern)
  local list_of_pattern_occurrences_on_text = {}
  local current_text_to_be_parsed_index = 1
  local current_pattern_to_be_searched_index = 1

  while current_text_to_be_parsed_index <= #text do
    if text:sub(current_text_to_be_parsed_index, current_text_to_be_parsed_index) ==
      pattern:sub(current_pattern_to_be_searched_index, current_pattern_to_be_searched_index) then
      current_text_to_be_parsed_index = current_text_to_be_parsed_index + 1

      current_pattern_to_be_searched_index = current_pattern_to_be_searched_index + 1
    end

    if current_pattern_to_be_searched_index > #pattern then
      table.insert(
        list_of_pattern_occurrences_on_text,
        current_text_to_be_parsed_index - current_pattern_to_be_searched_index + 1
      )

      current_pattern_to_be_searched_index = longest_prefix_suffix[current_pattern_to_be_searched_index - 1] + 1
    elseif current_text_to_be_parsed_index <= #text and
      text:sub(
        current_text_to_be_parsed_index,
        current_text_to_be_parsed_index
      ) ~= pattern:sub(
        current_pattern_to_be_searched_index,
        current_pattern_to_be_searched_index
      ) then
      if current_pattern_to_be_searched_index > 1 then
        current_pattern_to_be_searched_index = longest_prefix_suffix[current_pattern_to_be_searched_index - 1] + 1
      else
        current_text_to_be_parsed_index = current_text_to_be_parsed_index + 1
      end
    end
  end

  return list_of_pattern_occurrences_on_text
end

return KnuthMorrisPrattSubstringSearch
