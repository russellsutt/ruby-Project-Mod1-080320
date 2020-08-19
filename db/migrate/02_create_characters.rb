class CreateCharacters < ActiveRecord::Migration[6.0]

    def change
        create_table :characters do |t|
            t.string :name
            t.string :titles
            t.string :quote
            t.integer :house_id
        end
    end
end