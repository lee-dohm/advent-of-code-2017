if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("day-1.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule Day1.Test do
  use ExUnit.Case

  describe "first half solution" do
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

  describe "second half solution" do
    test "1212 returns 6" do
      assert Day1.captcha2("1212") == 6
    end

    test "1221 returns 0" do
      assert Day1.captcha2("1221") == 0
    end

    test "123425 returns 4" do
      assert Day1.captcha2("123425") == 4
    end

    test "123123 returns 12" do
      assert Day1.captcha2("123123") == 12
    end

    test "12131415 returns 4" do
      assert Day1.captcha2("12131415") == 4
    end
  end
end
