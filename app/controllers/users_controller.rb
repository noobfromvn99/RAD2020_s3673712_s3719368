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
    @user_class = "nav-link active"
    @home_class = ""
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
    if current_user.update(update_params)
      flash[:success] = "Success!"
      redirect_to current_user
    else
      render :edit
    end
  end
  

  def edit
    @user_class = "nav-link active"
    @home_class = ""
    respond_to do |format|  
      format.html
      format.js
    end  
  end

  def avatar #showing mutiple topic in index
    respond_to do |format|  
      format.js
    end
  end

    private
   def user_params
    params.require(:user).
      permit(:name,:email,:mobile,:password,:password_confirmation)
   end

   def update_params
    params.require(:user).
      permit(:name,:email,:mobile,:city,:bio)
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
