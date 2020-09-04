class AddColumnOwnTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :own_times, :task_flg, :integer, default: 0
    add_column :own_times, :done_task_flg, :integer, default: 0
    add_column :own_times, :estimated_time, :integer
  end
end
