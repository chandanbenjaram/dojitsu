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
end
