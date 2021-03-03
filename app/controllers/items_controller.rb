class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new


  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def items_params
    params.require(:item).permit(:prise_name, :description, :category_id, :condition_id, :deli_fee_id, :area_id, :deli_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
