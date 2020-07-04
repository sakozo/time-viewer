class ChangeNotnullToResultTimes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :result_times, :record_date, false
  end
end
