class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
                         
  # puts tree model on challenges
  recursively_embeds_many
  
  accepts_nested_attributes_for :tasks
  
  #callback for assign value1 to value in point_date_type
  
  #attr_accessible :title, :description, :start_point, :end_point, :tasks, :task_comp, :social_challenge, :personal_challenge, :name
  #attr_reader :ch_st_date, :ch_ed_date
  
  #validation for challenge creation
  #validates_associated :start_point
  #validates_presence_of :title,  :message => "Please enter title!"
  #validates_length_of :title, :within => 1..30, :too_long => "Title must be between one and 30 characters", :too_short => "Title must be between one and 30 characters"
  #validates_presence_of :ch_st_date, :message => "Date or Number must be selected", :allow_nil => true
  #validates_presence_of :ch_ed_date, :message => "Date or Number must be selected"
  
  
  field :title, :type=>String
  field :description, :type=>String
  field :task_comp
  # challenge status
  field :is_complete, :default => 0
  
  #validates :title, :presence => true

  # RDBMS associations
  field :user_id, :type=>String

  
  # STARTING & ENDING POINTS
  embeds_one :start_point, :class_name => "PointType"
  embeds_one :end_point, :class_name => "PointType"
  
  # CHALLENGE TYPE SOCIAL & PERSONAL
  embeds_one :social_type, :class_name => "ChallengeType"
  embeds_one :personal_type, :class_name => "ChallengeType"
  
  # TASKS
  embeds_many :tasks
end                