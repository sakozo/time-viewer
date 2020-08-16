class AddDefaultValueToProjectTable < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :done_flg, :integer, :default => 0
  end
end
