class RankingController < ApplicationController

  def index
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end


  #     # Like.group(:note_id) #記事の番号(note_id)が同じものにグループを分ける
  #     # order('count(note_id) desc') #いいねの多い順に並び替える
  #     # limit(3) #表示する最大数を3個に指定する
  #     # pluck(:note_id) #そして最後に:note_idカラムのみを数字で取り出すように指定。


  #     # Note.find()#最終的に、pluckで取り出される数字をノートのIDとすることでいいね順にnoteを取得する事ができる

  #     # @all_ranks = Note.find()#最後に＠all_ranksに代入

end
