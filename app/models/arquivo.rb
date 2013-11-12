class Arquivo < ActiveRecord::Base
	belongs_to :pasta
  	attr_accessible :arquivo, :pasta_id, :arquivo_cache, :nome
  	mount_uploader :arquivo, FileUploader
end
