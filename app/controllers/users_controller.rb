class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザー登録が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    u = User.find(params[:id])
    u.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end
  
  def show
    # URLのIDからユーザーを探す
    @user = User.find(params[:id])
    
    # そのユーザーの投稿一覧
    @reviews = @user.reviews
    
    # そのユーザーのブックマーク一覧
    @bookmarked_reviews = @user.bookmarked_reviews
  end
  
  private

  def user_params
    params.require(:user).permit(:uid, :password, :password_confirmation, :faculty, :grade)
  end
  
  ##def create
    ##u = 
    ##User.create(uid: params[:user][:uid],
      ##password: params[:user][:password], 
      ##password_confirmation: params[:user][:password_confirmation])
    ##p = Profile.new(message:"")
    ##p.user = u
    ##p.save
    ##redirect_to users_path
  ##end

  ##def destroy
    ##u = User.find(params[:id])
    ##u.destroy
    ##p = Profile.find_by(user_id: u.id)
    ##p.destroy
    ##redirect_to users_path
  ##end
end
