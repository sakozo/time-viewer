class ChangeOwnTimes < ActiveRecord::Migration[5.2]
  def change
    change_column :own_times, :shareFlg, :integer, default: 1
    change_column :own_times, :publicLevel, :integer, default: 1
    change_column :own_times, :task_flg, :integer, default: 1
  end
end
