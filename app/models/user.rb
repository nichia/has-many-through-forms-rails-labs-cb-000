class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def comments_count
    self.comments.count
  end
end
