class CreateProjectNotes < ActiveRecord::Migration
  def self.up
    create_table :project_notes do |t|
      # t.column :name, :string
      t.column "project_id", :integer
      t.column "subject", :string
      t.column "note", :text
    end
  end

  def self.down
    drop_table :project_notes
  end
end
