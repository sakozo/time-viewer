# == Schema Information
#
# Table name: own_times
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  publicLevel :integer          not null
#  shareFlg    :integer          not null
#  time_type   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_own_times_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class OwnTime < ApplicationRecord
  has_one :result_time
end
