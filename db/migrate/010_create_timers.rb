class CreateTimers < ActiveRecord::Migration
  def self.up
    create_table :timers do |t|
      # t.column :name, :string
      t.column 'task_id', :integer
      t.column 'start_time', :datetime
      t.column 'stop_time', :datetime
    end
  end

  def self.down
    drop_table :timers
  end
end
