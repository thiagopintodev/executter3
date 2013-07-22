class SignUpController < ApplicationController
  permit_controller!

  # GET /sign_up
  def index
    @user = User.new
  end

  # POST /sign_up
  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :link, :email, :password, :born_on, :gender, :city_living_name)
    @user = User.new(user_params)

    if @user.save
      set_current_user @user, 'sign_up'
      r = params[:return_url]
      r = home_path if r.blank?
      redirect_to r, notice: 'Welcome to Executter!'
    else
      render action: 'index'
    end
  end

  # MOVED TO HOME CONTROLLER FOR A PERMISSIONS PROBLEM
  # GET /sign_out
  # def sign_out
  #   session.clear
  #   redirect_to sign_in_path, notice: "You have signed out."
  # end

end
