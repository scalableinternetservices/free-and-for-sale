class Api::V1::UserController < Api::V1::BaseController
  before_filter :authenticate_request!

  def show
    @shopping_cart = current_user.shopping_cart.products
    @store = current_user.store.products
    success_response 200, "Product added successfully", user: {shopping_cart: @shopping_cart, store: @store}
  end

end