defmodule Day4 do
  def valid?(passphrase, func \\ &(&1)) do
    words = String.split(passphrase)
    unique_words = words
                   |> Enum.map(func)
                   |> Enum.uniq

    Enum.count(words) == Enum.count(unique_words)
  end
end
