class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  attr_accessible :title, :description, :dateStart, :dateEnd, :discipline, :participants, :cha_type, :scoring_method_soc, :scoring_method_per, :will_participating, :no_of_winners  
  attr_writer :current_step
  
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

  validates_presence_of :title,  :if => lambda { |o| o.current_step == "first_challenge_form" } #:message => "Please enter title!" 
  
  def user
    User.find(user_id)
  end
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[first_challenge_form second_challenge_form]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
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