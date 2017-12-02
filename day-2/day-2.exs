defmodule Day2 do
  def checksum(text) do
    text
    |> split_lines
    |> Enum.map(&min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.reduce(&Kernel.+/2)
  end

  defp min_max(line) do
    line
    |> split
    |> parse
    |> Enum.min_max
  end

  defp parse(list) do
    Enum.map(list, fn(item) ->
      {val, _} = Integer.parse(item)
      val
    end)
  end

  defp split_lines(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.take_while(fn(line) -> String.length(line) > 0 end)
  end

  defp split(text) do
    String.split(text)
  end
end
