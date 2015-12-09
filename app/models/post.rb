class Post < ActiveRecord::Base
  serialize :likearray, Array
  serialize :dislikearray, Array
  belongs_to :user
  has_many :comments
end
