class AddColumnOwnTimes2 < ActiveRecord::Migration[5.2]
  def change
    add_column :own_times, :done_date, :date
  end
end
