class Task
  include Mongoid::Document
  field :name, type: Integer
  embedded_in :challenges
end