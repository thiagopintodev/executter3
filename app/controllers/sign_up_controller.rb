class SignUpController < ApplicationController

  # GET /sign_up
  def index
    @user = User.new
  end

  # POST /sign_up
  def create
    @user = User.new(user_params)

    if @user.save
      set_current_user @user
      r = params[:return_url]
      r = home_path if r.blank?
      redirect_to r, notice: 'Welcome to Executter!'
    else
      render action: 'index'
    end
  end

  # GET /sign_out
  # def sign_out
  #   session.clear
  #   redirect_to sign_in_path
  # end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :born_on, :gender) #city
    end

end
