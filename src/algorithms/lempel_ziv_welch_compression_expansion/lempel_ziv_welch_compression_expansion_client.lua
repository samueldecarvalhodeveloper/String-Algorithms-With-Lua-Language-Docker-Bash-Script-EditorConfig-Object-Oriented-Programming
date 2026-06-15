local texts = require("src.constants.texts")
local LempelZivWelchCompressionExpansion =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.lempel_ziv_welch_compression_expansion")

local LempelZivWelchCompressionExpansionClient = {}

function LempelZivWelchCompressionExpansionClient.execute()
  local compressed_text = LempelZivWelchCompressionExpansion.get_compressed_text(texts["TEXT"])
  local decompressed_text = LempelZivWelchCompressionExpansion.get_decompressed_text(compressed_text)

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

return LempelZivWelchCompressionExpansionClient
