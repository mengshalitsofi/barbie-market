class CreateListings < ActiveRecord::Migration[6.1]
    def change
      create_table :listings do |t|
        t.integer :quantity
        t.integer :product_id
        t.integer :user_id

        t.timestamps
      end
    end
  end  