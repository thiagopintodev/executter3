class ApplicationController < ActionController::Base
  module CurrentUser
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    def set_current_user(user)
      @current_user = nil
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.find session[:user_id] rescue nil
    end

  end
end