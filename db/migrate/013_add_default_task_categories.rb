class AddDefaultTaskCategories < ActiveRecord::Migration
  def self.up
    TaskCategory.create(:name => "Development", :base_price => 150.00, :kind => 'T')
    TaskCategory.create(:name => "System Administration", :base_price => 150.00, :kind => 'T')
  end

  def self.down
  end
end
