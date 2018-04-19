class LikesController < ApplicationController

def create
    @status = Status.find(params[:like][:status])
    @like = Like.new(user_id: session[:user_id], status_id: @status.id)
    if Like.where(user_id: session[:user_id], status_id: @status.id).exists?
      flash[:alert] = "You liked before!"
      redirect_to root_url
    else
      if @like.save
        flash[:notice] = "You liked #{@status.title}!"
        redirect_to root_url
      end
    end
  end

 def destroy
	@like = Like.find(params[:id])
	@status = Status.find(@like.status_id)
	@like.destroy
	redirect_to status_path(@status)
	flash[:notice] = "You unlike."
 end
end


