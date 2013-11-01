class Diciplina < ActiveRecord::Base
	belongs_to :professors
	has_and_belongs_to_many :alunos
  	attr_accessible :conteudo, :nome, :professor_id, :aluno_ids
end
