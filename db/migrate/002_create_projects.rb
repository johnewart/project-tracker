class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      # t.column :name, :string
      t.column "name", :string, :limit => 50
      t.column "state", :string, :limit => 1
      t.column "due_date", :date
      t.column "started", :date
      t.column "completed", :date
      t.column "code", :string, :limit => 20
      t.column "purchase_order", :string, :limit => 40
    end
  end

  def self.down
    drop_table :projects
  end
end
