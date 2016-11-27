class CreateJoinTableProductShoppingCart < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :shopping_carts do |t|
      # t.index [:product_id, :shopping_cart_id]
      # t.index [:shopping_cart_id, :product_id]
    end
  end
end
