class Post < ApplicationRecord
  attachment :post_image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one :area

  # バリデーション
  validates :shop_name, presence: true
  validates :post_image, presence: true
  validates :body, presence: true
  validates :rate, presence: true

  # いいね機能
  has_many :favorites
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索機能
  def self.search(keyword)
    @posts = Post.where(['shop_name like? OR body like?', "%#{keyword}%", "%#{keyword}%"])
  end
end
