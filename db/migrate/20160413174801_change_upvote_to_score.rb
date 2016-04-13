class ChangeUpvoteToScore < ActiveRecord::Migration
  def change
  	add_column :votes, :score, :integer
  	remove_column :votes, :upvote, :boolean
  end
end
