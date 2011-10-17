class Task
  include Mongoid::Document
  field :task_description, :type => String
  embedded_in :challenges
end