class Api::V1::ProfileController < Api::V1::BaseController
  before_filter :authenticate_request!

  def show
    @shopping_cart_count = current_user.shopping_cart.products.count
    @store_count = current_user.store.products.count
    success_response 200, "Store and cart numbers pulled", user: {shopping_cart_number: @shopping_cart_count, store_number: @store_count }
  end

  def buy
    @shopping_cart = current_user.shopping_cart.products
    success_response 200, "Items in shopping cart pulled successfully", shopping_cart: @shopping_cart
  end

  def sell
    @store = current_user.store.products
    success_response 200, "Items in store pulled successfully", store: @store
  end

end
