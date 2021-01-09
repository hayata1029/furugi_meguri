class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorite_stores = @user.favorites.map { |favorite| favorite.store }
    @store = @favorite_stores.first
  end

  def create
    favorite = current_user.favorites.build(store_id: params[:store_id])
    favorite.save
    redirect_to store_path(params[:store_id])
  end

  def destroy
    favorite = Favorite.find_by(store_id: params[:store_id], user_id: current_user.id)
    favorite.destroy
    redirect_to store_path(params[:store_id])
  end
end
