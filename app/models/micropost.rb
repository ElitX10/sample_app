class Micropost < ApplicationRecord
  belongs_to :cat

  validates :content, presence: {}, length: {maximum: 140}
  validates :user_id, presence: {}

end
