class Authentication
	include Mongoid::Document

  field :provider, type: String
  field :email, type: String
  field :user_id, type: ObjectId
  field :first_name, type:String
  field :last_name, type: String
  field :name ,type: String
  field :token, type: String
  belongs_to :user
end
