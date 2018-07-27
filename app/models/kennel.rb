class Kennel < ActiveRecord::Base
  has_many :greyhounds

  has_secure_password

end
