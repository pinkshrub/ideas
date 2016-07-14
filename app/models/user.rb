class User < ActiveRecord::Base

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :password, confirmation: true
	validates :password_confirmation, presence:true	
	validates :password, length: { minimum: 8}
	validates :name, :alias, :email, :password, presence: true
	validates :email, format: { with: email_regex}
	validates :email, :alias, uniqueness: true
	has_secure_password

	has_many :posts
	has_many :likes

	def total_posts
		Post.where("user_id = ?",self.id).count
	end

	def total_likes
		Like.where("user_id = ?",self.id).count
	end
end
