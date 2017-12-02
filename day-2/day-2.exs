defmodule Day2 do
  def checksum(text) do
    text
    |> split_lines
    |> parse_lines
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.reduce(&Kernel.+/2)
  end

  defp parse(list) do
    Enum.map(list, fn(item) ->
      {val, _} = Integer.parse(item)
      val
    end)
  end

  defp parse_lines(list) do
    Enum.map(list, fn(line) ->
      line
      |> split
      |> parse
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
