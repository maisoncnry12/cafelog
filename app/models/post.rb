class Post < ApplicationRecord
  
  attachment :post_image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one :area
 
  # いいね機能
  has_many :favorites
   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
   
   # 検索機能
   def self.search(keyword)
    @posts = Post.where(["shop_name like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
   end
  
end
