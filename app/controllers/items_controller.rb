class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update] 
  before_action :find_sold_item, only: [:show, :edit] 

  def index
    @items = Item.all.order(created_at: 'DESC')
    @sold_items = Order.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
      if current_user.id != @item.user_id || @sold_item.present? 
      redirect_to action: :index
      end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      item.destroy
      redirect_to action: :index
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def find_sold_item
    @sold_item = Order.find_by(item_id: (params[:id]))
  end
end
