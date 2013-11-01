class Professor < User 
  has_many :diciplinas
  attr_accessible :cpf
end
