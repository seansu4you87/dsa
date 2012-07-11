module ApplicationHelper
  def menu_items
    MenuItem.all.to_a
  end
  
  def recent_articles
    Article.all.to_a
  end
  
  def current_user
    puts "SEAN YU SAYS: "
    puts User.find(session[:user_id])
    if session[:user_id] == nil
      return nil
    end
    User.find(session[:user_id])
  end
  
end
