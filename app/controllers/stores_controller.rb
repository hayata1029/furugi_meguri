class StoresController < ApplicationController
  def index
    @search = Store.ransack(params[:q])
    @stores = @search.result(distinct: true).page(params[:page]).per(5)
    @store_all = Store.all
    @areas = Area.all
  end

  def search
    @search = Store.ransack(params[:q])
    @stores = @search.result(distinct: true).order(:id).page(params[:page]).per(5)
  end

  def show
    @store = Store.find(params[:id])
    @area  = Area.find(@store.area_id)
    @image = @store.store_images.find(params[:id]).image
    if user_signed_in?
      @favorites = Favorite.find_by(store_id: params[:store_id], user_id: current_user.id)
    end
  end
end
