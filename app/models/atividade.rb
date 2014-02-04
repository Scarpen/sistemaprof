class Atividade < ActiveRecord::Base
	belongs_to :diciplina
	has_many :exercicios
	
  attr_accessible :diciplina_id, :nota_maxima, :nota_minima, :descricao, :prazo
end
