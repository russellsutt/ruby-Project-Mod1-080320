class CreateUserAdventures < ActiveRecord::Migration[6.0]
    def change
        create_table :user_adventures do |t|
            t.integer :user_id
            t.integer :adventure_id
        end
    end
end