class WomsController < ApplicationController
  before_action :set_store,    only: [:edit, :new, :create, :update]
  before_action :correct_wom,  only: [:destroy]
  before_action :set_wom,      only: [:edit, :update, :destroy]
  before_action :set_favorite
  before_action :set_item

  def index
    @wom = Wom.find_by(params[:id])
    @store = Store.find(params[:store_id])
  end

  def new
    @wom = Wom.new
  end

  def create
    @wom = current_user.woms.build(wom_params)
    if @wom.save
      render 'woms/index'
    elsif @wom.title.length >= 50 && @wom.content.length >= 140
      flash.now[:alert] = "タイトルは50字,クチコミは140字以内で入力してください"
      render 'woms/new'
    elsif @wom.content.length >= 140
      flash.now[:alert] = "クチコミは140字以内で入力してください"
      render 'woms/new'
    elsif @wom.title.length >= 50
      flash.now[:alert] = "タイトルは50字以内で入力してください"
      render 'woms/new'
    end
    @wom.user_id = current_user.id
  end

  def edit
    @store = Store.find(params[:store_id])
  end

  def update
    if @wom.update(update_params)
      redirect_to store_woms_path
    elsif @wom.title.length >= 50 && @wom.content.length >= 140
      flash.now[:alert] = "タイトルは50字,クチコミは140字以内で入力してください"
      render 'woms/edit'
    elsif @wom.content.length >= 140
      flash.now[:alert] = "クチコミは140字以内で入力してください"
      render 'woms/edit'
    elsif @wom.title.length >= 50
      flash.now[:alert] = "タイトルは50字以内で入力してください"
      render 'woms/edit'
    end
  end

  def destroy
    @wom.destroy
    redirect_to store_woms_path
  end

  private

  def wom_params
    params.require(:wom).permit(:store_id, :title, :content, :visit_date)
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
    params.require(:wom).permit(:store_id, :title, :content)
  end

  def set_favorite
    if user_signed_in?
      @favorite = Favorite.find_by(store_id: params[:store_id], user_id: current_user.id)
    end
  end

  def set_item
    @item = Item.find_by(params[:item_id])
  end
end
