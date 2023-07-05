require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { FactoryBot.build(:expense) }

  describe 'ActiveModel validations' do
    # Basic validations
    it 'is valid with valid attributes' do
      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      expect(Expense.new(name: nil)).to_not be_valid
    end

    it 'is not valid without an amount' do
      expect(Expense.new(amount: nil)).to_not be_valid
    end

    it 'is not valid without an author_id' do
      expect(Expense.new(author_id: nil)).to_not be_valid
    end

    # Acceptance of values
    it 'is not valid with non-numeric amount' do
      expect(Expense.new(amount: 'abc')).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      expect(Expense.new(amount: -1)).to_not be_valid
    end

    # Length validations
    it 'is not valid with a name longer than 20 characters' do
      expect(Expense.new(name: 'a' * 21)).to_not be_valid
    end
  end

  describe 'ActiveRecord associations' do
    it 'belongs to a user' do
      expense = Expense.reflect_on_association(:user)
      expect(expense.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      expense = Expense.reflect_on_association(:categories)
      expect(expense.macro).to eq(:has_many)
    end
  end
end
