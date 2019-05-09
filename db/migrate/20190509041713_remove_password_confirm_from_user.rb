class RemovePasswordConfirmFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_confirm, :varchar
  end
end
