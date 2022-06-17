class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :category_id
      t.decimal :price
      t.integer :user_id 

      t.timestamps
    end
  end
end
