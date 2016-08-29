class ApplicationPolicy
  attr_reader :user, :monkey

  def initialize(user, monkey)
    @user = user
    @monkey = monkey
  end

  def index?
    false
  end

  def show?
    scope.where(:id => monkey.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, monkey.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
