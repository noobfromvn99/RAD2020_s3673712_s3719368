class SessionsController < ApplicationController
  layout :resolve_layout
  def new
    @user = User.all
  end
  
  def bypass
    #email = params[:email]
    user = User.find_by(email: params[:email].downcase)
    log_in user
    redirect_to index_path
  end

  def create
    @user = User.all
    if logged_in?
      redirect_to index_path
    end

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      log_in user
      if params[:session][:remember_me] == '1' 
        remember(user) 
      else 
        forget(user)
        user.forget
        cookies.delete(:user_email)
        cookies.delete(:user_password)
      end
      redirect_to index_path
    else
    # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def setting
  end

  def resolve_layout
    case action_name
    when "setting"
      "application"
    else
      "form"
    end
    end
end
