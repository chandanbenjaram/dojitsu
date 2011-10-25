
class PointDateType < PointType
  include Mongoid::Document

  field :value, :type => date
end