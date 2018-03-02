class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # def search?
  #
  # end

  def my_listings?
    true
  end

  def update?
    @record.renter_id == @user.id
  end

  def create?
    true
  end

  def review?
    true
  end

  def destroy?
    @record.renter_id == @user.id
  end

  def schedule?
    @record.renter_id == @user.id
  end

end
