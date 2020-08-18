class CreateUserHouses < ActiveRecord::Migration[6.0]
    def change
        create_table :user_houses do |t|
           t.integer :user_id
           t.integer :house_id
        end
    end
end