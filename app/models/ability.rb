class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_manager?
      can :manage, Company, id: Company.where_manager(user.id).map { |company| company.id }
      can [:create, :manage], Production, id: Production.where_manager(user.id).map { |production| production.id }
      can [:create, :manage], Rehearsal, id: Rehearsal.where_manager(user.id).map { |rehearsal| rehearsal.id }
      can [:create, :manage], Team, id: Team.where_manager(user.id).map { |team| team.id }
    elsif user.is_member?
      can :read, Company, id: Company.where_member(user.id).map { |company| company.id }
      can :read, Production, id: Production.where_member(user.id).map { |production| production.id } 
      can :manage, Note
    else
      can [:create, :read], Company
    end
  end
end
