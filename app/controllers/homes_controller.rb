class HomesController < ApplicationController
  def index
    # @search = Store.ransack(params[:q])
    # @search_shops = @search.result(distinct: true).order(created_at: "DESC").includes(:shops)
  end
end
