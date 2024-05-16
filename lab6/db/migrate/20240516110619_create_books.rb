class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title # This line adds a 'title' column to the 'books' table.
      # more columns:
      t.string :author
      t.integer :year
      t.text :description
    end
  end
end
