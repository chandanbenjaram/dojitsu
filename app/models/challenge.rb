class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  accepts_nested_attributes_for :point_types, :tasks
  
  #callback for assign value1 to value in point_date_type
  before_save :assign_date_value
  
  attr_accessible :title, :description, :start_point, :end_point, :tasks, :social_challenge, :personal_challenge, :name
  
  validates_presence_of :title,  :message => "Please enter title!" 
       
  field :title, :type=>String
  field :description, :type=>String
  
  field :task_comp
  

  # RDBMS associations
  field :user_id, :type=>String

  # TASKS
  embeds_many :tasks
  
  # STARTING & ENDING POINTS
  embeds_one :start_point, :class_name => "PointType"
  embeds_one :end_point, :class_name => "PointType"
  
  # CHALLENGE TYPE SOCIAL & PERSONAL
  embeds_one :social_challenge, :class_name => "ChallengeType"
  embeds_one :personal_challenge, :class_name => "ChallengeType"
 
  private
  
  def assign_date_value
    logger.debug "pravin mishra"
  end

end                