class AddProjectCustomerId < ActiveRecord::Migration
  def self.up
    add_column :projects, :customer_id, :integer
  end

  def self.down
  end
end
