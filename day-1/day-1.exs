defmodule Day1 do
  def captcha(text) do
    temp = String.split(text, "", trim: true)
    list = Enum.concat([temp, [List.first(temp)]])
    list = Enum.map(list, fn(n) ->
      {val, _} = Integer.parse(n)
      val
    end)

    list
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn
      [a, a] -> a
      [_, _] -> 0
    end)
    |> Enum.reduce(0, fn(a, b) -> a + b end)
  end
end
