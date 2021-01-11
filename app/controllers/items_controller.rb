class ItemsController < ApplicationController
  before_action :set_store,    only: [:list, :edit, :new, :create, :update]
  before_action :set_wom,      only: [:edit, :update, :destroy]
  before_action :set_item,     only: [:edit, :update, :destroy]
  before_action :set_favorite

  def index
    @items = Item.all
    @user = User.find(current_user.id)
  end

  def list
    @item = Item.find_by(params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(items_params)
    if @item.save
      redirect_to store_items_path(@store.id)
    else
      redirect_to new_store_item_path(@user.id)
    end
    @item.user_id = current_user.id
  end

  def edit
  end

  def update
  end

  def destory
    @item.destroy
    redirect_to store_items_path(@store.id)
  end

  private

  def items_params
    params.require(:item).permit(:store_id, :name, :price, :image)
  end

  def set_item
    @item = Item.(params[:id])
  end

  def set_wom
    @wom = Wom.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def correct_wom
    @wom = Wom.find(params[:id])
    redirect_to root_url if @wom.nil?
  end

  def update_params
    params.require(:wom).permit(:name, :price, :image)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_favorite
    if user_signed_in?
      @favorite = Favorite.find_by(store_id: params[:store_id], user_id: current_user.id)
    end
  end
end
