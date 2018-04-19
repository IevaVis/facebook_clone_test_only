class StatusesController < ApplicationController
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]


	def index
		@statuses = Status.all
	end

	def new
		@status = Status.new
	end

	def create
		@status = Status.new(valid_params)
		if @status.save
			redirect_to status_path(@status)
			flash[:notice] = "Status is created successfully."
		else
			flash[:alert] = "Error creating status."
			render :new
		end
	end

	def edit
		@status = Status.find(params[:id])
	end

	def update
		@status = Status.find(params[:id])
		if @status.update_attributes(valid_params)
			redirect_to status_path(@status)
			flash[:notice] = "Status is updated successfully."
		else
			render :edit
		end
	end

	def destroy
		@status = Status.find(params[:id])
		@status.destroy
		redirect_to statuses_path
		flash[:notice] = "Status is deleted."

	end

	private

	def valid_params
		params.require(:status).permit(:title, :content)
	end

	def require_login
		if !logged_in?
		redirect_to root_path
	end
end

end