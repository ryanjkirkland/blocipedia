class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.premium?
        (scope.where(user_id: user.id, private: true) + scope.where(user_id: user.id) + scope.where(private: false)).uniq
      else
        (scope.where(user_id: user.id) + scope.where(private: false)).uniq
      end
    end
  end
end
