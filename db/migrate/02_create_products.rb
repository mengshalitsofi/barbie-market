class CreateProducts < ActiveRecord::Migration[4.2]
    def change
      create_table :products do |t|
        t.string :name
        t.float :price
      end
    end
  end
  