class CreateOwnTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :own_times do |t|
      t.string :name,          null: false                    # 何をする時間か
      t.references :user,      null: false, foreign_key: true # 作成者
      t.integer :type,         null: false                    # 時間マトリックスの領域
      t.integer :shareFlg,     null: false                    # 共有設定（共有 or プライベート）
      t.integer :publicLevel, null: false                  # 公開範囲（プライベートのみ設定可能）

      t.timestamps
    end
  end
end
