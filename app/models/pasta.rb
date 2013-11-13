class Pasta < ActiveRecord::Base
  has_many :arquivos
  belongs_to :diciplina
  attr_accessible :nome, :diciplina_id
end
