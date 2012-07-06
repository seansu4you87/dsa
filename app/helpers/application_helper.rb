module ApplicationHelper
  def menu_items
    MenuItem.all.to_a
  end
end
