class PointType
  include Mongoid::Document
  
  #attr_reader :st_value1
  
  field :st_value
  field :st_value1
  field :st_label
  
  field :ed_value
  field :ed_value1
  field :ed_label
  
  field :dateStart
  field :dateEnd
  
  embedded_in :challenge, :inverse_of => :point_types
  
  #embedded_in :challenge, class_name: "Challenge", inverse_of: :startPoint

end