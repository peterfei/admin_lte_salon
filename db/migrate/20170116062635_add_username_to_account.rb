class AddUsernameToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :username, :string
  end
end
