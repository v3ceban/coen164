class AddCompletedAndProcessedToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :completed, :boolean
    add_column :carts, :processed_at, :datetime
  end
end
