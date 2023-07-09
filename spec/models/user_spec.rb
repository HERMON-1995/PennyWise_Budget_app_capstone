require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      expect(User.new(name: nil)).to_not be_valid
    end

    it 'is not valid without an email' do
      expect(User.new(email: nil)).to_not be_valid
    end

    it 'is not valid without a password' do
      expect(User.new(password: nil)).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      expect(User.new(password_confirmation: nil)).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many expenses' do
      expect(user.expenses).to eq([])
    end

    it 'has many categories' do
      expect(user.categories).to eq([])
    end
  end
end
