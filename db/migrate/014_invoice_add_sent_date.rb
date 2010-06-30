class InvoiceAddSentDate < ActiveRecord::Migration
  def self.up
    add_column :invoices, :sent, :date
  end

  def self.down
  end
end
