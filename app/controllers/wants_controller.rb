class WantsController < ApplicationController

  def index
    @wants = Want.all
  end

  def create
    @current_user = User.select(current_user)
    @wants = @current_user.wants.new(product_id: params[:product_id])
    @wants.save
  end

  def destroy
    @want = Want.find(params[:id])
    @want.destroy
  end
end
