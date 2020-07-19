class AddColumnProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :done_flg, :integer
    change_column_null :projects, :done_flg, false, 0
  end
end
