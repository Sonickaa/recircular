class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:name])
    @category.save!
  end

  def destroy
    @category.find(params[:id])
    @category.destroy
  end
end
