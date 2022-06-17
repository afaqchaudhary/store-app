class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
    add_index("products", "category_id")
  end
end
