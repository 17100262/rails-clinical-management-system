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

ActiveRecord::Schema.define(version: 20180409132624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_subscribers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_subscribers_on_chat_id"
    t.index ["user_id"], name: "index_chat_subscribers_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinical_cases", force: :cascade do |t|
    t.date "date_of_birth"
    t.date "date_of_diagnostic"
    t.string "histology_type"
    t.integer "histology_level"
    t.string "estrogen_receptors"
    t.string "progesterone_receptors"
    t.string "her2"
    t.integer "ki67"
    t.text "estadiamento_clinico"
    t.string "neoadjuvant_systemic_treatment"
    t.date "surgery_date"
    t.string "surgery_type"
    t.string "sentinel_ganglion"
    t.string "axillary_emptying"
    t.string "adjuvant_chemotherapy"
    t.string "adjuvant_radiotherapy"
    t.integer "adjuvant_hormone_therapy_duration"
    t.string "adjuvant_hormone_therapy_treatment"
    t.date "date_of_ipo_discharge"
    t.date "first_follow_up_at_mgf"
    t.date "date_of_suspected_recurrence_local_recurrence"
    t.date "date_of_suspected_recurrence_collateral_breast_cancer"
    t.date "date_of_suspected_recurrence_distance_metastasis"
    t.date "date_of_suspected_recurrence_second_neoplasm"
    t.date "date_of_confirmation_of_recurrence"
    t.text "global_survival"
    t.text "Specif_breast_cancer_survival"
    t.text "last_contact_or_death"
    t.text "death_cause"
    t.text "satisfaction_survey_record_discharge_text"
    t.string "satisfaction_survey_record_discharge_file_name"
    t.string "satisfaction_survey_record_discharge_content_type"
    t.integer "satisfaction_survey_record_discharge_file_size"
    t.datetime "satisfaction_survey_record_discharge_updated_at"
    t.text "satisfaction_survey_record_first_text"
    t.string "satisfaction_survey_record_first_file_name"
    t.string "satisfaction_survey_record_first_content_type"
    t.integer "satisfaction_survey_record_first_file_size"
    t.datetime "satisfaction_survey_record_first_updated_at"
    t.text "satisfaction_survey_record_next_text"
    t.string "satisfaction_survey_record_next_file_name"
    t.string "satisfaction_survey_record_next_content_type"
    t.integer "satisfaction_survey_record_next_file_size"
    t.datetime "satisfaction_survey_record_next_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "unique_identifier"
    t.index ["user_id"], name: "index_clinical_cases_on_user_id"
  end

  create_table "imaging_controls", force: :cascade do |t|
    t.bigint "clinical_case_id"
    t.date "date_of_imaging"
    t.boolean "mammography"
    t.boolean "eco_breast"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinical_case_id"], name: "index_imaging_controls_on_clinical_case_id"
  end

  create_table "message_notifications", force: :cascade do |t|
    t.bigint "message_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_notifications_on_message_id"
    t.index ["user_id"], name: "index_message_notifications_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chat_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "gender"
    t.text "about_me"
    t.string "user_type"
    t.string "organization"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_picture_file_name"
    t.string "profile_picture_content_type"
    t.integer "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.boolean "approved", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_subscribers", "chats"
  add_foreign_key "chat_subscribers", "users"
  add_foreign_key "clinical_cases", "users"
  add_foreign_key "imaging_controls", "clinical_cases"
  add_foreign_key "message_notifications", "messages"
  add_foreign_key "message_notifications", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "notes", "users"
end
