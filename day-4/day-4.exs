defmodule Day4 do
  def valid?(passphrase) do
    words = String.split(passphrase)
    unique_words = Enum.uniq(words)

    Enum.count(words) == Enum.count(unique_words)
  end

  def anagram_valid?(passphrase) do
    words = String.split(passphrase)
    sorted_words = Enum.map(words, fn(word) ->
      word
      |> String.graphemes
      |> Enum.sort
      |> Enum.join
    end)
    unique_words = Enum.uniq(sorted_words)

    Enum.count(words) == Enum.count(unique_words)
  end
end
