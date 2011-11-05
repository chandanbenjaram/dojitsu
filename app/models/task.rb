class Task
  include Mongoid::Document
  
  # name of task
  field :name
  # score translates to Point on UI  
  field :score_by
  # score translates to Point on UI
  field :score
  
  embedded_in :challenge, :inverse_of => :tasks
end