class Kennel < ActiveRecord::Base
  has_many :tweets

  has_secure_password

end
