class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	validates_uniqueness_of :email
	validates_confirmation_of :password
	before_save :encrypt_password
	has_secure_password


	def self.authenticate email, password
	        user = find_by_email email
	        if user && user.password == BCrypt::Engine.hash_secret(params[:password],user.password_salt.to_s)
	            user
	        else
	            false
	        end
	end

	def encrypt_password
	        if password.present?
	            self.password_salt = BCrypt::Engine.generate_salt
	            self.password = BCrypt::Engine.hash_secret password, password_salt
	            
	        end
	    	

	end
end
