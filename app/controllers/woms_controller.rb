class WomsController < ApplicationController
  before_action :set_store,   only: [:index, :new, :create]
  before_action :set_area,    only: [:index, :new, :create]
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
    else
      render 'woms/new'
    end
    @wom.user_id = current_user.id
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
