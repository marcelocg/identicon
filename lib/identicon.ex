defmodule Identicon do
  @moduledoc """
  Main module for the Identicon application.
  """

  @doc """
  Main funcion that will drive our identicon generation pipeline execution
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  @doc """
  Creates a grid using the values from then list of hexadecimal values from the hash
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> mirror_row
  end

  @doc """
  Mirrors a 3 element list

  ## Examples
      iex> Identicon.mirror_row([145, 46, 200])
      [145, 46, 200, 46, 145]

  """
  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  @doc """
  Extracts the 3 first values from the list of hexadecimal values in the hash passed in the image struct
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do

    %Identicon.Image{image | color: {r, g, b}}

  end

  @doc """
  Hashes the input string so we can get a consistent representation of the input

  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
