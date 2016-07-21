class Admin::PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :find_pin, only: [:approve]



  def verify_admin
    redirect_to root_path unless current_user.admin?
  end

  def index
    @pins = Pin.unapproved.descending
  end

  def approve
    if @pin.update(approved_at: Time.now.utc)
      redirect_to admin_pins_path, notice: "Approved!"
    else
      redirect_to admin_pins_path, alert: "Something went wrong"
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
