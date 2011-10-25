class PointNumberType < PointType
  include Mongoid::Document

  field :label, :type => string
  field :value, :type => string
end