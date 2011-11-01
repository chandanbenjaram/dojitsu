class List
  include Mongoid::Document
  field :name, :type => String
  field :age
  #embedded_in :challenge, :inverse_of => :as
end
