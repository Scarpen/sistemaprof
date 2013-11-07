class Diciplina < ActiveRecord::Base
	belongs_to :professors
	has_and_belongs_to_many :alunos
	has_many :arquivos
  	attr_accessible :conteudo, :nome, :professor_id, :aluno_ids, :arquivos_ids
  	
  	def professor?(user)
  		if professor_id == user.id
  			return true
  		end
  		return false
  	end
  	
    def situacao(user)
  		Controle.all.each do |c|
  			if c.diciplina_id == id and c.aluno_id == user.id
  				return c.situacao
			end
  		end
  		return 0
  	end

    def pendentes
      alunos = []
      Controle.all.each do |c|
        if c.diciplina_id == id && c.situacao == 1
          aluno = Aluno.find(c.aluno_id)
          alunos << aluno
        end
      end
      return alunos
    end

    def aceitar(aluno,disciplina)
      Controle.all.each do |c|
        if c.diciplina_id == disciplina 
          if c.aluno_id == aluno.id
            c.update_attributes(:situacao => 2)
          end
        end
      end
    end

    def recusar(aluno,disciplina)
      Controle.all.each do |c|
        if c.diciplina_id == disciplina 
          if c.aluno_id == aluno.id
            c.destroy
          end
        end
      end
    end
     def inscritos
       alunos = []
       Controle.all.each do |c|
         if c.diciplina_id == id && c.situacao == 2
           aluno = Aluno.find(c.aluno_id)
           alunos << aluno
         end
       end
       return alunos
    end

end
