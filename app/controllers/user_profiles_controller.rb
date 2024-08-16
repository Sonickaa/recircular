class UserProfilesController < ApplicationController
  def index
    @user_profiles = UserProfile.all
  end

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def new
    @user_profile = UserProfile.new
  end

  def create
    @user_profile = UserProfile.create(list_params)
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    @user_profile.update(list_params)
  end

  def destroy
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy
  end

  private

  def list_params
    params.require(:user_profile).permit(:first_name, :last_name, :user_name, :bio, :profile_picture, :address)
  end
end
