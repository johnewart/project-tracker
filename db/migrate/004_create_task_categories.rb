class CreateTaskCategories < ActiveRecord::Migration
  def self.up
    create_table :task_categories do |t|
      # t.column :name, :string
      t.column "name", :string
      t.column "base_price", :float
    end
  end

  def self.down
    drop_table :task_categories
  end
end
