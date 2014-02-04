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
            can [:create,:read,:alunosinscritos,:atuais], [Diciplina]
            can :manage, [Arquivo]
            can [:update,:destroy,:alunospendentes,:materiais,:createpasta,:aceitar,:recusar, :atividades, :createatividade], Diciplina do |diciplina|
                diciplina.try(:professor_id) == user.id
            end
            can [:create], Atividade
            can [:manage], Atividade do |atividade|
                diciplina = atividade.diciplina
                diciplina.try(:professor_id) == user.id
            end
        elsif user.type?("Aluno")
            can :read, [Aluno]
            can :manage, [Aluno],:id => user.id
        	can [:index, :read, :atuais, :recusar, :materiais, :atividades], [Diciplina]
            cannot [:create],[Arquivo]
        end
    end
end
