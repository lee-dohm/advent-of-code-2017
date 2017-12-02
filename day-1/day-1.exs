defmodule Day1 do
  def captcha(text) do
    temp = split(text)
    list = Enum.concat([temp, [List.first(temp)]])

    list
    |> Enum.chunk_every(2, 1, :discard)
    |> sum
  end

  def captcha2(text) do
    list = split(text)

    length = Enum.count(list)
    distance = div(length, 2)

    list
    |> chunk(distance, length)
    |> sum
  end

  defp chunk(list, distance, length) do
    list
    |> Enum.with_index
    |> Enum.map(fn({val, index}) ->
      [val, Enum.at(list, Integer.mod(index + distance, length))]
    end)
  end

  defp split(text) do
    text
    |> String.split("", trim: true)
    |> Enum.map(fn(n) ->
      {val, _} = Integer.parse(n)
      val
    end)
  end

  defp sum(list) do
    list
    |> Enum.map(fn
      [a, a] -> a
      [_, _] -> 0
    end)
    |> Enum.reduce(0, fn(a, b) -> a + b end)
  end
end
