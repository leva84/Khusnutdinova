# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_18_171157) do

  create_table "alignments", force: :cascade do |t|
    t.string "title"
    t.text "rule"
    t.integer "quantity"
    t.string "deck_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "photo", null: false
    t.string "shirt", null: false
    t.string "deck_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_comments_on_training_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.string "picture"
    t.text "text"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "training_id"
    t.index ["training_id"], name: "index_descriptions_on_training_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "alignment_id"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alignment_id"], name: "index_games_on_alignment_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "playing_cards", force: :cascade do |t|
    t.integer "game_id"
    t.integer "card_id", null: false
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_playing_cards_on_card_id"
    t.index ["game_id"], name: "index_playing_cards_on_game_id"
  end

  create_table "training_subscriptions", force: :cascade do |t|
    t.string "user_name"
    t.string "user_email"
    t.integer "training_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_training_subscriptions_on_training_id"
    t.index ["user_id"], name: "index_training_subscriptions_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover"
    t.string "address"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer "cost"
    t.integer "training_id"
    t.index ["training_id"], name: "index_trainings_on_training_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar"
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
