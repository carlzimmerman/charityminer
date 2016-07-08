class Admin::PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin

  def verify_admin
    redirect_to root_path unless current_user.admin?
  end

  def index
    @pins = Pin.unapproved.descending
  end

end
