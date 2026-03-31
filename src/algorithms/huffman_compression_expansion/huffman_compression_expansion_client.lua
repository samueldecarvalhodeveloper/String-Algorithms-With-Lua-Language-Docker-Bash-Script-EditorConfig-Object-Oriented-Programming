local texts = require("src.constants.texts")
local HuffmanCompressionExpansion =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion")

local HuffmanCompressionExpansionClient = {}

function HuffmanCompressionExpansionClient.execute()
  local compressed_text = HuffmanCompressionExpansion.get_compressed_text(texts["TEXT"])
  local decompressed_text = HuffmanCompressionExpansion.get_decompressed_text(compressed_text)

  print("Text To Be Compressed:")

  print("")

  print("\"" .. texts["TEXT"] .. "\"")

  print("")

  print("Compressed Text:")

  print("")

  print(compressed_text)

  print("")

  print("Decompressed Text:")

  print("")

  print("\"" .. decompressed_text .. "\"")
end

return HuffmanCompressionExpansionClient
