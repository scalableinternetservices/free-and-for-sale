class Api::V1::CategoryController < Api::V1::BaseController

  def show
    category = Category.find_by(name: params[:category])
    logger.debug "Input category #{params[:category]}"
    @products = Product.where(category_id: category.id)
    success_response 200, "All products from category pulled", products: @products
  end

end
