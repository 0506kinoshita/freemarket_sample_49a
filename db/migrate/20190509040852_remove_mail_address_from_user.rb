class RemoveMailAddressFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mail_address, :text
  end
end
