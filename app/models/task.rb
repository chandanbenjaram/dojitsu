class Task
  include Mongoid::Document
  
  #task validations
  validates_presence_of :name, :message => "Please add at least one task."  

  # name of task
  field :name, :type => Hash
  # score translates to Point on UI  
  field :score_by
  # score translates to Point on UI
  field :score
  # task status
  field :is_complete, :type => Integer, :default => 0
  
  embedded_in :challenge
end