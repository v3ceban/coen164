class AddDetailsToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :address, :string
    add_column :carts, :phone_number, :string
    add_column :carts, :credit_card_number, :string
  end
end
