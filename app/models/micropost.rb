class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :addedusers, thorough: :favorites, source: :user
  
  def addfavorite(user)
    favorites.find_or_create_by(user_id: user.id)
  end
  
  def removefavorite(user)
    favorite = favorites.find_by(user_id: user.id)
    favorite.destroy if favorite
  end  
  
  def added?(user)
    addedusers.include?(user)
  end
  
  validates :content, presence: true, length: { maximum: 255 }
end
