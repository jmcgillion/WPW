class Category < ActiveRecord::Base
	belongs_to :user
	 validates  :name, :presence => true
	has_many :notes, :dependent => :destroy
		has_ancestry

  def self.nested_categories(categories)
    categories.map do |category|
      categories_json = {text: category.name }
      categories_json.merge!(nodes: nested_categories(category.children)) if category.children?

      categories_json
    end
  end
end
