class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :total_win
      t.integer :total_loss
      t.integer :total_profit
    end
  end
end
