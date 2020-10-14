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

	def edit
		@item =Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "successfully updated book!"
    else
      render 'edit'
    end
  end

  def destroy
  	@item.destroy
  	redirect_to items_path, notice: "successfully delete book!"
  end
	private
	def item_params
		params.require(:item).permit(:title,:review,:image)
 	end
end
