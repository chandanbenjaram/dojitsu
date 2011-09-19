class Challenge
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  field :title
  validates_presence_of :title
  embeds_many :tasks
end