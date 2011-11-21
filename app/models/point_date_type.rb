
class PointDateType < PointType
  include Mongoid::Document
  
  # fields with defaults  
  # defaults to Time.now
  field :value, :type => Date, :default => Time.now
 
  # domain validations
  #validates_presence_of :value
end