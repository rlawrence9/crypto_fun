defmodule CryptoEngine.Repo.Migrations.CreateBinancePricing do
  use Ecto.Migration

  def change do
    create table(:binance_pricing, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :current_price_data, :map
      add :date, :date
      add :current_symbols, :map

      timestamps()
    end
  end
end
