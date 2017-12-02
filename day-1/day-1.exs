defmodule Day1 do
  def captcha(text) do
    temp = split(text)    
    list = Enum.concat([temp, [List.first(temp)]])

    list
    |> Enum.chunk_every(2, 1, :discard)
    |> sum
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
