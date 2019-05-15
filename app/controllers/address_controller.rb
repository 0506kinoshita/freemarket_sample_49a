class AddressController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to '/credit_card/new'
    else
      render 'new'
    end
  end

  private

  def address_params
    params.require(:address).permit(:zip_code, :prefecture, :city, :block_number, :building_name, :homephone_number).merge(user_id: current_user.id)
  end
end