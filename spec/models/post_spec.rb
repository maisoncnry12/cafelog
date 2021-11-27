require 'rails_helper'

RSpec.describe Post, 'モデルに関するテスト', type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context '空白のバリデーションチェック' do
    it 'titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(shop_name: '', body: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:shop_name]).to include("can't be blank")
    end
    it 'bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      book = Book.new(shop_name: 'hoge', body: '')
      expect(post).to be_invalid
      expect(post.errors[:body]).to include("can't be blank")
    end
  end
end

# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
