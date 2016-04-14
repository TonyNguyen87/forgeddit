class User < ActiveRecord::Base
	validates_presence_of :password, :email
	validates :password, length: { minimum: 8 }
	validates :email, format: {
              with: /.+@.+\..+/,  message: "Must have an @ symbol and a period."
           	  }
    has_many :posts
    has_many :comments
    has_many :votes
    has_many :voted_posts, through: :votes, source: :post
    has_many :voted_comments, through: :votes, source: :comment
end
