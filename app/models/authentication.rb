class Authentication
	include Mongoid::Document

  field :provider, type: String
  field :email, type: String
  field :first_name, type:String
  field :last_name, type: String
  field :name ,type: String
  field :token, type: String
  belongs_to :user

  scope :provider_with_uid, ->(p,uid){where(:provider => p, :user_id=> uid)}
end
