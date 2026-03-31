local ValueWithMaximumLengthSizeExtractor = {}

function ValueWithMaximumLengthSizeExtractor.get_value_with_maximum_length_size(list_to_be_sorted)
  local value_with_maximum_length_size = 0

  for _, value in ipairs(list_to_be_sorted) do
    value_with_maximum_length_size = math.max(value_with_maximum_length_size, string.len(value))
  end

  return value_with_maximum_length_size
end

return ValueWithMaximumLengthSizeExtractor
