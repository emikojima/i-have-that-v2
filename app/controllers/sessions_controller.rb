class SessionsController < ApplicationController
  def create
    if @user = User.from_omniauth(request.env["omniauth.auth"])
  	session[:user_id] = @user.id
    redirect_to user_path(@user)
   elsif  @user = User.find_by(name: params[:user][:name]) && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       redirect_to '/signin'
     end
   end
  end
