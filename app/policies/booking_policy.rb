class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def review?
    true
  end

  def create?
    true
  end

  def confirm?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def requests?
    true
  end
end
