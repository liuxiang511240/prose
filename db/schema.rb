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

ActiveRecord::Schema.define(version: 20160524044531) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "face_file_name"
    t.string   "face_content_type"
    t.integer  "face_file_size"
    t.datetime "face_updated_at"
    t.string   "dynasty"
    t.string   "birthday"
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "outer_id"
    t.integer  "genre"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "outer_id"
    t.integer  "genre"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "updated_by"
    t.string   "author"
    t.integer  "author_id"
    t.integer  "last_comment_id"
    t.datetime "commented_at"
    t.integer  "comments_count",           default: 0
    t.integer  "likes_count",              default: 0
    t.integer  "comment_user_ids",         default: 0
    t.string   "last_commented_user_name"
    t.integer  "who_deleted"
    t.integer  "excellent",                default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poetries", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "updated_by"
    t.string   "author"
    t.integer  "author_id"
    t.integer  "last_comment_id"
    t.datetime "commented_at"
    t.integer  "comments_count",           default: 0
    t.integer  "likes_count",              default: 0
    t.integer  "comment_user_ids",         default: 0
    t.string   "last_commented_user_name"
    t.integer  "who_deleted"
    t.integer  "excellent",                default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proses", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "updated_by"
    t.string   "author"
    t.integer  "author_id"
    t.integer  "last_comment_id"
    t.datetime "commented_at"
    t.integer  "comments_count",           default: 0
    t.integer  "likes_count",              default: 0
    t.integer  "comment_user_ids",         default: 0
    t.string   "last_commented_user_name"
    t.integer  "who_deleted"
    t.integer  "excellent",                default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "updated_by"
    t.string   "author"
    t.integer  "author_id"
    t.integer  "last_comment_id"
    t.datetime "commented_at"
    t.integer  "comments_count",           default: 0
    t.integer  "likes_count",              default: 0
    t.integer  "comment_user_ids",         default: 0
    t.string   "last_commented_user_name"
    t.integer  "who_deleted"
    t.integer  "excellent",                default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "face_file_name"
    t.string   "face_content_type"
    t.integer  "face_file_size"
    t.datetime "face_updated_at"
    t.integer  "genre",                  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
