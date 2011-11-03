class PointType
  include Mongoid::Document
  
  #attr_reader :st_value1
  
  embedded_in :challenge, :inverse_of => :point_types
  
  #embedded_in :challenge, class_name: "Challenge", inverse_of: :startPoint

end