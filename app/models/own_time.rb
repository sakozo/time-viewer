class OwnTime < ApplicationRecord
  # t.string :name,          null: false                    # 何をする時間か
  # t.references :user,      null: false, foreign_key: true # 作成者
  # t.integer :type,         null: false                    # 時間マトリックスの領域
  # t.shareFlg :integer      null: false                    # 共有設定（0:共有 or 1:プライベート）
  # t.publicLevel :integer     null: false                  # 公開範囲（プライベートのみ設定可能）1:公開しない
  has_one :result_time
end
