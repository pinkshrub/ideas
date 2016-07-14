class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  def owner
  	User.find(self.user_id)
  end

  def total_likes
  	Like.where("post_id = ?", self.id).count
  end

  def likers
  	array_of_ids = Like.where("post_id = ?", self.id).uniq.pluck(:user_id)
  	puts '-1-1-1-1-1-'*10
  	puts array_of_ids
  	likers = []
  	array_of_ids.each do |id|
  		likers<< User.find(id)
  	end
  	return likers
  end
end
