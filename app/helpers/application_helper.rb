module ApplicationHelper
  def menu_items
    MenuItem.all.to_a
  end
  
  def recent_articles
    Article.all.to_a
  end
end
