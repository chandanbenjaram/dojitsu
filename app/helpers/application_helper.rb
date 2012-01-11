module ApplicationHelper

  # returns page title w/t fallback
  def title 
    base_title = "Dojitsu"
    if @title.nil?
      base_title
    else
      @title
    end
  end
  
 def isStandalone
   if current_user.fbauth == nil
     return true
   else 
     return false
   end
 end
  
end
