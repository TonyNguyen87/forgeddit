class Post < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :link_url
	belongs_to :user
	has_many :votes
	has_many :comments
	has_many :voters, through: :votes, source: :user
end
