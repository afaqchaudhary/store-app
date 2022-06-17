class RemoveStockFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :stock, :integer
  end
end
