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

ActiveRecord::Schema.define(version: 2019_01_06_002736) do

  create_table "events", force: :cascade do |t|
    t.string "uuid"
    t.integer "transition_id"
    t.integer "status_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_events_on_status_id"
    t.index ["ticket_id"], name: "index_events_on_ticket_id"
    t.index ["transition_id"], name: "index_events_on_transition_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "uuid"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "uuid"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_groups", force: :cascade do |t|
    t.integer "group_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_project_groups_on_group_id"
    t.index ["project_id"], name: "index_project_groups_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "uuid"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "uuid"
    t.string "summary"
    t.text "description"
    t.integer "creator_id"
    t.integer "assignee_id"
    t.integer "workflow_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_tickets_on_assignee_id"
    t.index ["creator_id"], name: "index_tickets_on_creator_id"
    t.index ["project_id"], name: "index_tickets_on_project_id"
    t.index ["workflow_id"], name: "index_tickets_on_workflow_id"
  end

  create_table "transitions", force: :cascade do |t|
    t.string "uuid"
    t.integer "start_id"
    t.integer "end_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_id"], name: "index_transitions_on_end_id"
    t.index ["start_id"], name: "index_transitions_on_start_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.boolean "admin"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_users_on_person_id"
  end

  create_table "workflow_transitions", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "transition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transition_id"], name: "index_workflow_transitions_on_transition_id"
    t.index ["workflow_id"], name: "index_workflow_transitions_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
