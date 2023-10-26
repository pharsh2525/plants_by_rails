class HomeController < ApplicationController
  def index
    @plants = Plant.all
  end
end
