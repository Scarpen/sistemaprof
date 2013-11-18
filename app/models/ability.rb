class Ability
  include CanCan::Ability

  def initialize(user)
        if user ||= User.new
            can :new, [Aluno]
        end    
        if user.type?("Admin")
        	can :manage, :all
        elsif user.type?("Professor")
            can :read, [Aluno]
            can :manage, [Professor],:id => user.id
            can :manage, [Diciplina]
            can :manage, [Arquivo]
        elsif user.type?("Aluno")
            can :read, [Aluno]
            can :manage, [Aluno],:id => user.id
        	can [:index, :read, :atuais, :recusar, :materiais], [Diciplina]
            cannot [:create],[Arquivo]
        end
    end
end
