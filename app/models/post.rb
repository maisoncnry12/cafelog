class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  #Post.commentsで投稿が所有するコメント取得できる
  
  has_many :favorites
   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
   
  has_one :area
  
  attachment :post_image
  
end
