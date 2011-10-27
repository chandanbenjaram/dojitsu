class PointType
  include Mongoid::Document
  
  field :dateStart
  field :dateEnd
  
  embedded_in :challenge, :inverse_of => :point_types
  
  #embedded_in :challenge, class_name: "Challenge", inverse_of: :startPoint

end