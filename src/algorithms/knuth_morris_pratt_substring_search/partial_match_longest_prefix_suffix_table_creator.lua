local PartialMatchLongestPrefixSuffixTableCreator = {}

function PartialMatchLongestPrefixSuffixTableCreator.get_partial_match_longest_prefix_suffix_table(pattern)
  local longest_prefix_suffix = {}
  local longest_prefix_suffix_length = 0
  local current_pattern_index = 2

  longest_prefix_suffix[1] = 0

  while current_pattern_index <= #pattern do
    if pattern:sub(current_pattern_index, current_pattern_index) ==
      pattern:sub(longest_prefix_suffix_length + 1, longest_prefix_suffix_length + 1) then
      longest_prefix_suffix_length = longest_prefix_suffix_length + 1

      longest_prefix_suffix[current_pattern_index] = longest_prefix_suffix_length

      current_pattern_index = current_pattern_index + 1
    else
      if longest_prefix_suffix_length > 0 then
        longest_prefix_suffix_length = longest_prefix_suffix[longest_prefix_suffix_length]
      else
        longest_prefix_suffix[current_pattern_index] = 0

        current_pattern_index = current_pattern_index + 1
      end
    end
  end

  return longest_prefix_suffix
end

return PartialMatchLongestPrefixSuffixTableCreator
