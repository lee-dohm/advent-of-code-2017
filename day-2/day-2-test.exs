Code.load_file("day-2.exs", __DIR__)

ExUnit.start
ExUnit.configure trace: true

defmodule Day2.Test do
  use ExUnit.Case

  describe "first half solution" do
    test "checksum is valid" do
      Day2.checksum("5 1 9 5\n7 5 3\n2 4 6 8") == 18
    end
  end
end
