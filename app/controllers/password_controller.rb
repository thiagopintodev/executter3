class PasswordController < ApplicationController
  permit_controller!


  load_resource do
    before(:new, :create) do
      @user = User.find session[:new_password_user_id]
      #render '/404' unless @user
    end
  end



  # GET /password/forgot
  def forgot
  end

  # POST /password/forgot
  def send_instructions
    user_params = params[:user].slice(:email)
    user = User.where(user_params).first
    if user
      user.change_generic_token!
      RegistrationMailer.forgot_password(user).deliver
    end
    redirect_to sign_in_path, notice: "We've sent password reset instructions to your email address."
  end






  # GET /password/:id/reset/:code
  # this action signs the user in a temporary stage
  # if the user is here, their email should be considered verified
  def reset
    user_conditions = params.slice(:id, :generic_token)

    if @user = User.where(user_conditions).first
      @user.confirm_email!
      session[:new_password_user_id] = @user.id
      redirect_to password_path
    else
      redirect_to sign_in_path, notice: "This link is expired."
    end
  end

  # GET /password
  def new
  end

  # POST /password
  def create
    user_params = params.require(:user).permit(:password, :password_confirmation)
    #
    if @user.update_attributes(user_params)
      session[:new_password_user_id] = nil
      redirect_to sign_in_path, notice: "Your new password was changed, please sign in now"
    else
      render action: 'new'
    end
  end




  # # GET /confirm/:id/:code
  # def confirm_email
  # end


end
