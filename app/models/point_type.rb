class PointType
  include Mongoid::Document
               
  # any common properties goes here
  # field :title
  TYPES = ['Date', 'Number']  
  
  embedded_in :challenge, :inverse_of => :start_point  
  embedded_in :challenge, :inverse_of => :end_point        
  
  def name_with_initial
     "a"
  end
end