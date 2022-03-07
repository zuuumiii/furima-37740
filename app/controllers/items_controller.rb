class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました"
      redirect_to root_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id || @item.order.present?
      flash[:alert] = "不正な操作です"
      redirect_to action: :index 
    end
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "商品を編集しました"
      redirect_to item_path(@item)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      item.destroy
      flash[:notice] = "削除しました"
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
end
