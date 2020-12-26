class StoresController < ApplicationController
  def index
    @search = Store.ransack(params[:q])
    @stores = @search.result(distinct: true).page(params[:page]).per(5)
    @areas = Area.all
  end

  def search
    @search = Store.search(search_params)
    @stores = @search.result(distinct: true).page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
