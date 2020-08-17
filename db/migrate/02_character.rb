class Characters < ActiveRecord::Migration[6.0]

    def change
        create_table :characters do |t|
            t.string :name
            t.string :title
            t.string :house
        end
    end
end