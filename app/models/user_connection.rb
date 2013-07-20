class UserConnection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: ObjectId
  field :target_id, type: String

  belongs_to :user
  has_one :usermail
end
