local texts = require("src.constants.texts")

local HuffmanCompressionExpansionCodeGenerator = {}

function HuffmanCompressionExpansionCodeGenerator.execute(current_node, code, list_of_character_codes)
  if current_node.character_frequency_on_text_index then
    list_of_character_codes[current_node.character_frequency_on_text_index] = code

    return
  end

  HuffmanCompressionExpansionCodeGenerator.execute(
    current_node.left,
    code .. texts["ZERO_BIT"],
    list_of_character_codes
  )
  HuffmanCompressionExpansionCodeGenerator.execute(
    current_node.right,
    code .. texts["ONE_BIT"],
    list_of_character_codes
  )
end

return HuffmanCompressionExpansionCodeGenerator
