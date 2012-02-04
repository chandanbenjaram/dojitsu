class Task
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #task validations
  validates_presence_of :name, :message => "Please add at least one task."  
  validates_presence_of :score
  #validates_presence_of :score_by
  
  #CALLBACK TO UPDATE TIMESTAMPS
  after_update :updateTimeStamps
  
  # name of task
  field :name, :type => Hash
  # score translates to Point on UI  
  field :score_by
  # score translates to Point on UI
  field :score

  field :total, :default=>0
  # task status
  field :is_complete, :type => Integer, :default => 0
 
  embedded_in :challenge
  
  protected
  
  def updateTimeStamps
    logger.debug "Maisa"
    #logger.debug "#{self.id}"
    #logger.debug "#{@as}"
    #logger.debug "#{self.score}"
    #logger.debug "#{Challenge.params[:ch_id]}"
    
  end
  
end