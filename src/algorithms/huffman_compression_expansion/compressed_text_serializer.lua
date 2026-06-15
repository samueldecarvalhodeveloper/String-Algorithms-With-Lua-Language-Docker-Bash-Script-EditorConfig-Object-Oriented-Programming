local CompressedTextSerializer = {}

function CompressedTextSerializer.get_serialized_list_of_characters_frequencies(
  serialized_list_of_characters_frequencies,
  number_of_character_frequencies_of_text,
  list_of_character_frequencies_on_text,
  list_of_sorted_character_frequencies_on_text
)
  for current_character in pairs(list_of_character_frequencies_on_text) do
    table.insert(list_of_sorted_character_frequencies_on_text, current_character)
  end

  table.sort(list_of_sorted_character_frequencies_on_text)

  serialized_list_of_characters_frequencies = string.pack(">I4", number_of_character_frequencies_of_text)

  for _, current_character in ipairs(list_of_sorted_character_frequencies_on_text) do
    serialized_list_of_characters_frequencies =
      serialized_list_of_characters_frequencies ..
        current_character ..
        string.pack(">I4", list_of_character_frequencies_on_text[current_character])
  end

  return serialized_list_of_characters_frequencies
end

return CompressedTextSerializer
