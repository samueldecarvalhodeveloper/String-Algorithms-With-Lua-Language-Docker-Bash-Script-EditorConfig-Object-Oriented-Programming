local DictionaryOfAsciiCharactersInitializer =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.dictionary_of_ascii_characters_initializer")
local LempelZivWelchCompressionExpansionDecompressor =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.lempel_ziv_welch_compression_expansion_decompressor")
local LempelZivWelchCompressionExpansionEncoder =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.lempel_ziv_welch_compression_expansion_encoder")
local CompressedBytesUnpacker =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.compressed_bytes_unpacker")
local CompressedTextToByteStreamConverter =
  require("src.algorithms.lempel_ziv_welch_compression_expansion.compressed_text_to_byte_stream_converter")

local LempelZivWelchCompressionExpansion = {}

function LempelZivWelchCompressionExpansion.get_compressed_text(text_to_be_compressed)
  local dictionary_of_ascii_characters = {}
  local list_of_dictionary_character_ascii = {}

  DictionaryOfAsciiCharactersInitializer.initialize_compression_dictionary(dictionary_of_ascii_characters)

  LempelZivWelchCompressionExpansionEncoder.execute(
    text_to_be_compressed,
    dictionary_of_ascii_characters,
    list_of_dictionary_character_ascii
  )

  return CompressedTextToByteStreamConverter.get_converted_compressed_text_to_byte_stream(
    list_of_dictionary_character_ascii
  )
end

function LempelZivWelchCompressionExpansion.get_decompressed_text(text_binary_representation)
  local dictionary_of_ascii_characters = {}
  local list_of_ascii_characters = {}

  CompressedBytesUnpacker.execute(text_binary_representation, list_of_ascii_characters)

  DictionaryOfAsciiCharactersInitializer.initialize_decompression_dictionary(dictionary_of_ascii_characters)

  return LempelZivWelchCompressionExpansionDecompressor.get_uncompressed_text(
    list_of_ascii_characters,
    dictionary_of_ascii_characters
  )
end

return LempelZivWelchCompressionExpansion
