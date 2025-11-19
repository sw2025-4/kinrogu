class ReviewsController < ApplicationController
  def index
  end
  
  def new
   @review = Review.new  #formヘルパーのデータの入れ物になる
  end
  
  def create
     
  bookmark = Review.new(title: params[:review][:storename], url: params[:review][:location])
  bookmark.save
  redirect_to '/' #=>一覧ページにリダイレクトする
end
end
