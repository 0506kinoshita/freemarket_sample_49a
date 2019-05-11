class AddressController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    Address.create(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:zip_code, :prefecture, :city, :block_number, :building_name, :homephone_number).merge(user_id: current_user.id)
  end
end