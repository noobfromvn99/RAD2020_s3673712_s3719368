class VerficationsController < ApplicationController
  before_action :logged_in?, only: [:create]
  include VerficationsHelper
  def create
    if current_user.create_verfication(verification_params)
      flash[:success] = "Success!"
      redirect_to setting_path
    else 
      flash[:alert] = "Fail!"
      redirect_to setting_path
    end
  end

  def show
    redirect_to current_user
  end

  private
  def verification_params
    params.require(:verfication).
      permit(:fullname,:cardnum, :card)
   end

end
