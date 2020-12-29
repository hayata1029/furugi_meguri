class StoresController < ApplicationController
  def index
    @search = Store.ransack(params[:q])
    @stores = @search.result(distinct: true).page(params[:page]).per(5)
    @areas = Area.all
  end

  def search
    @search = Store.ransack(params[:q])
    @stores = @search.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @store = Store.find(params[:id])
    @area  = Area.find(params[:id])
  end
end
