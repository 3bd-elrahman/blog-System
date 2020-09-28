class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token

def new
end


def create
user = User.find_by(email:params[:email])

if  user &&user.authenticate(params[:password])
	session[:user_email]=user.email
	redirect_to articles_path
else
	render 'new'

	end
	end

def destroy
session[:user_email]=nil
redirect_to root_path
end

end