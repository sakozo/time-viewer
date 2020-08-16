# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  done_date  :date
#  done_flg   :integer          default(0), not null
#  limit_date :date             not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
  belongs_to :user
end
