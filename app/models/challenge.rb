class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
   
  #attr_accessible :title, :description, :dateStart, :dateEnd, :task_comp,:task_comp, :soc_who_win, :soc_how_many_winner, :soc_will_participating, :soc_add_me, :per_who_win, :task_description, :task_point
  attr_reader :dateStart1, :dateStart21, :dateStart22, :dateEnd1, :dateEnd21, :dateEnd22
  accepts_nested_attributes_for :point_types
  validates_presence_of :title,  :message => "Please enter title!" 
  
  field :title, :type=>String
  field :description, :type=>String
  
  field :ch_task_type, :type => Array, :default => []
  field :task_description, :type => Array, :default => []
  field :task_point, :type => Array, :default => []
  
  #field :startPoint, :type => PointType
  #field :endPoint, :type => PointType
  embeds_one :startPoint, :class_name =>"PointType", :inverse_of => :challenge
  embeds_one :endPoint, :class_name =>"PointType", :inverse_of => :challenge

  
  field :task_comp
  field :soc_who_win
  field :soc_how_many_winner
  field :soc_will_participating
  field :soc_add_me
  field :per_who_win
  
  field :save_as_tempalate
  field :discipline, :type=>String
  field :participants, :type=>String
  field :rules, :type=>Array    
  field :goals, :type=>Array    
  
  #field :per_how_many_winner
  #field :per_participants
  #field :cha_type, :type=>String
  #field :scoring_method_soc, :type=>String
  #field :scoring_method_per, :type=>String
  #field :will_participating, :type=>String
  #field :no_of_winners, :type=>String
  #field :add_myself, :type=>String
  
  field :user_id, :type=>String

  embeds_many :point_types
  
end                