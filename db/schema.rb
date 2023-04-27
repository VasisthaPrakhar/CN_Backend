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

ActiveRecord::Schema[7.0].define(version: 2022_07_11_193932) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "img"
    t.datetime "st_time"
    t.datetime "end_time"
    t.integer "fee"
    t.string "venue"
    t.string "etype"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regables", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "user_reg_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_regables_on_article_id"
    t.index ["user_reg_id"], name: "index_regables_on_user_reg_id"
  end

  create_table "taggables", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_taggables_on_article_id"
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user1s", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_role_id"
    t.index ["email"], name: "index_user1s_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user1s_on_reset_password_token", unique: true
    t.index ["user_role_id"], name: "index_user1s_on_user_role_id"
  end

  create_table "user2s", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_regs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "role"
    t.string "rtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "regables", "articles"
  add_foreign_key "regables", "user_regs"
  add_foreign_key "taggables", "articles"
  add_foreign_key "taggables", "tags"
  add_foreign_key "user1s", "user_roles"
end
