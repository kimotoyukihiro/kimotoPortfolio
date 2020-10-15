class NicesController < ApplicationController
	before_action :item_params
		def create
			nice = current_user.nices.new(item_id: @item.id)
	    	nice.save
		end

		def destory
			nice = nice.find_by(user_id: current_user.id, item_id: @item.id)
			nice.destory
		end

	private
  def item_params
    @item = Item.find(params[:item_id])
  end

end
