class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #attr_accessible :title, :description, :dateStart, :dateEnd, :discipline, :participants
  
  before_save :ensure_start_date
  before_save :ensure_end_date

  field :title, :type=>String
  field :description, :type=>String

  field :dateStart
  field :dateStart1
  field :dateStart2
  field :dateStart3
  field :dateEnd
  field :dateEnd1
  field :dateEnd2
  field :discipline, :type=>String
  field :participants, :type=>String
  field :rules, :type=>Array    
  field :goals, :type=>Array    
  
  field :cha_type, :type=>String
  field :scoring_method_soc, :type=>String
  field :scoring_method_per, :type=>String
  field :will_participating, :type=>String
  field :no_of_winners, :type=>String
  field :user_id, :type=>String

  embeds_many :tasks  

  validates_presence_of :title, :message => "Please enter title!" 
  
  def user
    User.find(user_id)
  end  
  
  private
  def ensure_start_date
    if dateStart.blank?
      if !dateStart1.blank?
        self.dateStart = dateStart1
      elsif !dateStart3.blank?
        self.dateStart = dateStart3
      else
        self.dateStart = dateStart2
      end
    end
  end
  
  def ensure_end_date
    if dateEnd.blank?
      if !dateEnd1.blank?
        self.dateEnd = dateEnd1
      else
        self.dateEnd = dateEnd2
      end
    end
  end
  
end                