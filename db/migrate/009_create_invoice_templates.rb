class CreateInvoiceTemplates < ActiveRecord::Migration
  def self.up
    create_table :invoice_templates do |t|
      # t.column :name, :string
      t.column "name", :string
      t.column "description", :text
      t.column "body", :text
    end
  end

  def self.down
    drop_table :invoice_templates
  end
end
