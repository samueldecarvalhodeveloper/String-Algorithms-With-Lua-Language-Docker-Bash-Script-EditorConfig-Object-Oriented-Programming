local HuffmanCompressionExpansionNode = {
  character_frequency_on_text = nil,
  character_frequency_on_text_index = nil,
  left = nil,
  right = nil
}

HuffmanCompressionExpansionNode.__index = HuffmanCompressionExpansionNode

function HuffmanCompressionExpansionNode.new(
  character_frequency_on_text,
  character_frequency_on_text_index,
  left,
  right
)
  return setmetatable(
    {
      character_frequency_on_text = character_frequency_on_text,
      character_frequency_on_text_index = character_frequency_on_text_index,
      left = left,
      right = right
    },
    HuffmanCompressionExpansionNode
  )
end

return HuffmanCompressionExpansionNode
