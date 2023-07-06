class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[index new create]

  def index
    @expenses = @category.category_expenses(current_user)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @user_categories = current_user.user_categories
    @expense = Expense.new
  end

  def create
    expense = Expense.new(expense_params)
    expense.author_id = current_user.id

    if expense.save
      redirect_to category_expenses_path(@category),
                  notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end
end
