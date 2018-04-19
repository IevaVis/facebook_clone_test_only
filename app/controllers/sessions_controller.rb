class SessionsController < ApplicationController
include SessionsHelper
	def new

	end

	def create
    	user = User.find_by(email: params[:session][:email])
    	if user && user.authenticate(params[:session][:password])
   			log_in user
     		redirect_to statuses_path
     		flash[:notice] = "Welcome, joshhhh@nextacademy.com!"
    	else
      		flash[:alert] = "Please log in again"
      		render 'new'
    	end
  	end


	def destroy
		log_out
    	redirect_to root_url
	end
	
	
end

