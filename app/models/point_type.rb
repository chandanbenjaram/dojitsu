class PointType
  include Mongoid::Document
  embedded_in :challenge, class_name: "Challenge", inverse_of: :startPoint

end