class TopController < ApplicationController
  #def main
    #render "login_form"
  #end
  
  #def login
    #user = User.find_by(uid: params[:uid])
    #if user and user.authenticate(params[:pass])
      #session[:login_uid] = params[:uid]
      #redirect_to root_path
    #end
  #end
  
  #def logout
    #session.delete(:login_uid)
    #redirect_to root_path
  #end
  
  def main
    render "login_form"
  end

  def login
    # 入力されたUIDでユーザーを検索
    user = User.find_by(uid: params[:uid])
    
    # ユーザーが存在し、かつパスワードが一致する場合 (authenticateメソッド)
    if user && user.authenticate(params[:pass])
      session[:login_uid] = params[:uid] # セッションにUIDを保存
      redirect_to reviews_path, notice: 'ログインしました' # ログイン後は飲食店一覧へ
    else
      flash.now[:alert] = 'UIDまたはパスワードが間違っています'
      render "login_form", status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path, notice: 'ログアウトしました'
  end

end