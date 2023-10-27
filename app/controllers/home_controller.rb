class HomeController < ApplicationController
  def index
    @plants = Plant.order(:created_at).page(params[:page]).per(25)
  end
end
