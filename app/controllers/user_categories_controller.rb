class UserCategoriesController < ApplicationController

  def index
    @user_categories = UserCategory.all
  end

  # as a current user I want to add an existing category to my profile

  def create
    destroy
    @user_categories = params[:user_categories]
    @user_categories.each { |cat| UserCategory.create(user: current_user, category: cat) }
  end

  private

  def destroy
    @user_categories.destroy
  end
end
