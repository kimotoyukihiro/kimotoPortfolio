class ItemsController < ApplicationController
	def show
		@item =Item.find(params[:id])
		@comment = ItemComment.new
	end

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@comment = Comment.new
		@item.user_id = current_user.id
		@item.save!
		redirect_to item_path(@item.id)
	end

	def edit
		@item =Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
	    if @item.update(item_params)
	      redirect_to item_path(@item), notice: "successfully updated item!"
	    else
	      render 'edit'
    end
  end

	def destroy
	  	@item = Item.find(params[:id])
		  	@item.destroy
		  	redirect_to items_path, notice: "successfully delete item!"
	end

	private
	def item_params
		params.require(:item).permit(:title,:review,:image)
 	end
end
