class ReviewsController < ApplicationController
  def index
     @reviews = Review.all
  end
  
  def new
   @review = Review.new  #formヘルパーのデータの入れ物になる
  end
  
  def create
     
  review = Review.new(storename: params[:review][:storename], location: params[:review][:location], comment: params[:review][:comment],
    category: params[:review][:category],
    star: params[:review][:star],image: params[:review][:image],
     tags: params[:review][:tags] || [])
  review.user = current_user
  review.save
   redirect_to reviews_path#=>一覧ページにリダイレクトする
  end

end