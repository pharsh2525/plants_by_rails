class HomeController < ApplicationController
  def index
    @plants = Plant.limit(15)
  end
end
