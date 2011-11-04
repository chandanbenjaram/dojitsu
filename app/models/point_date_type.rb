class PointDateType < PointType
  include Mongoid::Document

  field :value, :type => date
  
  embedded_in :point_type
end