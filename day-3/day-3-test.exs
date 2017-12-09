Code.load_file("day-3.exs", __DIR__)

ExUnit.start
ExUnit.configure trace: true

defmodule Day3.Test do
  use ExUnit.Case

  describe "first half solution" do
    test "next_ring with no input is the first ring" do
      assert Day3.next_ring() == {1, 1, 0}
    end

    test "next_ring with the first ring is ring 1" do
      assert Day3.next_ring({1, 1, 0}) == {2, 9, 1}
    end

    test "next_ring with ring 1 is ring 2" do
      assert Day3.next_ring({2, 9, 1}) == {10, 25, 2}
    end

    test "in ring 2, 10 is subrange 0 index 0" do
      assert Day3.get_subrange_indices({10, 25, 2}, 10) == {0, 0}
    end

    test "in ring 2, 23 is subrange 6 index 1" do
      assert Day3.get_subrange_indices({10, 25, 2}, 23) == {6, 1}
    end

    test "in ring 2, subrange 0 is 10..11" do
      assert Day3.get_subrange({10, 25, 2}, 0) == {10, 11}
    end

    test "in ring 2, subrange 6 is 22..23" do
      assert Day3.get_subrange({10, 25, 2}, 6) == {22, 23}
    end

    test "distance_to_side_center for ring 2 subrange 0 index 0 is 1" do
      assert Day3.distance_to_side_center(2, {0, 0}) == 1
    end

    test "distance_to_side_center for ring 2 subrange 5 index 1 is 2" do
      assert Day3.distance_to_side_center(2, {5, 1}) == 2
    end

    test "distance_to_center for ring 2 subrange 0 index 0 is 3" do
      assert Day3.distance_to_center(2, {0, 0}) == 3
    end

    test "find_ring(1) is ring 0" do
      assert Day3.find_ring(1) == {1, 1, 0}
    end

    test "find_ring(23) is ring 2" do
      assert Day3.find_ring(23) == {10, 25, 2}
    end
  end
end
