class Task
  include Mongoid::Document
 
  embedded_in :challenge, :inverse_of => :tasks
  
  # name of task
  field :name
  # score translates to Point on UI  
  field :score_by
  # score translates to Point on UI
  field :score
 
end