class CreateCharacters < ActiveRecord::Migration[6.0]

    def change
        create_table :characters do |t|
            t.string :name
            t.string :title
            t.string :alias
            t.string :house
        end
    end
end