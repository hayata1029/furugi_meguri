class StoresController < ApplicationController
  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true)
  end

  def search
    @q = Store.search(search_params)
    @stores = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
