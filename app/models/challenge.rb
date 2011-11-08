class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  # TASKS
  embeds_many :tasks
  embedded_in :invitee
  
  # STARTING & ENDING POINTS
  embeds_one :start_point, :class_name => "PointType"
  embeds_one :end_point, :class_name => "PointType"
  
  # CHALLENGE TYPE SOCIAL & PERSONAL
  embeds_one :social_challenge, :class_name => "ChallengeType"
  embeds_one :personal_challenge, :class_name => "ChallengeType"
  
  accepts_nested_attributes_for :point_types, :tasks
  attr_accessible :title, :description, :start_point, :end_point, :tasks, :task_comp, :social_challenge, :personal_challenge, :name, :task_attributes
  #callback for assign value1 to value in point_date_type
  before_save :assign_date_value
  
  validates_presence_of :title,  :message => "Please enter title!" 
       
  field :title, :type=>String
  field :description, :type=>String
  
  field :task_comp
  
  # RDBMS associations
  field :user_id, :type=>String
 
  private
  
  def assign_date_value
    logger.debug "pravin mishra"
  end

end                