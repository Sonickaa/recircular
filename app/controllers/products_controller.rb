class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def my_products
    @products = Product.where(user: current_user)
  end

  def user_products
    @products = Product.where(user: params[:user_id])
  end

  def new
    @product = Product.new()
  end

  def create
    params = profile_params
    params[:category] = Category.find(profile_params[:category])
    params[:user] = current_user
    new_product = Product.new(params)
    if new_product.save!
      redirect_to root_path, notice: "Product created"
    else
      redirect_to @product, notice: "Product creation failed"
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    new_product = Product.find(params[:id])
    new_product.update(params)
  end

private

def profile_params
  params.require(:product).permit(:category, :product_picture, :product_title, :product_condition, :product_description)
end

end
