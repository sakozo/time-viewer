# == Schema Information
#
# Table name: diaries
#
#  id                 :bigint           not null, primary key
#  encrypted_diary    :text(65535)
#  encrypted_diary_iv :text(65535)
#  record_date        :date             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_diaries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Diary < ApplicationRecord
  attr_encrypted :diary, key: 'This is a key that is 256 bits!!'
  belongs_to :user
end
