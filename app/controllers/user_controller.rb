class UserController < ApplicationController
	def authenticate
	end
	def new
		@user=User.new
	end
	def create
	@user = User.new(user_param)
    if @user.save
    	#Librato.increment 'user.signup'
    	#Librato.increment 'user.signned'
    	session[:user]=@user.id
		redirect_to articles_path

		else
			puts @user.inspect
			render 'new'
		end
	end

	def login
		render 'login'
	end

	private def user_param
	params.require(:user).permit(:username, :email, :password, :password_confirmation )
	end
end
