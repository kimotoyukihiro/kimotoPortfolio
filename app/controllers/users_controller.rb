class UsersController < ApplicationController
	before_action :ensure_correct_user
	def show
		@user = User.find(params[:id])
		@items = @user.items
		@nices = @user.nices
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
       	@user = User.find(params[:id])
    	if @user.update(user_params)
      	  redirect_to user_path(@user.id), notice: "You have updated user successfully."
      	else
      	  render "edit"
      	end
 	end

	private
	def user_params
	    params.require(:user).permit(:name, :email,:salon_name,:salon_address)
	end

	def ensure_correct_user
    	@user = User.find(params[:id])
    unless @user == current_user
      	redirect_to root_path
    end
  end
end
