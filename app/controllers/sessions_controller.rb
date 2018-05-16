class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id
	    render :show, status: :created, location: user
	  else
	    render json: user.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  session[:user_id] = nil
	  head 200
	end
end
