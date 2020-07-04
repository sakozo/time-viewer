class RenameTypeColumnToOwnTime < ActiveRecord::Migration[5.2]
  def change
    rename_column :own_times, :type, :time_type
  end
end
