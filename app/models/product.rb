class Product < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    has_many :listings
    has_many :users, through: :listings
    
    accepts_nested_attributes_for :listings

    # def listings_attributes=(attrs)
    #   attrs.values.each do |hash|
    #     if hash[:id]
    #       l = Listing.find_by(id: hash[:id])
    #       l.update(hash)
    #     else
    #       self.listings.build(hash)
    #     end
    #   end
    # end
  end
  