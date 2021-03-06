class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def show_item
    @items = Item.where(user_id: current_user.id)
  end

  def show_profile
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to action: :show_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile)
  end
end

