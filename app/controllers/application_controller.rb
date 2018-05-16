class ApplicationController < ActionController::API
	before_filter :get_device
	
	private
		def current_user
			if session[:user_id]  
				device = Device.find_by_user_id(session[:user_id])
				@current_user ||= User.find_by_id(session[:user_id]) if device.logged_in?
			end
		end
		helper_method :current_user
end
