class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = nil
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      session[:intended_url] = nil
      session[:query] = nil
      session[:sort] = 'zip'
      session[:direction] = 'asc'
      flash[:notice] = "Welcome back, #{user.firstname} #{user.lastname}!"
#      redirect_to(session[:intended_url] || user)
      redirect_to(zips_path)
     # setup default session params
    else
#      binding.pry
      if(session[:user_id])
        render :new
      else
        flash[:alert] = "Invalid email/password combination!"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
#    session[:current_user] = nil
    self.current_user = nil
    redirect_to root_url, notice: "You're now signed out!"
  end

end
