require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.build(:category) }

  describe 'ActiveModel validations' do
    # Basic validations
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      expect(Category.new(name: nil)).to_not be_valid
    end

    it 'is not valid without an icon' do
      expect(Category.new(icon: nil)).to_not be_valid
    end

    # Length validations
    it 'is not valid with a name longer than 20 characters' do
      expect(Category.new(name: 'a' * 21)).to_not be_valid
    end
  end

  describe 'ActiveRecord associations' do
    it 'has and belongs to many expenses' do
      category = Category.reflect_on_association(:expenses)
      expect(category.macro).to eq(:has_many)
    end
  end
end
