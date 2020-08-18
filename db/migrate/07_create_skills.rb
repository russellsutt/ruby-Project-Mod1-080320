class CreateSkills < ActiveRecord::Migration[6.0]
    def change
        create_table :skills do |t|
            t.integer :sword_fighting
            t.integer :archery
            t.integer :horde_riding
            t.integer :survival_skills
            t.integer :Fatigue
        end
    end
end