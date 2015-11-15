# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151115234909) do

  create_table "comments", force: :cascade do |t|
    t.text     "texto"
    t.boolean  "approved"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["proposal_id"], name: "index_comments_on_proposal_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "score"
  end

  add_index "likes", ["comment_id"], name: "index_likes_on_comment_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "proplikes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "proplikes", ["proposal_id"], name: "index_proplikes_on_proposal_id"
  add_index "proplikes", ["user_id"], name: "index_proplikes_on_user_id"

  create_table "proposals", force: :cascade do |t|
    t.text     "texto"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "titulo"
  end

  add_index "proposals", ["user_id"], name: "index_proposals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "recover_digest"
    t.string   "email"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "region"
    t.string   "city"
    t.string   "nivel_acceso"
    t.string   "user_token"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
