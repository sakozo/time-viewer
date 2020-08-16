# == Schema Information
#
# Table name: user_colors
#
#  id         :bigint           not null, primary key
#  colors     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_colors_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserColor < ApplicationRecord
end
