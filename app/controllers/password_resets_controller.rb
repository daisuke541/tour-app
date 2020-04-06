class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email:params[:password_reset][:email].downcase)
    if @user 
      @user.create_reset_digest
      @user.send.password_reset_email
      flash[:info] = "再設定用のメールを送信しました"
      redirect_to root_url
    else
      flash.now[:danger] = "メールアドレスが見つかりませんでした"
      render 'new'
    end 
  end 
  
  def edit
  end
end
