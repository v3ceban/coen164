class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :condition
      t.decimal :price

      t.timestamps
    end
  end
end
