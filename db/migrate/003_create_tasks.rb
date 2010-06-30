class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      # t.column :name, :string
      t.column "quantity", :float
      t.column "name", :string, :limit => 50
      t.column "task_category_id", :integer
      t.column "billable", :boolean
      t.column "due_date", :date
      t.column "rate", :float
      t.column "start_date", :date
      t.column "completed_date", :date
      t.column "markup", :float, :default => 0
      t.column "discount", :float, :default => 0
      t.column "notes", :text
      t.column "project_id", :integer
    end
  end

  def self.down
    drop_table :tasks
  end
end
