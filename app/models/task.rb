class Task
  include Mongoid::Document
  
  #attr_accessible :task_description, :task_point
  #embedded_in :challenge, :inverse_of => :tasks
end