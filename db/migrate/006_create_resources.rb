class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      # t.column :name, :string
      t.column "name", :string
      t.column "filetype", :string
      t.column "filename", :string
      t.column "data", :binary
    end
  end

  def self.down
    drop_table :resources
  end
end
