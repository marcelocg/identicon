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
  end


  @doc """
  Extracts the 3 first values from the list of hexadecimal values in the hash passed in the image struct
  """
  def pick_color(image) do
    %Identicon.Image{hex: [r, g, b | _tail]} = image

    [r, g, b]
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
