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

ActiveRecord::Schema.define(version: 20180619135737) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "audiences", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audiences_cities", id: false, force: :cascade do |t|
    t.integer "audience_id", null: false
    t.integer "city_id", null: false
  end

  create_table "audiences_profession_statuses", id: false, force: :cascade do |t|
    t.integer "audience_id", null: false
    t.integer "profession_status_id", null: false
  end

  create_table "audiences_specializations", id: false, force: :cascade do |t|
    t.integer "audience_id", null: false
    t.integer "specialization_id", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "title"
    t.string "region"
    t.integer "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "title"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.integer "city_id"
    t.integer "profession_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_doctors_on_city_id"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["profession_status_id"], name: "index_doctors_on_profession_status_id"
  end

  create_table "doctors_specializations", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "specialization_id"
    t.index ["doctor_id"], name: "index_doctors_specializations_on_doctor_id"
    t.index ["specialization_id"], name: "index_doctors_specializations_on_specialization_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "profession_statuses", force: :cascade do |t|
    t.string "title"
  end

  create_table "specializations", force: :cascade do |t|
    t.string "title"
  end

end
