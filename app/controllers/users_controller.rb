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

  def update
    @user = current_user
    @user.name = params[:name]
    @user.save
    if @user.save
      flash[:success] = "Success!"
      redirect_to my_setting_path
    else
      render 'setting'
    end
  end
  

  def setting
    @user = current_user
  end

    private
   def user_params
    params.require(:user).
      permit(:name,:email,:mobile,:password,:password_confirmation)
   end

   def update_params
    params.require(:user).
      permit(:name,:email,:mobile,:city)
   end
  
  def resolve_layout
    case action_name
    when "new", "create"
      "form"
    else
      "application"
    end
  end

end
