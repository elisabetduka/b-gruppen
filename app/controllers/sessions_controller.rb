class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Inloggad!"
      session[:user] = @user
    else
      flash.now.alert = "losenord eller email stamde inte overens..."
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Utloggad!"
  end
end
