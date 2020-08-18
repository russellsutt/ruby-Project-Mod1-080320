# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 8) do

  create_table "adventures", force: :cascade do |t|
    t.string "name"
    t.string "house_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "titles"
    t.integer "houses_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "coat_of_arms"
    t.string "words"
    t.string "founded"
    t.string "died_out"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "adventure_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.integer "house_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "house_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "sword_fighting"
    t.integer "archery"
    t.integer "horse_riding"
    t.integer "survival_skills"
    t.integer "fatigue"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "gender"
  end

end
