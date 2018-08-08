class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  #accepts_nested_attributes_for :categories

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes)
      self.post_categories.build(category: category)
    end
  end

end
