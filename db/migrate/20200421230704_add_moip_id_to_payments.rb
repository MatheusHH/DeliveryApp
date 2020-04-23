class AddMoipIdToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :moip_id, :string
  end
end
