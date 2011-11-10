class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  recursively_embeds_many
  
  #accepts_nested_attributes_for :point_types, :tasks
  
  #callback for assign value1 to value in point_date_type
  
  #attr_accessible :title, :description, :start_point, :end_point, :tasks, :task_comp, :social_challenge, :personal_challenge, :name
  
  validates_presence_of :title,  :message => "Please enter title!" 
       
  field :title, :type=>String
  field :description, :type=>String
  field :task_comp
  

  # RDBMS associations
  field :user_id, :type=>String

  
  # STARTING & ENDING POINTS
  embeds_one :start_point, :class_name => "PointType"
  embeds_one :end_point, :class_name => "PointType"
  
  # CHALLENGE TYPE SOCIAL & PERSONAL
  embeds_one :social_type, :class_name => "ChallengeType"
  embeds_one :personal_challenge, :class_name => "ChallengeType"
  
  # TASKS
  embeds_many :tasks
end                