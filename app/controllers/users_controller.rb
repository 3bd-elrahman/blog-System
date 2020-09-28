class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user=User.create(user_params)
		if @user.save
			session[:user_email]=@user.email
        redirect_to articles_path

    else
    	render 'new'
		end

	end

	private 

	def user_params
   params.require(:user).permit(:name,:image,:email,:password,:password_confirmation)
	end
end
