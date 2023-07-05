class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :categories, -> { distinct }, through: :expenses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def admin?
    role == 'admin'
  end

  def user_categories
    categories.where.not(name: "dummy-categrory-#{id}")
  end

  # create a dummy category then create dummy expense with that category
  def dummy_data(user)
    category =
      Category.new(
        name: "dummy-categrory-#{user.id}",
        icon: 'fa-solid fa-utensils'
      )
    category.save
    expense =
      Expense.new(
        name: "dummy-expense-#{user.id}",
        amount: 0,
        author_id: user.id,
        category_ids: [category.id]
      )
    expense.save
  end

  # check if dummy category and dummy expense exist
  def dummy_data?(id)
    categories.find_by(name: "dummy-categrory-#{id}") &&
      expenses.find_by(name: "dummy-expense-#{id}")
  end
end
