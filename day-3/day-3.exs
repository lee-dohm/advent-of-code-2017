defmodule Day3 do
  @moduledoc """
  The way the spiral memory is designed:

  * Each "ring" is 8 cells larger than the last
  * A ring contains a contiguous range of integers, so it can be expressed as `x..y`
  * A ring has four sides, that contain a list of integers

  To determine the Manhattan distance, we need to:

  * Find the ring that contains the target number
      * Generate the range of each ring as `old_max + 1 .. old_max + 8 * n`
      * Return the ring number and the range extents
  * Find the side of that ring that contains the target number
      * Divide the range into eight sub-ranges, each `n` long
      * Each sub-range is `current_min + sub_range_number * n .. currennt_min + sub_range_number * n + n`
      * `(target - current_min) div n` gives us the sub-range number
      * `(target - current_min) mod n` gives us the index within the sub-range
  * Count from that target number's cell to the center of that side
      * If the sub-range number is even, `n - index - 1` is the number of steps to the center
      * If the sub-range number is odd, `n`
  * Count the number of rings minus the centermost ring
      * `n`
  """

  def distance_to_center(ring, subrange_pos) do
    distance_to_side_center(ring, subrange_pos) + ring
  end

  def distance_to_side_center(ring, {subrange, index}) when rem(subrange, 2) == 0 do
    ring - index - 1
  end

  def distance_to_side_center(_ring, {_subrange, index}) do
    index + 1
  end

  def find_ring(1), do: {1, 1, 0}

  def find_ring(target) do
    [ring] = Stream.iterate({1, 1, 0}, &next_ring/1)
             |> Enum.take_while(fn({min, _, _}) -> min < target end)
             |> Enum.slice(-1..-1)

    ring
  end

  def get_subrange({min, _, n}, index) do
    {min + index * n, min + (index + 1) * n - 1}
  end

  def get_subrange_indices({min, _, n}, target) do
    {div(target - min, n), rem(target - min, n)}
  end

  def next_ring(last_ring \\ nil)
  def next_ring(nil), do: {1, 1, 0}
  def next_ring({_, old_max, index}) do
    {old_max + 1, old_max + 8 * (index + 1), index + 1}
  end
end
