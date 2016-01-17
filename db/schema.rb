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

ActiveRecord::Schema.define(version: 20160115180009) do

  create_table "genes", force: :cascade do |t|
    t.string   "species"
    t.string   "number"
    t.string   "name"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pcrs", force: :cascade do |t|
    t.integer  "gene_id"
    t.string   "fragment_name"
    t.string   "product_size"
    t.string   "final_vector"
    t.string   "machine"
    t.string   "enzyme"
    t.integer  "break"
    t.integer  "break_t"
    t.integer  "denature"
    t.integer  "denature_t"
    t.integer  "annealing"
    t.integer  "annealing_t"
    t.integer  "elongation"
    t.integer  "elongation_t"
    t.integer  "polya"
    t.integer  "polya_t"
    t.integer  "cycles"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
