class PointNumberType < PointType
  include Mongoid::Document
  
  # fields with defaults
  field :label, :type => String
  field :value, :type => Float, :default => 0
  
  # domain validations
  #validates_presence_of :value
end