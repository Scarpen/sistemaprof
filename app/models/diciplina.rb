class Diciplina < ActiveRecord::Base
	belongs_to :professors
	has_and_belongs_to_many :alunos
	has_many :arquivos
  	attr_accessible :conteudo, :nome, :professor_id, :aluno_ids, :arquivos_ids
  	
end
