class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user = user.try(:authenticate, params[:password])
      #設定成功，設定session
      session[:user_id] = user.id
      message = "Welcome, #{user.email}"
    else
      message = "登入失敗"
    end
    redirect_to questions_path, notice: message
  end

  def destroy
    session.delete(:user_id)
    redirect_to questions_path, notice: '登出'
  end
end
