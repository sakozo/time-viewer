class CreateUserColors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_colors do |t|
      t.references :user,      null: false, foreign_key: true
      t.string :colors,        null: false

      t.timestamps
    end
  end
end
