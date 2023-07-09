class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show]

  def index
    @categories = current_user.user_categories
  end

  def show
    redirect_to category_expenses_path(@category)
  end

  def new
    @category = Category.new
  end

  def create
    current_user.dummy_data(current_user) unless current_user.dummy_data?(current_user.id)
    @category = Category.new(category_params)

    if @category.save
      current_user.expenses.find_by(name: "dummy-expense-#{current_user.id}").categories << @category
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
