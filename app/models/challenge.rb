class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :title, :type=>String
  field :user_id, :type=>String

  embeds_many :tasks  


  validates_presence_of :title
  def user
    User.find(user_id)
  end              
  
end