class AddColumnResultTime < ActiveRecord::Migration[5.2]
  def change
    add_column :result_times, :record_date, :date
  end
end
