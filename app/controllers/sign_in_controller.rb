class SignInController < ApplicationController

  # GET /sign_in
  def index
    @user = User.new
  end

  # POST /sign_ip
  def authenticate
    @user = User.sign_in(params.user.email, params.user.password)

    if @user.authenticated?
      set_current_user @user
      r = params[:return_url]
      r = home_path if r.blank?
      redirect_to r, notice: 'You Have Signed In.'
    else
      render action: 'index'
    end
  end

end
