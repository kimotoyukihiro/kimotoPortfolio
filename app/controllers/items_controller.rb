class ItemsController < ApplicationController
	def show
		@item =Item.find(params[:id])
	end

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.user_id = current_user.id
		@item.save!
		redirect_to item_path(@item.id)
	end

	private
	def item_params
		params.require(:item).permit(:title,:review,:image)
 	end
end
