class UsersController < ApplicationController

  def index
  end

  def show
    # user = User.find(params[:id])
  end

  def show_item
    @items = Item.where(user_id: current_user.id)
  end

end