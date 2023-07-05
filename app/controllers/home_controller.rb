class HomeController < ApplicationController
  before_action :redirect_to_categories, if: -> { user_signed_in? }
  def index
    render 'home/index'
  end

  private

  def redirect_to_categories
    redirect_to categories_path
  end
end
