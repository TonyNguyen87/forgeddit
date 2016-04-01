class RemoveFirstNameFromUsers < ActiveRecord::Migration
  def change
  	remove_column(User, :first_name)
  end
end
