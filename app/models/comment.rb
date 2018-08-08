class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }

  def user_name
    self.user.username
  end

  def post_title
    self.post.title
  end

  def post_content
    self.post.content
  end


end
