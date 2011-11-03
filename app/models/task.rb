class Task
  include Mongoid::Document
  
  #attr_accessible :task_description, :task_point
  field :name  
  field :scored_by
  field :points
  embedded_in :challenge, :inverse_of => :tasks
end