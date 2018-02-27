class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def search?
     true
  end

  def my_listings?
    true
  end

  def update?
    @record.renter_id = @user.id
  end

  def create?
    true
  end
end
