class User < ApplicationRecord
    has_many :listings
    has_many :products, through: :listings
    has_secure_password
  
    validates_uniqueness_of :username
    validates_presence_of :username
end  