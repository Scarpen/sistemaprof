class Aluno < User
  has_and_belongs_to_many :diciplinas
  has_many :exercicios
  attr_accessible :matricula, :diciplina_ids
end
