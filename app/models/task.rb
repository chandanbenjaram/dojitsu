class Task
  include Mongoid::Document
  # score translates to Point on UI  
  field :score_by 
  # score translates to Point on UI
  field :score
  field :name
  
  embedded_in :challenge, :inverse_of => :tasks
end