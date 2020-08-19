class CreateSkillSets < ActiveRecord::Migration[6.0]
    def change
        create_table :skill_sets do |t|
            t.integer :intellegince
            t.integer :sword_fighting
            t.integer :archery
            t.integer :horse_riding
            t.integer :survival_skills
            t.integer :fatigue
        end
    end
end