class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }
  
  #def category_attributes=(categories_attributes)
  #  category_attributes.values.each do |category_attribute|
  #    category = Category.find_or_create_by(category_attribute)
  #    self.post_categories.build(category: category)
  #  end
  #end

  def comments_count
    self.comments.count
  end

  def users_count
    self.users.uniq.count
  end

  def categories_count
    self.categories.count
  end
end
