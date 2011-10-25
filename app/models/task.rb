class Task
  include Mongoid::Document
  
  #attr_accessible :task_description, :task_point
  
  field :ch_task_type
  field :task_description, :type => String
  field :task_point
  embedded_in :challenge, :inverse_of => :tasks
end