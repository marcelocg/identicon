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
