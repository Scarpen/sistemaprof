class Atividade < ActiveRecord::Base
	belongs_to :diciplina
	has_many :exercicios
	
  attr_accessible :diciplina_id, :nota_maxima, :descricao, :prazo
  validates_presence_of :descricao, :nota_maxima, :prazo

  def situacao(user)
  	exercicios.each do |e|
		  		if e.aluno.id == user.id
		  			return "Atividade atividade ja foi enviada"
		  		end
  	end
  	return "A atividade ainda nao foi enviada"
  end

  def envio(user)
  	exercicios.each do |e|
		  		if e.aluno.id == user.id
		  			return e.created_at
		  		end
  	end
  	return nil
  end

  def nota(user)
  	exercicios.each do |e|
		  		if e.aluno.id == user.id
		  			if e.nota == nil
		  				return "A atividade ainda nao foi corrigida"
		  			end
		  			return e.nota
		  		end
 	end
  	return ""  
  end
end
