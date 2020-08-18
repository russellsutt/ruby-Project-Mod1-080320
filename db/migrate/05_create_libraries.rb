class CreateLibraries < ActiveRecord::Migration[6.0]
    def change
        create_table :library do |t|
            t.string :view_family_members
            t.string :view_skills
            t.integer :house_id
        end
    end
end