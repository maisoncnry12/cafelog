# 1 require 'rails_helper'
# 2	 
# 3	describe '投稿のテスト' do
# 4	  let!(:post) { create(:post,shop_name:'hoge',body:'body') }
# 5	  describe 'トップ画面(root_path)のテスト' do
# 6	    before do 
# 7	      visit root_path
# 8	    end
# 9	    context '表示の確認' do
# 10	      it 'トップ画面(root_path)に一覧ページへのリンクが表示されているか' do
# 11	        expect(page).to have_link "", href: posts_path
# 12	      end
# 13	      it 'root_pathが"/"であるか' do
# 14	        expect(current_path).to eq('/')
# 15	      end
# 16	   end
# 17	 end
# 18 end