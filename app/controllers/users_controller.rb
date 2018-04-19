class UsersController < ApplicationController 
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(valid_params)
		if @user.save
		redirect_to user_path(@user)
		flash[:notice] = "Account created. Please log in now."
		else
		flash[:alert] = "Error creating account: "
		render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(valid_params)
			redirect_to user_path(@user)
			flash[:notice] = "Account is updated successfully."
		else
			render template: "users/edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Account is deleted"
		redirect_to statuses_path

	end


	private
	def valid_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end