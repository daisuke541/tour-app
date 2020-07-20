class SessionsController < ApplicationController

  def new
  end

  def new_guest
    user = User.guest
    log_in user
    redirect_to root_url
    flash.now[:notice] = "ゲストユーザーとしてログインしました。よろしくお願い致します。"
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "有効なアカウントではありません"
        message += "メールのリンクを確認してください"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "メールアドレスとパスワードの組み合わせを確認してください"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
    
end
