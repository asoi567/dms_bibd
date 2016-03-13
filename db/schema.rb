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

ActiveRecord::Schema.define(version: 20160313090313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dmsf_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "kind",              default: 0
    t.integer  "analytic_type1_id"
    t.integer  "analytic_type2_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "dmsf_accounts", ["analytic_type1_id"], name: "index_dmsf_accounts_on_analytic_type1_id", using: :btree
  add_index "dmsf_accounts", ["analytic_type2_id"], name: "index_dmsf_accounts_on_analytic_type2_id", using: :btree

  create_table "dmsf_analytic_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dmsf_analytics", force: :cascade do |t|
    t.string   "name"
    t.integer  "analytic_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "dmsf_analytics", ["analytic_type_id"], name: "index_dmsf_analytics_on_analytic_type_id", using: :btree

  create_table "dmsf_document_definitions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dmsf_standard_operations", force: :cascade do |t|
    t.string   "name"
    t.integer  "debits_account_id"
    t.integer  "credits_account_id"
    t.integer  "document_definition_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "dmsf_standard_operations", ["credits_account_id"], name: "index_dmsf_standard_operations_on_credits_account_id", using: :btree
  add_index "dmsf_standard_operations", ["debits_account_id"], name: "index_dmsf_standard_operations_on_debits_account_id", using: :btree
  add_index "dmsf_standard_operations", ["document_definition_id"], name: "index_dmsf_standard_operations_on_document_definition_id", using: :btree

  add_foreign_key "dmsf_accounts", "dmsf_analytic_types", column: "analytic_type1_id"
  add_foreign_key "dmsf_accounts", "dmsf_analytic_types", column: "analytic_type2_id"
  add_foreign_key "dmsf_analytics", "dmsf_analytic_types", column: "analytic_type_id"
  add_foreign_key "dmsf_standard_operations", "dmsf_accounts", column: "credits_account_id"
  add_foreign_key "dmsf_standard_operations", "dmsf_accounts", column: "debits_account_id"
  add_foreign_key "dmsf_standard_operations", "dmsf_document_definitions", column: "document_definition_id"
end
