local TEXTS = {
  ["TEXT"] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur consequat auctor lorem, sed mattis mauris efficitur quis. Fusce posuere nulla in dolor congue, eget cursus nisi ultrices. Donec vitae lorem sed tortor porta sodales. Curabitur posuere quis diam eu aliquet. Mauris ante odio, dignissim non risus non, egestas elementum enim. Nullam euismod ac ex in tristique. In euismod consequat lectus a porttitor. Cras egestas ligula non lorem varius fringilla.",
  ["PATTERN"] = "Lorem",
  ["LIST_OF_NAMES"] = {
    "Benjamin", "Mia", "Olivia", "Ryan", "Grace", "Charlotte", "Alice", "Katherine", "Sophia",
    "Daniel", "Jack", "Frederick", "Isabella", "Liam", "Eleanor", "Quinn", "Nathan", "Patrick", "Henry",
    "Theodore"
  },
  ["PRIME_NUMBER_FOR_HASH_MODULUS"] = 101,
  ["EXTENDED_ASCII_VALUES_SIZE"] = 256,
  ["ZERO_BIT"] = "0",
  ["ONE_BIT"] = "1",
  ["BYTE_SIZE"] = 8,
  ["HIGHEST_ASCII_CHARACTER_CODE"] = 255,
  ["COMPRESSED_BYTE_SIZE"] = 4,
  ["NEXT_BYTE_PADDING"] = 3
}

function TEXTS.restore_list_of_names_unsorted_order()
  TEXTS["LIST_OF_NAMES"] = {
    "Benjamin", "Mia", "Olivia", "Ryan", "Grace", "Charlotte", "Alice", "Katherine", "Sophia",
    "Daniel", "Jack", "Frederick", "Isabella", "Liam", "Eleanor", "Quinn", "Nathan", "Patrick", "Henry",
    "Theodore"
  }
end

return TEXTS
