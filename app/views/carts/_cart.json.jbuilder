json.extract! cart, :id, :quantity, :product_id, :category_id, :price, :created_at, :updated_at
json.url cart_url(cart, format: :json)
