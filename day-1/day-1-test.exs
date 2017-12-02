if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("day-1.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule Day1.Test do
  use ExUnit.Case

  test "1122 returns 3" do
    assert Day1.captcha("1122") == 3
  end

  test "1111 returns 4" do
    assert Day1.captcha("1111") == 4
  end

  test "1234 returns 0" do
    assert Day1.captcha("1234") == 0
  end

  test "91212129 returns 9" do
    assert Day1.captcha("91212129") == 9
  end
end
