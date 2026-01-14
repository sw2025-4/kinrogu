# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  # ログイン必須
  before_action :authenticate_user!
  
  # 処理の前に、対象の飲食店をセットする
  before_action :set_review, only: [:create, :destroy]
  
  #ブックマーク一覧
  def index
    @bookmarked_reviews = current_user.bookmarked_reviews
  end

  # ブックマーク作成
  def create
    # ログイン中のユーザーが、対象のレビューをブックマークに追加
    bookmark = current_user.bookmarks.new(review: @review)
    
    if bookmark.save
      redirect_to reviews_index_path, notice: 'ブックマークしました。'
    else
      redirect_to reviews_index_path, alert: 'ブックマークに失敗しました。'
    end
  end

  def destroy
    # 対象のレビューへのブックマークを探して削除
    bookmark = current_user.bookmarks.find_by(review: @review)
    
    if bookmark&.destroy
      redirect_to reviews_index_path, notice: 'ブックマークを解除しました。'
    else
      redirect_to reviews_index_path, alert: '解除できませんでした。'
    end
  end

  private

  def set_review
    # URLの :review_id から対象データを取得
    @review = Review.find(params[:review_id])
  end
  
  def authenticate_user
    # current_user が空（＝ログインしていない）なら
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to top_main_path
    end
  end
  
end