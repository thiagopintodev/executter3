class SignInController < ApplicationController
  permit_controller!

  # GET /sign_in
  def index
    @new_user = User.new
  end

  # POST /sign_ip
  def authenticate
    @new_user = User.sign_in(params.user.email, params.user.password)

    if @new_user.authenticated?
      set_current_user @new_user
      r = params[:return_url]
      r = home_path if r.blank?
      redirect_to r, notice: 'You Have Signed In.'
    else
      render action: 'index'
    end
  end

end
