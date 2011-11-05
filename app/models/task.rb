class Task
  include Mongoid::Document
  
  #attr_accessible :task_description, :task_point
  field :task_description  
  field :task_point
  field :ch_task_type
  embedded_in :challenge, :inverse_of => :tasks
end