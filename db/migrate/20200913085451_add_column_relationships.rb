class AddColumnRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :status, :integer, default: 0
  end
end
