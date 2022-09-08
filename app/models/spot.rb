class Spot < ApplicationRecord
    has_many_attached :spot_image
    belongs_to :user
    belongs_to :genre
    has_many :spot_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
