class ApplicationController < ActionController::Base
  before_action :store_location

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  # ここでURLを覚えておく
  def store_location
    return unless request.get? 
    if (request.path != "/stores/index"  &&
        request.path != "/stores/search" &&
        request.path != "/stores/show"   &&
        request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        !request.xhr?)
      session[:previous_url] = request.fullpath 
    end
  end

  # ここで覚えておいたパスを返す
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end  

end
