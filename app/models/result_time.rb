# == Schema Information
#
# Table name: result_times
#
#  id          :bigint           not null, primary key
#  block       :integer          not null
#  record_date :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  own_time_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_result_times_on_own_time_id  (own_time_id)
#  index_result_times_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (own_time_id => own_times.id)
#  fk_rails_...  (user_id => users.id)
#
class ResultTime < ApplicationRecord
  # t.references :user,      null: false, foreign_key: true # 登録者
  # t.references :own_time,  null: false, foreign_key: true # 時間
  # t.integer :block,        null: false # ブロックid  ブロック1(5:00) ブロック2(5:15)...

  belongs_to :own_time
end
