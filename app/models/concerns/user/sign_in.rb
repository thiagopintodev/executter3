class User < ActiveRecord::Base
  
  module SignIn
    extend ActiveSupport::Concern

    included do
      validates_email_format_of :email
      validates_uniqueness_of   :email, :case_sensitive => false
      validates :password,  presence: true, length: { in: 4..20 }, on: :create
      validates :password_digest,  presence: true
    end

    def email=(email)
      write_attribute(:email, email.downcase)
    end

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