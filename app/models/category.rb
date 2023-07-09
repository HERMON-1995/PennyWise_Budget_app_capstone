class Category < ApplicationRecord
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, length: { in: 1..20 }
  validates :icon, presence: true

  ICONS = [
    'fa fa-cutlery',
    'fa fa-shopping-cart',
    'fa fa-credit-card',
    'fa fa-heartbeat',
    'fa fa-gamepad',
    'fa fa-question',
    'fa fa-medkit'
  ].freeze

  def total_expenses
    expenses.sum(:amount)
  end

  def non_dummy_expenses(current_user)
    expenses.where.not(name: "dummy-expense-#{current_user.id}").order(created_at: :desc)
  end
end
