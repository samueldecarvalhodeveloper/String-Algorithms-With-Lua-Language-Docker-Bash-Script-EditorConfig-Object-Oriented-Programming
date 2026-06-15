local texts = require("src.constants.texts")
local TrieSymbolTable = require("src.algorithms.trie_symbol_table.trie_symbol_table")

local TrieSymbolTableClient = {}

function TrieSymbolTableClient.execute()
  local trieSymbolTable = TrieSymbolTable.new()

  for i = 1, #texts["LIST_OF_NAMES"] do
    trieSymbolTable:add_key(texts["LIST_OF_NAMES"][i], texts["LIST_OF_NAMES"][i])

    if trieSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Added To The Set!")
    end
  end

  print("")

  for i = 1, #texts["LIST_OF_NAMES"] do
    if trieSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Is On The Set!")
    end
  end

  print("")

  for i = 1, #texts["LIST_OF_NAMES"] do
    trieSymbolTable:delete_key(texts["LIST_OF_NAMES"][i])

    if not trieSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Has Been Deleted From The Set!")
    end
  end
end

return TrieSymbolTableClient
