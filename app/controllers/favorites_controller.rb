class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    @current_user = User.select(current_user)
    @favorite = current_user.wants.new(product_id: params[:product_id])
    @favorite.save
  end

  def destroy
    @favorite.find(params[:id])
    @favorite.destroy
  end

end
