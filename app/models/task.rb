class Task
  include Mongoid::Document
  field :description, :type=>String
  embedded_in :challenges
end