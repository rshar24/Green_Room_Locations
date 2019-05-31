class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
      user_is_owner?
  end

  private

  def user_is_owner?
    record.location.user == user
  end
end
