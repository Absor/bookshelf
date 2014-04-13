class ShelfPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    @record.user == @user
  end

  def create?
    true
  end

  def update?
    @record.user == @user
  end

  def destroy?
    @record.user == @user
  end

  def search?
    true
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
