class ApplicationController < ActionController::Base
  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end
end
