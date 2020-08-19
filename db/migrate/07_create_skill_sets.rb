class CreateSkillSets < ActiveRecord::Migration[6.0]
    def change
        create_table :skill_sets do |t|
            t.integer :sword_fighting,:default => 1
            t.integer :archery,:default => 1
            t.integer :horse_riding,:default => 1
            t.integer :survival_skills,:default => 1
            t.integer :fatigue,:default => 1
            t.integer :intelligence,:default => 1
        end
    end
end