class RemovePriceCurrencyFromProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :products, :price_currency, :string
  end
end
