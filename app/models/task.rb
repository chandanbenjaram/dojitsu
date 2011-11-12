class Task
  include Mongoid::Document
  
  # name of task
  field :name, :type => Hash
  # score translates to Point on UI  
  field :score_by
  # score translates to Point on UI
  field :score
  # task status
  field :is_complete, :default => 0
  
  embedded_in :challenge
end