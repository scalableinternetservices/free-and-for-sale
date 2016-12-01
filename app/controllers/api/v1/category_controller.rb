class Api::V1::CategoryController < Api::V1::BaseController

  def show
    category = Category.find_by(name: params[:category])
    @products = Rails.cache.fetch("/category/#{category.id}-#{category.updated_at}", :expires_in => 12.hours) do
      Product.where(category_id: category.id)
    end
    success_response 200, "All products from category pulled", products: @products
  end

end
