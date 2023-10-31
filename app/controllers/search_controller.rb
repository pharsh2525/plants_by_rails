class SearchController < ApplicationController
  def index
    @query = Plant.ransack(params[:q])
    @plants = @query.result(distinct: true)
  end
end