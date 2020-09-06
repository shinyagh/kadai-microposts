class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :likedusers, thorough: :favorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
