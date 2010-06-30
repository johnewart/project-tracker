# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100629135143) do

  create_table "customers", :force => true do |t|
    t.string  "company"
    t.string  "address"
    t.string  "city",         :limit => 50
    t.string  "state",        :limit => 2
    t.integer "zipcode",      :limit => 8
    t.string  "email",        :limit => 50
    t.string  "contact_name", :limit => 50
    t.string  "telephone",    :limit => 14
    t.string  "fax",          :limit => 14
    t.binary  "image"
    t.string  "image_type"
  end

  create_table "invoice_templates", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.text   "body"
  end

  create_table "invoices", :force => true do |t|
    t.integer "project_id"
    t.date    "due"
    t.string  "state",      :limit => 1
    t.text    "comments"
    t.date    "sent"
  end

  create_table "invoices_tasks", :id => false, :force => true do |t|
    t.integer "invoice_id"
    t.integer "task_id"
  end

  create_table "payments", :force => true do |t|
    t.float   "amount"
    t.integer "customer_id"
    t.date    "received"
    t.text    "notes"
    t.integer "invoice_id"
  end

  create_table "project_notes", :force => true do |t|
    t.integer "project_id"
    t.string  "subject"
    t.text    "note"
  end

  create_table "projects", :force => true do |t|
    t.string  "name",           :limit => 50
    t.string  "state",          :limit => 1
    t.date    "due_date"
    t.date    "started"
    t.date    "completed"
    t.string  "code",           :limit => 20
    t.string  "purchase_order", :limit => 40
    t.integer "customer_id"
  end

  create_table "resources", :force => true do |t|
    t.string "name"
    t.string "filetype"
    t.string "filename"
    t.binary "data"
  end

  create_table "task_categories", :force => true do |t|
    t.string "name"
    t.float  "base_price"
    t.string "kind",       :limit => 1
  end

  create_table "tasks", :force => true do |t|
    t.float   "quantity"
    t.string  "name",             :limit => 50
    t.integer "task_category_id"
    t.boolean "billable"
    t.date    "due_date"
    t.float   "rate"
    t.date    "start_date"
    t.date    "completed_date"
    t.float   "markup",                         :default => 0.0
    t.float   "discount",                       :default => 0.0
    t.text    "notes"
    t.integer "project_id"
  end

  create_table "timers", :force => true do |t|
    t.integer  "task_id"
    t.datetime "start_time"
    t.datetime "stop_time"
  end

end
