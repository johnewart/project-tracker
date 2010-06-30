class AddInvoiceIdToPayments < ActiveRecord::Migration
  def self.up
    add_column :payments, :invoice_id, :integer
  end

  def self.down
    drop_column :payments, :invoice_id
  end
end
