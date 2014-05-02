class RemoveUniqueFromTokenIndex < ActiveRecord::Migration
  def change
    remove_index :users, :authentication_token
    add_index :users, :authentication_token
  end
end
