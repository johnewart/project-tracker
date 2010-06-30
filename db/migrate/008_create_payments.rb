class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.column "amount", :float
      t.column "customer_id", :integer
      t.column "received", :date
      t.column "notes", :text
    end
  end

  def self.down
    drop_table :payments
  end
end
