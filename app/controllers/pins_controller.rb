class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @pins = Pin.all.descending
  end

  def show
  end
  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Thank you. Your Charity is under review for listing."

    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Your article has successfully been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path

  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :neighborhood_id)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
