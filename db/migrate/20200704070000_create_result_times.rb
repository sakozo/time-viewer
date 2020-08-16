class CreateResultTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :result_times do |t|
      t.references :user,      null: false, foreign_key: true # 登録者
      t.references :own_time,  null: false, foreign_key: true # 時間
      t.integer :block,        null: false # ブロックid  ブロック1(5:00) ブロック2(5:15)...

      t.timestamps
    end
  end
end
