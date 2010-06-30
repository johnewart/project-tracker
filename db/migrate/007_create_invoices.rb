class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      # t.column :name, :string
      t.column "project_id", :integer
      t.column "due", :date
      t.column "state", :string, :limit => 1
      t.column "comments", :text
    end
    
    create_table :invoices_tasks, :id => false do |t|
      t.column "invoice_id", :integer
      t.column "task_id", :integer
    end
  end

  def self.down
    drop_table :invoices
  end
end
