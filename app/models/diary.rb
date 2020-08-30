class Diary < ApplicationRecord
  attr_encrypted :diary, key: 'This is a key that is 256 bits!!'
  belongs_to :user
end
