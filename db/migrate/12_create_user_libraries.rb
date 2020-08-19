class CreateUserLibraries < ActiveRecord::Migration[6.0]
    def change
        create_table :user_libraries do |t|
            t.integer :user_id
            t.integer :library_id
        end
    end
end