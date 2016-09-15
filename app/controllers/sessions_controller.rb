class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by('lower(username) = ?', user_params[:username].downcase)
    if admin && admin.authenticate(user_params[:password])
      session[:user_id] = admin.id
      redirect_to root_path, flash: { notice: "Welcome admin" }
    else
      redirect_to new_session_path, flash: { error: "Username or Password invalid!" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { notice: "See ya!" }
  end

  private

  def user_params
    params.require(:user_session).permit(:username, :password)
  end
end
