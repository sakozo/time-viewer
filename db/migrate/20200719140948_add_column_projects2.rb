class AddColumnProjects2 < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :done_date, :date
  end
end
