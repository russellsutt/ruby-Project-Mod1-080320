class CreateAdventures < ActiveRecord::Migration[6.0]
    def change
        create_table :adventures do |t|
            t.string :name
            t.integer :house_id
        end
    end
end