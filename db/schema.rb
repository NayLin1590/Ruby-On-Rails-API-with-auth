# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_21_052719) do

  create_table "applicants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "profilePhoto"
    t.timestamp "dob"
    t.string "phone_no1", null: false
    t.string "phone_no2"
    t.string "email"
    t.string "currentAddress", null: false
    t.string "hometownAddress"
    t.string "bachelorUni"
    t.string "bachelorYear"
    t.string "bachelorDegree"
    t.string "masterUni"
    t.string "masterYear"
    t.string "masterDegree"
    t.string "diplomaName"
    t.string "certificate"
    t.text "programming"
    t.text "english"
    t.text "japanese"
    t.text "otherLang"
    t.text "internshipInfo"
    t.text "jobExperience"
    t.integer "totalExperience"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
