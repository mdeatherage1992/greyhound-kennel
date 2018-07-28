class Kennel < ActiveRecord::Base
  has_many :greyhounds

  has_secure_password

  def slug
  name.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
  Kennel.all.find{|kennel| kennel.slug == slug}
end

end
