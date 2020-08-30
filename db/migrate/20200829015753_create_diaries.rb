class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.references :user,       null: false, foreign_key: true
      t.text :encrypted_diary
      t.text :encrypted_diary_iv
      t.date :record_date,     null: false
      t.timestamps
    end
  end
end
