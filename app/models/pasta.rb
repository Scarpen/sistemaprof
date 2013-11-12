class Pasta < ActiveRecord::Base
  has_many :arquivos
  attr_accessible :nome, :diciplina_id
end
