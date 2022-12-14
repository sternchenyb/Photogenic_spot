class Spot < ApplicationRecord

  validates :name, presence: true
  validates :caption, presence: true, length: { maximum: 500 }
  validates :address, presence: true

  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #一覧画面でのソート機能
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  #いいね機能
  def favorited_by?(user)
    return false if user == nil
    favorites.exists?(user_id: user.id)
  end

  #利用者側の一覧画面でのキーワード検索機能
  def self.search(search_word)
   Spot.where(["name LIKE(?) OR caption LIKE(?) OR address LIKE(?)",
                 "%#{search_word}%", "%#{search_word}%", "%#{search_word}%" ])
  end

  #管理者側で利用する検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @spot = Spot.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @spot = Spot.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @spot = Spot.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @spot = Spot.where("name LIKE?","%#{word}%")
    else
      @spot = Spot.all
    end
  end
end