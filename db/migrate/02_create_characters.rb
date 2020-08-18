class CreateCharacters < ActiveRecord::Migration[6.0]

    def change
        create_table :characters do |t|
            t.string :name
            t.string :titles
            t.integer :houses_id
        end
    end
end