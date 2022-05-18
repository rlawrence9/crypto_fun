defmodule CryptoApi.Exhchange_PricesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CryptoApi.Exhchange_Prices` context.
  """

  @doc """
  Generate a binance.
  """
  def binance_fixture(attrs \\ %{}) do
    {:ok, binance} =
      attrs
      |> Enum.into(%{
        coin_symbol: "some coin_symbol",
        current_price_data: [],
        date: ~D[2022-05-14],
        id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> CryptoApi.Exhchange_Prices.create_binance()

    binance
  end
end
