class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @store = Store.find(params[:id])
  end
end
