class SessionsController < ApplicationController
  def new
    redirect_to current_user if current_user
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
