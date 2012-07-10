module CategoriesHelper
  
  def category_string_from_categories categories
    category_string = ""
    categories.each do |category|
      category_string += category.name
      category_string += ', '
    end
    category_string[0, category_string.size-2]
  end
end
