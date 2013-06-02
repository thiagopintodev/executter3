class User < ActiveRecord::Base
  
  module Authentication
    extend ActiveSupport::Concern

    included do
      has_many :user_sessions
      #
      validates :email,             presence: true, email_format: true, uniqueness: true #{case_sensitive: false}
      #
      validates :password_digest,   presence: true
      validates :password,          length: { in: 4..20 }, presence: true,     on: :create
      validates :password,          confirmation: true
      #validates_confirmation_of :password
    end

    def change_generic_token!
      update_attributes! generic_token: rand(Time.now.to_i).to_s
    end

    def change_authentication_token!
      update_attributes! authentication_token: rand(Time.now.to_i).to_s
    end

    def confirm_email!
      update_attributes! email_confirmed: true
    end

    # enforce email downcase

    def email=(email)
      write_attribute(:email, email.downcase)
    end

    # password

    attr_accessor :password

    def password=(password)
      @password = password
      self.password_digest = self.class.digest_it(password)
    end

    def password_is?(password)
      self.password_digest == self.class.digest_it(password)
    end
    
    module ClassMethods
      def digest_it(s)
        s.object_id.to_s
      end
      def sign_in(email, password)
        User.where(email: email.downcase).first_or_initialize.tap do |user|
          if user.new_record? || user.password_is?(password)
            user.errors[:password] << "email and password do not match"
          end
        end
      end
    end

    def authenticated?
      errors[:password].size.zero?
    end
  end
end