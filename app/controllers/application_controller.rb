class ApplicationController < ActionController::Base
  before_action :set_categories
  before_action :set_query

  def set_categories
    @categories = Category.all
  end

  def set_query
    @query = Plant.ransack(params[:q])
  end
end
