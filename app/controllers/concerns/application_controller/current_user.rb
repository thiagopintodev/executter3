class ApplicationController < ActionController::Base
  module CurrentUser
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    def set_current_user(user, origin)
      user.change_authentication_token!
      us = user.user_sessions.create!({origin: origin, remote_ip: request.remote_ip, user_agent: request.user_agent, authentication_token: user.authentication_token})
      #
      @current_user = nil
      session[:user_id] = user.id
      session[:atoken]  = user.authentication_token
    end

    def current_user
      #@current_user ||= User.find session[:user_id] rescue nil

      # @current_user ||= (User.find(session[:user_id]) rescue nil).tap do |u|
      #   u = nil if u.try(:authentication_token) != session[:atoken]
      # end


      @current_user ||= (User.find(session[:user_id]) rescue nil).tap do |u|
        if u && u.authentication_token == session[:atoken]
          u.update(last_activity_at: Time.now)
          u
        else
          nil
        end
      end
    end

  end
end