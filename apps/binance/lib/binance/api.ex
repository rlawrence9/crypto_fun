defmodule Binance.API do
  @moduledoc """
    the module responsible for making rest API calls to the Binance.US API.

    it is excluded from coveralls for coverage because the mocking test is covered
    in binance client.  However, it does still have tests associated with it.
  """

  # alias Binance.APIBehaviour

  @behaviour Binance.APIBehaviour
  def get_single_live_ticker_price(symbol) do
    "https://api.binance.us/api/v3/ticker/price?symbol=#{symbol}"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

  def get_all_live_ticker_prices() do
    "https://api.binance.us/api/v3/ticker/price"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
  end

end
