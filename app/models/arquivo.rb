class Arquivo < ActiveRecord::Base
	belongs_to :diciplinas
  	attr_accessible :arquivo, :diciplina_id, :arquivo_cache
  	mount_uploader :arquivo, FileUploader
end
