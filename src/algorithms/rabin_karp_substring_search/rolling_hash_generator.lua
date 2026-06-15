local texts = require("src.constants.texts")

local RollingHashGenerator = {}

function RollingHashGenerator.get_rolling_hash(text_to_be_hashed, text_to_be_hashed_length)
  local rolling_hash = 0

  for text_to_be_hashed_character_index = 1, text_to_be_hashed_length do
    rolling_hash = (
      rolling_hash * texts["EXTENDED_ASCII_VALUES_SIZE"] +
        string.byte(text_to_be_hashed, text_to_be_hashed_character_index)
    ) %
      texts["PRIME_NUMBER_FOR_HASH_MODULUS"]
  end

  return rolling_hash
end

function RollingHashGenerator.get_updated_rolling_hash(
  old_hash,
  old_hashed_text,
  new_text_to_be_hashed,
  text_to_be_hashed_length
)
  return
  (
    old_hash - string.byte(old_hashed_text) *
      (
        texts["EXTENDED_ASCII_VALUES_SIZE"] ^
          (text_to_be_hashed_length - 1)
      )
  )
    * texts["EXTENDED_ASCII_VALUES_SIZE"] +
    string.byte(new_text_to_be_hashed) %
      texts["PRIME_NUMBER_FOR_HASH_MODULUS"]
end

return RollingHashGenerator
