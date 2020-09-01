class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user,       null: false, foreign_key: true
      t.string :text
      t.date :record_date
      t.timestamps
    end
  end
end
