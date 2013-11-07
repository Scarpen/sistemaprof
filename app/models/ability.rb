class Ability
  include CanCan::Ability

  def initialize(user)
        user ||= User.new
        if user.type?("Admin")
        	can :manage, :all
        elsif user.type?("Professor")
        	can :manage, [Diciplina]
        elsif user.type?("Aluno")
        	can [:index, :read, :atuais, :recusar], [Diciplina]
        end
    end
end
