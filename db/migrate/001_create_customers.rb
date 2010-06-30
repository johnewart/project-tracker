class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      # t.column :name, :string
      t.column "company", :string
      t.column "address", :string
      t.column "city", :string, :limit => 50
      t.column "state", :string, :limit => 2
      t.column "zipcode", :integer, :limit => 5
      t.column "email", :string, :limit => 50
      t.column "contact_name", :string, :limit => 50
      t.column "telephone", :string, :limit => 14
      t.column "fax", :string, :limit => 14
      t.column "image", :binary
      t.column "image_type", :string
    end
  end

  def self.down
    drop_table :customers
  end
end
