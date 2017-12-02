defmodule Day2 do
  def checksum(text) do
    text
    |> split_lines
    |> parse_lines
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.reduce(&Kernel.+/2)
  end

  def checksum2(text) do
    text
    |> split_lines
    |> parse_lines
    |> Enum.map(fn(line) ->
      line
      |> combine(2)
      |> Enum.reduce(0, fn
        ([a, b], acc) when a > b and rem(a, b) == 0 -> div(a, b) + acc
        ([a, b], acc) when b > a and rem(b, a) == 0 -> div(b, a) + acc
        ([_, _], acc) -> acc
      end)
    end)
    |> Enum.reduce(&Kernel.+/2)
  end

  # combine/2 and do_combine/5 are from the awesome elixir-combination library:
  # https://github.com/seantanly/elixir-combination
  defp combine(collection, k) when is_integer(k) and k >= 0 do
    list = Enum.to_list(collection)
    list_length = Enum.count(list)
    if k > list_length do
      raise Enum.OutOfBoundsError
    else
      do_combine(list, list_length, k, [], [])
    end
  end

  defp do_combine(_list, _list_length, 0, _pick_acc, _acc), do: [[]]
  defp do_combine(list, _list_length, 1, _pick_acc, _acc), do: list |> Enum.map(&([&1])) # optimization
  defp do_combine(list, list_length, k, pick_acc, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t} end)
    |> Enum.take(list_length)
    |> Enum.reduce(acc, fn {x, sublist}, acc ->
      sublist_length = Enum.count(sublist)
      pick_acc_length = Enum.count(pick_acc)
      if k > pick_acc_length + 1 + sublist_length do
        acc # insufficient elements in sublist to generate new valid combinations
      else
        new_pick_acc = [x | pick_acc]
        new_pick_acc_length = pick_acc_length + 1
        case new_pick_acc_length do
          ^k -> [new_pick_acc | acc]
          _  -> do_combine(sublist, sublist_length, k, new_pick_acc, acc)
        end
      end
    end)
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
      |> String.split
      |> parse
    end)
  end

  defp split_lines(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.take_while(fn(line) -> String.length(line) > 0 end)
  end
end
