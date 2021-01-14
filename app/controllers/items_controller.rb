class ItemsController < ApplicationController
  before_action :set_store,     only: [:list, :edit, :new, :create, :update]
  before_action :set_item,      only: [:edit, :destroy]
  before_action :set_favorite

  def index
    @items = Item.all
    @user = User.find(current_user.id)
  end

  def list
    @item = Item.find_by(params[:item_id])
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(items_params)
    @user = User.find(current_user.id)
    if @item.save
      redirect_to store_list_path(@store.id)
    else
      redirect_to new_store_item_path(@user.id)
    end
    @item.user_id = current_user.id
  end

  def edit
    @store = Store.find(params[:store_id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(items_params)
      redirect_to store_list_path(@store.id)
    else
      root_path
    end
  end

  def destroy
    @item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def items_params
    params.require(:item).permit(:store_id, :name, :price, :item_image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_favorite
    if user_signed_in?
      @favorite = Favorite.find_by(store_id: params[:store_id], user_id: current_user.id)
    end
  end
end
