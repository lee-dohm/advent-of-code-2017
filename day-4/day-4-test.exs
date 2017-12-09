Code.load_file("day-4.exs", __DIR__)

ExUnit.start
ExUnit.configure trace: true

defmodule Day4.Test do
  use ExUnit.Case

  describe "Part one solution" do
    test "'aa bb cc dd ee' is valid" do
      assert Day4.valid?("aa bb cc dd ee")
    end

    test "'aa bb cc dd aa' is not valid" do
      refute Day4.valid?("aa bb cc dd aa")
    end

    test "'aa bb cc dd aaa' is valid" do
      assert Day4.valid?("aa bb cc dd aaa")
    end
  end
end
