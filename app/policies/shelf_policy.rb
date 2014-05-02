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
    @record.user == @user
  end

  def update?
    @record.user == @user
  end

  def destroy?
    @record.user == @user
  end

  def clear?
    @record.user == @user
  end
end
