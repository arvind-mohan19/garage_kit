class User < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :phone_number, :presence => true, :uniqueness => true

	def self.authenticate(phone_number, password)
	    user = find_by_email(phone_number)
	    if user && user.password == password
	      user
	    else
	      nil
	    end
	end
	 
end
