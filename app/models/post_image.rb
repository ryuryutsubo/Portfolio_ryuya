class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :quiz, presence: true
  validates :hint, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
