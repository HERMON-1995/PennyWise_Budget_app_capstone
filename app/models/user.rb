class User < ApplicationRecord
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
    categories.where.not(name: "dummy-category-#{id}")
  end

  def dummy_data(user)
    category = find_or_create_dummy_category(user)
    create_dummy_expense(user, category)
  end

  def dummy_data?(id)
    categories.exists?(name: "dummy-category-#{id}") &&
      expenses.exists?(name: "dummy-expense-#{id}")
  end

  private

  def find_or_create_dummy_category(user)
    Category.find_or_create_by(
      name: "dummy-category-#{user.id}",
      icon: 'fa-solid fa-utensils'
    )
  end

  def create_dummy_expense(user, category)
    Expense.create(
      name: "dummy-expense-#{user.id}",
      amount: 0,
      author_id: user.id,
      category_ids: [category.id]
    )
  end
end
