class ItemsController < ApplicationController

	def show
		@item =Item.find(params[:id])
		@comment = ItemComment.new
	end

	def index
		@items = Item.page(params[:page]).per(8)
		@user = current_user
	end

	def new
		@item = Item.new
		@user = current_user
		if @user.Hairdresser != "false"
			redirect_to items_path
		end
	end

	def create
		@item = Item.new(item_params)
		@item.user_id = current_user.id
		if @item.save
			redirect_to item_path(@item.id)
		else
			render 'new'
		end
	end

	def edit
		@item =Item.find(params[:id])
		if current_user != @item.user
      		redirect_to items_path
    	end
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
		params.require(:item).permit(:title,:review,:image,:genre)
 	end
end
