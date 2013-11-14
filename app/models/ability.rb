class Ability
  include CanCan::Ability

  def initialize(user)
        user ||= User.new
        if user.type?("Admin")
        	can :manage, :all
        elsif user.type?("Professor")
        	can :manage, [Diciplina]
            can :manage, [Arquivo]
        elsif user.type?("Aluno")
        	can [:index, :read, :atuais, :recusar, :materiais], [Diciplina]
            cannot [:create],[Arquivo]
        end
    end
end
