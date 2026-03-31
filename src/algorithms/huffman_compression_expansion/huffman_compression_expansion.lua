local HuffmanCompressionExpansionCodeGenerator =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_code_generator")
local CharacterFrequenciesCalculator =
  require("src.algorithms.huffman_compression_expansion.character_frequencies_calculator")
local HuffmanCompressionExpansionTreeGenerator =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_tree_generator")
local HuffmanCompressionExpansionTextEncoder =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_text_encoder")
local HuffmanCompressionExpansionBitToByteConverter =
  require("src.algorithms.huffman_compression_expansion.huffman_compression_expansion_bit_to_byte_converter")
local CompressedTextSerializer =
  require("src.algorithms.huffman_compression_expansion.compressed_text_serializer")
local CharacterFrequenciesParsingAdapter =
  require("src.algorithms.huffman_compression_expansion.character_frequencies_parsing_adapter")
local CompressedBytesStreamDecoder =
  require("src.algorithms.huffman_compression_expansion.compressed_bytes_stream_decoder")
local EncodedDataToBitStreamConverter =
  require("src.algorithms.huffman_compression_expansion.encoded_data_to_bit_stream_converter")
local NumberOfCharacterFrequenciesOfTextParser =
  require("src.algorithms.huffman_compression_expansion.number_of_character_frequencies_of_text_parser")
local texts = require("src.constants.texts")

local HuffmanCompressionExpansion = {}

function HuffmanCompressionExpansion.get_compressed_text(text_to_be_compressed)
  local list_of_character_frequencies_on_text = {}
  local list_of_byte_encoded_characters = {}
  local list_of_tree_nodes = {}
  local list_of_character_codes = {}
  local list_of_text_encoded_bytes = {}
  local list_of_sorted_character_frequencies_on_text = {}
  local number_of_character_frequencies_of_text = 0
  local padding_characters
  local padding_characters_size
  local serialized_list_of_characters_frequencies

  CharacterFrequenciesCalculator.execute(text_to_be_compressed, list_of_character_frequencies_on_text)

  HuffmanCompressionExpansionTreeGenerator.generate_compression_tree(
    list_of_character_frequencies_on_text,
    list_of_tree_nodes
  )

  HuffmanCompressionExpansionCodeGenerator.execute(list_of_tree_nodes[1], "", list_of_character_codes)

  number_of_character_frequencies_of_text =
    NumberOfCharacterFrequenciesOfTextParser.get_number_of_character_frequencies_of_text(
      list_of_character_frequencies_on_text
    )

  HuffmanCompressionExpansionTextEncoder.execute(
    text_to_be_compressed,
    list_of_byte_encoded_characters,
    list_of_character_codes
  )

  padding_characters = table.concat(list_of_byte_encoded_characters)

  padding_characters_size = (texts["BYTE_SIZE"] - (#padding_characters % texts["BYTE_SIZE"])) % texts["BYTE_SIZE"]

  padding_characters = padding_characters .. string.rep(texts["ZERO_BIT"], padding_characters_size)

  HuffmanCompressionExpansionBitToByteConverter.execute(padding_characters, list_of_text_encoded_bytes)

  serialized_list_of_characters_frequencies = CompressedTextSerializer.get_serialized_list_of_characters_frequencies(
    serialized_list_of_characters_frequencies,
    number_of_character_frequencies_of_text,
    list_of_character_frequencies_on_text,
    list_of_sorted_character_frequencies_on_text
  )

  return serialized_list_of_characters_frequencies ..
    string.char(padding_characters_size) ..
    table.concat(list_of_text_encoded_bytes)
end

function HuffmanCompressionExpansion.get_decompressed_text(text_binary_representation)
  local list_of_decompressed_characters = {}
  local list_of_character_frequencies_on_text = {}
  local list_of_tree_nodes = {}
  local number_of_character_frequencies_of_text = string.unpack(">I4", text_binary_representation:sub(1, 4))
  local pointer_to_current_character_position = 5
  local text_compressed_byte_stream = ""
  local compressed_text

  pointer_to_current_character_position = CharacterFrequenciesParsingAdapter.get_pointer_to_current_character_position(
    pointer_to_current_character_position,
    number_of_character_frequencies_of_text,
    text_binary_representation,
    list_of_character_frequencies_on_text
  ) + 1
  compressed_text = text_binary_representation:sub(pointer_to_current_character_position)

  HuffmanCompressionExpansionTreeGenerator.generate_decompression_tree(
    list_of_character_frequencies_on_text,
    list_of_tree_nodes
  )

  text_compressed_byte_stream =
    EncodedDataToBitStreamConverter.get_text_compressed_byte_stream(compressed_text, text_compressed_byte_stream)

  CompressedBytesStreamDecoder.execute(
    text_compressed_byte_stream,
    list_of_tree_nodes,
    list_of_decompressed_characters
  )

  return table.concat(list_of_decompressed_characters)
end

return HuffmanCompressionExpansion
