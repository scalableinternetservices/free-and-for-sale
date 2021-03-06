class Api::V1::ProductController < Api::V1::BaseController
  before_filter :authenticate_request!, :except => [:index]

  def index
    @products = JSON.parse(Product.all.to_json( :include => {:user => {:only => :email } } ))
    success_response 200, "All products pulled.", products: @products
  end

  def create
    base_64_image = params[:image]
    blob = Base64.decode64(base_64_image)
    decoded_image = MiniMagick::Image.read(blob)
    image_file = File.open(decoded_image.path)
    @product = Product.new(product_params.merge(:image=> image_file))
    @category = Category.find_by(name: params[:category])
    @product.category = @category
    @product.store = current_user.store
    @product.user = current_user
    if @product.save
      @product.image_url = @product.image.url
      @product.save
      success_response 201, "Product created successfully", product: @product
    else
      error_response 422, "Product could not be created", @product.errors.full_messages
    end
  end

  private

  def product_params
    params.permit(:name, :description, :price, :image)
  end

end
