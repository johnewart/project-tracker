class AddTaskCategoryKind < ActiveRecord::Migration
  def self.up
    add_column :task_categories, :kind, :char
  end

  def self.down
  end
end
