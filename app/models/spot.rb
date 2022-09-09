class Spot < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :genre
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
