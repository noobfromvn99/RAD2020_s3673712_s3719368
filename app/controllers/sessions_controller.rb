class SessionsController < ApplicationController
  layout "form"
  def new
  end
  
  def create
    if logged_in?
      redirect_to index_path
    end

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to index_path
    else
    # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
