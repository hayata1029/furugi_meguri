class WomsController < ApplicationController
  before_action :set_store,   only: [:index, :new, :create, :update]
  before_action :set_area,    only: [:index, :new, :create, :update]
  before_action :correct_wom, only: [:destroy]

  def index
    @wom = Wom.find_by(params[:id])
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
    @wom = Wom.find(params[:id])
  end

  def update
    @wom = Wom.find(params[:id])
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

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_area
    @area  = Area.find(@store.area_id)
  end

  def correct_wom
    @wom = Wom.find(params[:id])
    redirect_to root_url if @wom.nil?
  end

  def update_params
    params.require(:wom).permit(:store_id, :title, :content)
  end
end
