# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    record.author == user or user&.admin?
  end

  def destroy?
    user&.admin?
  end
end
