class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order(created_at: 'DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in?
      if current_user.id != @item.user_id
      redirect_to action: :index
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
      item.destroy
    else
      redirect_to action: :index
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end
end
