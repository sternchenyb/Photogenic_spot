class Spot < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    has_many_attached :spot_image
    belongs_to :user
    belongs_to :genre
    has_many :spot_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
