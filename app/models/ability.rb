class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    user.admin? ? admin_abilities(user) : user_abilities(user)
  end

  private

  def admin_abilities(_user)
    can :manage, :all
  end

  def user_abilities(user)
    can :manage, User, id: user.id
    can :manage, Expense, author_id: user.id
    can :manage, Category, author_id: user.id
  end
end
