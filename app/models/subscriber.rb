class Subscriber < ApplicationRecord
	validates :f_name,:l_name,:country,:email , presence:true
end
