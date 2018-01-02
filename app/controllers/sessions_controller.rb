class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  layout "home"

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = ["Username and password do not match"]
      redirect_to login_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
