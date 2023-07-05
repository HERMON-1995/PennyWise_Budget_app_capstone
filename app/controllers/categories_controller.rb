class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.user_categories
  end

  def show
    @category = Category.find(params[:id])
    redirect_to category_expenses_path(@category)
  end

  def new
    @category = Category.new
  end

  def create
    current_user.dummy_data(current_user) unless current_user.dummy_data?(current_user.id)
    new_category = Category.new(category_params)
    if new_category.save
      current_user.expenses.find_by(name: "dummy-expense-#{current_user.id}").categories << new_category
      @category = new_category
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
