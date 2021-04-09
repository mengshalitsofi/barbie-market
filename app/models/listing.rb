class Listing < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :quantity


    scope(:quantity_search, ->(quantity) { self.where("quantity >= ?", quantity) }) 
end
  