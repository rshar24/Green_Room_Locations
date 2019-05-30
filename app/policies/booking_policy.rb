class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def bookings_received
      # raise
      scope.where(location: user.locations)
    end
  end

  def create?
    return true
  end

  def show?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
