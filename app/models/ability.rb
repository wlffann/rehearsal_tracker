class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_manager?
      can :manage, Company, id: Company.where_manager(user.id).pluck('id')
      can :manage, Production, company_id: Company.where_manager(user.id).pluck('id')
      can :manage, Rehearsal, production_id: Production.where_manager(user.id).pluck('id') 
      can :manage, Team, production_id: Production.where_manager(user.id).pluck('id') 
    elsif user.is_member?
      can :read, Company, id: Company.where_member(user.id).map { |company| company.id }
      can :read, Production, id: Production.where_member(user.id).map { |production| production.id } 
      can :manage, Note
    else
      can [:create, :read], Company
    end
  end
end
