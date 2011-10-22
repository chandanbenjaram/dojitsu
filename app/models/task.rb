class Task
  include Mongoid::Document
  #field :ch_task_type
  field :task_description, :type => String
  #field :task_point
  embedded_in :challenge
end