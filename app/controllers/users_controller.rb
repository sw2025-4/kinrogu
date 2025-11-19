class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    ##u = 
    User.create(uid: params[:user][:uid],
      password: params[:user][:password], 
      password_confirmation: params[:user][:password_confirmation])
    ##p = Profile.new(message:"")
    ##p.user = u
    ##p.save
    redirect_to users_path
  end

  def destroy
    u = User.find(params[:id])
    u.destroy
    ##p = Profile.find_by(user_id: u.id)
    ##p.destroy
    redirect_to users_path
  end
end
