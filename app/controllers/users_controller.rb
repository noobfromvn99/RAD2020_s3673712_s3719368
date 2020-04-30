class UsersController < ApplicationController
  layout :resolve_layout
  def new
    if logged_in?
      redirect_to index_path
    end

    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

    private
   def user_params
    params.require(:user).
      permit(:name,:email,:mobile,:password,:password_confirmation)
   end

   private
  def resolve_layout
    case action_name
    when "new", "create"
      "form"
    else
      "application"
    end
  end

end
