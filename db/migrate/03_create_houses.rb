class CreateHouses < ActiveRecord::Migration[6.0]
    def change
        create_table :houses do |t|
            t.string :name
            t.string :region
            t.string :coat_of_arms
            t.string :words
            t.string :founded
            t.string :died_out            
        end
    end
end