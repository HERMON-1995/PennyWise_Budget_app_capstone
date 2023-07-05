class Expense < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :category_expenses
  has_many :categories, through: :category_expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :amount,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }
end
