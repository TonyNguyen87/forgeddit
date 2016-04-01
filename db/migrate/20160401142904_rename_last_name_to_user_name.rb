class RenameLastNameToUserName < ActiveRecord::Migration
  def change
  	rename_column(User, :last_name, :username)
  end
end
