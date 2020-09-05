class Micropost < ApplicationRecord
  belongs_to :user
  has_many :user
  has_many :addedusers, thorough: :favorites, source :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
