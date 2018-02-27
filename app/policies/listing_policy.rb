class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def search?
     true
  end
end
