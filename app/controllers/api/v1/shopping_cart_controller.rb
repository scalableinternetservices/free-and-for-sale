class Api::V1::ShoppingCartController < Api::V1::BaseController
  before_filter :authenticate_request!, :except => [:index]

  def add_to_cart
    @product = Product.where(id: params[:product_id]).first
    @product.shopping_carts << current_user.shopping_cart
    success_response 200, "Product added successfully", product: @product
  end

end
