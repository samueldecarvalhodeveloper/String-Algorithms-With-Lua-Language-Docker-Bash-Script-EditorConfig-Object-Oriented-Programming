local texts = require("src.constants.texts")
local TernarySearchTreeSymbolTable =
  require("src.algorithms.ternary_search_tree_symbol_table.ternary_search_tree_symbol_table")

local TernarySearchTreeSymbolTableClient = {}

function TernarySearchTreeSymbolTableClient.execute()
  local TernarySearchTreeSymbolTable = TernarySearchTreeSymbolTable.new()

  for i = 1, #texts["LIST_OF_NAMES"] do
    TernarySearchTreeSymbolTable:add_key(texts["LIST_OF_NAMES"][i], texts["LIST_OF_NAMES"][i])

    if TernarySearchTreeSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Added To The Set!")
    end
  end

  print("")

  for i = 1, #texts["LIST_OF_NAMES"] do
    if TernarySearchTreeSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Is On The Set!")
    end
  end

  print("")

  for i = 1, #texts["LIST_OF_NAMES"] do
    TernarySearchTreeSymbolTable:delete_key(texts["LIST_OF_NAMES"][i])

    if not TernarySearchTreeSymbolTable:get_key(texts["LIST_OF_NAMES"][i]) then
      print("Value \"" .. texts["LIST_OF_NAMES"][i] .. "\" Has Been Deleted From The Set!")
    end
  end
end

return TernarySearchTreeSymbolTableClient
