class MapsController < ApplicationController
  def index
     
    # Review のデータをすべて取得してビューに渡す
    @reviews = Review.all
  
  end
end
