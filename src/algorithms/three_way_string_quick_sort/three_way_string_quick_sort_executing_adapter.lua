local ThreeWayQuickStringSortExecutingAdapter = {}

function ThreeWayQuickStringSortExecutingAdapter.execute(
  array_to_be_sorted,
  starting_character_index,
  ending_character_index,
  current_character_position
)
  local current_starting_character_index = starting_character_index
  local current_ending_character_index = ending_character_index
  local current_character_index = starting_character_index + 1
  local current_character_being_sorted

  if ending_character_index <= starting_character_index then
    return
  end

  current_character_being_sorted =
    string.byte(array_to_be_sorted[starting_character_index], current_character_position)

  while current_character_index <= current_ending_character_index do
    local charCode = string.byte(array_to_be_sorted[current_character_index], current_character_position)

    if charCode < current_character_being_sorted then
      array_to_be_sorted[current_starting_character_index], array_to_be_sorted[current_character_index] =
        array_to_be_sorted[current_character_index], array_to_be_sorted[current_starting_character_index]

      current_starting_character_index = current_starting_character_index + 1

      current_character_index = current_character_index + 1
    elseif charCode > current_character_being_sorted then
      array_to_be_sorted[current_character_index], array_to_be_sorted[current_ending_character_index] =
        array_to_be_sorted[current_ending_character_index], array_to_be_sorted[current_character_index]

      current_ending_character_index = current_ending_character_index - 1
    else
      current_character_index = current_character_index + 1
    end
  end

  ThreeWayQuickStringSortExecutingAdapter.execute(
    array_to_be_sorted,
    starting_character_index,
    current_starting_character_index - 1,
    current_character_position
  )

  if current_character_being_sorted ~= 0 then
    ThreeWayQuickStringSortExecutingAdapter.execute(
      array_to_be_sorted,
      current_starting_character_index,
      current_ending_character_index,
      current_character_position + 1
    )
  end

  ThreeWayQuickStringSortExecutingAdapter.execute(
    array_to_be_sorted,
    current_ending_character_index + 1,
    ending_character_index,
    current_character_position
  )
end

return ThreeWayQuickStringSortExecutingAdapter
