class UserConnection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :target_id, type: String

  belongs_to :user
  has_one :usermail
end
