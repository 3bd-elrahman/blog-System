class ApplicationController < ActionController::Base
	

def current_user
@current_user = User.find_by(email:session[:user_email]) 
end

	helper_method :current_user
helper_method :subscriber_country

	def authorize
if session[:user_email].nil?
	redirect_to root_path alert:"youn have to log in"
end
	end

	
	def authorize_admin
     if current_user.admin==false
        redirect_to root_path
     end
	end

	def subscriber_country
       arr =['Egypt','Sudan','Libya','Morroco','Tunis','KSA','Qatar','Kuwit','Yemen','Oman','Algeria','Palestine','Syria','Jordon']
       return arr
	end


end
