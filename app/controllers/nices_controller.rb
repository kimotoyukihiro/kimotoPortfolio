class NicesController < ApplicationController
	before_action :item_params
  def create
    @nice = Nice.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    @nice = Nice.find_by(user_id: current_user.id, item_id: @item.id).destroy
  end
	private
  def item_params
    @item = Item.find(params[:item_id])
  end

end
