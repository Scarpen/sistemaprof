class Exercicio < ActiveRecord::Base
	belongs_to :atividade
	belongs_to :aluno
  	attr_accessible :aluno_id, :arquivo, :atividade_id, :nota, :arquivo_cache
    mount_uploader :arquivo, FileUploader
end
